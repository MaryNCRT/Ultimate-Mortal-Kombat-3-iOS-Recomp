/*
 * Win32 + WGL backend.
 *
 * Chosen for the vertical slice because it needs nothing installed and because
 * the engine is OpenGL ES 1.1 fixed function -- glMatrixMode, glVertexPointer,
 * glTexEnvf, glDrawElements -- which desktop GL 1.1 provides directly. The 18
 * calls RenderMesh.cpp makes map almost one to one.
 *
 * That is a deliberate shortcut for a slice, not the shipping plan. A release
 * renderer should target a core profile and emulate the fixed-function bits it
 * needs, because compatibility contexts are not guaranteed everywhere. See
 * docs/LIME-ENGINE.md for the full 77-entry-point surface.
 */
#include "platform.h"
#include "gl.h"

#include <stdio.h>
#include <string.h>

static HWND      g_wnd;
static HDC       g_dc;
static HGLRC     g_rc;
static bool      g_quit;
static LARGE_INTEGER g_freq, g_start;
static bool      g_mouse_down;
static int       g_mouse_x, g_mouse_y;
static unsigned char g_key[256];

static LRESULT CALLBACK wndproc(HWND h, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_CLOSE:
    case WM_DESTROY:
        g_quit = true;
        return 0;
    case WM_KEYDOWN:
        if (wp == VK_ESCAPE) g_quit = true;
        if (wp < 256) g_key[wp] = 1;
        return 0;
    case WM_KEYUP:
        if (wp < 256) g_key[wp] = 0;
        return 0;
    /* The pointer, which the front end reads as a finger. The position comes
     * from the message rather than from GetCursorPos so that it is already in
     * client coordinates, and the capture stops a drag that leaves the window
     * from silently leaving the button down. */
    case WM_LBUTTONDOWN:
        g_mouse_down = true;
        SetCapture(h);
        g_mouse_x = (short)LOWORD(lp);
        g_mouse_y = (short)HIWORD(lp);
        return 0;
    case WM_LBUTTONUP:
        g_mouse_down = false;
        ReleaseCapture();
        return 0;
    case WM_MOUSEMOVE:
        g_mouse_x = (short)LOWORD(lp);
        g_mouse_y = (short)HIWORD(lp);
        return 0;
    case WM_SIZE: {
        int w = LOWORD(lp), h2 = HIWORD(lp);
        if (w > 0 && h2 > 0) glViewport(0, 0, w, h2);
        return 0;
    }
    default:
        return DefWindowProcA(h, msg, wp, lp);
    }
}

bool plat_open(const char *title, int width, int height)
{
    HINSTANCE inst = GetModuleHandleA(NULL);

    WNDCLASSA wc;
    ZeroMemory(&wc, sizeof(wc));
    wc.style         = CS_OWNDC;
    wc.lpfnWndProc   = wndproc;
    wc.hInstance     = inst;
    wc.hCursor       = LoadCursorA(NULL, IDC_ARROW);
    wc.lpszClassName = "LimeWindow";
    if (!RegisterClassA(&wc)) return false;

    RECT r = { 0, 0, width, height };
    AdjustWindowRect(&r, WS_OVERLAPPEDWINDOW, FALSE);

    g_wnd = CreateWindowA("LimeWindow", title, WS_OVERLAPPEDWINDOW,
                          CW_USEDEFAULT, CW_USEDEFAULT,
                          r.right - r.left, r.bottom - r.top,
                          NULL, NULL, inst, NULL);
    if (!g_wnd) return false;

    g_dc = GetDC(g_wnd);

    PIXELFORMATDESCRIPTOR pfd;
    ZeroMemory(&pfd, sizeof(pfd));
    pfd.nSize      = sizeof(pfd);
    pfd.nVersion   = 1;
    pfd.dwFlags    = PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER;
    pfd.iPixelType = PFD_TYPE_RGBA;
    pfd.cColorBits = 32;
    pfd.cDepthBits = 24;

    int fmt = ChoosePixelFormat(g_dc, &pfd);
    if (!fmt || !SetPixelFormat(g_dc, fmt, &pfd)) return false;

    g_rc = wglCreateContext(g_dc);
    if (!g_rc || !wglMakeCurrent(g_dc, g_rc)) return false;

    ShowWindow(g_wnd, SW_SHOW);
    glViewport(0, 0, width, height);

    QueryPerformanceFrequency(&g_freq);
    QueryPerformanceCounter(&g_start);
    return true;
}

bool plat_poll(void)
{
    MSG msg;
    while (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE)) {
        TranslateMessage(&msg);
        DispatchMessageA(&msg);
    }
    return !g_quit;
}

bool plat_swap(void) { return SwapBuffers(g_dc) != FALSE; }

void plat_size(int *width, int *height)
{
    RECT r;
    GetClientRect(g_wnd, &r);
    if (width)  *width  = r.right - r.left;
    if (height) *height = r.bottom - r.top;
}

double plat_time(void)
{
    LARGE_INTEGER now;
    QueryPerformanceCounter(&now);
    return (double)(now.QuadPart - g_start.QuadPart) / (double)g_freq.QuadPart;
}

void plat_close(void)
{
    if (g_rc) { wglMakeCurrent(NULL, NULL); wglDeleteContext(g_rc); g_rc = NULL; }
    if (g_dc) { ReleaseDC(g_wnd, g_dc); g_dc = NULL; }
    if (g_wnd) { DestroyWindow(g_wnd); g_wnd = NULL; }
}

/* Where the pointer is, and whether it is pressed. The front end has no mouse:
 * it reads a touch position, with -1 for "nothing is down", so the caller maps
 * one onto the other. */
int plat_mouse(int *x, int *y)
{
    if (x) *x = g_mouse_x;
    if (y) *y = g_mouse_y;
    return g_mouse_down ? 1 : 0;
}


/* ------------------------------------------------------------------- input
 *
 * The keyboard map. Player one is the left hand plus the number row, player
 * two is the numeric keypad -- so two people can share one keyboard, which is
 * the only way to test a fight without two pads.
 *
 * These are the DEFAULTS and they are here, in the backend, rather than in the
 * engine, because the engine has no idea what a key is. It takes ten bits.
 */
static const int g_vk[PK_COUNT] = {
    'W', 'S', 'A', 'D',                 /* P1 directions */
    'U', 'I', 'O', 'J', 'K', 'L',       /* P1  HP LP BL HK LK RUN */
    VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT,  /* P2 directions */
    VK_NUMPAD7, VK_NUMPAD8, VK_NUMPAD9, /* P2  HP LP BL */
    VK_NUMPAD4, VK_NUMPAD5, VK_NUMPAD6, /* P2  HK LK RUN */
    VK_F5                               /* reset the scene */
};

int plat_key(int code)
{
    if (code < 0 || code >= PK_COUNT)
        return 0;
    return g_key[g_vk[code]] ? 1 : 0;
}

/* The gamepad, through XInput loaded at run time.
 *
 * `LoadLibrary` rather than a link-time import on purpose: a machine with no
 * XInput still runs the build, `plat_pad` just answers -1 forever. The engine
 * cannot tell the difference between no pad and a pad with nothing pressed,
 * and that is the right behaviour -- a missing driver must never be a crash.
 */
#define PAD_A       0x1000
#define PAD_B       0x2000
#define PAD_X       0x4000
#define PAD_Y       0x8000
#define PAD_LB      0x0100
#define PAD_RB      0x0200
#define PAD_DUP     0x0001
#define PAD_DDOWN   0x0002
#define PAD_DLEFT   0x0004
#define PAD_DRIGHT  0x0008

typedef struct { unsigned long packet; unsigned short buttons;
                 unsigned char lt, rt; short lx, ly, rx, ry; } PAD_STATE;
typedef unsigned long (__stdcall *PADGET)(unsigned long, PAD_STATE *);

static PADGET g_padget;
static int    g_pad_tried;

int plat_pad(int which)
{
    PAD_STATE s;
    int bits = 0;

    if (!g_pad_tried) {
        static const char *dll[] = { "xinput1_4.dll", "xinput1_3.dll",
                                     "xinput9_1_0.dll", "xinput1_2.dll" };
        int i;
        g_pad_tried = 1;
        for (i = 0; i < 4 && !g_padget; i++) {
            HMODULE m = LoadLibraryA(dll[i]);
            if (m)
                g_padget = (PADGET)(void *)GetProcAddress(m, "XInputGetState");
        }
    }
    if (!g_padget)
        return -1;

    memset(&s, 0, sizeof s);
    if (g_padget((unsigned long)which, &s) != 0)
        return -1;                      /* nothing plugged into that slot */

    /* The stick counts as a direction past a third of its range, so the pad
     * feels like the arcade's switch rather than like an analogue axis. */
    if ((s.buttons & PAD_DUP)    || s.ly >  10000) bits |= 1 << 0;
    if ((s.buttons & PAD_DDOWN)  || s.ly < -10000) bits |= 1 << 1;
    if ((s.buttons & PAD_DLEFT)  || s.lx < -10000) bits |= 1 << 2;
    if ((s.buttons & PAD_DRIGHT) || s.lx >  10000) bits |= 1 << 3;

    /* Face buttons to the punches and kicks, shoulders to block and run --
     * the layout a six-button fighter normally gets on a four-button pad. */
    if (s.buttons & PAD_X)  bits |= 1 << 4;      /* HP  */
    if (s.buttons & PAD_A)  bits |= 1 << 5;      /* LP  */
    if (s.buttons & PAD_RB) bits |= 1 << 6;      /* BL  */
    if (s.buttons & PAD_Y)  bits |= 1 << 7;      /* HK  */
    if (s.buttons & PAD_B)  bits |= 1 << 8;      /* LK  */
    if (s.buttons & PAD_LB) bits |= 1 << 9;      /* RUN */
    if (s.rt > 64)          bits |= 1 << 9;

    return bits;
}
