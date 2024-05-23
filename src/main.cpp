//
//  main.cpp
//  CustomWindowGLFW
//
//  Created by Nicolas U on 08.05.24.
//
#ifdef __APPLE__
/* Defined before GLFW includes to avoid deprecation messages */
#define GL_SILENCE_DEPRECATION
#endif
#include <iostream>

#include "GLFW/glfw3.h"

static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GL_TRUE); // close window
}

static void drag_callback(GLFWwindow* window, int button, int action, int mods)
{
    if (button == GLFW_MOUSE_BUTTON_LEFT && action == GLFW_PRESS) {
        glfwDragWindow(window);
    }
}

int main(void)
{
    GLFWwindow* window;

    /* Initialize the library */
    if (!glfwInit())
        return -1;
    
    /* Set window flag to draw without a titlebar */
    glfwWindowHint(GLFW_TITLEBAR, GL_FALSE);

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(640, 480, "GLFW Window", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);
    
    /* Notify when a esc key is pressed */
    glfwSetKeyCallback(window, key_callback);
    
    /* Notify when a mouse button is pressed to drag a window */
    glfwSetMouseButtonCallback(window, drag_callback);

    /* Loop until the user closes the window */
    while (!glfwWindowShouldClose(window))
    {
        /* Render here */
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
