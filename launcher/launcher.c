/* UMK3-Launcher.exe -- settings, the build from the player's .ipa, and Play.
 *
 * Lives in the game folder, beside umk3-game.exe, res\ and umk3.ini, and
 * touches nothing outside that folder:
 *
 *   - "Compilar" runs launcher\build_game.ps1 on the chosen .ipa, which
 *     compiles umk3-game.exe and fills res\ from it. No game data ships with
 *     the port, so until this has run there is nothing to play.
 *   - Resolution, fullscreen and language are written to umk3.ini the moment
 *     they change; the game reads them at start (runtime/game_main.c).
 *   - "Jugar" starts umk3-game.exe.
 *
 * Plain Win32, no resources: one window, built by hand.
 */
#define WIN32_LEAN_AND_MEAN
#define UNICODE
#define _UNICODE
#include <windows.h>
#include <commdlg.h>
#include <stdio.h>
#include <wchar.h>

#define VERSION L"0.0.1 alpha"

enum { ID_IPA = 100, ID_BROWSE, ID_BUILD, ID_RES, ID_FULL, ID_LANG, ID_PLAY,
       ID_STATUS };

static const struct { int w, h; } k_res[] = {
    { 480, 320 }, { 960, 640 }, { 1440, 960 }, { 1920, 1280 },
    { 2400, 1600 }, { 2880, 1920 }, { 3840, 2560 },
};
#define NRES (int)(sizeof k_res / sizeof k_res[0])

/* The languages Info.plist maps (LANGUAGE_TEXT_xx); "" follows Windows. */
static const struct { const wchar_t *code, *name; } k_lang[] = {
    { L"",   L"Automatico (Windows)" },
    { L"EN", L"English" },
    { L"ES", L"Español" },
    { L"FR", L"Français" },
    { L"DE", L"Deutsch" },
    { L"IT", L"Italiano" },
    { L"KO", L"한국어" },
    { L"ZH", L"中文" },
};
#define NLANG (int)(sizeof k_lang / sizeof k_lang[0])

static wchar_t g_dir[MAX_PATH];        /* the launcher's folder, with '\' */
static HWND    g_wnd, g_ipa, g_res, g_full, g_lang, g_play, g_build, g_status;
static HFONT   g_font;
static int     g_cfg_res = 1, g_cfg_full, g_cfg_lang;
static wchar_t g_cfg_ipa[MAX_PATH];
static HANDLE  g_build_proc;

static void path_in_dir(wchar_t *out, size_t n, const wchar_t *name)
{
    _snwprintf(out, n, L"%ls%ls", g_dir, name);
    out[n - 1] = 0;
}

static int exists(const wchar_t *name)
{
    wchar_t p[MAX_PATH * 2];
    path_in_dir(p, MAX_PATH * 2, name);
    return GetFileAttributesW(p) != INVALID_FILE_ATTRIBUTES;
}

/* ------------------------------------------------------------- umk3.ini */

static void load_config(void)
{
    wchar_t p[MAX_PATH * 2];
    char line[MAX_PATH * 3];
    FILE *f;
    int w = 960, h = 640, i;

    path_in_dir(p, MAX_PATH * 2, L"umk3.ini");
    f = _wfopen(p, L"r");
    if (!f)
        return;
    while (fgets(line, sizeof line, f)) {
        char *v = strchr(line, '='), *e;
        if (!v)
            continue;
        *v++ = 0;
        for (e = v + strlen(v); e > v && (unsigned char)e[-1] <= 32; )
            *--e = 0;
        if (strcmp(line, "width") == 0)
            w = atoi(v);
        else if (strcmp(line, "height") == 0)
            h = atoi(v);
        else if (strcmp(line, "fullscreen") == 0)
            g_cfg_full = atoi(v) != 0;
        else if (strcmp(line, "language") == 0) {
            for (i = 0; i < NLANG; i++) {
                char c[8];
                WideCharToMultiByte(CP_UTF8, 0, k_lang[i].code, -1, c, sizeof c,
                                    NULL, NULL);
                if (_stricmp(c, v) == 0)
                    g_cfg_lang = i;
            }
        } else if (strcmp(line, "ipa") == 0)
            MultiByteToWideChar(CP_UTF8, 0, v, -1, g_cfg_ipa, MAX_PATH);
    }
    fclose(f);
    for (i = 0; i < NRES; i++)
        if (k_res[i].w == w && k_res[i].h == h)
            g_cfg_res = i;
}

static void save_config(void)
{
    wchar_t p[MAX_PATH * 2];
    char ipa[MAX_PATH * 3], lang[8];
    FILE *f;

    path_in_dir(p, MAX_PATH * 2, L"umk3.ini");
    f = _wfopen(p, L"w");
    if (!f)
        return;
    WideCharToMultiByte(CP_UTF8, 0, g_cfg_ipa, -1, ipa, sizeof ipa, NULL, NULL);
    WideCharToMultiByte(CP_UTF8, 0, k_lang[g_cfg_lang].code, -1, lang, sizeof lang,
                        NULL, NULL);
    fprintf(f, "width=%d\nheight=%d\nfullscreen=%d\nlanguage=%s\nipa=%s\n",
            k_res[g_cfg_res].w, k_res[g_cfg_res].h, g_cfg_full, lang, ipa);
    fclose(f);
}

/* --------------------------------------------------------------- state */

static int game_ready(void)
{
    return exists(L"umk3-game.exe") && exists(L"res\\Info.plist");
}

static void refresh(void)
{
    int building = g_build_proc != NULL;

    EnableWindow(g_play, !building && game_ready());
    EnableWindow(g_build, !building);
    if (building)
        SetWindowTextW(g_status, L"Compilando... sigue el progreso en la ventana de consola.");
    else if (game_ready())
        SetWindowTextW(g_status, L"Juego listo. Pulsa Jugar.");
    else
        SetWindowTextW(g_status, L"Falta compilar: elige tu UMK3 .ipa (v1.2.59 iPhone) y pulsa Compilar.");
}

static void browse(void)
{
    OPENFILENAMEW ofn;
    wchar_t file[MAX_PATH];

    wcscpy(file, g_cfg_ipa);
    ZeroMemory(&ofn, sizeof ofn);
    ofn.lStructSize = sizeof ofn;
    ofn.hwndOwner = g_wnd;
    ofn.lpstrFilter = L"UMK3 .ipa\0*.ipa\0Todos\0*.*\0";
    ofn.lpstrFile = file;
    ofn.nMaxFile = MAX_PATH;
    ofn.Flags = OFN_FILEMUSTEXIST | OFN_PATHMUSTEXIST | OFN_NOCHANGEDIR;
    if (GetOpenFileNameW(&ofn)) {
        wcscpy(g_cfg_ipa, file);
        SetWindowTextW(g_ipa, g_cfg_ipa);
        save_config();
    }
}

static DWORD WINAPI wait_build(LPVOID arg)
{
    (void)arg;
    WaitForSingleObject(g_build_proc, INFINITE);
    PostMessageW(g_wnd, WM_APP, 0, 0);
    return 0;
}

static void build(void)
{
    wchar_t cmd[MAX_PATH * 4];
    STARTUPINFOW si;
    PROCESS_INFORMATION pi;

    GetWindowTextW(g_ipa, g_cfg_ipa, MAX_PATH);
    if (!g_cfg_ipa[0] || GetFileAttributesW(g_cfg_ipa) == INVALID_FILE_ATTRIBUTES) {
        MessageBoxW(g_wnd, L"Elige primero tu archivo .ipa de UMK3.", L"UMK3 Launcher",
                    MB_OK | MB_ICONWARNING);
        return;
    }
    save_config();
    /* cmd /k-style pause at the end so the player can read the result. */
    _snwprintf(cmd, sizeof cmd / sizeof cmd[0],
               L"powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "
               L"\"& '%lslauncher\\build_game.ps1' -Ipa '%ls'; "
               L"Write-Host ''; Read-Host 'Pulsa Enter para cerrar'; exit $LASTEXITCODE\"",
               g_dir, g_cfg_ipa);
    cmd[sizeof cmd / sizeof cmd[0] - 1] = 0;
    ZeroMemory(&si, sizeof si);
    si.cb = sizeof si;
    if (!CreateProcessW(NULL, cmd, NULL, NULL, FALSE, CREATE_NEW_CONSOLE, NULL,
                        g_dir, &si, &pi)) {
        MessageBoxW(g_wnd, L"No se pudo iniciar PowerShell.", L"UMK3 Launcher",
                    MB_OK | MB_ICONERROR);
        return;
    }
    CloseHandle(pi.hThread);
    g_build_proc = pi.hProcess;
    CloseHandle(CreateThread(NULL, 0, wait_build, NULL, 0, NULL));
    refresh();
}

static void play(void)
{
    wchar_t exe[MAX_PATH * 2];
    STARTUPINFOW si;
    PROCESS_INFORMATION pi;

    save_config();
    path_in_dir(exe, MAX_PATH * 2, L"umk3-game.exe");
    ZeroMemory(&si, sizeof si);
    si.cb = sizeof si;
    if (!CreateProcessW(exe, NULL, NULL, NULL, FALSE, 0, NULL, g_dir, &si, &pi)) {
        MessageBoxW(g_wnd, L"No se pudo iniciar umk3-game.exe.", L"UMK3 Launcher",
                    MB_OK | MB_ICONERROR);
        return;
    }
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
}

/* -------------------------------------------------------------- window */

static HWND add(const wchar_t *cls, const wchar_t *text, DWORD style,
                int x, int y, int w, int h, int id)
{
    HWND c = CreateWindowExW(0, cls, text, WS_CHILD | WS_VISIBLE | style,
                             x, y, w, h, g_wnd, (HMENU)(INT_PTR)id,
                             GetModuleHandleW(NULL), NULL);
    SendMessageW(c, WM_SETFONT, (WPARAM)g_font, TRUE);
    return c;
}

static void build_ui(void)
{
    int i;
    wchar_t s[64];

    add(L"STATIC", L"Ultimate Mortal Kombat 3 -- port de PC " VERSION, 0,
        16, 12, 440, 20, 0);

    add(L"BUTTON", L"1. Tu .ipa (se compila el juego con el)", BS_GROUPBOX,
        10, 40, 460, 90, 0);
    g_ipa = add(L"EDIT", g_cfg_ipa, WS_BORDER | ES_AUTOHSCROLL, 22, 62, 340, 24, ID_IPA);
    add(L"BUTTON", L"Buscar...", BS_PUSHBUTTON, 370, 61, 88, 26, ID_BROWSE);
    g_build = add(L"BUTTON", L"Compilar", BS_PUSHBUTTON, 22, 94, 120, 28, ID_BUILD);

    add(L"BUTTON", L"2. Configuracion (se guarda sola)", BS_GROUPBOX,
        10, 140, 460, 120, 0);
    add(L"STATIC", L"Resolucion 3D:", 0, 22, 166, 110, 20, 0);
    g_res = add(L"COMBOBOX", NULL, CBS_DROPDOWNLIST | WS_VSCROLL, 140, 162, 200, 300, ID_RES);
    for (i = 0; i < NRES; i++) {
        _snwprintf(s, 64, L"%d x %d%ls", k_res[i].w, k_res[i].h,
                   i == 0 ? L" (original)" : L"");
        SendMessageW(g_res, CB_ADDSTRING, 0, (LPARAM)s);
    }
    SendMessageW(g_res, CB_SETCURSEL, g_cfg_res, 0);
    g_full = add(L"BUTTON", L"Pantalla completa", BS_AUTOCHECKBOX, 140, 194, 200, 22, ID_FULL);
    SendMessageW(g_full, BM_SETCHECK, g_cfg_full ? BST_CHECKED : BST_UNCHECKED, 0);
    add(L"STATIC", L"Idioma:", 0, 22, 228, 110, 20, 0);
    g_lang = add(L"COMBOBOX", NULL, CBS_DROPDOWNLIST | WS_VSCROLL, 140, 224, 200, 300, ID_LANG);
    for (i = 0; i < NLANG; i++)
        SendMessageW(g_lang, CB_ADDSTRING, 0, (LPARAM)k_lang[i].name);
    SendMessageW(g_lang, CB_SETCURSEL, g_cfg_lang, 0);

    g_play = add(L"BUTTON", L"JUGAR", BS_DEFPUSHBUTTON, 10, 272, 460, 44, ID_PLAY);
    g_status = add(L"STATIC", L"", 0, 12, 326, 456, 36, ID_STATUS);
    refresh();
}

static LRESULT CALLBACK wndproc(HWND h, UINT msg, WPARAM wp, LPARAM lp)
{
    switch (msg) {
    case WM_COMMAND:
        switch (LOWORD(wp)) {
        case ID_BROWSE: browse(); break;
        case ID_BUILD:  build();  break;
        case ID_PLAY:   play();   break;
        case ID_FULL:
            g_cfg_full = SendMessageW(g_full, BM_GETCHECK, 0, 0) == BST_CHECKED;
            save_config();
            break;
        case ID_RES:
            if (HIWORD(wp) == CBN_SELCHANGE) {
                g_cfg_res = (int)SendMessageW(g_res, CB_GETCURSEL, 0, 0);
                save_config();
            }
            break;
        case ID_LANG:
            if (HIWORD(wp) == CBN_SELCHANGE) {
                g_cfg_lang = (int)SendMessageW(g_lang, CB_GETCURSEL, 0, 0);
                save_config();
            }
            break;
        case ID_IPA:
            if (HIWORD(wp) == EN_KILLFOCUS) {
                GetWindowTextW(g_ipa, g_cfg_ipa, MAX_PATH);
                save_config();
            }
            break;
        }
        return 0;
    case WM_APP:                        /* the build finished */
        CloseHandle(g_build_proc);
        g_build_proc = NULL;
        refresh();
        if (game_ready())
            MessageBoxW(h, L"Juego compilado. Ya puedes pulsar Jugar.", L"UMK3 Launcher",
                        MB_OK | MB_ICONINFORMATION);
        return 0;
    case WM_CTLCOLORSTATIC:
        SetBkMode((HDC)wp, TRANSPARENT);
        return (LRESULT)GetSysColorBrush(COLOR_BTNFACE);
    case WM_DESTROY:
        PostQuitMessage(0);
        return 0;
    }
    return DefWindowProcW(h, msg, wp, lp);
}

int WINAPI wWinMain(HINSTANCE inst, HINSTANCE prev, PWSTR cmd, int show)
{
    WNDCLASSW wc;
    RECT r = { 0, 0, 480, 370 };
    NONCLIENTMETRICSW ncm;
    MSG msg;
    wchar_t *slash;
    DWORD style = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU | WS_MINIMIZEBOX;

    (void)prev; (void)cmd;
    GetModuleFileNameW(NULL, g_dir, MAX_PATH);
    slash = wcsrchr(g_dir, L'\\');
    if (slash)
        slash[1] = 0;
    load_config();

    ncm.cbSize = sizeof ncm;
    SystemParametersInfoW(SPI_GETNONCLIENTMETRICS, sizeof ncm, &ncm, 0);
    g_font = CreateFontIndirectW(&ncm.lfMessageFont);

    ZeroMemory(&wc, sizeof wc);
    wc.lpfnWndProc = wndproc;
    wc.hInstance = inst;
    wc.hCursor = LoadCursorW(NULL, (LPCWSTR)IDC_ARROW);
    wc.hIcon = LoadIconW(NULL, (LPCWSTR)IDI_APPLICATION);
    wc.hbrBackground = GetSysColorBrush(COLOR_BTNFACE);
    wc.lpszClassName = L"UMK3Launcher";
    RegisterClassW(&wc);

    AdjustWindowRect(&r, style, FALSE);
    g_wnd = CreateWindowW(L"UMK3Launcher", L"UMK3 Launcher " VERSION, style,
                          CW_USEDEFAULT, CW_USEDEFAULT, r.right - r.left,
                          r.bottom - r.top, NULL, NULL, inst, NULL);
    build_ui();
    ShowWindow(g_wnd, show);

    while (GetMessageW(&msg, NULL, 0, 0)) {
        if (IsDialogMessageW(g_wnd, &msg))
            continue;
        TranslateMessage(&msg);
        DispatchMessageW(&msg);
    }
    return 0;
}
