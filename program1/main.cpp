#include <QApplication>
#include <QLabel>

#include "glwidget.h"

int main(int argc, char** argv) {
    QApplication a(argc, argv);

    QSurfaceFormat format;
    format.setVersion(3,3);
    format.setProfile(QSurfaceFormat::CoreProfile);
    QSurfaceFormat::setDefaultFormat(format);

    QImage image;
    QLabel label;
    image.load("car.jpg");
    label.setPixmap(QPixmap::fromImage(image));

    GLWidget glWidget;
    qreal pixelRatio = glWidget.devicePixelRatio();
    glWidget.resize(640/pixelRatio,480/pixelRatio);
    glWidget.show();

    return a.exec();
}
