/*
 * SDL2 backend -- the portable path, and the reason platform.h never exposes
 * an HWND.
 *
 * It asks for a compatibility context on purpose. The engine is OpenGL ES 1.1
 * fixed function throughout (77 entry points, no shaders anywhere -- see
 * docs/LIME-ENGINE.md), so the slice draws with glMatrixMode, glVertexPointer
 * and friends, which only exist in a compatibility profile. A core-profile
 * renderer that emulates the fixed-function pipeline is the shipping plan;
 * this is not it.
 *
 * The window is resizable and reports its drawable size rather than the
 * requested one, so high-DPI displays get the right viewport.
 */
#include "platform.h"
#include "gl.h"

#include <SDL.h>
#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

static SDL_Window   *g_wnd;
static SDL_GLContext g_ctx;
static bool          g_quit;
static bool          g_focused = true;
static Uint64        g_start, g_freq;
static SDL_GameController *g_controller;

bool plat_open(const char *title, int width, int height)
{
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_GAMECONTROLLER) != 0) {
        SDL_Log("SDL_Init: %s", SDL_GetError());
        return false;
    }

#ifdef __EMSCRIPTEN__
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK,
                        SDL_GL_CONTEXT_PROFILE_ES);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 2);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
#else
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK,
                        SDL_GL_CONTEXT_PROFILE_COMPATIBILITY);
#endif
    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
    SDL_GL_SetAttribute(SDL_GL_RED_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_GREEN_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_BLUE_SIZE, 8);
    SDL_GL_SetAttribute(SDL_GL_ALPHA_SIZE, 8);

    g_wnd = SDL_CreateWindow(title,
                             SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
                             width, height,
                             SDL_WINDOW_OPENGL | SDL_WINDOW_RESIZABLE |
                             SDL_WINDOW_ALLOW_HIGHDPI);
    if (!g_wnd) {
        SDL_Log("SDL_CreateWindow: %s", SDL_GetError());
        SDL_Quit();
        return false;
    }

    g_ctx = SDL_GL_CreateContext(g_wnd);
    if (!g_ctx) {
        SDL_Log("SDL_GL_CreateContext: %s", SDL_GetError());
        SDL_DestroyWindow(g_wnd);
        g_wnd = NULL;
        SDL_Quit();
        return false;
    }

    SDL_GL_MakeCurrent(g_wnd, g_ctx);
    SDL_GL_SetSwapInterval(1);

    int dw, dh;
    SDL_GL_GetDrawableSize(g_wnd, &dw, &dh);
    glViewport(0, 0, dw, dh);

    g_quit  = false;
    g_focused = true;
    g_freq  = SDL_GetPerformanceFrequency();
    g_start = SDL_GetPerformanceCounter();
    return true;
}

bool plat_focused(void)
{
    return g_focused;
}

bool plat_poll(void)
{
    SDL_Event ev;
    while (SDL_PollEvent(&ev)) {
        switch (ev.type) {
        case SDL_QUIT:
            g_quit = true;
            break;
        case SDL_KEYDOWN:
            if (ev.key.keysym.sym == SDLK_ESCAPE) g_quit = true;
            break;
        case SDL_WINDOWEVENT:
            if (ev.window.event == SDL_WINDOWEVENT_CLOSE) {
                g_quit = true;
            } else if (ev.window.event == SDL_WINDOWEVENT_FOCUS_LOST) {
                g_focused = false;
            } else if (ev.window.event == SDL_WINDOWEVENT_FOCUS_GAINED) {
                g_focused = true;
            } else if (ev.window.event == SDL_WINDOWEVENT_SIZE_CHANGED) {
                int dw, dh;
                SDL_GL_GetDrawableSize(g_wnd, &dw, &dh);
                if (dw > 0 && dh > 0) glViewport(0, 0, dw, dh);
            }
            break;
        default:
            break;
        }
        if (ev.type == SDL_CONTROLLERDEVICEADDED && !g_controller &&
            SDL_IsGameController(ev.cdevice.which))
            g_controller = SDL_GameControllerOpen(ev.cdevice.which);
        else if (ev.type == SDL_CONTROLLERDEVICEREMOVED && g_controller &&
                 SDL_JoystickInstanceID(
                     SDL_GameControllerGetJoystick(g_controller)) ==
                     ev.cdevice.which) {
            SDL_GameControllerClose(g_controller);
            g_controller = NULL;
        }
    }
#ifdef __EMSCRIPTEN__
    emscripten_sleep(16);
#endif
    return !g_quit;
}

bool plat_swap(void)
{
    if (!g_wnd) return false;
    SDL_GL_SwapWindow(g_wnd);
    return true;
}

void plat_size(int *width, int *height)
{
    int dw = 0, dh = 0;
    if (g_wnd) SDL_GL_GetDrawableSize(g_wnd, &dw, &dh);
    if (width)  *width  = dw;
    if (height) *height = dh;
}

int plat_mouse(int *x, int *y)
{
    int mx, my, ww, wh, dw, dh;
    Uint32 buttons = SDL_GetMouseState(&mx, &my);

    SDL_GetWindowSize(g_wnd, &ww, &wh);
    SDL_GL_GetDrawableSize(g_wnd, &dw, &dh);
    if (ww <= 0) ww = 1;
    if (wh <= 0) wh = 1;
    if (x) *x = mx * dw / ww;
    if (y) *y = my * dh / wh;
    return (buttons & SDL_BUTTON(SDL_BUTTON_LEFT)) != 0;
}

static const SDL_Scancode g_scancode[PK_COUNT] = {
    SDL_SCANCODE_W, SDL_SCANCODE_S, SDL_SCANCODE_A, SDL_SCANCODE_D,
    SDL_SCANCODE_U, SDL_SCANCODE_I, SDL_SCANCODE_O,
    SDL_SCANCODE_J, SDL_SCANCODE_K, SDL_SCANCODE_L,
    SDL_SCANCODE_UP, SDL_SCANCODE_DOWN, SDL_SCANCODE_LEFT, SDL_SCANCODE_RIGHT,
    SDL_SCANCODE_KP_7, SDL_SCANCODE_KP_8, SDL_SCANCODE_KP_9,
    SDL_SCANCODE_KP_4, SDL_SCANCODE_KP_5, SDL_SCANCODE_KP_6,
    SDL_SCANCODE_F5,
    SDL_SCANCODE_F1, SDL_SCANCODE_RETURN, SDL_SCANCODE_RIGHT,
    SDL_SCANCODE_LEFT, SDL_SCANCODE_F3, SDL_SCANCODE_F2
};

int plat_key(int code)
{
    const Uint8 *keys;
    int count;

    if (code < 0 || code >= PK_COUNT)
        return 0;
    keys = SDL_GetKeyboardState(&count);
    return g_scancode[code] < count && keys[g_scancode[code]] != 0;
}

int plat_pad(int which)
{
    SDL_GameController *pad = g_controller;
    Sint16 x, y, trigger;
    int bits = 0;

    if (which != 0)
        return -1;
    if (!pad) {
        int i;
        for (i = 0; i < SDL_NumJoysticks(); i++) {
            if (SDL_IsGameController(i)) {
                pad = SDL_GameControllerOpen(i);
                if (pad) {
                    g_controller = pad;
                    break;
                }
            }
        }
    }
    if (!pad || !SDL_GameControllerGetAttached(pad))
        return -1;

    x = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTX);
    y = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTY);
    trigger = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_TRIGGERRIGHT);
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_UP) ||
        y < -10000)
        bits |= 1 << 0;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_DOWN) ||
        y > 10000)
        bits |= 1 << 1;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_LEFT) ||
        x < -10000)
        bits |= 1 << 2;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_RIGHT) ||
        x > 10000)
        bits |= 1 << 3;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_X))
        bits |= 1 << 4;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_A))
        bits |= 1 << 5;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_RIGHTSHOULDER))
        bits |= 1 << 6;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_Y))
        bits |= 1 << 7;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_B))
        bits |= 1 << 8;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_LEFTSHOULDER) ||
        trigger > 8000)
        bits |= 1 << 9;
    return bits;
}

double plat_time(void)
{
    if (!g_freq) return 0.0;
    return (double)(SDL_GetPerformanceCounter() - g_start) / (double)g_freq;
}

void plat_close(void)
{
    if (g_controller) {
        SDL_GameControllerClose(g_controller);
        g_controller = NULL;
    }
    if (g_ctx) { SDL_GL_DeleteContext(g_ctx); g_ctx = NULL; }
    if (g_wnd) { SDL_DestroyWindow(g_wnd); g_wnd = NULL; }
    SDL_Quit();
}
