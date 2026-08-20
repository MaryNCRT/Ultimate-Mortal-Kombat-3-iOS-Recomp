/*
 * The one place that knows where the GL headers live.
 *
 * Win32 needs windows.h pulled in first or GL/gl.h will not compile; Apple
 * moved the headers into a framework. Nothing else in the tree should include
 * a GL header directly.
 */
#ifndef LIME_GL_H
#define LIME_GL_H

#if defined(_WIN32)
#  include <windows.h>
#  include <GL/gl.h>
#elif defined(__APPLE__)
#  include <OpenGL/gl.h>
#else
#  include <GL/gl.h>
#endif

#endif
