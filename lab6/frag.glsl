#version 330
uniform vec3 light;
uniform mat4 view;

in vec3 fcolor;
in vec4 outPosition;
in vec4 outNormal;
float ambient = .1;
float shine = 128;
out vec4 color_out;

void main() {
    mat4 IView = inverse(view);
    vec3 camLight = vec3(IView[3][0], IView[3][1], IView[3][2]);
    vec3 newlight = camLight * light;
    vec3 lightDir = normalize(light - outPosition.xyz);
    float diffuse = clamp(dot(lightDir, outNormal.xyz), 0.0f, 1.0f);
    vec3 reflectDir = normalize((2.0f * dot(lightDir, outNormal.xyz) * outNormal.xyz) - lightDir);
    vec3 viewDir = normalize(newlight - outPosition.xyz);
    float specular = pow(clamp(dot(reflectDir, viewDir), 0.0f, 1.0f), shine);
    color_out = vec4(fcolor, 1) * (ambient + diffuse); // + specular);
}
