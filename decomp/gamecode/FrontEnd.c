/*
 * FrontEnd.c — src/gamecode/FrontEnd.cpp (menus and screens)
 *
 * 125 functions in the original. These three are the coordinate scalers every
 * other one goes through, which makes them worth having first: they are the
 * front end's whole relationship with the screen it is drawn on.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against the
 * oracle by tests/test_frontend_diff.c.
 */

#include <stdint.h>
#include <string.h>

/* Both live in the slice's data and both hold 1.0f as shipped. */
extern float FE_WidthScale;             /* 0x000ff9b8 */
extern float FE_HeightScale;            /* 0x000ff9bc */

/* Ten words as far as resetKodeSelector reaches; it writes six of them. */
extern int  KodeSelector[10];           /* 0x000ff8f8 */
extern char Stats[0x98];                /* 0x00183c84 */

/* Reached through a pointer slot at 0x000f3608 holding its address. */
extern int CurrentTask;                 /* 0x00150590 */

/* Menu tables, each terminated by -1. Only their addresses matter here. */
extern int Menu_Task_Rematch[], Menu_Task_Lobby[], Menu_Task_Wifi_Bluetooth[];
extern int Menu_Task_Credits[], Menu_Task_About_Terms_of_Service[];
extern int Menu_Task_About_Privacy_Policy[], Menu_Task_About_Eula[];
extern int Menu_Task_Manage_Profile[], Menu_Task_Get_More_Games[];

extern int   lastTimerTimestamp;        /* 0x000ff8d8 */
extern float vsScreenTimer;             /* 0x000ff8dc */

int  BasicMenuWithWidth(int *menu, int width);
void PopFETaskDeferred(void);

int  getMenuItemNum(const int *menu);
int  BasicMenu(int *menu);
void resetCountersBeforeMP(void);

void PushFETaskDeferred(int task);

void switchToTask(int task);
void switchToFETask(int task);
void resetKodeSelector(void);
void Reset_Stats(void);

float FE_X(float v);
float FE_W(float v);
float FE_H(float v);


/* ------------------------------------------------- the front end's scalers
 *
 * armv7 0x00002e84, 0x00002ecc and 0x00002ee8, 28 bytes each. Identical shape:
 *
 *      ldr   r3, [pc, #0x14]
 *      vmov  s12, r0            ; the argument -- soft-float, so it arrives
 *      add   r3, pc             ;   in a core register and is moved across
 *      vldr  s14, [r3]
 *      vmul.f32 s14, s12, s14
 *      vmov  r0, s14            ; and leaves the same way
 *      bx    lr
 *
 * **`FE_X` and `FE_W` resolve to the SAME global**, 0x000ff9b8, which the
 * symbol table calls `_FE_WidthScale`. `FE_H` uses `_FE_HeightScale` at
 * 0x000ff9bc. So horizontal positions and widths share one multiplier and
 * heights have their own — two numbers, not three.
 *
 * ## Why this is the widescreen hook
 *
 * Both scales hold **1.0f** in the shipped binary, so the front end draws at
 * its authored size and these functions are pass-throughs on the device. They
 * exist for the case where it does not.
 *
 * That makes them the place a widescreen port changes the menus, and it makes
 * the split matter: X and W move together because stretching horizontally has
 * to move a thing and its width by the same factor or the layout tears. A port
 * that gave positions and widths separate scales would look right on one
 * element and wrong on the next.
 *
 * `_CreatePerspectiveMatrix` is the corresponding hook for the game itself.
 * This is the other half of it.
 */
float FE_X(float v)
{
    return v * FE_WidthScale;
}

float FE_W(float v)
{
    return v * FE_WidthScale;
}

float FE_H(float v)
{
    return v * FE_HeightScale;
}


/* ------------------------------------------------------- resetKodeSelector
 *
 * armv7 0x00002f04, 24 bytes.
 *
 *      str r2, [r3]      ; +0x00
 *      str r2, [r3, #4]  ; +0x04
 *      str r2, [r3, #8]  ; +0x08
 *      str r2, [r3, #0x1c]
 *      str r2, [r3, #0x20]
 *      str r2, [r3, #0x24]
 *
 * **Six words with a hole in the middle.** 0x0c through 0x18 are deliberately
 * left alone, so this is not "clear the struct" -- it is two groups of three,
 * and whatever sits between them survives a reset.
 *
 * A memset over 0x28 bytes would look tidier, pass any test that only asked
 * about the six, and quietly wipe the four in the gap.
 */
void resetKodeSelector(void)
{
    KodeSelector[0] = 0;                /* 0x00 */
    KodeSelector[1] = 0;                /* 0x04 */
    KodeSelector[2] = 0;                /* 0x08 */
    /* 0x0c .. 0x18 untouched */
    KodeSelector[7] = 0;                /* 0x1c */
    KodeSelector[8] = 0;                /* 0x20 */
    KodeSelector[9] = 0;                /* 0x24 */
}


/* ------------------------------------------------------------- Reset_Stats
 *
 * armv7 0x00013120, 24 bytes.
 *
 *      ldr r0, [pc, #0xc] ; movs r1, #0 ; movs r2, #0x98 ; add r0, pc
 *      blx _memset
 *
 * 0x98 bytes at `_Stats`, and here a memset IS what the original does -- which
 * is worth saying next to resetKodeSelector above, where it is not.
 */
void Reset_Stats(void)
{
    memset(Stats, 0, 0x98);
}


/* ------------------------------------------------------------ switchToTask
 *
 * armv7 0x0000312c, 24 bytes.
 *
 *      cmp r0, #4 ; bne out
 *      ldr r3, [pc, #0xc] ; add r3, pc     ; -> a pointer SLOT at 0x000f3608
 *      ldr r2, [r3]                        ; -> &CurrentTask, 0x00150590
 *      ldr r3, [r2] ; cmp r3, #4
 *      it ne ; strne r0, [r2]
 *
 * **It only ever does anything for task 4.** Anything else returns without
 * touching the variable, so this is not a general setter despite the name --
 * it is one specific transition with a guard on it.
 *
 * And the second guard makes the store conditional on the value not already
 * being 4, which is redundant for the value written and is still what the
 * original does. Written as-is: a port that drops it turns a no-op into a
 * write, and anything watching that variable for changes would see one.
 *
 * Another `it ne`, so another check that the IT-block flag fix holds.
 */
void switchToTask(int task)
{
    if (task != 4)
        return;
    if (CurrentTask != 4)
        CurrentTask = task;
}


/* ---------------------------------------------------------- switchToFETask
 *
 * armv7 0x000038bc, 12 bytes.
 *
 * A tail call to `PushFETaskDeferred` and nothing else. The argument goes
 * straight through in r0. Worth keeping as its own function rather than
 * inlining it away: the name is what the rest of the front end calls, and a
 * deferred push is a different thing from an immediate one.
 */
void switchToFETask(int task)
{
    PushFETaskDeferred(task);
}


/* ---------------------------------------------------------- getMenuItemNum
 *
 * armv7 0x00002fe4, 32 bytes.  `__Z14getMenuItemNumPi`
 *
 *      ldr   r3, [r0] ; cmp r3, #-1 ; beq empty
 *      movs  r0, #0
 *  L:  adds  r0, #1
 *      ldr.w r3, [r2, r0, lsl #2]
 *      cmp   r3, #-1 ; bne L
 *
 * How many entries a menu table has, counted to a **-1 terminator**. The empty
 * case is handled before the loop rather than by it, which is why an empty
 * table returns 0 and not 1: the loop increments before it reads, so entering
 * it at all already claims one entry exists.
 *
 * The terminator is -1 and not 0. A menu item numbered 0 is perfectly legal.
 */
int getMenuItemNum(const int *menu)
{
    int n;

    if (menu[0] == -1)
        return 0;

    n = 0;
    do {
        n++;
    } while (menu[n] != -1);

    return n;
}


/* ---------------------------------------------------- resetCountersBeforeMP
 *
 * armv7 0x000030a0, 32 bytes.
 *
 * Two stores to two adjacent globals, and the second is a FLOAT: the literal
 * 0x44160000 is 600.0f. Written as a float rather than as the word, because
 * `vsScreenTimer = 0x44160000` and `vsScreenTimer = 600.0f` are the same bytes
 * and only one of them says what the code means.
 */
void resetCountersBeforeMP(void)
{
    lastTimerTimestamp = 0;
    vsScreenTimer = 600.0f;
}


/* ---------------------------------------------------------------- BasicMenu
 *
 * armv7 0x0000ebb8, 16 bytes.  `__Z9BasicMenuPi`
 *
 * `BasicMenuWithWidth(menu, 0x120)` and nothing else. 0x120 is 288, and every
 * front-end menu that does not ask for its own width gets that one.
 */
int BasicMenu(int *menu)
{
    return BasicMenuWithWidth(menu, 0x120);
}


/* ------------------------------------------------------- the menu tasks
 *
 * armv7 0x0000ebc8 onward, 28 bytes each, nine of them. Every one is the same
 * four lines with a different table:
 *
 *      ldr  r0, [pc, #0x10] ; add r0, pc     ; -> Menu_Task_<name>
 *      bl   __Z9BasicMenuPi
 *      cmp  r0, #1 ; bne out
 *      bl   _PopFETaskDeferred
 *
 * **Only a return of exactly 1 pops the task.** Not non-zero -- one. Whatever
 * else BasicMenu can return leaves the menu on the stack, and writing this as
 * `if (BasicMenu(...))` would close every menu on any other outcome.
 *
 * The pop is DEFERRED, matching `switchToFETask` above: the front end never
 * changes its own task stack in the middle of handling one.
 *
 * These are written out one by one rather than generated. They are separate
 * symbols in the binary with separate addresses, and collapsing them into a
 * loop over `Menu_Task_*` would be this project inventing a structure the
 * original does not have.
 *
 * A macro was tried first and both tools rejected it, which was the right
 * answer for a reason worth recording: `symcheck` saw the macro parameter as
 * a call to a function named `name` and reported it NOT IN BINARY, and
 * `tools/progress.py` could not see the nine definitions at all and counted
 * them as undone. A generated body is invisible to anything that reads the
 * source as text, and both of this project's gates do exactly that.
 */
void FE_Task_Rematch(void)
{
    if (BasicMenu(Menu_Task_Rematch) == 1)
        PopFETaskDeferred();
}

void FE_Task_Lobby(void)
{
    if (BasicMenu(Menu_Task_Lobby) == 1)
        PopFETaskDeferred();
}

void FE_Task_Wifi_Bluetooth(void)
{
    if (BasicMenu(Menu_Task_Wifi_Bluetooth) == 1)
        PopFETaskDeferred();
}

void FE_Task_Credits(void)
{
    if (BasicMenu(Menu_Task_Credits) == 1)
        PopFETaskDeferred();
}

void FE_Task_About_Terms_of_Service(void)
{
    if (BasicMenu(Menu_Task_About_Terms_of_Service) == 1)
        PopFETaskDeferred();
}

void FE_Task_About_Privacy_Policy(void)
{
    if (BasicMenu(Menu_Task_About_Privacy_Policy) == 1)
        PopFETaskDeferred();
}

void FE_Task_About_Eula(void)
{
    if (BasicMenu(Menu_Task_About_Eula) == 1)
        PopFETaskDeferred();
}

void FE_Task_Manage_Profile(void)
{
    if (BasicMenu(Menu_Task_Manage_Profile) == 1)
        PopFETaskDeferred();
}

void FE_Task_Get_More_Games(void)
{
    if (BasicMenu(Menu_Task_Get_More_Games) == 1)
        PopFETaskDeferred();
}


extern int   VSAssetsLoaded;            /* 0x000ff9a8 */
extern int   PendingPop;                /* 0x001008b4, -1 when idle */
extern float FE_FadeAdd;                /* 0x0010089c */
extern char  Stats[];                   /* 0x00183c84 */
void limeWriteFile(const char *name, const void *data, long size, long flags);


/* ---------------------------------------------------------- FE_Task_Kode_List
 *
 * armv7 0x000031a0, 4 bytes: `bx lr`.
 *
 * Empty. One of the front-end task slots that exists so the task table has an
 * entry at that index; the screen it would have driven is not in this build.
 * docs/HIDDEN-CONTENT.md collects the rest of these.
 */
void FE_Task_Kode_List(void)
{
}


/* -------------------------------------------------- FE_Task_VS_Screen_Destroy
 *
 * armv7 0x00003300, 16 bytes.  **Complete.**
 *
 * Clears the flag and nothing else -- the textures the VS screen loaded are not
 * freed here. Whatever loads them next tests this flag and reloads.
 */
void FE_Task_VS_Screen_Destroy(void)
{
    VSAssetsLoaded = 0;
}


/* ---------------------------------------------------------------- Write_Stats
 *
 * armv7 0x0001270c, 32 bytes.  **Complete.**
 *
 *      ldr  r1, =_Stats
 *      ldr  r0, ="statsdata"
 *      movs r2, #0x98              <- 152 bytes, the whole block
 *      movs r3, #0
 *      bl   _limeWriteFile
 *
 * The size is a literal, not a sizeof: 152 bytes of `_Stats` go to disk under
 * the name "statsdata" whatever the struct grows to. A port that writes
 * sizeof(Stats) instead would produce a file the original cannot read back the
 * moment the two disagree.
 */
void Write_Stats(void)
{
    limeWriteFile("statsdata", Stats, 0x98, 0);
}


/* ---------------------------------------------------------- PopFETaskDeferred
 *
 * armv7 0x00002f94, 28 bytes.  **Complete.**
 *
 *      ldr  r2, =_PendingPop
 *      ldr  r3, [r2]
 *      cmp  r3, #-1
 *      bne  out                    <- already pending: do nothing
 *      ldr  r3, =_FE_FadeAdd
 *      ldr  r1, =0xbd088889        <- -0.033333335f
 *      str  r1, [r3]
 *      movs r3, #1
 *      str  r3, [r2]
 *
 * -1 means idle, so a second call while a pop is already queued is ignored
 * rather than queued twice. The fade rate it installs is -0.0333333507, which
 * is -1/30 to within a float: one thirtieth per frame, so the screen is gone
 * in thirty frames -- half a second at the 60 Hz this game does not run at, one
 * second at the 30 it does.
 */
void PopFETaskDeferred(void)
{
    if (PendingPop != -1)
        return;

    FE_FadeAdd = -0.033333335f;      /* the literal 0xbd088889 */
    PendingPop = 1;
}
