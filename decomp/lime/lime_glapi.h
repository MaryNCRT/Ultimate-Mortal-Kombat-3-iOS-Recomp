/*
 * lime_glapi.h -- the calling convention of the GL entry points.
 *
 * The transcribed code declares the GL calls it makes itself, the way the
 * binary links them: as plain functions. On 32-bit Windows that is not what
 * opengl32 exports -- every GL entry there is __stdcall, decorated
 * `_glPopMatrix@0`, and a cdecl declaration of the same name neither links
 * nor, if forced to, cleans the stack the same way.
 *
 * The fight logic is 32-bit by construction (it stores pointers in 32-bit
 * words, as the armv7 build does), so the build that runs it is i686, and
 * these declarations have to agree with the real header there. Everywhere
 * else -- 64-bit Windows, where there is one convention, the headless builds,
 * which define the GL calls themselves, and other platforms -- the macro is
 * empty and nothing changes.
 */
#ifndef LIME_GLAPI_H
#define LIME_GLAPI_H

#if defined(_WIN32) && !defined(_WIN64) && defined(UMK3_REAL_GL)
#  define LIME_GLAPI __stdcall
#else
#  define LIME_GLAPI
#endif

#endif
