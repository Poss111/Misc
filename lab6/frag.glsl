#version 330
in vec3 fcolor;
in vec4 outPosition;
in vec4 outNormal;
in vec3 camLight;
//uniform vec3 viewVec;
float ambient = .1;
float shine = 1;
out vec4 color_out;

void main() {
    vec3 lightDir = normalize(camLight - outPosition.xyz);
    float diffuse = clamp(dot(lightDir, outNormal.xyz), 0.0f, 1.0f);
//    vec3 reflectDir = normalize((2.0f * dot(lightDir, outNormal.xyz) * outNormal.xyz) - lightDir);
//    vec3 viewDir = normalize(viewVec - outPosition.xyz);
//    float specular = pow(clamp(dot(reflectDir, viewDir), 0.0f, 1.0f), shine);
    color_out = vec4(fcolor, 1) * (ambient + diffuse); // + specular);
}
