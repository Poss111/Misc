#version 330

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;
uniform mat4 ITModel;

in vec3 position;
in vec3 normal;
in vec3 color;
out vec4 outPosition;
out vec4 outNormal;
out vec3 fcolor;

void main() {
  gl_Position = projection * view * model * vec4(position, 1);
  outPosition = model * vec4(position, 1.0f);
  outNormal = normalize(ITModel * vec4(normal, 0.0f));
  fcolor = color;
}
