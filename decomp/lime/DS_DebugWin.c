/*
 * lime/common/DS_DebugWin.c -- the on-screen debug overlay.
 *
 * Recovered from the armv6 slice. Addresses below are armv6.
 *
 * A set of numbered text windows the engine could print into at runtime, plus
 * six sliders for live-tweaking values. This is the machinery behind the debug
 * menu whose labels survive in the binary -- `Shadow HeightFrom Ground`,
 * `Poly Count %d  Joy: %d`, `AI: CPU vs CPU`, `Speed: Slow-mo`.
 *
 * Structure established here:
 *
 *  - windows are an **array of fixed-size records** indexed by a small integer,
 *    with `-1` meaning "no window";
 *  - each window holds **50 lines** (`0x31` is the last valid index, and
 *    reaching it triggers a scroll);
 *  - a window's first two words are its **column** and **line** cursors, at
 *    +0x00 and +0x04;
 *  - **sliders live in window slots 10 through 15** -- six of them, which is
 *    exactly what LIME_KillSliders clears.
 *
 * The record size is deliberately not stated. The literal pools here
 * disassemble as `0xe12fff1e` (`bx lr` read as data), so the constants cannot
 * be pinned down from this pass, and guessing one would be worse than leaving
 * it open.
 */

#include "lime.h"


/* ------------------------------------------------------------- LIME_printf
 *
 * armv6 0x000ed4dc, 8 bytes.
 *
 * ```
 * push {r1, r2, r3}
 * add  sp, sp, #0xc
 * bx   lr
 * ```
 *
 * **Compiled away.** It pushes its variadic arguments to the stack and pops
 * them again without reading one. The formatting body was behind a switch that
 * shipped off, exactly like `RenderAxesLines` in RenderMesh.cpp.
 *
 * That is a finding rather than a gap: nothing in the retail binary prints
 * through this, so any log output seen from the game comes from somewhere else.
 */
void LIME_printf(const char *fmt, ...)
{
    (void)fmt;
}


/* -------------------------------------------------------------- DW_NewLine
 *
 * armv6 0x000ed438, 32 bytes.
 *
 * Ends a line: resets the column to zero, advances the line, and scrolls when
 * the window is full rather than wrapping or overflowing.
 *
 * `0x31` is 49, so a window is **50 lines**, and after a scroll the cursor is
 * pinned to the last line rather than to the first free one -- which is what
 * makes it behave like a terminal.
 */
void DW_NewLine(DEBUGWINDOW *win)
{
    win->column = 0;                    /* +0x00 */
    win->line++;                        /* +0x04 */

    if (win->line > 0x31) {
        DS_ScrollLines(win);
        win->line = 0x31;
    }
}


/* ----------------------------------------------------------- DS_ScrollLines
 *
 * armv6 0x000ed330, 56 bytes.
 *
 * Moves every line up by one, copying each word to the slot four bytes below
 * it, 49 times. A straight memmove of the text block; nothing is cleared at
 * the bottom, because the caller is about to write there.
 */
void DS_ScrollLines(DEBUGWINDOW *win)
{
    int i;
    for (i = 1; i < 0x31; i++)
        win->lines[i - 1] = win->lines[i];
}


/* -------------------------------------------------------- ClearDebugWindow
 *
 * armv6 0x000ed244, 68 bytes.
 *
 * Resets one window by index. **`-1` returns immediately**, which is how the
 * engine says "no window" without a separate flag.
 *
 * Four fields are zeroed: +0x00 and +0x04 (the two cursors), +0x18, and a
 * single byte at +0x38.
 */
void ClearDebugWindow(int index)
{
    DEBUGWINDOW *win;

    if (index == -1)
        return;

    win = &g_debugWindows[index];
    win->column = 0;                    /* +0x00 */
    win->line = 0;                      /* +0x04 */
    win->field18 = 0;                   /* +0x18 */
    win->flag38 = 0;                    /* +0x38, one byte */
}


/* ---------------------------------------------------------- LIME_KillSliders
 *
 * armv6 0x000ed2a4, 104 bytes.
 *
 * Clears window slots **10, 11, 12, 13, 14 and 15** -- six unrolled calls to
 * ClearDebugWindow with literal indices.
 *
 * So the slider area is a fixed reservation inside the same window array
 * rather than a separate structure, and there are exactly six sliders. The
 * indices are hard-coded, so adding a seventh would have meant editing this
 * function.
 */
void LIME_KillSliders(void)
{
    ClearDebugWindow(10);
    ClearDebugWindow(11);
    ClearDebugWindow(12);
    ClearDebugWindow(13);
    ClearDebugWindow(14);
    ClearDebugWindow(15);
}
