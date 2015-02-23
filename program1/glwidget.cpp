#include "glwidget.h"
#include <iostream>

#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtc/type_ptr.hpp>
#include <vector>

#include <QTextStream>
#include <QLabel>

using namespace std;
GLuint uniformLoc;

GLWidget::GLWidget(QWidget *parent) : QOpenGLWidget(parent), outline(false), drawMode(0) {
    num_pts = 0;
    pressed = 0;
    drawMode = GL_POINTS;
}

GLWidget::~GLWidget() {
}

void GLWidget::keyPressEvent(QKeyEvent *event) {
    switch(event->key()) {
        case Qt::Key_C:
            cout << "Cleared all the points. " << endl;
            num_pts = 0;
            glBindBuffer(GL_ARRAY_BUFFER, positionBuffer);
            glBufferData(GL_ARRAY_BUFFER, 0, NULL, GL_DYNAMIC_DRAW);
            pts.resize(0);
            break;
        case Qt::Key_W:
            outline = !outline;
            if(outline) {
                cout << "Displaying outlines." << endl;
                glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
            } else {
                cout << "Displaying filled polygons." << endl;
                glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
            }
            break;
        case Qt::Key_Space:
            switch(pressed) {
                case 0:
                    cout << "Draw Mode => GL_LINES " << endl;
                    drawMode = GL_LINES;
                    pressed++;
                    break;
                case 1:
                    cout << "Draw Mode => GL_LINE_STRIP " << endl;
                    drawMode = GL_LINE_STRIP;
                    pressed++;
                    break;
                case 2:
                    cout << "Draw Mode => GL_LINE_LOOP " << endl;
                    drawMode = GL_LINE_LOOP;
                    pressed++;
                    break;
                case 3:
                    cout << "Draw Mode => GL_TRIANGLES " << endl;
                    drawMode = GL_TRIANGLES;
                    pressed++;
                    break;
                case 4:
                    cout << "Draw Mode => GL_TRIANGLE_STRIP " << endl;
                    drawMode = GL_TRIANGLE_STRIP;
                    pressed++;
                    break;
                case 5:
                    cout << "Draw Mode => GL_TRIANGLE_FAN " << endl;
                    drawMode = GL_TRIANGLE_FAN;
                    pressed++;
                    break;
                default:
                    cout << "Draw Mode => GL_POINTS " << endl;
                    drawMode = GL_POINTS;
                    pressed = 0;
                    break;
            }
            break;
    }
    update();
}

void GLWidget::mousePressEvent(QMouseEvent *event) {
    // devicePixelRatio will be 1 on standard displays.
    // On retina display devices (mac book pro retina, tablets, phones, etc)
    // devicePixelRatio will be greater than 1.
    // The coordinates of the event are in points (like font points,
    // not vertex points) rather than pixels.
    // There are devicePixelRatio pixels in a single point, so here
    // we are converting to pixels.
    QImage image;
    QLabel label;
    image.load("car.jpg");
    label.setPixmap(QPixmap::fromImage(image));
    hdc = GetDc(label);
    color[num_pts] = GetPixel(*hdc, event->x, event->y);

    pts.resize(num_pts+1);
    qreal pixelRatio = this->devicePixelRatio();
    pts[num_pts].x = event->x()*pixelRatio;
    pts[num_pts].y = event->y()*pixelRatio;

    cout << "Added point (" << pts[num_pts].x << ", " << pts[num_pts].y << ") " << endl;

    num_pts++;

    glBindBuffer(GL_ARRAY_BUFFER, positionBuffer);
    glBufferData(GL_ARRAY_BUFFER, pts.size() * 8, pts.data(), GL_DYNAMIC_DRAW);
    update();
}

void GLWidget::initializeGL() {
    initializeOpenGLFunctions();

    glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
    glPointSize(4.0f);

    // Create a new Vertex Array Object on the GPU which
    // saves the attribute layout of our vertices.
    GLuint vao;
    glGenVertexArrays(1, &vao);
    glBindVertexArray(vao);

    // Create a buffer on the GPU for position data
    glGenBuffers(1, &positionBuffer);

    // Upload the position data to the GPU, storing
    // it in the buffer we just allocated.
    glBindBuffer(GL_ARRAY_BUFFER, positionBuffer);
    glBufferData(GL_ARRAY_BUFFER, 0, NULL, GL_DYNAMIC_DRAW);

    // Load our vertex and fragment shaders into a program object
    // on the GPU
    GLuint program = loadShaders();

    // Bind the attribute "position" (defined in our vertex shader)
    // to the currently bound buffer object, which contains our
    // position data for a single triangle. This information 
    // is stored in our vertex array object.
    glBindBuffer(GL_ARRAY_BUFFER, positionBuffer);
    GLint positionIndex = glGetAttribLocation(program, "position");
    glEnableVertexAttribArray(positionIndex);
    glVertexAttribPointer(positionIndex, 2, GL_FLOAT, GL_FALSE, 0, 0);
    uniformLoc = glGetUniformLocation(program, "projMat");
}

void GLWidget::resizeGL(int w, int h) {
    glViewport(0,0,w,h);
    float w2 = w;
    float h2 = h;
    glm::mat4 orthoMat = glm::mat4(glm::vec4((2.0f/w2), 0.0f, 0.0f, 0.0f),
                                  glm::vec4(0.0f, -(2.0f/h2), 0.0f, 0.0f),
                                  glm::vec4(0.0f,0.0f,-1.0f,0.0f),
                                  glm::vec4(-1.0f, 1.0f, 1.0f,1.0f));

    glUniformMatrix4fv(uniformLoc, 1, GL_FALSE, glm::value_ptr(orthoMat));

    // When our OpenGL context is resized, we need to change
    // our projection matrix to match. Create an orthographic 
    // projection matrix that converts window coordinates to normalized 
    // device coordinates.  This is similar to our previous lab, 
    // except the conversion will happen in our vertex shader. 
    // This way we won't need to do any conversions on our mouse 
    // event coordinates and when we resize the window the geometry 
    // won't be scaled unevenly.
}

void GLWidget::paintGL() {
    glClear(GL_COLOR_BUFFER_BIT);

    // draw primitives based on the current draw mode
    glDrawArrays(drawMode, 0, num_pts);
    
    // draw points so we can always see them
    // glPointSize adjusts the size of point
    // primitives
    glDrawArrays(GL_POINTS, 0, num_pts);
}

// Copied from LoadShaders.cpp in the the oglpg-8th-edition.zip
// file provided by the OpenGL Programming Guide, 8th edition.
const GLchar* GLWidget::readShader(const char* filename) {
#ifdef WIN32
        FILE* infile;
        fopen_s( &infile, filename, "rb" );
#else
    FILE* infile = fopen( filename, "rb" );
#endif // WIN32

    if ( !infile ) {
#ifdef _DEBUG
        std::cerr << "Unable to open file '" << filename << "'" << std::endl;
#endif /* DEBUG */
        return NULL;
    }

    fseek( infile, 0, SEEK_END );
    int len = ftell( infile );
    fseek( infile, 0, SEEK_SET );

    GLchar* source = new GLchar[len+1];

    fread( source, 1, len, infile );
    fclose( infile );

    source[len] = 0;

    return const_cast<const GLchar*>(source);
}

GLuint GLWidget::loadShaders() {
    GLuint program = glCreateProgram();

    // read vertex shader from Qt resource file
    QFile vertFile(":/vert.glsl");
    vertFile.open(QFile::ReadOnly | QFile::Text);
    QString vertString;
    QTextStream vertStream(&vertFile);
    vertString.append(vertStream.readAll());
    string vertSTLString = vertString.toStdString();

    cout << "Vertex Shader:" << endl;
    cout << vertSTLString << endl;

    const GLchar* vertSource = vertSTLString.c_str();

    GLuint vertShader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(vertShader, 1, &vertSource, NULL);
    glCompileShader(vertShader);
    {
        GLint compiled;
        glGetShaderiv( vertShader, GL_COMPILE_STATUS, &compiled );
        if ( !compiled ) {
            GLsizei len;
            glGetShaderiv( vertShader, GL_INFO_LOG_LENGTH, &len );

            GLchar* log = new GLchar[len+1];
            glGetShaderInfoLog( vertShader, len, &len, log );
            std::cout << "Shader compilation failed: " << log << std::endl;
            delete [] log;
        }
    }
    glAttachShader(program, vertShader);

    // read fragment shader from Qt resource file
    QFile fragFile(":/frag.glsl");
    fragFile.open(QFile::ReadOnly | QFile::Text);
    QString fragString;
    QTextStream fragStream(&fragFile);
    fragString.append(fragStream.readAll());
    string fragSTLString = fragString.toStdString();

    cout << "Fragment Shader:" << endl;
    cout << fragSTLString << endl;

    const GLchar* fragSource = fragSTLString.c_str();

    GLuint fragShader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderSource(fragShader, 1, &fragSource, NULL);
    glCompileShader(fragShader);
    {
        GLint compiled;
        glGetShaderiv( fragShader, GL_COMPILE_STATUS, &compiled );
        if ( !compiled ) {
            GLsizei len;
            glGetShaderiv( fragShader, GL_INFO_LOG_LENGTH, &len );

            GLchar* log = new GLchar[len+1];
            glGetShaderInfoLog( fragShader, len, &len, log );
            std::cerr << "Shader compilation failed: " << log << std::endl;
            delete [] log;
        }
    }
    glAttachShader(program, fragShader);

    glLinkProgram(program);
    glUseProgram(program);

    return program;
}
