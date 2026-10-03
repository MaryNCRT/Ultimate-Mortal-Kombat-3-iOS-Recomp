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
typedef int16_t  Sint16;
typedef Sint32   SDL_JoystickID;

typedef struct SDL_Window SDL_Window;
typedef struct SDL_GameController SDL_GameController;
typedef struct SDL_Joystick SDL_Joystick;
typedef void *SDL_GLContext;

/* placeholder values -- see the header comment */
#define SDL_INIT_VIDEO            0x1u
#define SDL_INIT_GAMECONTROLLER   0x2u
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
typedef enum {
    SDL_WINDOWEVENT_SIZE_CHANGED = 6,
    SDL_WINDOWEVENT_FOCUS_GAINED = 12,
    SDL_WINDOWEVENT_FOCUS_LOST   = 13,
    SDL_WINDOWEVENT_CLOSE        = 14
} SDL_WindowEventID;
typedef enum {
    SDL_CONTROLLERDEVICEADDED = 0x400,
    SDL_CONTROLLERDEVICEREMOVED
} SDL_ControllerEventType;
typedef enum {
    SDL_SCANCODE_W, SDL_SCANCODE_S, SDL_SCANCODE_A, SDL_SCANCODE_D,
    SDL_SCANCODE_U, SDL_SCANCODE_I, SDL_SCANCODE_O, SDL_SCANCODE_J,
    SDL_SCANCODE_K, SDL_SCANCODE_L, SDL_SCANCODE_UP, SDL_SCANCODE_DOWN,
    SDL_SCANCODE_LEFT, SDL_SCANCODE_RIGHT, SDL_SCANCODE_KP_7,
    SDL_SCANCODE_KP_8, SDL_SCANCODE_KP_9, SDL_SCANCODE_KP_4,
    SDL_SCANCODE_KP_5, SDL_SCANCODE_KP_6, SDL_SCANCODE_F5,
    SDL_SCANCODE_F1, SDL_SCANCODE_RETURN, SDL_SCANCODE_F3,
    SDL_SCANCODE_F2, SDL_SCANCODE_BACKSPACE
} SDL_Scancode;

typedef enum {
    SDL_CONTROLLER_AXIS_LEFTX, SDL_CONTROLLER_AXIS_LEFTY,
    SDL_CONTROLLER_AXIS_TRIGGERRIGHT
} SDL_GameControllerAxis;
typedef enum {
    SDL_CONTROLLER_BUTTON_A, SDL_CONTROLLER_BUTTON_B,
    SDL_CONTROLLER_BUTTON_X, SDL_CONTROLLER_BUTTON_Y,
    SDL_CONTROLLER_BUTTON_LEFTSHOULDER,
    SDL_CONTROLLER_BUTTON_RIGHTSHOULDER,
    SDL_CONTROLLER_BUTTON_DPAD_UP, SDL_CONTROLLER_BUTTON_DPAD_DOWN,
    SDL_CONTROLLER_BUTTON_DPAD_LEFT, SDL_CONTROLLER_BUTTON_DPAD_RIGHT
} SDL_GameControllerButton;

typedef struct { Sint32 sym; } SDL_Keysym;
typedef struct { Uint32 type; Uint32 timestamp; Sint32 which; } SDL_ControllerDeviceEvent;
typedef struct { Uint32 type; SDL_Keysym keysym; } SDL_KeyboardEvent;
typedef struct { Uint32 type; Uint8 event; Sint32 data1, data2; } SDL_WindowEvent;

typedef union SDL_Event {
    Uint32            type;
    SDL_KeyboardEvent key;
    SDL_WindowEvent   window;
    SDL_ControllerDeviceEvent cdevice;
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
void          SDL_GetWindowSize(SDL_Window *window, int *w, int *h);
Uint32        SDL_GetMouseState(int *x, int *y);

#define SDL_BUTTON_LEFT 1
#define SDL_BUTTON(X) (1u << ((X) - 1))
#define SDL_BUTTON_LMASK SDL_BUTTON(SDL_BUTTON_LEFT)

Uint64 SDL_GetPerformanceCounter(void);
Uint64 SDL_GetPerformanceFrequency(void);
int    SDL_PollEvent(SDL_Event *event);
const Uint8 *SDL_GetKeyboardState(int *numkeys);

int                SDL_InitSubSystem(Uint32 flags);
int                SDL_NumJoysticks(void);
int                SDL_IsGameController(int joystick_index);
SDL_GameController *SDL_GameControllerOpen(int joystick_index);
void               SDL_GameControllerClose(SDL_GameController *gamecontroller);
SDL_Joystick       *SDL_GameControllerGetJoystick(SDL_GameController *gamecontroller);
SDL_JoystickID      SDL_JoystickInstanceID(SDL_Joystick *joystick);
int                SDL_GameControllerGetAttached(SDL_GameController *gamecontroller);
Uint8              SDL_GameControllerGetButton(SDL_GameController *gamecontroller,
                                                SDL_GameControllerButton button);
Sint16             SDL_GameControllerGetAxis(SDL_GameController *gamecontroller,
                                             SDL_GameControllerAxis axis);

/* ---- audio: what runtime/platform/sdl_audio.c uses, from the documented
 *      SDL2 API (SDL_audio.h). Same caveat as everything above. */
typedef uint16_t Uint16;
typedef Uint16   SDL_AudioFormat;
typedef Uint32   SDL_AudioDeviceID;
typedef void (*SDL_AudioCallback)(void *userdata, Uint8 *stream, int len);

typedef struct SDL_AudioSpec {
    int               freq;
    SDL_AudioFormat   format;
    Uint8             channels;
    Uint8             silence;
    Uint16            samples;
    Uint16            padding;
    Uint32            size;
    SDL_AudioCallback callback;
    void             *userdata;
} SDL_AudioSpec;

#define SDL_INIT_AUDIO  0x10u
#define AUDIO_S16SYS    0x8010

Uint32 SDL_WasInit(Uint32 flags);
SDL_AudioDeviceID SDL_OpenAudioDevice(const char *device, int iscapture,
                                      const SDL_AudioSpec *desired,
                                      SDL_AudioSpec *obtained,
                                      int allowed_changes);
void   SDL_PauseAudioDevice(SDL_AudioDeviceID dev, int pause_on);
void   SDL_CloseAudioDevice(SDL_AudioDeviceID dev);
int    SDL_QueueAudio(SDL_AudioDeviceID dev, const void *data, Uint32 len);
Uint32 SDL_GetQueuedAudioSize(SDL_AudioDeviceID dev);

#endif /* UMK3_SDL2_LINT_FIXTURE_H */
