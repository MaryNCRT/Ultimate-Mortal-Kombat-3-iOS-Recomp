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

static HWND      g_wnd;
static HDC       g_dc;
static HGLRC     g_rc;
static bool      g_quit;
static LARGE_INTEGER g_freq, g_start;

static LRESULT CALLBACK wndproc(HWND h, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_CLOSE:
    case WM_DESTROY:
        g_quit = true;
        return 0;
    case WM_KEYDOWN:
        if (wp == VK_ESCAPE) g_quit = true;
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
