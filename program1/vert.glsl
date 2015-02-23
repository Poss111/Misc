#version 330

in vec2 position;
uniform mat4 projMat;

void main() {
  gl_Position = projMat*vec4(position.x, position.y, 0, 1);
}
