
#include <GL/glew.h>
#include <GL/freeglut.h>
#include <iostream>
#include <ostream>
#include <stdio.h> /* printf, scanf, NULL */
#include <stdlib.h>  /* malloc, free, rand */

#include <fstream>
#include <cmath>    // Definitions for math library.
#include <cstdlib>
#include <string>
#include <vector>
#include <list>
#include <math.h> 
#include "maths_funcs.h"
#include <Windows.h>

// Macro for indexing vertex buffer
#define BUFFER_OFFSET(i) ((char *)NULL + (i))
using namespace std;

// Vertex Shader (for convenience, it is defined in the main here, but we will be using text files for shaders in future)
// Note: Input to this shader is the vertex positions that we specified for the triangle. 
// Note: gl_Position is a special built-in variable that is supposed to contain the vertex position (in X, Y, Z, W)
// Since our triangle vertices were specified as vec3, we just set W to 1.0.

float red = 1.0f, blue = 1.0f, green = 1.0f;
GLfloat X1r, X2r, Y1r, Y2r, Z1r, Z2r;

/*translation coords*/
GLfloat Xt = 0.0f , Yt=0.0f, Zt=0.0f;

/*scaling coords*/
GLfloat Su = 1,Snu = 1;
GLuint matrixtranslation, matrixidentity, matrixrotation, matrixscaling;


class Matrix {
		GLuint numtri, numver;
	public:
		Matrix(GLuint, GLuint);
		int totalv() { return 3*3; }
};
Matrix::Matrix(GLuint t, GLuint v) {
	numtri = t;
	numver = v;
}

class Matrix2 {
	mat4 identitymatrix = identity_mat4();
	mat4 translationmatrix = identity_mat4();
	mat4 rotationmatrix = identity_mat4();
	mat4 scalingmatrix = identity_mat4();
	
public:
	Matrix2(mat4);
	 GLfloat totalarr() {
		 }
};

Matrix2::Matrix2(mat4) {
	identitymatrix;
	translationmatrix;
	rotationmatrix;
	scalingmatrix;
}


/*matrix definition*/
mat4 identitymatrix = identity_mat4();
mat4 translationmatrix = identity_mat4();
mat4 rotationmatrix = identity_mat4();
mat4 scalingmatrix = identity_mat4();






static const char* pVS = "          \n\
#version 330                        \n\
                                    \n\
in vec3 vPosition;				    \n\
in vec4 vColor;						\n\
uniform mat4 iMatrix;				\n\
uniform mat4 tMatrix;				\n\
uniform mat4 rMatrix;				\n\
uniform mat4 sMatrix;				\n\
out vec4 color;						\n\
                                    \n\
                                    \n\
void main()                         \n\
{									\n\
						/*T*R*S*T*/	\n\
                                    \n\
    gl_Position =tMatrix * rMatrix* sMatrix *iMatrix * vec4(vPosition.x/4, vPosition.y/4, vPosition.z/4, 1.0);  \n\
	color = vColor;							\n\
}";

// Fragment Shader
// Note: no input in this shader, it just outputs the colour of all fragments, in this case set to red (format: R, G, B, A).
static const char* pFS = "																	\n\
#version 330																				\n\
/*since FeagColor5 is an out vector, its name does not need to corespond to anything		\n\
this is onl required for the possible out vecttor FragColor	*/								\n\
out vec4 FragColor5;																		\n\
/*for future reference make sure mapping and shading names are the same*/					\n\
in vec4 color;																				\n\
																							\n\
void main()																					\n\
{																							\n\
																							\n\
FragColor5 =  vec4(color);																	\n\
																							\n\
}";

// Shader Functions- click on + to expand
#pragma region SHADER_FUNCTIONS
static void AddShader(GLuint ShaderProgram, const char* pShaderText, GLenum ShaderType)
{
	// create a shader object
    GLuint ShaderObj = glCreateShader(ShaderType);

    if (ShaderObj == 0) {
        fprintf(stderr, "Error creating shader type %d\n", ShaderType);
        exit(0);
    }
	// Bind the source code to the shader, this happens before compilation
	glShaderSource(ShaderObj, 1, (const GLchar**)&pShaderText, NULL);
	// compile the shader and check for errors
    glCompileShader(ShaderObj);
    GLint success;
	// check for shader related errors using glGetShaderiv
    glGetShaderiv(ShaderObj, GL_COMPILE_STATUS, &success);
    if (!success) {
        GLchar InfoLog[1024];
        glGetShaderInfoLog(ShaderObj, 1024, NULL, InfoLog);
        fprintf(stderr, "Error compiling shader type %d: '%s'\n", ShaderType, InfoLog);
        exit(1);
    }
	// Attach the compiled shader object to the program object
    glAttachShader(ShaderProgram, ShaderObj);
}

GLuint CompileShaders()
{
	//Start the process of setting up our shaders by creating a program ID
	//Note: we will link all the shaders together into this ID
    GLuint shaderProgramID = glCreateProgram();
    if (shaderProgramID == 0) {
        fprintf(stderr, "Error creating shader program\n");
        exit(1);
    }

	// Create two shader objects, one for the vertex, and one for the fragment shader
    AddShader(shaderProgramID, pVS, GL_VERTEX_SHADER);
    AddShader(shaderProgramID, pFS, GL_FRAGMENT_SHADER);

    GLint Success = 0;
    GLchar ErrorLog[1024] = { 0 };

	// After compiling all shader objects and attaching them to the program, we can finally link it
    glLinkProgram(shaderProgramID);
	// check for program related errors using glGetProgramiv
    glGetProgramiv(shaderProgramID, GL_LINK_STATUS, &Success);
	if (Success == 0) {
		glGetProgramInfoLog(shaderProgramID, sizeof(ErrorLog), NULL, ErrorLog);
		fprintf(stderr, "Error linking shader program: '%s'\n", ErrorLog);
        exit(1);
	}

	// program has been successfully linked but needs to be validated to check whether the program can execute given the current pipeline state
    glValidateProgram(shaderProgramID);
	// check for program related errors using glGetProgramiv
    glGetProgramiv(shaderProgramID, GL_VALIDATE_STATUS, &Success);
    if (!Success) {
        glGetProgramInfoLog(shaderProgramID, sizeof(ErrorLog), NULL, ErrorLog);
        fprintf(stderr, "Invalid shader program: '%s'\n", ErrorLog);
        exit(1);
    }
	// Finally, use the linked shader program
	// Note: this program will stay in effect for all draw calls until you replace it with another or explicitly disable its use
    glUseProgram(shaderProgramID);
	return shaderProgramID;
}
#pragma endregion SHADER_FUNCTIONS

// VBO Functions 
#pragma region VBO_FUNCTIONS
GLuint generateObjectBuffer(GLfloat vertices[], GLfloat colors[]) {
	Matrix numtriver3 (3, 2);
	GLuint numVertices = numtriver3.totalv();
	
	// Genderate 1 generic buffer object, called VBO
	GLuint VBO;
 	glGenBuffers(1, &VBO);
	// In OpenGL, we bind (make active) the handle to a target name and then execute commands on that target
	// Buffer will contain an array of vertices 
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	// After binding, we now fill our object with data, everything in "Vertices" goes to the GPU
	glBufferData(GL_ARRAY_BUFFER, numVertices*7*sizeof(GLfloat), NULL, GL_STATIC_DRAW);
	// if you have more data besides vertices (e.g., vertex colours or normals), use glBufferSubData to tell the buffer when the vertices array ends and when the colors start
	glBufferSubData (GL_ARRAY_BUFFER, 0, numVertices*3*sizeof(GLfloat), vertices);
	glBufferSubData (GL_ARRAY_BUFFER, numVertices*3*sizeof(GLfloat), numVertices*4*sizeof(GLfloat), colors);
return VBO;
}


void linkCurrentBuffertoShader(GLuint shaderProgramID){
	Matrix numtriver2 (3, 2);
	GLuint numVertices = numtriver2.totalv();
	// find the location of the variables that we will be using in the shader program
	GLuint colorID = glGetAttribLocation(shaderProgramID, "vColor");
	GLuint positionID = glGetAttribLocation(shaderProgramID, "vPosition");
	
	matrixidentity = glGetUniformLocation(shaderProgramID, "iMatrix");
	matrixtranslation = glGetUniformLocation(shaderProgramID, "tMatrix");
	matrixrotation = glGetUniformLocation(shaderProgramID, "rMatrix");
	matrixscaling= glGetUniformLocation(shaderProgramID, "sMatrix");

	// Have to enable this
	glEnableVertexAttribArray(positionID);
	// Tell it where to find the position data in the currently active buffer (at index positionID)
    glVertexAttribPointer(positionID, 3, GL_FLOAT, GL_TRUE, 0, 0);
	// Similarly, for the color data.
	glEnableVertexAttribArray(colorID);
	glVertexAttribPointer(colorID, 4, GL_FLOAT, GL_TRUE, 0, BUFFER_OFFSET(numVertices*3*sizeof(GLfloat)));
	/*glUniformMatrix4fv(matrixtranslation, 1, GL_TRUE, translationmatrix.m);
	glUniformMatrix4fv(matrixrotation, 1, GL_TRUE, rotationmatrix.m);
	glUniformMatrix4fv(matrixscaling, 1, GL_TRUE, scalingmatrix.m);
	glUniformMatrix4fv(matrixidentity, 1, GL_TRUE, identitymatrix.m);*/
}
#pragma endregion VBO_FUNCTIONS

void display(){
	Matrix numtriver (3,2);
	GLuint numVertices = numtriver.totalv();
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // Clear Color and Depth Buffers
	glLoadIdentity();// Reset transformations
	glClearColor(red, green, blue, 0.50f); //change background coilor

	glColor3f(red, green, blue);
	//keyOperations(); //use only for when you need to click on the screen
	/*1 triangle*/
	glUniformMatrix4fv(matrixtranslation, 1, GL_TRUE, &translationmatrix.m[0]);
	glUniformMatrix4fv(matrixrotation, 1, GL_TRUE, &rotationmatrix.m[0]);
	glUniformMatrix4fv(matrixscaling, 1, GL_TRUE, &scalingmatrix.m[0]);
	glUniformMatrix4fv(matrixidentity, 1, GL_TRUE, &identitymatrix.m[0]);
	// NB: Make the call to draw the geometry in the currently activated vertex buffer. This is where the GPU starts to work!
	glDrawArrays(GL_TRIANGLES, 0, 3); /*pattern 0,3/3,3//6,3*/


	glUniformMatrix4fv(matrixrotation, 1, GL_TRUE, &identitymatrix.m[0]);
	glUniformMatrix4fv(matrixidentity, 1, GL_TRUE, &identitymatrix.m[0]);
	glUniformMatrix4fv(matrixidentity, 1, GL_TRUE, &identitymatrix.m[0]);
	glUniformMatrix4fv(matrixidentity, 1, GL_TRUE, &identitymatrix.m[0]);

	glDrawArrays(GL_TRIANGLES, 3, 3); /*pattern 0,3/3,3//6,3*/

    glutSwapBuffers();
}

float color()
{	
	float r = ((double)rand() / (RAND_MAX));
	float g = ((double)rand() / (RAND_MAX));
	float b = ((double)rand() / (RAND_MAX));
	return red = r, green = g, blue = b;
}

/*
*KEYPRESSED OPERATIONS
*/
float temp =0.05;
float tempx, tempy, tempz;

void keyPressed(unsigned char key, int x, int y) {
	 // Set the state of the current key to pressed  
	if (key == 'a')
	{	printf(" x-axis:%c: ",key);
		color();
		Xt = Xt - temp;}
	if (key == 'w')
	{	printf(" y-axis:%c: ",key);
		color();
		Yt = Yt + temp;}
	if (key == 'd')
	{	printf(" x-axis:%c: ",key);
		color();
		Xt = Xt + temp;}
	if (key == 's')
	{
		color();
	 Yt = Yt - temp;}

	if (key == 'q')
	{	printf(" z-axis:%c: ",key);
		color();
		Zt = Zt - temp;}
	if (key == 'e')
	{	printf(" z-axis:%c: ",key);
		color();
		Zt = Zt + temp;}
	/*x-axis rotation*/ 
	if (key == '8')
	{	color();
		tempy = tempy + temp;
		Y1r = cos(tempy);
		Y2r = sin(tempy);}
	if (key == '2')
	{	color();
		tempy = tempy - temp;
		Y1r = cos(tempy);
		Y2r = sin(tempy);}
	/*y-axis rotation*/
	if (key == '4')
	{color();
		tempy = tempy - temp;
		X1r = cos(tempy);
		X2r = sin(tempy);}
	if (key == '6')
	{	color();
		tempy = tempy + temp;
		X1r = cos(tempy);
		X2r = sin(tempy);}
	/*z-axis rotation*/
	if (key == '7')
	{	color();
		tempy = tempy - temp;
		Z1r = cos(tempy);
		Z2r = sin(tempy);}
	if (key == '9')
	{color();
		tempy = tempy + temp;
		Z1r = cos(tempy);
		Z2r = sin(tempy);}
	/*reset*/
	if (key == 'r')
	{	printf(" scaling:%c: ",key);
	color();
		Su = 1, Snu=1;}
	/*uniform scaling*/
	if (key == 'p')
	{	printf(" scaling:%c : %f", key, Su);
	color();
		Su = Su + temp;
		printf(" scaling:%c : %f", key, Su);}
	if (key == 'l')
	{	if (Su > 0.01) {
		color();
		Su = Su - temp;
		printf(" scaling:%c : %f ", key, Su);}
		else {
			Su = Su + temp;}	}
	/*non uniform scaling*/
	if (key == 'o')
	{color();
		Snu = Snu + temp *2;
		//Su= Su = Su + temp;
		printf(" scaling:%c : %f",key, Snu);}
	if (key == 'k')
	{		if (Snu > 0.01) {
			Snu = Snu - temp;
			printf(" scaling:%c : %f", key, Snu);}
		else {
			Snu = Snu + temp;
			printf(" scaling:%c : %f", key, Snu);}}
	if (key == 'm')
	{	printf(" scaling: %f", key );
	color();
		Yt = Yt + temp*0.5;
		tempy = tempy + temp;
		X1r = cos(tempy);
		X2r = sin(tempy);
	}
	if (key == 'n')
	{	printf(" scaling:%c: ", key);
		Yt = Yt - temp*0.5;
		tempy = tempy - temp;
		X1r = cos(tempy);
		X2r = sin(tempy);
		Su = Su + temp;
		Snu = Snu - temp;}

	/*z-axis*/
	rotationmatrix.m[1] = -Z2r;
	rotationmatrix.m[4] = Z2r;

	/*y-axis*/
	rotationmatrix.m[0] = X1r*Z1r;
	rotationmatrix.m[2] = X2r;
	rotationmatrix.m[8] = -X2r;

	/*x-axis*/
	rotationmatrix.m[5] = Y1r*Z1r;
	rotationmatrix.m[6] = -Y2r;
	rotationmatrix.m[9] = Y2r;
	rotationmatrix.m[10] = Y1r*X1r;

	/*translations*/
	translationmatrix.m[3] = Xt;
	translationmatrix.m[7] = Yt;
	translationmatrix.m[11] = Zt;

	/*non- uniform/ uniform scaling*/
	scalingmatrix.m[0] = Su;
	scalingmatrix.m[5] =Su*Snu;
	scalingmatrix.m[10] = Su;
}

/*
*	void init() stores actual verticee coordinates
*
*/
void init()
{
	GLfloat vertices[] = { 	

		0.0f, 1.0f, 0.0f,
		-1.0f, -1.0f, 0.0f,
		 1.0f, -1.0f, 0.0f,
	
		 1.5f, -1.0f, 0.0f,
		2.5f, 1.0f, 0.0f,
		3.5f, -1.0f, 0.0f };

	// Create a color array that identfies the colors of each vertex (format R, G, B, A)
	GLfloat colors[] = {1.0f, 1.0f, 1.0f, 1.0f,   
						1.0f, 0.0f,0.50f,  1.0f,   
						1.0f, 1.0f, 0.0f, 1.0f, 

						1.0f, 1.0f, 0.0f, 1.0f,
						0.50f, 1.0f,1.0f,  1.0f,    
						1.0f, 1.0f, 0.0f, 1.0f};
	GLuint shaderProgramID = CompileShaders();// Set up the shaders
	generateObjectBuffer( vertices, colors);// Put the vertices and colors into a vertex buffer object
	linkCurrentBuffertoShader(shaderProgramID);		// Link the current buffer to the shader
}


int main(int argc, char** argv){
	glutInit(&argc, argv);// init GLUT and create window
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH); //specify display moder
	glutInitWindowPosition(100, 100);
	glutInitWindowSize(600, 400); // create window with dimensions
	glutCreateWindow("Tutorial2 Translations"); //set name of created window

	glutDisplayFunc(display);// Tell glut where the display function is
	glutIdleFunc(display);
	
	GLenum res = glewInit();// A call to glewInit() must be done after glut is initialized!
	// Check for any errors
	if (res != GLEW_OK) {
		fprintf(stderr, "Error: '%s'\n", glewGetErrorString(res));
		return 1;
	}
	glutKeyboardFunc(keyPressed); //initialise keyboard function
	
	init();// Set up your objects and shaders
	glutMainLoop();	// Begin infinite event loop
	return 1; 
}