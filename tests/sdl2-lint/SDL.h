/*
 * SDL.h -- a LINT FIXTURE, not SDL2. Never in the build path.
 *
 * ## Why this exists
 *
 * `runtime/platform/sdl_gl.c` is the Linux backend. On a Windows machine CMake
 * never compiles it, so it sat completely unchecked: a typo in it would survive
 * every local build and only surface on somebody else's Linux box. That is the
 * same shape as the call-site scan that reported zero `glBindTexture` callers --
 * a check that cannot detect a known positive is not evidence of anything.
 *
 * So `tools/check.sh` syntax-checks that file against this header when real
 * SDL2 is absent.
 *
 * ## What a pass here does and does not prove
 *
 * PROVES  -- our own mistakes are gone: typos, undeclared variables, wrong
 *            argument COUNTS, missing returns, unused variables, bad struct
 *            member names on SDL_Event.
 *
 * DOES NOT PROVE -- that these declarations match real SDL2. They are written
 *            from the documented SDL2 API, which makes them a CLAIM, not a
 *            reading of an installed header. If one is wrong, this lint passes
 *            and the real build still fails.
 *
 * Which is why `tools/check.sh` prefers a real SDL2 whenever one is installed
 * and only falls back here, saying loudly which of the two it used. Install
 * SDL2 and the claim stops mattering.
 *
 * The constant VALUES below are placeholders chosen only to be distinct.
 * `-fsyntax-only` never looks at them. Do not copy them anywhere, and do not
 * link anything against this file -- the guard beneath makes that fail loudly.
 */
#ifndef UMK3_SDL2_LINT_FIXTURE_H
#define UMK3_SDL2_LINT_FIXTURE_H

#ifndef UMK3_SDL2_LINT
#error "tests/sdl2-lint/SDL.h is a lint fixture, not SDL2. Install SDL2 to build."
#endif

#include <stdint.h>

typedef uint8_t  Uint8;
typedef uint32_t Uint32;
typedef uint64_t Uint64;
typedef int32_t  Sint32;

typedef struct SDL_Window SDL_Window;
typedef void *SDL_GLContext;

/* placeholder values -- see the header comment */
#define SDL_INIT_VIDEO            0x1u
#define SDL_WINDOWPOS_CENTERED    0x2
#define SDL_WINDOW_OPENGL         0x4u
#define SDL_WINDOW_RESIZABLE      0x8u
#define SDL_WINDOW_ALLOW_HIGHDPI  0x10u
#define SDLK_ESCAPE               0x20

typedef enum {
    SDL_GL_RED_SIZE, SDL_GL_GREEN_SIZE, SDL_GL_BLUE_SIZE, SDL_GL_ALPHA_SIZE,
    SDL_GL_DEPTH_SIZE, SDL_GL_DOUBLEBUFFER, SDL_GL_CONTEXT_PROFILE_MASK
} SDL_GLattr;

#define SDL_GL_CONTEXT_PROFILE_COMPATIBILITY 0x0002

typedef enum { SDL_QUIT = 0x100, SDL_WINDOWEVENT = 0x200, SDL_KEYDOWN = 0x300 } SDL_EventType;
typedef enum { SDL_WINDOWEVENT_SIZE_CHANGED = 6, SDL_WINDOWEVENT_CLOSE = 14 } SDL_WindowEventID;

typedef struct { Sint32 sym; } SDL_Keysym;
typedef struct { Uint32 type; SDL_Keysym keysym; } SDL_KeyboardEvent;
typedef struct { Uint32 type; Uint8 event; Sint32 data1, data2; } SDL_WindowEvent;

typedef union SDL_Event {
    Uint32            type;
    SDL_KeyboardEvent key;
    SDL_WindowEvent   window;
} SDL_Event;

int         SDL_Init(Uint32 flags);
void        SDL_Quit(void);
const char *SDL_GetError(void);
void        SDL_Log(const char *fmt, ...);

SDL_Window *SDL_CreateWindow(const char *title, int x, int y, int w, int h, Uint32 flags);
void        SDL_DestroyWindow(SDL_Window *window);

int           SDL_GL_SetAttribute(SDL_GLattr attr, int value);
SDL_GLContext SDL_GL_CreateContext(SDL_Window *window);
void          SDL_GL_DeleteContext(SDL_GLContext context);
int           SDL_GL_MakeCurrent(SDL_Window *window, SDL_GLContext context);
int           SDL_GL_SetSwapInterval(int interval);
void          SDL_GL_SwapWindow(SDL_Window *window);
void          SDL_GL_GetDrawableSize(SDL_Window *window, int *w, int *h);

Uint64 SDL_GetPerformanceCounter(void);
Uint64 SDL_GetPerformanceFrequency(void);
int    SDL_PollEvent(SDL_Event *event);

#endif /* UMK3_SDL2_LINT_FIXTURE_H */
