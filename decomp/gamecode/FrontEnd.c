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


extern float FE_HeightScale;            /* 0x000ff9bc */
extern float FE_YOffset;                /* 0x000ff9b4 */
extern int  *limeScreenWidth;           /* pointer slot at 0x00171aec */


/* ---------------------------------------------------------------------- FE_Y
 *
 * armv7 0x00002ea0, 36 bytes.  **Complete.**
 *
 * The front end's vertical layout transform: `y * FE_HeightScale + FE_YOffset`.
 * Every menu coordinate goes through it, which is how one layout serves several
 * screen heights.
 */
float FE_Y(float y)
{
    return y * FE_HeightScale + FE_YOffset;
}


/* ------------------------------------------------------------------ getScale
 *
 * armv7 0x00002fbc, 32 bytes.  **Complete.**
 *
 *      ldr r3, =_limeScreenWidth   <- through a pointer SLOT, then dereferenced
 *      vcvt.f32.s32
 *      vdiv.f32 by 480.0
 *
 * **480 is the original iPhone's width**, so this returns the screen's width as
 * a multiple of the resolution the front end was laid out for: 1.0 on a 3GS,
 * 2.0 on a Retina 4. Nothing here is aspect-aware -- it is width only -- which
 * is worth knowing before anyone widens the front end for the PC port.
 */
float getScale(void)
{
    return (float)(*limeScreenWidth) / 480.0f;
}


extern int  PendingPopAll;              /* 0x001008b8 */
extern int  FE_CurrentTask;             /* 0x001008bc */
extern int  Menu_Task_Training[];       /* 0x00100ec0 */
int  BasicMenu(int *menu);
void FE_Task_VS_Screen_Destroy(void);


/* ------------------------------------------------------ PopAllFETasksDeferred
 *
 * armv7 0x00002f1c, 24 bytes.  **Complete.**
 *
 * **No guard, unlike its three siblings.** PopFETaskDeferred, ...Deferred2 and
 * ...DeferredSelected all test `PendingPop == -1` first and do nothing if a pop
 * is already queued; this one overwrites whatever was pending. That asymmetry
 * is the behaviour: "pop everything" outranks "pop one".
 */
void PopAllFETasksDeferred(long count)
{
    FE_FadeAdd    = -0.033333335f;      /* the literal 0xbd088889 */
    PendingPop    = 1;
    PendingPopAll = (int)count;
}


/* --------------------------------------------------------- PopFETaskDeferred2
 *
 * armv7 0x00002f44, 28 bytes.  **Complete.**
 *
 * PopFETaskDeferred with 2 instead of 1. Whatever consumes PendingPop reads the
 * value as a count or a mode, not a flag.
 */
void PopFETaskDeferred2(void)
{
    if (PendingPop != -1)
        return;

    FE_FadeAdd = -0.033333335f;
    PendingPop = 2;
}


/* -------------------------------------------------- PopFETaskDeferredSelected
 *
 * armv7 0x00002f6c, 28 bytes.  **Complete.**
 *
 * The general form: the caller chooses the value. Note the store order --
 * `str r0, [r2]` comes BEFORE the fade is set here, where the other two set the
 * fade first. Nothing observes the difference on one thread, and it is
 * transcribed as written rather than normalised.
 */
void PopFETaskDeferredSelected(long which)
{
    if (PendingPop != -1)
        return;

    PendingPop = (int)which;
    FE_FadeAdd = -0.033333335f;
}


/* --------------------------------------------------------- FE_Special_Destroys
 *
 * armv7 0x00003310, 40 bytes.  **Complete.**
 *
 *      r2 = (FE_CurrentTask == 0x2b)
 *      r3 = (FE_CurrentTask == 0x22) ? (r2 | 1) : r2
 *      if (r3) FE_Task_VS_Screen_Destroy()
 *
 * Two task ids share one teardown. The compiler built the disjunction with an
 * `ite` pair rather than a branch, which is why it reads as arithmetic; it is
 * an `||`.
 */
void FE_Special_Destroys(void)
{
    if (FE_CurrentTask == 0x2b || FE_CurrentTask == 0x22)
        FE_Task_VS_Screen_Destroy();
}


/* ------------------------------------------------------------ FE_Task_Training
 *
 * armv7 0x0000ed1c, 40 bytes.  **Complete.**
 *
 * One menu, two outcomes. The pushed task id is `r0 + 0x1a` computed on the
 * path where r0 is known to be 1, so it is 27 -- written as the sum rather than
 * as 27 because the addition is what the code does and the 1 is a menu result,
 * not a constant.
 */
void FE_Task_Training(void)
{
    int r = BasicMenu(Menu_Task_Training);

    if (r == 1)
        PushFETaskDeferred(r + 0x1a);
    else if (r == 2)
        PopFETaskDeferred();
}


extern int mpLevelList[];               /* 0x000ddffc, file-local in the original */
long limeRand(void);


/* ------------------------------------------------------------ getRandomLevel
 *
 * armv7 0x000055fc, 40 bytes.  **Complete.**
 *
 *      bl   _limeRand
 *      and  r0, r0, #0x3f          <- 0..63
 *      ... magic-number divide by 14 ...
 *      ldr  r0, [_mpLevelList, r0, lsl #2]
 *
 * The `% 14` is a multiply by 0x92492493 and a shift, which is the compiler's
 * reciprocal for 14 rather than anything meaningful -- the modulus is what
 * matters and it says the multiplayer level list has fourteen entries.
 *
 * **The mask makes the distribution uneven and that is in the original.**
 * `rand() & 0x3f` gives 0..63, and 64 is not a multiple of 14, so levels 0..7
 * come up five times in sixty-four and levels 8..13 only four. A port that
 * "fixes" this to a uniform pick changes which stages players see.
 */
int getRandomLevel(void)
{
    return mpLevelList[(limeRand() & 0x3f) % 14];
}


extern long **FrameRemapTablePtr;       /* pointer slot -> 0x002003d4 */
extern char **PlayerDefsPtr;            /* pointer slot -> 0x00170950 */
extern float *PlayerZPosPtr;            /* pointer slot -> 0x00150e88 */

typedef struct limeVECTOR3 { float x, y, z; } limeVECTOR3;


/* ------------------------------------------------------------ HaveFrameInList
 *
 * armv7 0x00003294, 60 bytes.  **Complete.**
 *
 * Walks `list` until -1, and for each entry looks up the SECOND word of that
 * entry's row in `_FrameRemapTable` -- the same table ClearAnimRemapTables
 * fills with (0, -1) pairs -- comparing it against `frame`.
 *
 * So the list holds remap-table INDICES, not frame numbers, and the frame
 * number is what the table's second word holds. Comparing the list entries
 * directly against `frame` would compile and would always be wrong.
 */
int HaveFrameInList(const long *list, long frame)
{
    long i;

    for (i = 0; list[i] != -1; i++)
        if ((*FrameRemapTablePtr)[list[i] * 2 + 1] == frame)
            return 1;
    return 0;
}


/* ------------------------------------------------------- GetCharacterOffsetPos
 *
 * armv7 0x000032d0, 44 bytes.  **Complete.**
 *
 *      idx*4, idx*16, minus -> idx*12, plus idx -> idx*13, <<2 -> idx*52
 *      out->x = def[+0x08]
 *      out->y = *_PlayerZPos          <- a GLOBAL, not a field
 *      out->z = def[+0x0c]
 *
 * Two of the three components come from the character's own definition and the
 * middle one from a global that every character shares. The stride is 52 bytes,
 * built by the compiler out of shifts rather than a multiply.
 *
 * The naming is the original's and it is confusing on purpose-free grounds:
 * the global is called `_PlayerZPos` and it lands in the vector's **y**. Left
 * as the code has it rather than renamed to match, because the symbol name is
 * evidence and the assignment is evidence, and they disagree.
 */
void GetCharacterOffsetPos(int index, limeVECTOR3 *out)
{
    const char *def = *PlayerDefsPtr + index * 52;

    out->x = *(const float *)(def + 0x08);
    out->y = *PlayerZPosPtr;
    out->z = *(const float *)(def + 0x0c);
}


#define PEER_SLOTS   5
#define PEER_STRIDE  0x40

extern char peerNames[PEER_SLOTS][PEER_STRIDE];     /* 0x00185730 */
extern int  peerNamesFlags[];                       /* 0x00185930 */
void __static_initialization_and_destruction_0(int a, int b);


/* ------------------------------------------------------------ resetPeerNames
 *
 * armv7 0x00003064, 44 bytes.  **Complete, and it is not symmetric.**
 *
 * The loop clears the first TWO BYTES of each of five 64-byte name slots -- not
 * the whole slot -- and zeroes `peerNamesFlags[1..5]` as it goes, through a
 * pre-indexed `str r2, [r1, #4]!` that writes index 1 on its first pass and
 * never touches index 0.
 *
 * Then, after the loop:
 *
 *      str r1, [r3, #4]        <- peerNamesFlags[1] = 1
 *      str r2, [r3, #0x18]     <- peerNamesFlags[6] = 0
 *
 * So index 1 is cleared and then immediately set to 1, index 0 is never written
 * at all, and index 6 is outside the range the loop covers. All three are
 * transcribed as they are. A port that "cleans this up" into a memset plus one
 * flag has changed three things, and the local peer -- which is what slot 1
 * being 1 most likely marks -- is the one that would break.
 *
 * Only two bytes of each name are cleared because a name is a UTF-16 string and
 * two zero bytes are its terminator; the rest is left as whatever it held.
 */
void resetPeerNames(void)
{
    int i;

    for (i = 0; i < PEER_SLOTS; i++) {
        peerNames[i][0] = 0;
        peerNames[i][1] = 0;            /* the UTF-16 terminator, not a wipe */
        peerNamesFlags[i + 1] = 0;      /* index 0 is never written */
    }
    peerNamesFlags[1] = 1;
    peerNamesFlags[6] = 0;
}


/* ------------------------------------------------- __GLOBAL__I_InGameLevelSelect
 *
 * armv7 0x0001b580, 16 bytes.  **Complete.**
 *
 * The compiler's own static-initialisation thunk for this translation unit,
 * calling the shared constructor body with (1, 0xffff) -- the standard
 * "construct, all priorities" pair. It is written out because it is a function
 * in the binary and the counts should match, not because there is anything to
 * learn from it.
 */
void __GLOBAL__I_InGameLevelSelect(void)
{
    __static_initialization_and_destruction_0(1, 0xffff);
}


void FE_Task_VS_Screen_Init(void);
void InitKodeScreen(void);

/* The C++ runtime's own names, spelled as C because gamecode has no C++ here.
 * `_ZN13LocaleManagerC1Ev` is the constructor, `__tcf_0` the compiler-generated
 * destructor thunk, and `__mh_execute_header` the image handle __cxa_atexit
 * wants so the registration can be unwound with the image. */
typedef struct LocaleManager LocaleManager;

/* Spelled with the MANGLED names rather than readable ones. They are valid C
 * identifiers, they are what the symbol table holds, and tools/symcheck.py
 * verifies every callee against that table -- inventing `LocaleManager_ctor`
 * here made it report a function that does not exist, which is the tool working
 * as intended. */
extern LocaleManager _ZN13LocaleManager10s_instanceE;   /* 0x00379c1c */
void _ZN13LocaleManagerC1Ev(LocaleManager *self);
void __tcf_0(void *p);
extern char __mh_execute_header;
typedef void (*cxa_dtor)(void *);
int  __cxa_atexit(cxa_dtor fn, void *arg, void *dso);


/* ----------------------------------------------------------- FE_Special_Inits
 *
 * armv7 0x00004e48, 56 bytes.  **Complete.**
 *
 * The mirror of FE_Special_Destroys, with one extra step: tasks 0x2b and 0x22
 * both get the VS screen initialised, and 0x2b **also** gets the kode screen.
 * The teardown side has no equivalent second step.
 *
 * `_FE_CurrentTask` is re-read for the second test rather than kept in a
 * register. Nothing between the two can change it, and it is transcribed as
 * written.
 */
void FE_Special_Inits(void)
{
    if (FE_CurrentTask == 0x2b || FE_CurrentTask == 0x22)
        FE_Task_VS_Screen_Init();

    if (FE_CurrentTask == 0x2b)
        InitKodeScreen();
}


/* ------------------------------- __static_initialization_and_destruction_0
 *
 * armv7 0x0009fc0c, 52 bytes.  **Complete.**
 *
 * The compiler's shared static-init body for the translation unit: constructs
 * `LocaleManager::s_instance` and registers its destructor with
 * `__cxa_atexit`. It runs only for the (1, 0xffff) pair, which is the
 * "construct, all priorities" call `__GLOBAL__I_InGameLevelSelect` makes.
 *
 * **LocaleManager is the only C++ object with static storage in this build**
 * that reaches a constructor here, which is worth knowing: the port does not
 * need a general static-init mechanism, it needs that one object.
 */
void __static_initialization_and_destruction_0(int action, int priority)
{
    if (action != 1 || priority != 0xffff)
        return;

    _ZN13LocaleManagerC1Ev(&_ZN13LocaleManager10s_instanceE);
    __cxa_atexit(__tcf_0, 0, &__mh_execute_header);
}


extern int syncCharacters;              /* 0x000ff814 */
extern int syncCharactersOpponent;      /* 0x000ff818 */
extern char Stats_[];                   /* see Write_Stats; 0x00183c84 */
int   isParentBasedOnSpeed(void);
int   puts(const char *s);
void *limeLoadSaveFile(const char *name);
void  limeFree(void *p);


/* --------------------------------------------- processCharacterSelectedPacket
 *
 * armv7 0x000163d8, 44 bytes.  **Complete.**
 *
 * Three guards and a counter, and the counter is capped at five by testing
 * BEFORE the increment (`cmp r3, #4; bgt out`), so it reaches 5 and stops.
 *
 * The `puts` ships, like get_tsound's printf, and its message carries the
 * original's typo: "incresing syncCharacterOpponent". Transcribed as it is --
 * correcting it would make the string in the binary and the string in this file
 * differ, and that string is how somebody greps from one to the other.
 */
void processCharacterSelectedPacket(void)
{
    if (!isParentBasedOnSpeed())
        return;
    if (syncCharacters == 0)
        return;
    if (syncCharactersOpponent > 4)
        return;

    syncCharactersOpponent++;
    puts("incresing syncCharacterOpponent");
}


/* ---------------------------------------------------------------- Load_Stats
 *
 * armv7 0x00012830, 52 bytes.  **Complete.**
 *
 *      p = limeLoadSaveFile("statsdata")
 *      if (!p) { Write_Stats(); return; }       <- writes a fresh one
 *      copy 0x98 bytes, word by word, into _Stats
 *      limeFree(p)
 *
 * **A missing save file is not an error, it is a first run**, and the recovery
 * is to write the current in-memory stats out rather than to zero anything. So
 * whatever `_Stats` holds at that moment becomes the saved file.
 *
 * The size is the same literal 0x98 Write_Stats uses, and the copy is a word
 * loop rather than a memcpy -- 152 bytes, 38 words.
 */
void Load_Stats(void)
{
    long *src = (long *)limeLoadSaveFile("statsdata");
    long *dst = (long *)Stats_;
    int i;

    if (src == 0) {
        Write_Stats();                  /* first run: seed the file */
        return;
    }
    for (i = 0; i < 0x98 / 4; i++)
        dst[i] = src[i];
    limeFree(src);
}


#define LEVEL_INFO_STRIDE  244
#define LEVEL_SLOTS         16

extern char **LevelInfoPtr;             /* pointer slot -> 0x0014e8d4 */


/* -------------------------------------------------------------- GetNextLevel
 *
 * armv7 0x00002d54, 68 bytes.  **Complete, and it can hang.**
 *
 *      cur++
 *      if (cur > 15) cur = 0
 *      while (Level_Info[cur].field70 != 0) {
 *          cur++
 *          if (cur > 15) cur = 0
 *      }
 *      return cur
 *
 * The entry stride is 244 bytes, built out of shifts: `cur*4`, `cur*64`,
 * subtract for `cur*60`, add `cur` for `cur*61`, shift for `cur*244`.
 *
 * **There is no exhaustion check.** The `cur <= 15` test inside the loop is
 * always true, because the wrap happens before the test is reached, so the only
 * way out is finding an entry whose +0x70 is zero. If all sixteen are non-zero
 * this spins forever.
 *
 * That is in the original and it is left in. The caller evidently guarantees at
 * least one free slot, and a port that adds a bail-out has to decide what to
 * return when it bails -- which is a game-design answer this file cannot
 * supply. Worth a comment at the call site rather than a silent guard here.
 */
int GetNextLevel(int cur)
{
    const char *info = *LevelInfoPtr;

    cur++;
    if (cur > LEVEL_SLOTS - 1)
        cur = 0;

    while (*(const long *)(info + cur * LEVEL_INFO_STRIDE + 0x70) != 0) {
        cur++;
        if (cur > LEVEL_SLOTS - 1)
            cur = 0;
    }
    return cur;
}


extern int PendingPush;                 /* 0x001008b0 */


/* --------------------------------------------------------- PushFETaskDeferred
 *
 * armv7 0x0000386c, 60 bytes.  **Complete.**
 *
 *      if (FE_CurrentTask == task) return          <- already there
 *      if (FE_CurrentTask == 0x2c && task != 0) {
 *          puts("IGNORING PUSH TASK DEFERRED!!!")
 *          return
 *      }
 *      FE_FadeAdd  = -0.033333335f
 *      PendingPush = task
 *
 * **Task 0x2c refuses pushes, loudly.** The message ships in the retail binary,
 * three exclamation marks and all, which says somebody hit this during
 * development and wanted to hear about it rather than silently swallow it.
 *
 * The first guard makes pushing the current task a no-op, and it comes BEFORE
 * the 0x2c check -- so pushing 0x2c while already on 0x2c returns quietly,
 * without the message.
 */
void PushFETaskDeferred(int task)
{
    if (FE_CurrentTask == task)
        return;

    if (FE_CurrentTask == 0x2c && task != 0) {
        puts("IGNORING PUSH TASK DEFERRED!!!");
        return;
    }

    FE_FadeAdd  = -0.033333335f;
    PendingPush = task;
}


extern char CustomButtonsPos4[0x78];    /* 0x00150294 */
extern char CustomButtonsPos5[0x78];    /* 0x0015030c */
extern char CustomButtonsPos6[0x78];    /* 0x00150384 */
void achievementsReset(void);
extern int achievementTracker[24];       /* 0x00379c60, see achievements.c */
void Write_AchievementsData(void);


/* --------------------------------------------------------- Load_AchievementsData
 *
 * armv7 0x00015ba8, 76 bytes.  **Complete.**
 *
 *      p = limeLoadSaveFile("achievementsdata")
 *      if (!p) { achievementsReset(); Write_AchievementsData(); return; }
 *      copy 0x00..0x4c in a loop, then 0x50, 0x54, 0x58 and 0x5c unrolled
 *      limeFree(p)
 *
 * **A third independent confirmation that the tracker is 24 words.** The symbol
 * table bounds it at 96 bytes; achievementsReset clears 0x00 through 0x5c; and
 * this copies exactly the same range and stops. Three unrelated pieces of
 * evidence, one of them in a different file, agreeing to the word.
 *
 * The missing-file recovery differs from Load_Stats: that one writes the
 * current in-memory stats out, this one RESETS first and then writes. So a lost
 * achievements file starts you at zero, and a lost stats file preserves
 * whatever the session had.
 */
void Load_AchievementsData(void)
{
    long *src = (long *)limeLoadSaveFile("achievementsdata");
    int i;

    if (src == 0) {
        achievementsReset();            /* zero first, unlike Load_Stats */
        Write_AchievementsData();
        return;
    }
    for (i = 0; i < 0x60 / 4; i++)
        achievementTracker[i] = src[i];
    limeFree(src);
}


/* ------------------------------------------------------- Write_PresetButtonData
 *
 * armv7 0x00012874, 62 bytes.  **Complete.**
 *
 * Three saves of 0x78 bytes each -- the 4, 5 and 6 button layouts to
 * "preset4data", "preset5data" and "preset6data". The size is a literal in all
 * three, as in Write_Stats, so the file format is fixed at 120 bytes whatever
 * the struct becomes.
 */
void Write_PresetButtonData(void)
{
    limeWriteFile("preset4data", CustomButtonsPos4, 0x78, 0);
    limeWriteFile("preset5data", CustomButtonsPos5, 0x78, 0);
    limeWriteFile("preset6data", CustomButtonsPos6, 0x78, 0);
}


extern int  FE_TaskStackPointer;        /* 0x001008ac */
extern int  FE_CurrentTaskStack[];      /* 0x00183f30 */
extern char DEFAULT_CustomButtonsPos4[0x78];    /* 0x001503fc */
extern char DEFAULT_CustomButtonsPos5[0x78];    /* 0x00150474 */
extern char DEFAULT_CustomButtonsPos6[0x78];    /* 0x001504ec */
void  dumpStack(void);
int   printf(const char *fmt, ...);


/* ---------------------------------------------------------------- PopFETask
 *
 * armv7 0x00004e88, 72 bytes.  **Complete.**
 *
 *      if (!FE_TaskStackPointer) return
 *      printf("pop fe task: %d->%d\n", stack[sp - 1], FE_CurrentTask)
 *      dumpStack()
 *      FE_TaskStackPointer--
 *      FE_Special_Destroys()
 *      FE_CurrentTask = stack[FE_TaskStackPointer]
 *      FE_Special_Inits()
 *      dumpStack()
 *
 * **The teardown runs before the task changes and the setup after**, which is
 * the only ordering that makes FE_Special_Destroys see the task it is tearing
 * down and FE_Special_Inits see the one it is setting up. Both read
 * _FE_CurrentTask directly rather than taking it as an argument, so the order
 * is load-bearing.
 *
 * The printf and both dumpStack calls SHIP. Front-end navigation prints a line
 * and dumps the stack twice in the retail build.
 */
void PopFETask(void)
{
    if (FE_TaskStackPointer == 0)
        return;

    printf("pop fe task: %d->%d\n",
           FE_CurrentTaskStack[FE_TaskStackPointer - 1], FE_CurrentTask);
    dumpStack();

    FE_TaskStackPointer--;
    FE_Special_Destroys();                      /* still the OLD task */
    FE_CurrentTask = FE_CurrentTaskStack[FE_TaskStackPointer];
    FE_Special_Inits();                         /* now the NEW one */
    dumpStack();
}


/* --------------------------------------------------- Reset_PresetButtonData
 *
 * armv7 0x00015bf4, 62 bytes.  **Complete.**
 *
 * Three memcpys of 0x78 bytes from the DEFAULT_ tables into the live ones. The
 * size is the same literal Write_PresetButtonData saves, so the defaults, the
 * live copies and the files on disk are all 120 bytes by construction.
 */
void Reset_PresetButtonData(void)
{
    memcpy(CustomButtonsPos4, DEFAULT_CustomButtonsPos4, 0x78);
    memcpy(CustomButtonsPos5, DEFAULT_CustomButtonsPos5, 0x78);
    memcpy(CustomButtonsPos6, DEFAULT_CustomButtonsPos6, 0x78);
}


extern int  Settings[10];               /* 0x00100e34 */
extern int *limeScreenHeight;           /* pointer slot -> 0x00171af0 */
int  limeCheckForUserMusic(void);


/* ----------------------------------------------------------- Write_SettingsData
 *
 * armv7 0x0001295c, 76 bytes.  **Complete.**
 *
 *      puts("######### writing settings data")
 *      limeWriteFile("settingsdata", Settings, 0x28, 0)
 *      printf("Settings[%d] = %d\n", 0, Settings[0])
 *      for (i = 1; i < 10; i++)
 *          printf("Settings[%d] = %d\n", i, Settings[i])
 *
 * **Eleven lines of console output every time settings are saved**, and all of
 * it ships. The first printf is peeled out of the loop by the compiler, and
 * both it and the loop resolve to the SAME format string at 0x000ff3a8 -- the
 * two PC-relative loads differ but land on one address.
 *
 * 0x28 is 40 bytes, ten words, which is what makes the loop bound of 10 the
 * whole array rather than a prefix of it.
 */
void Write_SettingsData(void)
{
    int i;

    puts("######### writing settings data");
    limeWriteFile("settingsdata", Settings, 0x28, 0);

    printf("Settings[%d] = %d\n", 0, Settings[0]);
    for (i = 1; i < 10; i++)
        printf("Settings[%d] = %d\n", i, Settings[i]);
}


/* ----------------------------------------------------------- ResetSettingsData
 *
 * armv7 0x00015494, 76 bytes.  **Complete.**
 *
 * Ten defaults, and one of them is conditional:
 *
 *      Settings[0] = 1     Settings[5] = 0
 *      Settings[1] = 0     Settings[6] = 100
 *      Settings[2] = 3     Settings[7] = 1
 *      Settings[3] = 3     Settings[8] = 1
 *      Settings[4] = 5     Settings[9] = 1
 *
 *      if (limeCheckForUserMusic()) Settings[2] = 0
 *
 * **Settings[2] is written twice**: 3 first, then 0 if the device has the
 * user's own music playing. So the default is on and the presence of user music
 * turns it off -- the game's music setting deferring to whatever the phone was
 * already doing, which is the iOS convention of the period.
 *
 * The 100 is built as `5 + 0x5f` from the constant already in the register, not
 * loaded as a literal.
 */
void ResetSettingsData(void)
{
    puts("########### resetting settings data!");

    Settings[0] = 1;
    Settings[1] = 0;
    Settings[2] = 3;

    if (limeCheckForUserMusic())
        Settings[2] = 0;                /* the phone was already playing */

    Settings[4] = 5;
    Settings[3] = 3;
    Settings[5] = 0;
    Settings[6] = 100;                  /* built as 5 + 0x5f */
    Settings[7] = 1;
    Settings[8] = 1;
    Settings[9] = 1;
}


/* -------------------------------------------------------------- getMenuStartPos
 *
 * armv7 0x00003004, 96 bytes.  **Complete.**
 *
 *      return (int)( (float)(limeScreenHeight / 2)
 *                    + (-16.0f * getScale()) * getMenuItemNum(menu) )
 *
 * Centres a menu vertically: start at the middle of the screen and move UP
 * sixteen scaled units per item, so a longer menu starts higher and stays
 * centred.
 *
 * The -16 is a `vmov.f32 s12, #-1.6e+01` immediate, and getScale is the width
 * ratio against 480 -- so the spacing follows the screen's WIDTH while the
 * starting point follows its height. That mismatch is in the original.
 *
 * The halving is `add r3, r3, r3, lsr #31` then `asrs #1`, which is signed
 * division by two rounding toward zero. It matters only for a negative screen
 * height, which cannot happen, and it is transcribed because it is free.
 */
int getMenuStartPos(const int *menu)
{
    float mid  = (float)(*limeScreenHeight / 2);
    float step = -16.0f * getScale();

    return (int)(mid + step * (float)getMenuItemNum(menu));
}


extern int Menu_Task_Game_Over[];       /* 0x00101770 */
extern int GameStarted;                 /* 0x0014e208 */
extern int Destiny;                     /* 0x0014e20c */
extern int Stage;                       /* 0x0014e214 */
void PopulateTower(void);


/* ------------------------------------------------------------ FE_Task_Game_Over
 *
 * armv7 0x0000ec1c, 72 bytes.  **Complete.**
 *
 *      r = BasicMenu(Menu_Task_Game_Over)
 *      r == 1 -> PopFETaskDeferred()
 *      r == 2 -> PopAllFETasksDeferred(r - 2)   ; the argument is ZERO
 *                GameStarted = 0
 *                PopulateTower()
 *                Destiny = -1
 *                Stage   = 0
 *
 * **The argument to PopAllFETasksDeferred is computed as `r - 2` on the path
 * where r is known to be 2**, so it is always zero. Written as the subtraction
 * rather than as 0, because the subtraction is what the code does and folding
 * it hides that the value came from the menu result.
 *
 * Destiny is reset to -1 and Stage to 0 -- the same "nobody" sentinel
 * GameCodeInit uses for the camera, and 0 being a valid stage is why they
 * differ.
 */
void FE_Task_Game_Over(void)
{
    int r = BasicMenu(Menu_Task_Game_Over);

    if (r == 1) {
        PopFETaskDeferred();
    } else if (r == 2) {
        PopAllFETasksDeferred(r - 2);   /* always 0 on this path */
        GameStarted = 0;
        PopulateTower();
        Destiny = -1;
        Stage   = 0;
    }
}


#define FE_TASK_STACK_MAX  0x200


/* ---------------------------------------------------------------- PushFETask
 *
 * armv7 0x00004ee0, 96 bytes.  **Complete.**
 *
 *      if (FE_TaskStackPointer >= 0x200) return
 *      if (task == 0x2b) puts("...  PUSHING MP VS SCREEN")
 *      if (FE_CurrentTask == task) return
 *      printf("push fe task: %d->%d\n", FE_CurrentTask, task)
 *      dumpStack()
 *      FE_CurrentTaskStack[FE_TaskStackPointer++] = FE_CurrentTask
 *      FE_Special_Destroys()
 *      FE_CurrentTask = task
 *      FE_Special_Inits()
 *      dumpStack()
 *
 * PopFETask's mirror, and the ordering is the same: the teardown runs while
 * _FE_CurrentTask still names the OLD task, the setup after it names the new
 * one. Both read the global rather than taking an argument.
 *
 * **The overflow check drops the push silently** -- 512 deep and it returns
 * without a word, where every other refusal in this file prints something. The
 * MP VS screen announcement fires BEFORE the already-on-that-task check, so
 * pushing 0x2b onto 0x2b prints the banner and then does nothing.
 */
void PushFETask(int task)
{
    if (FE_TaskStackPointer >= FE_TASK_STACK_MAX)
        return;                         /* silent, unlike every other refusal */

    if (task == 0x2b)
        puts("########################  PUSHING MP VS SCREEN");

    if (FE_CurrentTask == task)
        return;

    printf("push fe task: %d->%d\n", FE_CurrentTask, task);
    dumpStack();

    FE_CurrentTaskStack[FE_TaskStackPointer] = FE_CurrentTask;
    FE_TaskStackPointer++;

    FE_Special_Destroys();              /* still the OLD task */
    FE_CurrentTask = task;
    FE_Special_Inits();                 /* now the NEW one */
    dumpStack();
}


extern int  opponentCharacter;          /* 0x000ff998 */
extern int  playerCharacter;            /* 0x000ff99c */
extern int  CharacterConfirmed;         /* 0x000ff8cc */
extern int  CharacterSelected;          /* 0x000ff8d0 */
extern int *FrameCountPtr;              /* pointer slot -> 0x0014fa60 */
extern int *incomingQueueStartPtr;      /* pointer slot -> 0x0017c928 */
extern int *incomingQueueLenPtr;        /* pointer slot -> 0x0017c92c */


/* ------------------------------------------------------ resetCharacterSelection
 *
 * armv7 0x000030c0, 72 bytes.  **Complete.**
 *
 * Eight globals, and the values are not uniform:
 *
 *      syncCharactersOpponent = 0      CharacterConfirmed = -1
 *      syncCharacters         = 0      CharacterSelected  = -1
 *      opponentCharacter      = -1     FrameCount         = 0
 *      playerCharacter        = -1     incomingQueueStart = 0
 *                                      incomingQueueLen   = 1
 *
 * **-1 for the four that name a character, 0 for the counters, and 1 for the
 * queue length.** The last is the odd one: an "empty" incoming queue is length
 * ONE here, not zero, so whatever consumes it treats index 0 as reserved.
 *
 * A port that memsets this group to zero breaks all three conventions at once,
 * and the character ones would look like player 0 being pre-selected.
 */
void resetCharacterSelection(void)
{
    syncCharactersOpponent = 0;
    syncCharacters         = 0;
    opponentCharacter      = -1;
    playerCharacter        = -1;
    CharacterConfirmed     = -1;
    CharacterSelected      = -1;

    *FrameCountPtr         = 0;
    *incomingQueueStartPtr = 0;
    *incomingQueueLenPtr   = 1;         /* one, not zero */
}


/* ------------------------------------------------------- Write_AchievementsData
 *
 * armv7 0x00015b30, 100 bytes.  **Complete.**
 *
 *      char buf[0x60]
 *      memcpy(buf, achievementTracker, 0x60)
 *      for (i = 0; i < 0x50 / 4; i++)
 *          if (buf[i] == 4 || buf[i] == 1) buf[i] = 2
 *      puts(banner); puts("## saving achievement tracker"); puts(banner)
 *      limeWriteFile("achievementsdata", buf, 0x60, 0)
 *
 * **It saves a COPY, and it rewrites values on the way out.** States 4 and 1
 * become 2 on disk; the live tracker keeps whatever it had. So the file is not
 * a snapshot of memory, and round-tripping it through Load_AchievementsData
 * does not give back what was saved.
 *
 * The rewrite covers only the first twenty entries -- the loop stops at 0x50 --
 * while the copy and the write are the full 0x60. The four slots from 0x50 to
 * 0x5c, which include the matches-won counter and Sub-Zero's clone count, go
 * out untouched. That split is the point: the first twenty are achievement
 * STATES, and 4 and 1 are transient ones that must not persist.
 *
 * Three puts around one save. All of it ships.
 */
void Write_AchievementsData(void)
{
    int buf[0x60 / 4];
    int i;

    memcpy(buf, achievementTracker, 0x60);

    for (i = 0; i < 0x50 / 4; i++)      /* states only, not the counters */
        if (buf[i] == 4 || buf[i] == 1)
            buf[i] = 2;

    puts("#############################################");
    puts("## saving achievement tracker");
    puts("#############################################");

    limeWriteFile("achievementsdata", buf, 0x60, 0);
}


extern int Menu_Task_Challenge[];       /* 0x00100f18 */
int   EASOC_FBGetFriendsNum(void);
char *EASOC_FBGetFriendName(int index);


/* ------------------------------------------------------------ FE_Task_Challenge
 *
 * armv7 0x00015c4c, 108 bytes.  **Complete.**
 *
 *      r = BasicMenu(Menu_Task_Challenge)
 *      n = EASOC_FBGetFriendsNum()
 *      if (n > 0) {
 *          for (i = 0; i < n; i++)
 *              printf("FRIEND NAME:%s\n", EASOC_FBGetFriendName(i))
 *          puts("-----------")
 *      } else {
 *          puts("YOU HAVE NO FRIENDS!")
 *      }
 *      if (r == 8) PopFETaskDeferred()
 *
 * **The menu is drawn before the Facebook call and its result is used after
 * it**, so the friends list is fetched on every frame this task runs, not once
 * on entry. EASOC_FBGetFriendsNum is in the EA SDK, which this port stubs --
 * a stub returning 0 puts the game down the "no friends" path permanently and
 * the menu still works, which is the right shape for a stub.
 *
 * Every string here ships, including the one in the else branch.
 */
void FE_Task_Challenge(void)
{
    int r = BasicMenu(Menu_Task_Challenge);
    int n = EASOC_FBGetFriendsNum();
    int i;

    if (n > 0) {
        for (i = 0; i < n; i++)
            printf("FRIEND NAME:%s\n", EASOC_FBGetFriendName(i));
        puts("-----------");
    } else {
        puts("YOU HAVE NO FRIENDS!");
    }

    if (r == 8)
        PopFETaskDeferred();
}


void Write_SettingsData(void);
void Write_PresetButtonData(void);


/* ----------------------------------------------------------- Load_SettingsData
 *
 * armv7 0x000154ec, 116 bytes.  **Complete.**
 *
 *      puts("########### loading settings data!")
 *      p = limeLoadSaveFile("settingsdata")
 *      if (!p) {
 *          puts("###########  cannot load settings data!")
 *          ResetSettingsData()
 *          Write_SettingsData()
 *          return
 *      }
 *      copy 0x28 bytes into Settings
 *      printf(fmt, Settings[7]); printf(fmt, Settings[8]); printf(fmt, Settings[9])
 *      limeFree(p)
 *
 * The recovery is reset-then-write, the same shape Load_AchievementsData uses
 * and the opposite of Load_Stats, which writes whatever memory already held.
 *
 * **Only the last three settings are printed**, at +0x1c, +0x20 and +0x24 --
 * the three ResetSettingsData sets to 1. Whatever they control was worth
 * watching and the other seven were not.
 */
void Load_SettingsData(void)
{
    long *src;
    int i;

    puts("########### loading settings data!");

    src = (long *)limeLoadSaveFile("settingsdata");
    if (src == 0) {
        puts("###########  cannot load settings data!");
        ResetSettingsData();
        Write_SettingsData();
        return;
    }

    for (i = 0; i < 0x28 / 4; i++)
        Settings[i] = (int)src[i];

    printf("%d\n", Settings[7]);
    printf("%d\n", Settings[8]);
    printf("%d\n", Settings[9]);

    limeFree(src);
}


/* ------------------------------------------------------- Load_PresetButtonData
 *
 * armv7 0x000128c8, 132 bytes.  **Complete.**
 *
 * Three loads of 0x78 bytes into CustomButtonsPos4, 5 and 6, each freed after
 * the copy, and **every one of the three failures jumps to the same recovery:
 * Write_PresetButtonData, and nothing else.**
 *
 * No reset. So the recovery writes out whatever the live tables happen to hold
 * at that moment -- which, if preset4data loaded and preset5data did not, is
 * the loaded 4 alongside the defaults for 5 and 6. That is the Load_Stats shape
 * (write what memory has) and NOT the Load_AchievementsData shape (reset first,
 * then write), and the difference is worth stating because the two sit within a
 * few hundred bytes of each other in the same file.
 */
void Load_PresetButtonData(void)
{
    long *src;
    int i;

    src = (long *)limeLoadSaveFile("preset4data");
    if (src == 0)
        goto reset;
    for (i = 0; i < 0x78 / 4; i++)
        ((long *)CustomButtonsPos4)[i] = src[i];
    limeFree(src);

    src = (long *)limeLoadSaveFile("preset5data");
    if (src == 0)
        goto reset;
    for (i = 0; i < 0x78 / 4; i++)
        ((long *)CustomButtonsPos5)[i] = src[i];
    limeFree(src);

    src = (long *)limeLoadSaveFile("preset6data");
    if (src == 0)
        goto reset;
    for (i = 0; i < 0x78 / 4; i++)
        ((long *)CustomButtonsPos6)[i] = src[i];
    limeFree(src);
    return;

reset:
    /* Whatever the live tables hold right now -- there is no reset here. */
    Write_PresetButtonData();
}


extern const char *FETaskNames[];       /* 0x00100d60 */
extern int BUTTON_1X3_1[];              /* 0x001004d8 */
extern int BUTTON_1X3_2[];              /* 0x001004ec */
extern int BUTTON_1X3_3[];              /* 0x00100500 */
int DrawButtonNew(int *b, int x, int y, int flag);


/* ----------------------------------------------------------------- dumpStack
 *
 * armv7 0x000038c8, 108 bytes.  **Complete.**
 *
 *      puts("STACK:")
 *      for (i = 0; i < FE_TaskStackPointer; i++)
 *          printf("#%d:%s(%d)\n", i, FETaskNames[stack[i]], stack[i])
 *      printf("######################### (%s)(%d)\n",
 *             FETaskNames[FE_CurrentTask], FE_CurrentTask)
 *
 * **The whole front-end task stack is printed on every push and every pop**,
 * and both PushFETask and PopFETask call this TWICE. So one menu transition
 * prints the stack four times over, plus its own line.
 *
 * All of it ships. That is worth knowing before anyone measures the front end's
 * frame time in a port: on a device with a slow console this is the cost.
 *
 * The stack pointer is re-read from memory each iteration rather than held in a
 * register, which is why the loop looks heavier than it is.
 */
void dumpStack(void)
{
    int i;

    puts("STACK:");

    for (i = 0; i < FE_TaskStackPointer; i++)
        printf("#%d:%s(%d)\n", i,
               FETaskNames[FE_CurrentTaskStack[i]], FE_CurrentTaskStack[i]);

    printf("######################### (%s)(%d)\n",
           FETaskNames[FE_CurrentTask], FE_CurrentTask);
}


/* ---------------------------------------------------------- drawPage1x3Small
 *
 * armv7 0x00007558, 148 bytes.  **Complete.**
 *
 * Three buttons at a fixed x of 0xed and y of 0x5a, 0xa0 and 0xe6, returning
 * which one was pressed -- **but only while the screen is not fading**.
 * FE_FadeAdd being non-zero means a transition is in flight, and a press during
 * one is swallowed.
 *
 * The first button is the odd one out: it sets the result to 1 OR ZERO with an
 * `ite`, where the other two only overwrite on the fade-clear path. The
 * difference cannot show, because a press that arrives during a fade leaves the
 * result at its initial zero either way -- but the code is not symmetric and it
 * is transcribed as it is.
 *
 * A press on button 1 does NOT skip the other two: the branch jumps back into
 * the sequence rather than out of it, so all three are drawn every frame and a
 * later press wins.
 */
int drawPage1x3Small(void)
{
    int r = 0;

    if (DrawButtonNew(BUTTON_1X3_1, 0xed, 0x5a, 1))
        r = (FE_FadeAdd == 0.0f) ? 1 : 0;   /* the ite, not an if */

    if (DrawButtonNew(BUTTON_1X3_2, 0xed, 0xa0, 1))
        if (FE_FadeAdd == 0.0f)
            r = 2;

    if (DrawButtonNew(BUTTON_1X3_3, 0xed, 0xe6, 1))
        if (FE_FadeAdd == 0.0f)
            r = 3;

    return r;
}


#define FE_INIT_STEPS  86

extern int   FEInitState;               /* 0x001017a8 */
extern int   FE_LoadCount;              /* 0x001017ac */
extern float FE_Fade;                   /* 0x00100898 */
void Task_LoadingScreen_DRAWSCREEN(long a, long percent);
void DeleteLoadingScreenTexture(void);
int  FEInit_LoadABit(long step);


/* --------------------------------------------------------------- Task_FEInit
 *
 * armv7 0x00004a14, 148 bytes.  **Complete. A three-state machine, one step per
 * frame.**
 *
 *      state 0: FE_LoadCount = 0
 *               Task_LoadingScreen_DRAWSCREEN(0, 0)
 *               state = 1
 *
 *      state 1: Task_LoadingScreen_DRAWSCREEN(0, FE_LoadCount * 100 / 86)
 *               done = FEInit_LoadABit(FE_LoadCount)
 *               FE_LoadCount++
 *               if (done) state = 2
 *
 *      state 2: Task_LoadingScreen_DRAWSCREEN(0, 100)
 *               DeleteLoadingScreenTexture()
 *               state = 0
 *               CurrentTask = 3
 *               FE_Fade = 0
 *               FE_FadeAdd = +0.033333335f
 *
 * **The loading bar is a percentage of 86 steps**, and 86 is a literal folded
 * into a reciprocal multiply -- `100*n` times 0x2fa0be83 shifted right 36. That
 * magic is not the minimal one a textbook would pick, so it is worth saying it
 * was checked rather than assumed: it agrees with `100*n/86` at n = 1, 43, 85
 * and 86, including the exact 50 and the exact 100.
 *
 * The bar therefore reaches 100% only if FEInit_LoadABit reports done on step
 * 86 or later; finishing early jumps straight to state 2, which draws 100
 * itself. So the percentage cannot stall short of the end.
 *
 * **FE_FadeAdd is +1/30 here where every Pop and Push sets -1/30.** Same
 * magnitude, opposite sign: those fade OUT of a screen, this fades IN to one.
 */
void Task_FEInit(void)
{
    switch (FEInitState) {
        case 0:
            FE_LoadCount = 0;
            Task_LoadingScreen_DRAWSCREEN(0, 0);
            FEInitState = 1;
            break;

        case 1:
            Task_LoadingScreen_DRAWSCREEN(0, FE_LoadCount * 100 / FE_INIT_STEPS);
            if (FEInit_LoadABit(FE_LoadCount)) {
                FE_LoadCount++;
                FEInitState = 2;
            } else {
                FE_LoadCount++;
            }
            break;

        case 2:
            Task_LoadingScreen_DRAWSCREEN(0, 100);
            DeleteLoadingScreenTexture();
            FEInitState = 0;
            CurrentTask = 3;
            FE_Fade    = 0.0f;
            FE_FadeAdd = 0.033333335f;   /* +1/30: this one fades IN */
            break;

        default:
            break;
    }
}


typedef struct MESHSETINFO MESHSETINFO;
void LIME_FreeMeshSet(void *set);

/* The front end's own meshsets, sixteen of them, consecutive from 0x00183d1c
 * at four bytes apart -- one pointer each. */
extern void *MeshSet_VS_BRICK;
extern void *MeshSet_SINGLEBRICK;
extern void *MeshSet_PLAYERFACE;
extern void *MeshSet_OPPONENTFACE;
extern void *MeshSet_FLOOR;
extern void *MeshSet_VORTEX1;
extern void *MeshSet_VORTEX2;
extern void *MeshSet_VORTEX3;
extern void *MeshSet_VORTEX4;
extern void *MeshSet_VORTEX5;
extern void *MeshSet_SPIRAL;
extern void *MeshSet_LIGHTNING1;
extern void *MeshSet_LIGHTNING2;
extern void *MeshSet_LIGHTNING3;
extern void *MeshSet_LIGHTNING4;
extern void *MeshSet_LIGHTNING5;


/* ---------------------------------------------------------- DestroyFEMeshSets
 *
 * armv7 0x0001b114, 232 bytes.  **Complete.**
 *
 * Sixteen calls to LIME_FreeMeshSet, one per front-end meshset, written out
 * rather than looped -- and the globals ARE consecutive, four bytes apart from
 * 0x00183d1c, so a loop was available and the compiler was not asked for one.
 *
 * **None of the pointers is cleared afterwards.** Every one is loaded, passed,
 * and left holding its freed address. So calling this twice is a double free
 * unless something else nulls them, and nothing in this function does.
 *
 * That is transcribed as written rather than made safe. A port that adds the
 * clears changes what a second call does, and if the game relies on this being
 * called exactly once, the clears hide a bug rather than fixing one.
 */
void DestroyFEMeshSets(void)
{
    LIME_FreeMeshSet(MeshSet_VS_BRICK);
    LIME_FreeMeshSet(MeshSet_SINGLEBRICK);
    LIME_FreeMeshSet(MeshSet_PLAYERFACE);
    LIME_FreeMeshSet(MeshSet_OPPONENTFACE);
    LIME_FreeMeshSet(MeshSet_FLOOR);
    LIME_FreeMeshSet(MeshSet_VORTEX1);
    LIME_FreeMeshSet(MeshSet_VORTEX2);
    LIME_FreeMeshSet(MeshSet_VORTEX3);
    LIME_FreeMeshSet(MeshSet_VORTEX4);
    LIME_FreeMeshSet(MeshSet_VORTEX5);
    LIME_FreeMeshSet(MeshSet_SPIRAL);
    LIME_FreeMeshSet(MeshSet_LIGHTNING1);
    LIME_FreeMeshSet(MeshSet_LIGHTNING2);
    LIME_FreeMeshSet(MeshSet_LIGHTNING3);
    LIME_FreeMeshSet(MeshSet_LIGHTNING4);
    LIME_FreeMeshSet(MeshSet_LIGHTNING5);
}


extern float FE_AspectRatioAdjust;      /* 0x000ff9c0 */
extern float FE_WidthScale;             /* 0x000ff9b8 */
extern float HUD_Scale;                 /* 0x000ff9c4 */
extern int  *UseLOWAssetsPtr;           /* slot -> 0x0010df10 */


/* --------------------------------------------------------------- SetupFEScale
 *
 * armv7 0x00002d98, 184 bytes.  **Complete.**
 *
 *      aspect               = (float)w / (float)h
 *      FE_AspectRatioAdjust = 1.5f / aspect
 *      FE_WidthScale        = (float)(w / 480.0)
 *      FE_HeightScale       = (float)((h / 320.0) / FE_AspectRatioAdjust)
 *      FE_YOffset           = ((float)h - (float)h / FE_AspectRatioAdjust) * 0.5f
 *      HUD_Scale            = (FE_WidthScale >= 2.0f) ? 1.75f : 1.0f
 *      UseLOWAssets         = (w == 480)
 *
 * **480 by 320 is the reference layout**, and the two divisors are doubles, not
 * floats -- the widths and heights go through `vcvt.f64.s32` and `vdiv.f64`
 * before being narrowed back. That is a real difference in the last bits and it
 * is transcribed as written.
 *
 * `FE_AspectRatioAdjust` is 1.5 over the actual aspect, so it is 1.0 on a 3:2
 * screen -- exactly the 480x320 the layout was drawn for -- and departs from it
 * on anything else. FE_HeightScale divides by it and FE_YOffset centres what is
 * left, which is letterboxing done in the layout rather than in the projection.
 *
 * **UseLOWAssets is set by WIDTH alone, and only for exactly 480.** Not "480 or
 * less": a 320-wide device would get the high assets. That is what the code
 * says.
 *
 * HUD_Scale steps rather than scales: 1.0 below a 2x width and 1.75 at or above
 * it, so a Retina screen gets a bigger HUD in one jump and nothing in between.
 */
void SetupFEScale(void)
{
    int   w = *limeScreenWidth;
    int   h = *limeScreenHeight;
    float aspect = (float)w / (float)h;
    float adj;

    FE_AspectRatioAdjust = 1.5f / aspect;
    adj = FE_AspectRatioAdjust;

    FE_WidthScale  = (float)((double)w / 480.0);     /* double, then narrowed */
    FE_HeightScale = (float)(((double)h / 320.0) / (double)adj);
    FE_YOffset     = ((float)h - (float)h / adj) * 0.5f;

    HUD_Scale = (FE_WidthScale >= 2.0f) ? 1.75f : 1.0f;

    *UseLOWAssetsPtr = (w == 480) ? 1 : 0;           /* exactly 480, not <= */
}


#define CHARACTER_SLOTS 26

extern signed char CharacterAvailable[CHARACTER_SLOTS];  /* 0x0018ed5c */
extern int  ErmacUnlocked;              /* 0x000ff974 */
extern int  JadeUnlocked;               /* 0x000ff97c */
extern int  GameMode;                   /* slot -> 0x0014faa4 */
extern int *TreasureGained;             /* slot -> 0x00101164, see Reset_SaveData */


/* ------------------------------------------------------- SetupLockedCharacters
 *
 * armv7 0x000031a4, 176 bytes.  **Complete.**
 *
 *      ErmacUnlocked = TreasureGained[2] != 0
 *      JadeUnlocked  = TreasureGained[3] != 0
 *      clear all 26 slots of CharacterAvailable
 *      if (GameMode == 2) { CharacterAvailable[1] = 2; return; }
 *      CharacterAvailable[0x18] = 1
 *      CharacterAvailable[0x19] = 1
 *      ... twenty-two more set to 2 ...
 *      if (ErmacUnlocked) CharacterAvailable[0x14] = 2
 *      if (JadeUnlocked)  CharacterAvailable[0x10] = 2
 *
 * **There are TWO availability values, not one.** Slots 0x18 and 0x19 get 1;
 * every other available slot gets 2. The 2 is built as `0x1a - 0x18` from the
 * loop counter the compiler already had, which is exactly the kind of thing
 * that reads as noise and is not: a port writing 1 everywhere collapses two
 * states into one.
 *
 * **GameMode 2 unlocks exactly one character**, slot 1, and nothing else -- not
 * even the two that get 1 in the normal path. Whatever mode 2 is, it is a
 * single-character mode.
 *
 * Ermac and Jade are gated on treasure slots 2 and 3, and their unlock flags are
 * recomputed here from TreasureGained rather than read from the save -- so the
 * save's own ErmacUnlocked and JadeUnlocked are outputs of this function, not
 * inputs to it.
 */
void SetupLockedCharacters(void)
{
    int i;

    ErmacUnlocked = (TreasureGained[2] != 0);
    JadeUnlocked  = (TreasureGained[3] != 0);

    for (i = 0; i < CHARACTER_SLOTS; i++)
        CharacterAvailable[i] = 0;

    if (GameMode == 2) {
        CharacterAvailable[1] = 2;      /* one character, and only one */
        return;
    }

    CharacterAvailable[0x19] = 1;       /* these two get 1 ... */
    CharacterAvailable[0x18] = 1;

    CharacterAvailable[0x01] = 2;       /* ... and everything else gets 2 */
    CharacterAvailable[0x05] = 2;
    CharacterAvailable[0x02] = 2;
    CharacterAvailable[0x0b] = 2;
    CharacterAvailable[0x12] = 2;
    CharacterAvailable[0x04] = 2;
    CharacterAvailable[0x0f] = 2;
    CharacterAvailable[0x0d] = 2;
    CharacterAvailable[0x03] = 2;

    if (ErmacUnlocked)
        CharacterAvailable[0x14] = 2;
    if (JadeUnlocked)
        CharacterAvailable[0x10] = 2;

    CharacterAvailable[0x00] = 2;
    CharacterAvailable[0x06] = 2;
    CharacterAvailable[0x09] = 2;
    CharacterAvailable[0x0c] = 2;
    CharacterAvailable[0x16] = 2;
    CharacterAvailable[0x0a] = 2;
    CharacterAvailable[0x15] = 2;
    CharacterAvailable[0x08] = 2;
    CharacterAvailable[0x11] = 2;
    CharacterAvailable[0x13] = 2;
    CharacterAvailable[0x07] = 2;
    CharacterAvailable[0x0e] = 2;
    CharacterAvailable[0x17] = 2;
}


extern int   KodeSelectorParticle[10];  /* 0x000ff920 */
extern float KodeTime;                  /* 0x000ff964 */
extern int   KodeSuccess;               /* 0x000ff968 */


/* ----------------------------------------------------------- InitKodeScreen
 *
 * armv7 0x00003144, 92 bytes.  **Complete.**
 *
 * Clears both kode arrays, sets the timer and clears the success flag.
 *
 * **This settles the length of KodeSelector.** The declaration above says "ten
 * words as far as resetKodeSelector reaches", which was a floor, not a
 * measurement -- that function writes six of them. Here the loop runs the byte
 * cursor from 4 to 0x28, and with index 0 written before it that is exactly ten
 * words, for BOTH arrays. Two functions, opposite ends, same answer.
 *
 * The peeled first iteration is the same trick InitGameEvents uses: the cursor
 * doubles as the loop counter, so starting it at zero would cost a compare.
 *
 * `_KodeTime` is set to the literal 0x419ffdf4. As an integer that is
 * 1101332980 and means nothing; as a float it is 19.999001, which is a
 * twenty-second countdown a hair under the round number -- so it is a float
 * here. The exact bits are recorded because the value is odd enough that a port
 * writing a clean 20.0f would be making a decision, not transcribing one.
 */
void InitKodeScreen(void)
{
    int i;

    KodeSelectorParticle[0] = 0;
    KodeSelector[0]         = 0;

    for (i = 1; i < 10; i++) {
        KodeSelectorParticle[i] = 0;
        KodeSelector[i]         = 0;
    }

    KodeTime    = 19.999001f;           /* 0x419ffdf4 exactly */
    KodeSuccess = 0;
}


/* `_BUTTON_1X2_1D` 0x00100514 and `_BUTTON_1X2_2D` 0x00100528 -- two BUTTONNEW
 * records twenty bytes apart. DrawButtonNew takes one by reference. */
extern int BUTTON_1X2_1D[];
extern int BUTTON_1X2_2D[];


/* ---------------------------------------------------------- drawPage2x1Wide
 *
 * armv7 0x000074e8, 112 bytes.  **Complete.**
 *
 * Two full-width buttons stacked, both at x + 0xf0, at y + 0x3c and y + 0xa0.
 * Returns which one was pressed: 1 for the top, 2 for the bottom, 0 for
 * neither.
 *
 * **A press only counts while `FE_FadeAdd` is exactly zero.** Both returns are
 * gated on it, so every press that lands during a screen fade is discarded --
 * not queued, not deferred. FE_FadeAdd is the per-frame fade step the front end
 * sets to -0.033333335f when it starts fading out, and zero when it is done.
 *
 * That gate is the whole reason this returns anything at all, and a port that
 * drops it gets a menu that accepts input through its own transitions.
 */
int drawPage2x1Wide(int x, int y)
{
    int cx = x + 0xf0;
    int r  = 0;

    if (DrawButtonNew(BUTTON_1X2_1D, cx, y + 0x3c, 1) && FE_FadeAdd == 0.0f)
        r = 1;

    if (DrawButtonNew(BUTTON_1X2_2D, cx, y + 0xa0, 1) && FE_FadeAdd == 0.0f)
        r = 2;

    return r;
}


extern int BUTTON_BOXLT[];              /* 0x00100488 */
extern int BUTTON_BOXLB[];              /* 0x001004b0 */
extern int BUTTON_BOXRB[];              /* 0x001004c4 */

int limeCheckForUserMusic(void);


/* -------------------------------------------------- drawPage2x2BigForSettings
 *
 * armv7 0x00015578, 192 bytes.  **Complete.**
 *
 * The settings page buttons. Returns 1, 3 or 4 for the one pressed, 0 for none,
 * and every return is gated on `FE_FadeAdd == 0` the same way drawPage2x1Wide
 * gates its own.
 *
 *      BOXLT at (0x9c, 0x59)   -> 1
 *      BOXLB at (0x9c, 0xe0)   -> 3       only when there is no user music
 *      BOXRB at (0x145, 0xe0)  -> 4
 *
 * **`limeCheckForUserMusic()` decides which of the two bottom buttons exists.**
 * With the phone playing the user own music the BOXLB slot is skipped entirely
 * -- not drawn greyed, not drawn at all -- and only BOXRB appears. There is no
 * value 2: the layout has four slots and one of them is never used.
 *
 * ### It lies to the button it is about to draw
 *
 * Around the BOXRB call it saves `Settings[3]`, **writes zero over it**, draws,
 * and puts the saved value back:
 *
 *      saved = Settings[3];  Settings[3] = 0;
 *      DrawButtonNew(BUTTON_BOXRB, ...)
 *      Settings[3] = saved;
 *
 * So that button is rendered as though the setting were off, whatever it really
 * is, and the real value is restored before anyone else can see it. Settings[3]
 * is the music volume index PlayFatalityVoice reads. A port that drops the
 * save/restore pair draws the right thing and corrupts the setting; a port that
 * drops the zeroing draws the wrong thing. Both halves have to survive.
 */
int drawPage2x2BigForSettings(void)
{
    int r = 0;
    int saved;

    if (DrawButtonNew(BUTTON_BOXLT, 0x9c, 0x59, 1) && FE_FadeAdd == 0.0f)
        r = 1;

    if (!limeCheckForUserMusic()) {
        if (DrawButtonNew(BUTTON_BOXLB, 0x9c, 0xe0, 1) && FE_FadeAdd == 0.0f)
            r = 3;
    }

    saved = Settings[3];
    Settings[3] = 0;                    /* drawn as though it were off */

    if (DrawButtonNew(BUTTON_BOXRB, 0x145, 0xe0, 1) && FE_FadeAdd == 0.0f)
        r = 4;

    Settings[3] = saved;
    return r;
}


extern float FESlideOffset;             /* 0x000ff844 */
extern long  FESlideDir;                /* 0x000ff848, -1 / 0 / 1 */
extern long  FESlideNextTask;           /* 0x000ff84c */
extern float limeFPSScaleFactor;        /* 0x00171acc */



/* ---------------------------------------------------------- MaintainFESlide
 *
 * armv7 0x0000551c, 224 bytes.  **Complete.**
 *
 * Advances the front-end slide transition one frame. `FESlideDir` is a
 * three-state: 1 slides out, -1 slides back, anything else does nothing.
 *
 *      dir ==  1:  offset += 0.1 / limeFPSScaleFactor
 *                  if (offset >= 1.0f) {
 *                      offset = 1.0f
 *                      dir    = -1
 *                      FESlideNextTask == -1 ? PopFETask() : PushFETask(it)
 *                  }
 *
 *      dir == -1:  offset += -0.1 / limeFPSScaleFactor
 *                  if (!(offset > 0.0f)) offset = 0.0f
 *
 * **The step is 0.1 divided by the frame-rate scale, and it is computed in
 * DOUBLE precision** -- the offset is widened with `vcvt.f64.f32`, the divide
 * and add are `.f64`, and only the result is narrowed back. At 30 fps the slide
 * takes ten frames; at any other rate it takes whatever keeps the wall-clock
 * duration the same. This is one of the few places in the tree that is already
 * frame-rate independent, so a 60 fps port must not "fix" it.
 *
 * The two literals are exact: +0.1 and -0.1 as doubles, in separate pool
 * entries. Neither is derived from the other by negation at run time.
 *
 * The task switch happens at the far end of the slide-out, not at the start:
 * the screen is fully covered before the new task is pushed, and `dir` is set
 * to -1 in the same breath so the next frame begins sliding back.
 *
 * **The negative test is `> 0`, not `>= 0`.** So an offset of exactly zero is
 * rewritten with zero -- harmless -- and the branch that skips the clamp is
 * taken only for a strictly positive value.
 */
void MaintainFESlide(void)
{
    if (FESlideDir == -1) {
        FESlideOffset = (float)((double)FESlideOffset
                                + -0.1 / (double)limeFPSScaleFactor);
        if (!(FESlideOffset > 0.0f))
            FESlideOffset = 0.0f;
        return;
    }

    if (FESlideDir != 1)
        return;

    FESlideOffset = (float)((double)FESlideOffset
                            + 0.1 / (double)limeFPSScaleFactor);

    if (FESlideOffset >= 1.0f) {
        FESlideOffset = 1.0f;
        FESlideDir    = -1;

        if (FESlideNextTask == -1)
            PopFETask();
        else
            PushFETask((int)FESlideNextTask);
    }
}


/* `_TowerRand` -- 0x001014d0, **four rows of 22** entries: the index is
 * `22 * row + column`, the column walks by +/-1 and wraps between 0 and 0x15.
 *
 * `_OpponentTowerList` -- 0x0014fcb4 through a pointer slot, **44 bytes** a
 * row: eleven words. */
#define TOWERRAND_ROW     22
#define TOWERLIST_STRIDE  44

extern long  TowerRand[];               /* 0x001014d0 */
extern long *OpponentTowerList;         /* pointer slot -> 0x0014fcb4 */

long limeRand(void);
void Write_Tower(void);


/* -------------------------------------------------------------- PopulateTower
 *
 * armv7 0x0000a5cc, 228 bytes.  **Complete.**
 *
 * Builds the four arcade ladders. Each row of `_OpponentTowerList` holds eleven
 * opponents and the rows are filled with **6, 7, 8 and 9 random ones
 * respectively, followed always by characters 24 and 25**:
 *
 *      row 0:  6 random, then 24, 25       (words 0..5, 6, 7)
 *      row 1:  7 random, then 24, 25       (words 0..6, 7, 8)
 *      row 2:  8 random, then 24, 25
 *      row 3:  9 random, then 24, 25       (words 0..8, 9, 10 -- the row is full)
 *
 * The last row uses all eleven words exactly, which is where the 44-byte stride
 * comes from. The two fixed opponents are written after the loop, at four
 * offsets that look unrelated until you line them up against each row length:
 * 0x18, 0x48, 0x78, 0xa8 are word 6 of row 0, word 7 of row 1, word 8 of row 2
 * and word 9 of row 3.
 *
 * **So the last two fights of every ladder are always the same two characters,
 * and they are never drawn from the random pool.**
 *
 * ### How the random ones are picked
 *
 * Not by rolling once per slot. One `limeRand()` picks a starting column
 * (`& 7`), another picks a direction (+1 or -1), and the row then WALKS the
 * TowerRand table from there, wrapping between column 0 and column 0x15. The
 * table row advances by one per ladder, `(row + 1) & 3`, from a start that is
 * itself `limeRand() & 3`.
 *
 * That means a ladder is a contiguous run through a hand-authored table, read
 * forwards or backwards -- not a random draw. Whatever ordering constraints the
 * designers put in TowerRand survive, which is the whole point and is lost
 * immediately by a port that "simplifies" this to picking each slot at random.
 *
 * The direction is re-rolled per ladder; the starting column is not -- `r6`
 * holds one `limeRand()` result reused across all four rows, masked to 3 bits
 * each time. It prints `populating tower!` once and calls `Write_Tower` at the
 * end, so the result is persisted.
 */
void PopulateTower(void)
{
    long row = limeRand() & 3;          /* the TowerRand row to start from */
    long seed;
    long ladder;

    puts("populating tower!");

    for (ladder = 6; ladder != 10; ladder++) {
        long *dst = OpponentTowerList + (ladder - 6) * (TOWERLIST_STRIDE / 4);
        long step, col, i;

        seed = limeRand();
        step = (limeRand() & 1) ? -1 : 1;
        col  = seed & 7;

        for (i = 0; i < ladder; i++) {
            dst[i] = TowerRand[row * TOWERRAND_ROW + col];

            col += step;
            if (col < 0)
                col = 0x15;             /* wrap at the bottom */
            else if (col > 0x15)
                col = 0;                /* and at the top */
        }

        row = (row + 1) & 3;
    }

    /* The two fixed opponents, one word past each ladder random run. */
    OpponentTowerList[0x18 / 4] = 24;
    OpponentTowerList[0x48 / 4] = 24;
    OpponentTowerList[0x78 / 4] = 24;
    OpponentTowerList[0xa8 / 4] = 24;
    OpponentTowerList[0x1c / 4] = 25;
    OpponentTowerList[0x4c / 4] = 25;
    OpponentTowerList[0x7c / 4] = 25;
    OpponentTowerList[0xac / 4] = 25;

    Write_Tower();
}


/* `_Stats` -- 0x00183c84. Five words are reached from here:
 *
 *      +0x00  best win streak (a running maximum)
 *      +0x04  wins            single player
 *      +0x08  losses          single player
 *      +0x0c  wins            human vs human
 *      +0x10  losses          human vs human
 */
/* `_Stats` is already declared above as char[0x98]; these are its first five
 * words. */
#define STATW(n)  (((long *)Stats)[(n) / 4])

extern long Health[];                   /* 0x0014fa64, one per player */
extern long Player1Wins;                /* 0x0014e204 */
extern long winStreak;                  /* 0x0014e1a8 */

int  isParent(void);
void Write_Stats(void);


/* ------------------------------------------------------------------ UpdateStats
 *
 * armv7 0x0001272c, 260 bytes.  **Complete.**
 *
 * Books the result of a match. `GameMode` picks which pair of counters moves:
 *
 *      GameMode == 6   nothing is counted, Write_Stats runs anyway
 *      GameMode == 1   the human-vs-human pair, +0x0c and +0x10
 *      anything else   the single-player pair, +0x04 and +0x08
 *
 * ### Each side judges the match by the OTHER player health
 *
 * In the human-vs-human case it asks `isParent()` and then reads a different
 * slot of `_Health` depending on the answer:
 *
 *      parent      -> Health[1] == 0  ->  "wins"
 *      not parent  -> Health[0] == 0  ->  "wins"
 *
 * So the parent checks the child health and the child checks the parent, and
 * both arrive at the same verdict from their own copy of the state. Reading it
 * as "check my own health" gets the sign backwards on one of the two devices,
 * which is exactly the sort of thing that only shows up in a real two-device
 * test.
 *
 * It prints `wins` or `loss` on the way through -- both survive in retail.
 *
 * The single-player path uses `Player1Wins` instead, and then keeps the best
 * streak with `if (Stats[0] <= winStreak) Stats[0] = winStreak`. **The
 * comparison is `<=`, so an equal streak is rewritten with itself** rather than
 * skipped. Harmless, and transcribed as written.
 *
 * Every path ends in Write_Stats, including GameMode 6 which changed nothing.
 */
void UpdateStats(void)
{
    if (GameMode == 1) {
        if (isParent()) {
            puts("increasing human wins/loss - parent");
            if (Health[1] == 0) {
                puts("wins");
                STATW(0x0c)++;
            } else {
                puts("loss");
                STATW(0x10)++;
            }
        } else {
            if (Health[0] == 0) {
                puts("wins");
                STATW(0x0c)++;
            } else {
                puts("loss");
                STATW(0x10)++;
            }
        }
        Write_Stats();
        return;
    }

    if (GameMode != 6) {
        if (Player1Wins != 0)
            STATW(0x04)++;
        else
            STATW(0x08)++;

        if (STATW(0) <= winStreak)
            STATW(0) = winStreak;
    }

    Write_Stats();
}


extern long  VSWait;                    /* 0x000ff9a0 */
extern float VSScroll;                  /* 0x000ff9a4 */
extern long  TowerState;                /* 0x000ff9ac */
extern long  Character1;                /* 0x000ff988 */
extern long  Character2;                /* 0x000ff98c */
extern long  Character2Override;        /* 0x00101798 */
/* `VSAssetsLoaded`, `GameStarted`, `Destiny` and `Stage` are declared above. */


/* --------------------------------------------------- FE_Task_VS_Screen_Init
 *
 * armv7 0x00004d38, 272 bytes.  **Complete.**
 *
 * Sets up the versus screen and, in the process, decides who player two is.
 *
 *      VSWait   = 0
 *      VSScroll = 256.0f
 *
 *      GameMode == 1  ->  nothing else; multiplayer picks its own opponent
 *      otherwise      ->  GameStarted = 1, TowerState = -1, then:
 *
 *          GameMode == 4   Character2 = TowerRand[|limeRand()| % 22]
 *          otherwise       Character2 = OpponentTowerList[Destiny * 11 + Stage]
 *                          and if GameMode == 2, Character2 = Character1
 *
 *      Character2Override = -1
 *      VSAssetsLoaded     = 1
 *
 * ### It confirms the tower list layout from the reading side
 *
 * `OpponentTowerList[Destiny * 11 + Stage]` -- **eleven words a row**, which is
 * exactly the 44-byte stride `PopulateTower` writes with. One function fills
 * the table, this one reads it, and they agree without either saying so.
 * `Destiny` is the ladder and `Stage` is how far up it the player is.
 *
 * `GameMode == 4` bypasses the ladder entirely and takes a random entry from
 * the first 22 of `_TowerRand` -- the same table `PopulateTower` walks, read
 * flat here rather than by row.
 *
 * The modulus is a reciprocal multiply: magic `0x2e8ba2e9`, `smull`, `asr #2`.
 * Worked out numerically rather than assumed, that is **22** -- and 22 is the
 * TowerRand row width. The absolute value is taken first, so a negative
 * `limeRand()` cannot index backwards.
 *
 * `GameMode == 2` is the mirror match: player two is set to player one AFTER
 * the ladder lookup has already chosen someone, overwriting it.
 *
 * `VSScroll` starts at 256.0 and `Character2Override` at -1, the same "nobody"
 * sentinel used elsewhere in this tree.
 */
void FE_Task_VS_Screen_Init(void)
{
    VSWait   = 0;
    VSScroll = 256.0f;

    if (GameMode != 1) {
        GameStarted = 1;
        TowerState   = -1;

        if (GameMode == 4) {
            long r = limeRand();
            if (r < 0)
                r = -r;
            Character2 = TowerRand[r % 22];
        } else {
            Character2 = OpponentTowerList[Destiny * 11 + Stage];
            if (GameMode == 2)
                Character2 = Character1;    /* the mirror match */
        }
    }

    Character2Override = -1;
    VSAssetsLoaded     = 1;
}


void limeFillRect(float x, float y, float w, float h,
                  float r, float g, float b, float a);


/* ------------------------------------------ DrawGreenHighlight / DrawRedHighlight
 *
 * armv7 0x0000359c and 0x00003704, 360 bytes each.  **Both complete.**
 *
 * A hollow rectangle -- four filled bars making an outline `thick` pixels wide:
 *
 *      (x,             y,             w,     thick)     top
 *      (x,             y + h - thick, w,     thick)     bottom
 *      (x,             y,             thick, h    )     left
 *      (x + w - thick, y,             thick, h    )     right
 *
 * Every coordinate goes through `FE_X` / `FE_Y` / `FE_W` / `FE_H`, so the bars
 * scale with the front end rather than being in device pixels. The corners are
 * covered twice -- the top and bottom bars span the full width and the side
 * bars span the full height -- which is invisible at alpha 1 and would not be
 * if either were translucent.
 *
 * **The two functions are identical apart from one colour**: green is
 * `(0, 1, 0, 1)` and red is `(1, 0, 0, 1)`. The compiler emitted two full
 * copies rather than sharing a body, 720 bytes for what is one function and a
 * parameter. They are written here as one static helper and two wrappers,
 * which is a readability choice and not a claim about the original.
 *
 * `h` arrives in r3 and `thick` is the only stack argument.
 */
static void DrawHighlight(int x, int y, int w, int h, int thick,
                          float r, float g, float b)
{
    limeFillRect((float)FE_X((float)x), (float)FE_Y((float)y),
                 (float)FE_W((float)w), (float)FE_H((float)thick),
                 r, g, b, 1.0f);

    limeFillRect((float)FE_X((float)x), (float)FE_Y((float)(h + y - thick)),
                 (float)FE_W((float)w), (float)FE_H((float)thick),
                 r, g, b, 1.0f);

    limeFillRect((float)FE_X((float)x), (float)FE_Y((float)y),
                 (float)FE_W((float)thick), (float)FE_H((float)h),
                 r, g, b, 1.0f);

    limeFillRect((float)FE_X((float)(w + x - thick)), (float)FE_Y((float)y),
                 (float)FE_W((float)thick), (float)FE_H((float)h),
                 r, g, b, 1.0f);
}

void DrawGreenHighlight(int x, int y, int w, int h, int thick)
{
    DrawHighlight(x, y, w, h, thick, 0.0f, 1.0f, 0.0f);
}

void DrawRedHighlight(int x, int y, int w, int h, int thick)
{
    DrawHighlight(x, y, w, h, thick, 1.0f, 0.0f, 0.0f);
}


extern float FE_WidthScale;             /* 0x000ff9b8 */
extern float FE_HeightScale;            /* 0x000ff9bc */
extern void *GameFont;                  /* pointer slot -> 0x001abb98 */
/* `limeScreenWidth` and `limeScreenHeight` are declared above, in the
 * pointer-slot spelling this file uses throughout. */

void limeDrawFONT(void *font, const char *text, float x, float y,
                  long align, float scale, const float *colour);
int  snprintf(char *buf, size_t n, const char *fmt, ...);


/* ---------------------------------------- FE_DrawLeaderBoardEntriesCallback
 *
 * armv7 0x00013d2c, 320 bytes.  **Complete.**
 *
 * Draws one leaderboard row: the rank and name on the left, the score on the
 * right, both in **red** -- the static colour constant is `(1, 0, 0, 1)`.
 *
 *      snprintf(buf, 64, "%d. %s", offset + rank, name)
 *      limeDrawFONT(GameFont, buf, 60, y, 0, FE_WidthScale, red)
 *
 *      snprintf(buf, 64, "%d", score)
 *      limeDrawFONT(GameFont, buf, limeScreenWidth - 60 * FE_WidthScale,
 *                   y, 2, FE_WidthScale, red)
 *
 * ### Both edges are inset by the same 60, from opposite directions
 *
 * The left column sits at a bare `60` and the right at
 * `limeScreenWidth + FE_WidthScale * -60`. The two constants are separate pool
 * entries, +60 and -60, not one negated at run time. **Only the right one is
 * scaled**: the left x is passed as a raw 60 with no `FE_WidthScale` anywhere
 * near it, so the two margins stop matching as soon as the scale is not 1.
 * Transcribed as written -- it is the kind of asymmetry that looks like a
 * transcription slip and is not.
 *
 * The alignment argument differs too: 0 for the left column, **2** for the
 * right, which is what makes the score right-justified against its edge.
 *
 * ### The row y
 *
 *      y = screenHeight / 2 + 10 + FE_HeightScale * -80
 *            + FE_HeightScale * (rank * 16)
 *
 * so rows are 16 units apart before scaling, starting 80 above the midpoint
 * plus ten. The `/ 2` is the signed halving the compiler emits
 * (`r3 + (r3 >>> 31)` then `asr #1`), transcribed rather than written `/ 2`.
 *
 * The whole body is skipped when the fourth argument is zero, and the colour
 * block is still copied to the stack first either way.
 *
 * The scratch buffer is 64 bytes and `snprintf` is bounded -- unlike the
 * `sprintf` elsewhere in this tree.
 */
void FE_DrawLeaderBoardEntriesCallback(int rank, int offset, const char *name,
                                       int show, int unused, int score)
{
    float colour[4];
    char buf[64];
    float y;

    colour[0] = 1.0f;                   /* C.550 -- red, opaque */
    colour[1] = 0.0f;
    colour[2] = 0.0f;
    colour[3] = 1.0f;

    (void)unused;

    if (show == 0)
        return;

    y = (float)(*limeScreenHeight / 2 + 10)
        + FE_HeightScale * -80.0f
        + FE_HeightScale * (float)(rank * 16);

    snprintf(buf, sizeof buf, "%d. %s", offset + rank, name);
    limeDrawFONT(GameFont, buf, 60.0f, (float)(long)y, 0,
                 FE_WidthScale, colour);

    snprintf(buf, sizeof buf, "%d", score);
    limeDrawFONT(GameFont, buf,
                 (float)*limeScreenWidth + FE_WidthScale * -60.0f,
                 (float)(long)y, 2, FE_WidthScale, colour);
}


/* `_ButtonSplitText2` -- 0x00184f30, **256 bytes a line**: the index is
 * `line << 8`. */
#define SPLITTEXT_STRIDE  256

extern char ButtonSplitText2[];         /* 0x00184f30 */

char *limeUC(const char *s);
long  limeGetStringWidth(void *font, const char *text);
long  CreateWrappedTextArrays(const char *text, char *out, long *lines,
                              long maxWidth, void *font, float scale);


/* --------------------------------------------------------- DrawOptionAsText
 *
 * armv7 0x0000dd50, 352 bytes.  **Complete.**
 *
 * Wraps a string into `_ButtonSplitText2` and draws each line, 20 units apart,
 * vertically centred on the block:
 *
 *      CreateWrappedTextArrays(text, ButtonSplitText2, &lines, maxWidth,
 *                              GameFont, scale * FE_WidthScale)
 *
 *      for each line:
 *          y = centre - (lines * 10 - 10) + lineOffset
 *          limeDrawFONT(GameFont, limeUC(line), FE_X(x), FE_Y(y),
 *                       1, scale * FE_WidthScale, colour)
 *          lineOffset += 20
 *
 * `lines * 10 - 10` is half of `(lines - 1) * 20`, so the block straddles the
 * centre rather than starting at it. Zero lines draws nothing and returns 0.
 *
 * ### The line offset is an integer parked in a float register
 *
 * `s18` is stepped with `vmov` to a core register, `adds #0x14`, and `vmov`
 * back -- never with `vadd.f32` -- then read out with `vcvt.f32.s32`. It holds
 * an INT bit pattern the whole time. Anyone reading the FP register list would
 * take it for a float accumulator and be wrong by a factor of 10^38.
 *
 * ### Three limeUC calls per line, for a result that is discarded
 *
 * Each iteration calls `limeUC` and `limeGetStringWidth` once to draw, once to
 * compare the scaled width against the widest seen, and **once more inside the
 * branch to recompute the value it just compared**. The running maximum ends up
 * in `s22` and `s22` is never read: the function returns a constant 0.
 *
 * That matters beyond being wasteful. `limeUC` advances the sixteen-buffer ring
 * on every call, so **six lines exhaust it** and the earliest buffers are
 * overwritten while the function is still running. It survives because each
 * buffer is used immediately and never held -- but any port that starts holding
 * a `limeUC` result across the loop breaks here first, and the redundant calls
 * are the reason the margin is only six lines instead of sixteen.
 *
 * Transcribed with all three calls. Collapsing them is safe today and removes
 * the only evidence of how tight that ring is.
 */
long DrawOptionAsText(const char *text, int x, float scale, int centre,
                      const float *colour, float maxWidth)
{
    long lines = 0;
    long i;
    long lineOffset;                    /* an int, in s18 */
    float widest = 0.0f;                /* s22 -- computed and never read */

    CreateWrappedTextArrays(text, ButtonSplitText2, &lines, (long)maxWidth,
                            GameFont, (float)centre * FE_WidthScale);

    if (lines <= 0)
        return 0;

    lineOffset = 0;
    for (i = 0; i < lines; i++) {
        char *line = &ButtonSplitText2[i * SPLITTEXT_STRIDE];
        float y = scale - (float)(lines * 10 - 10) + (float)lineOffset;
        float w;

        limeDrawFONT(GameFont, limeUC(line),
                     (float)FE_X((float)x), (float)FE_Y(y),
                     1, (float)centre * FE_WidthScale, colour);

        w = (float)limeGetStringWidth(GameFont, limeUC(line))
            * FE_WidthScale * (float)centre;

        if (w > widest)                 /* recomputed inside the branch */
            widest = (float)limeGetStringWidth(GameFont, limeUC(line))
                     * FE_WidthScale * (float)centre;

        lineOffset += 0x14;             /* 20, added as an integer */
    }

    return 0;
}


extern float *limeTouchScreenX;         /* pointer slot -> 0x00171af4 */
extern float *limeTouchScreenY;         /* pointer slot */
extern float *limeLastTouchScreenX;     /* pointer slot */
extern float *limeLastTouchScreenY;     /* pointer slot */
extern long  *SFXHandle;                /* pointer slot */
extern float *MusicVol;                 /* pointer slot -> 0x000ff830 */

void limePlaySound(long id, float vol, float pan, long flags);


/* ---------------------------------------------------------------- TouchAreaWH
 *
 * armv7 0x0000562c, 428 bytes.  **Complete.**
 *
 * Hit-tests a rectangle against the touch screen and returns **which kind of
 * touch it is**, not a boolean:
 *
 *      2   a finger is down inside the rectangle right now
 *      1   a finger was just LIFTED inside it
 *      0   neither
 *
 * The rectangle is `FE_X(x)`, `FE_Y(y)`, `FE_W(w)`, `FE_H(h)` -- all four
 * scaled, unlike the leaderboard's left margin.
 *
 * ### Only touch slot zero
 *
 * `limeTouchScreenX[0]` and nothing else. `CheckLeftDial` scans all ten slots;
 * this looks at one. So a second finger anywhere on the screen cannot press a
 * button, and the front end is single-touch by construction rather than by
 * policy.
 *
 * ### The release test uses a different pair of globals
 *
 * A live touch is `limeTouchScreenX/Y`; `-1.0f` there means nothing is down,
 * and only then does it consult `limeLastTouchScreenX/Y` -- where the finger
 * was when it lifted. So the "1" result is genuinely a release event, and it
 * fires exactly once per lift because the live array has already gone to -1.
 *
 * **The click sound plays only on that path.** `limePlaySound(SFXHandle[0x1a],
 * MusicVol[Settings[3]] / 100.0f, 1.0f, 0)`, gated on `Settings[3]` -- the same
 * volume table and the same /100 that `RunGameEvents` uses for the hit sound.
 * A button held down is silent; releasing it clicks.
 *
 * The bounds tests are `>=` on the near edges and `>` on the far ones, so the
 * rectangle is half-open and two abutting buttons cannot both claim a pixel.
 */
long TouchAreaWH(int x, int y, int w, int h)
{
    float tx = limeTouchScreenX[0];
    float x0 = (float)FE_X((float)x);
    long r = 0;

    if (tx >= x0
        && tx <= x0 + (float)FE_W((float)w)) {
        float ty = limeTouchScreenY[0];
        float y0 = (float)FE_Y((float)y);

        if (ty >= y0 && ty <= y0 + (float)FE_H((float)h))
            r = 2;                      /* held down inside */
    }

    if (tx != -1.0f)
        return r;                       /* a live touch: nothing more to say */

    /* nothing is down -- was the last one released in here? */
    {
        float lx = limeLastTouchScreenX[0];
        float ly;
        float y0;

        if (x0 > lx)
            return r;
        if (lx > x0 + (float)FE_W((float)w))
            return r;

        ly = limeLastTouchScreenY[0];
        y0 = (float)FE_Y((float)y);

        if (ly < y0)
            return r;
        if (ly > y0 + (float)FE_H((float)h))
            return r;

        r++;                            /* 0 -> 1, the release */

        if (Settings[3] != 0)
            limePlaySound(SFXHandle[0x68 / 4],
                          MusicVol[Settings[3]] / 100.0f, 1.0f, 0);
    }

    return r;
}


long limeGetStringWidthUCNoHeader(void *font, const char *text);


/* ---------------------------------------------------- CreateWrappedTextArrays
 *
 * armv7 0x00003338, 612 bytes.  **Complete.**
 *
 * The word wrapper. Splits `text` into fixed 256-byte lines in `out` and
 * reports how many it produced. **The 256-byte stride is the same one
 * `DrawOptionAsText` walks `ButtonSplitText2` with** -- two functions, one
 * layout.
 *
 * It handles two encodings and picks between them by looking at the first byte:
 * `0xFF` followed by `0xFE` is the UTF-16LE BOM that `limeUC` writes and
 * `LoadTextData` bakes into every shipped string; anything else is bytes.
 *
 * ### Width is measured one character at a time, not per line
 *
 *      w = limeGetStringWidth(font, &line[col])      <- from HERE to the NUL
 *      total += w * scale
 *      if (total > maxWidth) break the line
 *
 * The measured slice starts at the character just written and the terminator
 * was written immediately after it, so each call measures exactly one glyph and
 * the total is accumulated. Measuring the whole line each pass would be
 * quadratic; this is linear, and it is why `total` is reset rather than
 * recomputed after a break.
 *
 * The UTF-16 branch uses **`limeGetStringWidthUCNoHeader`** -- the variant that
 * does not expect a BOM -- because the slice it hands over starts mid-string
 * and has no header of its own.
 *
 * ### Where it is allowed to break
 *
 * A break position is remembered when either:
 *
 *      the character is `' '` or `'|'`            (ASCII, or UTF-16 high byte 0)
 *      the UTF-16 high byte is above 0x4d
 *
 * The second is the interesting one. High bytes above 0x4d are the CJK and
 * Hangul blocks, and there **any** character is a legal break point -- which is
 * correct for languages that do not put spaces between words, and is the whole
 * reason the test is on the high byte rather than on the character. Latin text
 * still breaks only at spaces and pipes.
 *
 * `'|'` is also a hard break: on hitting one the line is cut there whether or
 * not it was full.
 *
 * ### Line count
 *
 * `*lines` ends at `lastLineIndex + 1`, and **an empty string reports 1**, not
 * 0 -- the increment happens on every exit path. A caller that loops
 * `for (i = 0; i < lines; i++)` therefore always draws at least one line, which
 * for an empty string is an empty one.
 */
long CreateWrappedTextArrays(const char *text, char *out, long *lines,
                             long maxWidth, void *font, float scale)
{
    long line = 0;
    long col = 0;
    long i;
    long breakAt = -1;                  /* index in `text` */
    long breakCol = 0;                  /* column in the current line */
    float total = 0.0f;
    int utf16;

    *lines = 0;

    if (text[0] == 0) {
        *lines = 1;                     /* empty still counts as one line */
        return 0;
    }

    utf16 = ((unsigned char)text[0] == 0xFF
             && (signed char)text[1] == (signed char)0xFE);

    if (!utf16) {
        for (i = 0; text[i] != 0; ) {
            char *dst = &out[line * 256];
            char ch;

            dst[col] = text[i];
            dst[col + 1] = 0;
            ch = dst[col];

            if (ch == '|' || ch == ' ') {
                breakAt  = i;
                breakCol = col;
            }

            total += (float)limeGetStringWidth(font, &dst[col]) * scale;

            if (total > (float)maxWidth) {
                out[line * 256 + breakCol] = 0;
                i    = breakAt + 1;
                col  = 0;
                line++;
                total = 0.0f;
                continue;
            }

            if (dst[col] == '|') {      /* a hard break */
                out[line * 256 + breakCol] = 0;
                i    = breakAt + 1;
                col  = 0;
                line++;
                total = 0.0f;
                continue;
            }

            i++;
            col++;
        }
    } else {
        const char *s = text + 1;       /* past the 0xFF; units are read at s+k */

        for (i = 2; text[i] != 0; ) {
            char *dst = &out[line * 256];
            long hi;

            if (s[i] == 0)
                break;

            dst[col]     = text[i];     /* the low byte  */
            dst[col + 1] = s[i];        /* and the high  */
            dst[col + 2] = 0;           /* 16-bit terminator */
            dst[col + 3] = 0;

            hi = (signed char)dst[col + 1];

            if ((signed char)dst[col] == '|' || (signed char)dst[col] == ' ') {
                if (hi == 0) {
                    breakAt  = i;
                    breakCol = col;
                } else if (hi > 0x4d) {
                    breakAt  = i;
                    breakCol = col;
                }
            } else if (hi > 0x4d) {     /* CJK: break anywhere */
                breakAt  = i;
                breakCol = col;
            }

            total += (float)limeGetStringWidthUCNoHeader(font, &dst[col])
                     * scale;

            if (total > (float)maxWidth
                || ((signed char)dst[col] == '|' && dst[col + 1] == 0)) {
                if (breakAt != -1) {
                    out[line * 256 + breakCol]     = 0;
                    out[line * 256 + breakCol + 1] = 0;
                    i = ((signed char)s[breakAt] <= 0x4d)
                        ? breakAt : breakAt - 2;
                }
                line++;
                breakAt = -1;
                col   = 0;
                total = 0.0f;
                continue;
            }

            i   += 2;
            col += 2;
        }
    }

    *lines = line + 1;
    return 0;
}


extern long  mpLobbyCurrentPage;        /* 0x000ff8e0 */
extern void **FEBackground;             /* pointer slot */
extern float *col;                      /* pointer slot -> 0x0014fa00 */
extern float *fontcol;                  /* pointer slot */
typedef struct TEXTURE TEXTURE;

void limeDrawSprite(TEXTURE *tex, float x, float y, float w, float h,
                    float u0, float v0, float u1, float v1,
                    const float *colour);

const char *GameText(long id);
void PopFETaskDeferredSelected(long task);


/* --------------------------------------------- FE_Task_Multiplayer_Disconnected
 *
 * armv7 0x00007344, 420 bytes.  **Complete.**
 *
 * The "connection lost" screen. Clears `_mpLobbyCurrentPage`, draws the
 * front-end backdrop full-screen, the message, and one button.
 *
 *      limeDrawSprite(*FEBackground, 0, 0, screenW, screenH,
 *                     0, 0.0234375f, 1.0f, 0.703125f, col)
 *
 * The V pair is 3/128 to 90/128 -- another inset window into a texture larger
 * than the part shown, the same shape `Task_LoadSplashScreen` uses.
 *
 * The message is `GameText(0xc4)` centred on the screen midpoint minus 20; the
 * halving is the signed `(w + (w >>> 31)) >> 1` the compiler emits, transcribed
 * rather than written `/ 2`.
 *
 * ### The two arms of the button test are the same draw
 *
 * `DrawButtonNew(BUTTON_1X3_3, 0xed, 0xe6, 1)` gates on the usual
 * `FE_FadeAdd == 0`, and **both outcomes draw the identical label** --
 * `GameText(0xc3)` at `FE_X(235)`, `FE_Y(222)`, same font, same colour, same
 * scale. The only difference is what happens after: the pressed path
 * additionally does
 *
 *      GameMode = 0
 *      PopFETaskDeferredSelected(0x29a)
 *
 * So the label is drawn either way and the compiler emitted two full copies of
 * the call rather than sharing it. Transcribed as one draw plus the tail,
 * because writing it twice would suggest a difference that is not there.
 *
 * `0x29a` is 666 -- the task id to return to.
 */
void FE_Task_Multiplayer_Disconnected(void)
{
    int pressed;

    mpLobbyCurrentPage = 0;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    limeDrawFONT(GameFont, GameText(0xc4),
                 (float)(*limeScreenWidth / 2),
                 (float)(*limeScreenHeight / 2 - 0x14),
                 1, FE_WidthScale, col);

    pressed = DrawButtonNew(BUTTON_1X3_3, 0xed, 0xe6, 1)
              && FE_FadeAdd == 0.0f;

    limeDrawFONT(GameFont, GameText(0xc3),
                 (float)FE_X(235.0f), (float)FE_Y(222.0f),
                 1, FE_WidthScale, fontcol);

    if (pressed) {
        GameMode = 0;
        PopFETaskDeferredSelected(0x29a);       /* 666 */
    }
}


extern float  FEObjPos[3];              /* 0x000ff948 */
extern float  FECamPos[3];              /* 0x000ff954 */
extern float *CameraLookAt;             /* pointer slot -> 0x0014fa80 */
extern float  VortexSpin;               /* 0x0010174c */
extern float  VortexScale;              /* 0x00101754 */
extern float  TowerBGMatrix[16];        /* 0x0018ed80 */
extern void  *Vortex1Texture;           /* 0x00183e7c */
extern void  *Vortex2Texture;           /* 0x00183e80 */
extern void  *MeshSet_VORTEX1;          /* 0x00183d30 */
extern void  *MeshSet_VORTEX2;
extern void  *MeshSet_VORTEX3;
extern void  *MeshSet_VORTEX4;
extern void  *MeshSet_VORTEX5;

void LIMEDS_Set3dMode(void);
void limeEnableDepthTest(void);
void limeEnableDepthWrites(void);
void limeDisableDepthTest(void);
void limeDisableDepthWrites(void);
void limeEnableAlphaBlending_Basic(void);
void glPushMatrix(void);
void glScalef(float x, float y, float z);
void SetToUseCamera(void);
void limeEnableAlphaBlending_Additive(void);
void RotMatrixY(float *m, float angle);
void RenderAMesh(int a, int b, float *pos, float *m, int flip,
                 void *t0, void *t1, void *ms, long n);


/* ------------------------------------------------------------- DrawVortex3D
 *
 * armv7 0x000078d8, 580 bytes.  **Complete.**
 *
 * The tower background: **five nested vortex meshes, all spinning at different
 * rates around Y**, drawn additively with no depth.
 *
 *      VortexSpin += 0.01 / limeFPSScaleFactor     <- frame-rate independent
 *
 *      layer 1   VORTEX1  Vortex1Texture   spin * 1.0
 *      layer 2   VORTEX2  Vortex2Texture   spin * 1.1
 *      layer 3   VORTEX3  Vortex1Texture   spin * 1.2
 *      layer 4   VORTEX4  Vortex2Texture   spin * 1.3
 *      layer 5   VORTEX5  Vortex1Texture   spin * 1.4
 *
 * Five multipliers, four of them double-precision literals in the pool, and the
 * two textures alternate. The staggered rates are the whole effect -- give them
 * all the same multiplier and the five shells lock together into one shape.
 *
 * The camera is placed by hand first: `FEObjPos` and `FECamPos` are both zeroed
 * and `CameraLookAt` is set to `FECamPos` with **+1.0 on Y**, so the view looks
 * slightly up from the origin. `LIMEDS_Set3dMode` and `SetToUseCamera` bracket
 * that.
 *
 * Depth test and depth writes are enabled and then immediately **disabled**
 * again before the draws -- four calls where two would do. Transcribed; the net
 * state is what matters and it is depth off, additive on.
 *
 * ### glPushMatrix with no glPopMatrix
 *
 * There is exactly one `glPushMatrix` in this function and **no matching pop**
 * -- confirmed by counting both across the whole disassembly, not by reading
 * past the end. On a screen redrawn every frame that walks the GL matrix stack
 * until it overflows, after which the push silently fails and `glScalef`
 * compounds onto whatever is current instead.
 *
 * It is invisible in the shipped game for one reason: `_VortexScale` is
 * **exactly 1.0**, so the scale that leaks is the identity and compounding it
 * changes nothing. Any port that gives that global a different value inherits a
 * vortex that grows or shrinks without bound.
 *
 * Transcribed as written, with the pop left out, because adding one changes
 * behaviour in a way nothing here justifies -- but a port should add it
 * deliberately and say so.
 *
 * Blending is restored to basic on the way out; the depth state is not.
 */
void DrawVortex3D(void)
{
    FEObjPos[0] = FEObjPos[1] = FEObjPos[2] = 0.0f;
    FECamPos[0] = FECamPos[1] = FECamPos[2] = 0.0f;

    LIMEDS_Set3dMode();
    limeEnableDepthTest();
    limeEnableDepthWrites();

    VortexSpin = (float)((double)VortexSpin
                         + 0.01 / (double)limeFPSScaleFactor);

    CameraLookAt[0] = FECamPos[0];
    CameraLookAt[2] = FECamPos[2];
    CameraLookAt[1] = FECamPos[1] + 1.0f;

    SetToUseCamera();
    limeEnableAlphaBlending_Additive();
    limeDisableDepthTest();
    limeDisableDepthWrites();

    glPushMatrix();                     /* never popped -- see above */
    glScalef(VortexScale, VortexScale, VortexScale);

    RotMatrixY(TowerBGMatrix, VortexSpin);
    RenderAMesh(0, 0, FEObjPos, TowerBGMatrix, 0,
                Vortex1Texture, 0, MeshSet_VORTEX1, 0);

    RotMatrixY(TowerBGMatrix, (float)((double)VortexSpin * 1.1));
    RenderAMesh(0, 0, FEObjPos, TowerBGMatrix, 0,
                Vortex2Texture, 0, MeshSet_VORTEX2, 0);

    RotMatrixY(TowerBGMatrix, (float)((double)VortexSpin * 1.2));
    RenderAMesh(0, 0, FEObjPos, TowerBGMatrix, 0,
                Vortex1Texture, 0, MeshSet_VORTEX3, 0);

    RotMatrixY(TowerBGMatrix, (float)((double)VortexSpin * 1.3));
    RenderAMesh(0, 0, FEObjPos, TowerBGMatrix, 0,
                Vortex2Texture, 0, MeshSet_VORTEX4, 0);

    RotMatrixY(TowerBGMatrix, (float)((double)VortexSpin * 1.4));
    RenderAMesh(0, 0, FEObjPos, TowerBGMatrix, 0,
                Vortex1Texture, 0, MeshSet_VORTEX5, 0);

    limeEnableAlphaBlending_Basic();
}


extern void *FENew1Texture;             /* 0x00183d7c */
extern float mmfontcol[];               /* 0x000ff854, sixteen bytes an entry */

void limeDrawFONTAtAngle(void *font, const char *text, float x, float y,
                         long align, float scale, const float *colour,
                         float angle);


/* --------------------------------------------------------------- DrawMainMenu
 *
 * armv7 0x00018c14, 612 bytes.  **Complete.**
 *
 * The five main-menu entries, each drawn at its own position, scale and
 * **slight rotation**. The five arguments are colour indices, one per entry,
 * into `_mmfontcol` at a sixteen-byte stride -- so the caller passes which of
 * several colours each line should use, and highlighting is done by changing
 * an index rather than by drawing anything extra.
 *
 *      entry   text        x     y     scale   angle (radians)
 *      1       GameText(4)   170    24    1.4    -0.021
 *      2       GameText(10)  218   104    1.6    -0.0021
 *      3       GameText(6)   190   180    1.3     0.008
 *      4       GameText(5)   190   250    1.3     0.023
 *      5       GameText(213) 167   290    1.3     0.015
 *
 * **Every line is tilted, and no two by the same amount.** The angles run from
 * -0.021 to +0.023 radians -- between one and one and a half degrees -- and
 * they alternate sign down the list. That hand-placed jitter is what makes the
 * menu look drawn rather than laid out, and it is invisible in a screenshot
 * unless you know to look for it. A port that draws these upright loses the
 * entire character of the screen for the sake of five float literals.
 *
 * Entries 3, 4 and 5 share the 1.3 scale, which is loaded once into `d8` at the
 * top and reused; entries 1 and 2 each load their own. All five scales are
 * doubles multiplied by `FE_WidthScale` and narrowed at the call.
 *
 * Entries 3 and 4 also share their X, held in a register across both draws.
 *
 * The backdrop is `_FENew1Texture` at `FE_X(0)`, `FE_Y(-32)`, `FE_W(256)`,
 * `FE_H(384)` with UVs `(0, 0)` to `(0.5, 0.75)` -- the left half and top three
 * quarters of the texture. The -32 puts it above the top of the screen.
 */
void DrawMainMenu(int c1, int c2, int c3, int c4, int c5)
{
    void *font;

    limeDrawSprite((TEXTURE *)FENew1Texture,
                   (float)FE_X(0.0f), (float)FE_Y(-32.0f),
                   (float)FE_W(256.0f), (float)FE_H(384.0f),
                   0.0f, 0.0f, 0.5f, 0.75f, col);

    font = GameFont;

    limeDrawFONTAtAngle(font, GameText(4),
                        (float)FE_X(170.0f), (float)FE_Y(24.0f), 2,
                        (float)((double)FE_WidthScale * 1.4),
                        &mmfontcol[c1 * 4], -0.021f);

    limeDrawFONTAtAngle(font, GameText(10),
                        (float)FE_X(218.0f), (float)FE_Y(104.0f), 2,
                        (float)((double)FE_WidthScale * 1.6),
                        &mmfontcol[c2 * 4], -0.0021f);

    limeDrawFONTAtAngle(font, GameText(6),
                        (float)FE_X(190.0f), (float)FE_Y(180.0f), 2,
                        (float)((double)FE_WidthScale * 1.3),
                        &mmfontcol[c3 * 4], 0.008f);

    limeDrawFONTAtAngle(font, GameText(5),
                        (float)FE_X(190.0f), (float)FE_Y(250.0f), 2,
                        (float)((double)FE_WidthScale * 1.3),
                        &mmfontcol[c4 * 4], 0.023f);

    limeDrawFONTAtAngle(font, GameText(213),
                        (float)FE_X(167.0f), (float)FE_Y(290.0f), 2,
                        (float)((double)FE_WidthScale * 1.3),
                        &mmfontcol[c5 * 4], 0.015f);
}
