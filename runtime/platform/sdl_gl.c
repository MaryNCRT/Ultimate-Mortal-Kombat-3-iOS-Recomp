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
#include <stdlib.h>
#include <string.h>

static SDL_Window   *g_wnd;
static SDL_GLContext g_ctx;
static bool          g_quit;
static Uint64        g_start, g_freq;

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

void plat_close(void)
{
    if (g_ctx) { SDL_GL_DeleteContext(g_ctx); g_ctx = NULL; }
    if (g_wnd) { SDL_DestroyWindow(g_wnd); g_wnd = NULL; }
    SDL_Quit();
}


/* UTF-16 (the game's strings) to UTF-8 (SDL's), BMP only -- the game's text
 * has no surrogate pairs. */
static void utf16_to_utf8(const unsigned short *in, char *out, size_t n)
{
    size_t o = 0;

    for (; in && *in && o + 4 < n; in++) {
        unsigned c = *in;
        if (c < 0x80) {
            out[o++] = (char)c;
        } else if (c < 0x800) {
            out[o++] = (char)(0xc0 | (c >> 6));
            out[o++] = (char)(0x80 | (c & 0x3f));
        } else {
            out[o++] = (char)(0xe0 | (c >> 12));
            out[o++] = (char)(0x80 | ((c >> 6) & 0x3f));
            out[o++] = (char)(0x80 | (c & 0x3f));
        }
    }
    out[o] = 0;
}

int plat_ask(const unsigned short *msg, const unsigned short *ok,
             const unsigned short *cancel)
{
    char m[1024], a[128], b[128];
    SDL_MessageBoxButtonData btn[2];
    SDL_MessageBoxData box;
    int hit = -1;

    utf16_to_utf8(msg, m, sizeof m);
    utf16_to_utf8(ok, a, sizeof a);
    utf16_to_utf8(cancel, b, sizeof b);

    btn[0].flags = SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT;
    btn[0].buttonid = 0;
    btn[0].text = a;
    btn[1].flags = SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT;
    btn[1].buttonid = 1;
    btn[1].text = b;

    memset(&box, 0, sizeof box);
    box.flags = SDL_MESSAGEBOX_INFORMATION;
    box.window = g_wnd;
    box.title = "Ultimate Mortal Kombat 3";
    box.message = m;
    box.numbuttons = cancel ? 2 : 1;
    box.buttons = btn;

    if (SDL_ShowMessageBox(&box, &hit) != 0 || hit < 0)
        return cancel ? 1 : 0;
    return hit;
}

/* POSIX locale variables, in the order setlocale(LC_MESSAGES) reads them:
 * "es_CO.UTF-8" gives "es". */
void plat_language(char *out, int n)
{
    static const char *vars[] = { "LC_ALL", "LC_MESSAGES", "LANG" };
    const char *v = NULL;
    int i;

    if (n <= 0)
        return;
    out[0] = 0;
    for (i = 0; i < 3 && (v == NULL || *v == 0); i++)
        v = getenv(vars[i]);
    if (v == NULL || strcmp(v, "C") == 0 || strcmp(v, "POSIX") == 0)
        return;
    for (i = 0; i < n - 1 && v[i] && v[i] != '_' && v[i] != '.' && v[i] != '@'; i++)
        out[i] = v[i];
    out[i] = 0;
}
