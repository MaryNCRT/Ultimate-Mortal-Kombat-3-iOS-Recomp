/*
 * The platform layer's entire interface.
 *
 * Everything iOS-specific in the original lives behind this. The point of
 * keeping it this small is that porting to another OS means writing one file,
 * not auditing the engine.
 *
 * Backends:
 *   win32_gl.c   Win32 + WGL. No dependencies, builds with the toolchain that
 *                is already here. This is what the vertical slice uses.
 *   sdl_gl.c     not written yet -- the portable path, and the reason the
 *                interface is shaped this way rather than exposing HWND.
 */
#ifndef LIME_PLATFORM_H
#define LIME_PLATFORM_H

#include <stdbool.h>

/* Open a window with a GL context current on it. Returns false on failure. */
bool plat_open(const char *title, int width, int height);

/* Pump the OS event queue. Returns false once the user has asked to quit. */
bool plat_poll(void);

/* Present the back buffer. */
bool plat_swap(void);

void plat_close(void);

/* Current drawable size in pixels -- not the same as the requested size once
 * the user resizes or the OS applies scaling. */
void plat_size(int *width, int *height);

/* Seconds since plat_open, monotonic. */
double plat_time(void);

#endif
