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

static SDL_Window   *g_wnd;
static SDL_GLContext g_ctx;
static bool          g_quit;
static Uint64        g_start, g_freq;
static bool          g_gamecontrollers;

#define SDL_PAD_COUNT 4
static SDL_GameController *g_pad[SDL_PAD_COUNT];
static SDL_JoystickID g_pad_instance[SDL_PAD_COUNT];

static void pad_added(int device_index)
{
    SDL_GameController *pad;
    SDL_JoystickID instance;
    int i, free_slot = -1;

    if (!g_gamecontrollers || !SDL_IsGameController(device_index))
        return;

    pad = SDL_GameControllerOpen(device_index);
    if (!pad) {
        SDL_Log("SDL_GameControllerOpen: %s", SDL_GetError());
        return;
    }
    instance = SDL_JoystickInstanceID(SDL_GameControllerGetJoystick(pad));
    if (instance < 0) {
        SDL_Log("SDL_JoystickInstanceID: %s", SDL_GetError());
        SDL_GameControllerClose(pad);
        return;
    }

    for (i = 0; i < SDL_PAD_COUNT; i++) {
        if (g_pad[i] && g_pad_instance[i] == instance) {
            SDL_GameControllerClose(pad);
            return;
        }
        if (!g_pad[i] && free_slot < 0)
            free_slot = i;
    }
    if (free_slot < 0) {
        SDL_GameControllerClose(pad);
        return;
    }

    g_pad[free_slot] = pad;
    g_pad_instance[free_slot] = instance;
}

static void pad_removed(SDL_JoystickID instance)
{
    int i;

    for (i = 0; i < SDL_PAD_COUNT; i++) {
        if (g_pad[i] && g_pad_instance[i] == instance) {
            SDL_GameControllerClose(g_pad[i]);
            g_pad[i] = NULL;
            break;
        }
    }
}

bool plat_open(const char *title, int width, int height)
{
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        SDL_Log("SDL_Init: %s", SDL_GetError());
        return false;
    }

    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK,
                        SDL_GL_CONTEXT_PROFILE_COMPATIBILITY);
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

    if (SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER) == 0) {
        int i, count;
        g_gamecontrollers = true;
        count = SDL_NumJoysticks();
        if (count < 0)
            SDL_Log("SDL_NumJoysticks: %s", SDL_GetError());
        for (i = 0; i < count; i++)
            pad_added(i);
    } else {
        SDL_Log("SDL_INIT_GAMECONTROLLER: %s", SDL_GetError());
    }

    g_quit  = false;
    g_freq  = SDL_GetPerformanceFrequency();
    g_start = SDL_GetPerformanceCounter();
    return true;
}

static bool g_focused = true;

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
        case SDL_CONTROLLERDEVICEADDED:
            pad_added(ev.cdevice.which);
            break;
        case SDL_CONTROLLERDEVICEREMOVED:
            pad_removed(ev.cdevice.which);
            break;
        default:
            break;
        }
    }
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

double plat_time(void)
{
    if (!g_freq) return 0.0;
    return (double)(SDL_GetPerformanceCounter() - g_start) / (double)g_freq;
}

int plat_mouse(int *x, int *y)
{
    int mx = 0, my = 0;
    int ww = 0, wh = 0, dw = 0, dh = 0;
    Uint32 buttons = SDL_GetMouseState(&mx, &my);

    if (g_wnd) {
        SDL_GetWindowSize(g_wnd, &ww, &wh);
        SDL_GL_GetDrawableSize(g_wnd, &dw, &dh);
        if (ww > 0 && dw > 0)
            mx = (int)((long long)mx * dw / ww);
        if (wh > 0 && dh > 0)
            my = (int)((long long)my * dh / wh);
    }
    if (x) *x = mx;
    if (y) *y = my;
    return (buttons & SDL_BUTTON_LMASK) ? 1 : 0;
}

int plat_pad(int which)
{
    SDL_GameController *pad;
    int bits = 0;
    Sint16 lx, ly, rt;

    if (!g_gamecontrollers || which < 0 || which >= SDL_PAD_COUNT)
        return -1;
    pad = g_pad[which];
    if (!pad || !SDL_GameControllerGetAttached(pad))
        return -1;

    lx = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTX);
    ly = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_LEFTY);
    rt = SDL_GameControllerGetAxis(pad, SDL_CONTROLLER_AXIS_TRIGGERRIGHT);

    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_UP) ||
        ly < -10000)
        bits |= 1 << 0;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_DOWN) ||
        ly > 10000)
        bits |= 1 << 1;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_LEFT) ||
        lx < -10000)
        bits |= 1 << 2;
    if (SDL_GameControllerGetButton(pad, SDL_CONTROLLER_BUTTON_DPAD_RIGHT) ||
        lx > 10000)
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
        rt > 8192)
        bits |= 1 << 9;
    return bits;
}

int plat_key(int code)
{
    const Uint8 *keys = SDL_GetKeyboardState(NULL);
    SDL_Scancode key;

    switch (code) {
    case PK_UP:       key = SDL_SCANCODE_W; break;
    case PK_DOWN:     key = SDL_SCANCODE_S; break;
    case PK_LEFT:     key = SDL_SCANCODE_A; break;
    case PK_RIGHT:    key = SDL_SCANCODE_D; break;
    case PK_HP:       key = SDL_SCANCODE_U; break;
    case PK_LP:       key = SDL_SCANCODE_I; break;
    case PK_BL:       key = SDL_SCANCODE_O; break;
    case PK_HK:       key = SDL_SCANCODE_J; break;
    case PK_LK:       key = SDL_SCANCODE_K; break;
    case PK_RUN:      key = SDL_SCANCODE_L; break;
    case PK_P2_UP:    key = SDL_SCANCODE_UP; break;
    case PK_P2_DOWN:  key = SDL_SCANCODE_DOWN; break;
    case PK_P2_LEFT:  key = SDL_SCANCODE_LEFT; break;
    case PK_P2_RIGHT: key = SDL_SCANCODE_RIGHT; break;
    case PK_P2_HP:    key = SDL_SCANCODE_KP_7; break;
    case PK_P2_LP:    key = SDL_SCANCODE_KP_8; break;
    case PK_P2_BL:    key = SDL_SCANCODE_KP_9; break;
    case PK_P2_HK:    key = SDL_SCANCODE_KP_4; break;
    case PK_P2_LK:    key = SDL_SCANCODE_KP_5; break;
    case PK_P2_RUN:   key = SDL_SCANCODE_KP_6; break;
    case PK_RESET:    key = SDL_SCANCODE_F5; break;
    case PK_MENU:     key = SDL_SCANCODE_F1; break;
    case PK_OK:       key = SDL_SCANCODE_RETURN; break;
    case PK_NEXT:     key = SDL_SCANCODE_RIGHT; break;
    case PK_PREV:     key = SDL_SCANCODE_LEFT; break;
    case PK_BACK:     key = SDL_SCANCODE_F3; break;
    case PK_TEST:     key = SDL_SCANCODE_F2; break;
    default:          return 0;
    }

    return keys[key] != 0;
}

void plat_close(void)
{
    int i;

    for (i = 0; i < SDL_PAD_COUNT; i++) {
        if (g_pad[i]) {
            SDL_GameControllerClose(g_pad[i]);
            g_pad[i] = NULL;
        }
    }
    g_gamecontrollers = false;
    if (g_ctx) { SDL_GL_DeleteContext(g_ctx); g_ctx = NULL; }
    if (g_wnd) { SDL_DestroyWindow(g_wnd); g_wnd = NULL; }
    SDL_Quit();
}
