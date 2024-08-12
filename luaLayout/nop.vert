#version 120

attribute vec4 TextureMatrixScale;
varying vec3 position;
varying vec3 normal;
varying vec4 color;
varying vec2 textureCoord;
varying vec2 imageCoord;
uniform vec2 textureSize;
uniform vec2 imageSize;
uniform mat4 textureMatrix;

void main() {
    normal = gl_NormalMatrix * gl_Normal * vec3(1.0, -1.0, 1.0);
    gl_Position = (gl_ModelViewProjectionMatrix * gl_Vertex);
    position = gl_Vertex.xyz;
    gl_TexCoord[0] = (textureMatrix * gl_MultiTexCoord0 * TextureMatrixScale) + (gl_MultiTexCoord0 * (vec4(1) - TextureMatrixScale));
    textureCoord = ((textureMatrix * gl_MultiTexCoord0 * TextureMatrixScale) + (gl_MultiTexCoord0 * (vec4(1) - TextureMatrixScale))).xy;
    imageCoord = textureCoord * textureSize / imageSize;
    gl_FrontColor = gl_Color;
    color = gl_Color;
}