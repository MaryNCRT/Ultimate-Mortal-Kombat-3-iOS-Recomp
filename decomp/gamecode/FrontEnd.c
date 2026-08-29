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

long BasicMenuWithWidth(const long *items, int width);
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
    return (int)BasicMenuWithWidth((const long *)menu, 0x120);
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
/* The BUTTONNEW layout is established at DrawButtonNew's definition below. */
typedef struct BUTTONNEW BUTTONNEW;

extern BUTTONNEW BUTTON_1X3_1;          /* 0x001004d8 */
extern BUTTONNEW BUTTON_1X3_2;          /* 0x001004ec */
extern BUTTONNEW BUTTON_1X3_3;          /* 0x00100500 */
long DrawButtonNew(BUTTONNEW *b, int x, int y, int interactive);


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

    if (DrawButtonNew(&BUTTON_1X3_1, 0xed, 0x5a, 1))
        r = (FE_FadeAdd == 0.0f) ? 1 : 0;   /* the ite, not an if */

    if (DrawButtonNew(&BUTTON_1X3_2, 0xed, 0xa0, 1))
        if (FE_FadeAdd == 0.0f)
            r = 2;

    if (DrawButtonNew(&BUTTON_1X3_3, 0xed, 0xe6, 1))
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
extern BUTTONNEW BUTTON_1X2_1D;
extern BUTTONNEW BUTTON_1X2_2D;


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

    if (DrawButtonNew(&BUTTON_1X2_1D, cx, y + 0x3c, 1) && FE_FadeAdd == 0.0f)
        r = 1;

    if (DrawButtonNew(&BUTTON_1X2_2D, cx, y + 0xa0, 1) && FE_FadeAdd == 0.0f)
        r = 2;

    return r;
}


extern BUTTONNEW BUTTON_BOXLT;          /* 0x00100488 */
extern BUTTONNEW BUTTON_BOXLB;          /* 0x001004b0 */
extern BUTTONNEW BUTTON_BOXRB;          /* 0x001004c4 */

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
 *      DrawButtonNew(&BUTTON_BOXRB, ...)
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

    if (DrawButtonNew(&BUTTON_BOXLT, 0x9c, 0x59, 1) && FE_FadeAdd == 0.0f)
        r = 1;

    if (!limeCheckForUserMusic()) {
        if (DrawButtonNew(&BUTTON_BOXLB, 0x9c, 0xe0, 1) && FE_FadeAdd == 0.0f)
            r = 3;
    }

    saved = Settings[3];
    Settings[3] = 0;                    /* drawn as though it were off */

    if (DrawButtonNew(&BUTTON_BOXRB, 0x145, 0xe0, 1) && FE_FadeAdd == 0.0f)
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
/* All four of x, y and scale arrive as FLOATS -- `vmov s20, r2` and
 * `vmov s16, r3` in the prologue, no `vcvt` anywhere. The parameters were
 * named and typed `int x, float scale, int centre` here, which had the y
 * position under the name `scale` and the scale under the name `centre`.
 * Corrected against the call sites in UpdateInGamePauseMenu, which pass
 * 384.0f, 48.0f and 1.25f. */
long DrawOptionAsText(const char *text, float x, float y, float scale,
                      const float *colour, float maxWidth)
{
    long lines = 0;
    long i;
    long lineOffset;                    /* an int, in s18 */
    float widest = 0.0f;                /* s22 -- computed and never read */

    CreateWrappedTextArrays(text, ButtonSplitText2, &lines, (long)maxWidth,
                            GameFont, scale * FE_WidthScale);

    if (lines <= 0)
        return 0;

    lineOffset = 0;
    for (i = 0; i < lines; i++) {
        char *line = &ButtonSplitText2[i * SPLITTEXT_STRIDE];
        float py = y - (float)(lines * 10 - 10) + (float)lineOffset;
        float w;

        limeDrawFONT(GameFont, limeUC(line),
                     FE_X(x), FE_Y(py),
                     1, scale * FE_WidthScale, colour);

        w = (float)limeGetStringWidth(GameFont, limeUC(line))
            * FE_WidthScale * scale;

        if (w > widest)                 /* recomputed inside the branch */
            widest = (float)limeGetStringWidth(GameFont, limeUC(line))
                     * FE_WidthScale * scale;

        lineOffset += 0x14;             /* 20, added as an integer */
    }

    return 0;
}


extern float *limeTouchScreenX;         /* pointer slot -> 0x00171af4 */
extern float *limeTouchScreenY;         /* pointer slot */
extern float *limeLastTouchScreenX;     /* pointer slot */
extern float *limeLastTouchScreenY;     /* pointer slot */
extern long  SFXHandle[];               /* 0x001ab99c -- an ARRAY of sound handles.
                                         * Every site reaches it as `ldr r3,[slot]`
                                         * then `ldr r0,[r3,#0x68]`: the slot holds
                                         * the ADDRESS of the array, so declaring it
                                         * `long *` dereferenced once too many. */
extern float MusicVol[];                /* 0x000ff830 -- an ARRAY, same correction:
                                         * `add r1,pc` puts the array address in r1
                                         * and the volume is `[r1 + idx*4]`. */

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
 * `DrawButtonNew(&BUTTON_1X3_3, 0xed, 0xe6, 1)` gates on the usual
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

    pressed = DrawButtonNew(&BUTTON_1X3_3, 0xed, 0xe6, 1)
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
void SetToUseCamera(const float *eye);
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

    SetToUseCamera(FECamPos);
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


extern float *darkcol;                  /* pointer slot */

long limeGetStringWidth(void *font, const char *text);


/* -------------------------------------------------------------- BasicMenuMod
 *
 * armv7 0x00004ad0, 616 bytes.  **Complete.**
 *
 * A vertical list menu. `items` is a `-1`-terminated array of `GameText` ids
 * and `disabled` is a parallel array of flags. Returns the index of the item
 * released on, or 0.
 *
 * The list is centred: entries are 32 units apart and the block starts at
 *
 *      y = limeScreenHeight / 2  -  (count * 16) * FE_HeightScale
 *
 * so `count * 16` is half of `count * 32` -- the block straddles the midpoint
 * rather than starting at it, the same construction `DrawOptionAsText` uses.
 *
 * **The walk starts at index 1, not 0.** `items[0]` is only tested for the -1
 * terminator; its text is never drawn. So the caller's first slot is a header
 * or a count, and a one-entry array draws nothing.
 *
 * ### The hit band is the text's own width
 *
 *      horizontally   centre - w/2  ..  centre + w/2
 *      vertically     y + (off - 6) * scale  ..  y + (off + 22) * scale
 *
 * where `w` is what `limeGetStringWidth` returned for that entry. So a short
 * label has a small target and a long one a large one -- the touch area is not
 * a fixed row. The vertical band is 28 units against a 32-unit pitch, leaving a
 * 4-unit dead gap between neighbours, and it starts 6 units **above** the draw
 * position.
 *
 * Only a release counts: the test requires `limeLastTouchScreenX[0] == -1`.
 *
 * ### Disabled entries are drawn grey and are still selectable
 *
 * `disabled[i] != 0` sends the draw down a separate path that uses `_darkcol`
 * instead of `_fontcol` -- and that path then **rejoins the common tail, which
 * includes the hit test**. There is no second check. So a greyed-out item
 * returns its own index when released on, exactly like an enabled one.
 *
 * Transcribed as written. Whether callers guard against it elsewhere is not
 * established here; what is established is that this function does not.
 *
 * `GameText` is called **twice per entry** -- once to measure and once to draw
 * -- with the first result discarded after `limeGetStringWidth`. The same
 * redundancy `DrawOptionAsText` has three of.
 */
long BasicMenuMod(const long *items, const long *disabled)
{
    long count, i, off;
    long selected = 0;
    float y;

    if (items[0] == -1)
        return 0;

    for (count = 1; items[count] != -1; count++)
        ;

    y = (float)(*limeScreenHeight / 2)
        - (float)(count * 16) * FE_HeightScale;

    if (count <= 0)
        return 0;

    for (i = 1, off = 0x20; i < count; i++, off += 0x20) {
        const char *text = GameText(items[i]);
        long w = limeGetStringWidth(GameFont, text);
        const float *colour = (disabled[i] != 0) ? darkcol : fontcol;
        float cx, tx, ty;

        limeDrawFONT(GameFont, GameText(items[i]),
                     (float)(*limeScreenWidth / 2),
                     y + (float)off * FE_HeightScale,
                     1, FE_WidthScale, colour);

        /* the hit test runs for disabled entries too -- see above */
        if (limeLastTouchScreenX[0] != -1.0f)
            continue;

        cx = (float)(*limeScreenWidth / 2);
        tx = limeTouchScreenX[0];

        if (tx < cx + (float)w * -0.5f)
            continue;
        if (tx > cx + (float)w * 0.5f)
            continue;

        ty = limeTouchScreenY[0];

        if (ty < (float)(off - 6) * FE_HeightScale + y)
            continue;
        if (ty > (float)(off + 0x16) * FE_HeightScale + y)
            continue;

        selected = i;
    }

    return selected;
}


/* `BUTTONNEW`, as far as DrawButtonNew reaches. Declared here rather than
 * guessed at beyond these five fields. */
struct BUTTONNEW {
    long  style;                        /* 0x00, 0..8; anything else is a
                                         *       full-texture fallback */
    long  w;                            /* 0x04 */
    long  h;                            /* 0x08 */
    short thickness;                    /* 0x0c, for the red highlight */
    short pad;                          /* 0x0e */
    float pressed;                      /* 0x10, set to 1.0f on release */
};

extern void **FEBits1;                  /* pointer slot -> 0x001f40f4 */
extern void **FEBits2;                  /* pointer slot -> 0x001f40f8 */

void DrawRedHighlight(int x, int y, int w, int h, int thick);


/* -------------------------------------------------------------- DrawButtonNew
 *
 * armv7 0x000057d8, 924 bytes.  **Complete.**  The button every front-end
 * screen in this tree goes through.
 *
 * The rectangle is **centred on the given point**: `x - w/2`, `y - h/2`, with
 * the halving done as the signed `(n + (n >>> 31)) >> 1` the compiler emits.
 *
 * ### Nine styles, one atlas, and one that changes texture
 *
 * A `tbb` on `style` picks the UV window:
 *
 *      style  u0          v0          u1          v1          texture
 *      0      0.5078125   0           0.2890625   0.234375    FEBits1
 *      1      0           0           0.40625     0.09375     FEBits1
 *      2      0.1015625   0           0.5234375   0.09375     FEBits1
 *      3      0.359375    0           0.640625    0.171875    **FEBits2**
 *      4      0.578125    0.65234375  0.296875    0.0625      FEBits1
 *      5      0.5078125   0.65234375  0.296875    0.0625      FEBits1
 *      6      0.6484375   0.65234375  0.0859375   0.0625      FEBits1
 *      7      0           0.4140625   0.1484375   0.0625      FEBits1
 *      8      0           0.5703125   0.22265625  0.0625      FEBits1
 *      >8     0           0           1.0         1.0         FEBits1
 *
 * **Style 3 is the only one that reads `_FEBits2`**, and it is the only style
 * whose art lives in the second atlas. Everything else shares the first.
 *
 * Every value is an exact binary fraction over 128 or 256, so they were typed
 * as pixel offsets into a power-of-two texture rather than tuned.
 *
 * ### The return is the caller's own flag, not a boolean
 *
 * With `interactive != 1` it draws and returns 0 without any hit testing. With
 * 1 it returns **the argument** on a release inside the rectangle -- which is
 * 1, but written as a copy of the parameter rather than a constant.
 *
 * A release also sets `b->pressed = 1.0f` and plays `SFXHandle[0x1a]` at
 * `MusicVol[Settings[3]] / 100`, gated on `Settings[3]`.
 *
 * ### The highlight is drawn from the HELD test, which runs either way
 *
 * After the release check -- whether it matched or not -- a second test asks
 * whether a finger is down inside the rectangle **and `FE_FadeAdd <= 0`**, and
 * if so calls `DrawRedHighlight` with the button's own `thickness`. So the red
 * frame is the pressed-state feedback, it is drawn by the button rather than by
 * the screen, and it is suppressed during a fade like every other front-end
 * interaction in this tree.
 *
 * The two tests use different globals: the release path reads
 * `limeLastTouchScreen*` and the held path reads `limeTouchScreen*`.
 */
long DrawButtonNew(BUTTONNEW *b, int x, int y, int interactive)
{
    void *tex = *FEBits1;
    float u0 = 0.0f, v0 = 0.0f, u1 = 1.0f, v1 = 1.0f;
    float px, py, pw, ph;
    long r = 0;

    switch (b->style) {
    case 0: u0 = 0.5078125f; u1 = 0.2890625f;  v1 = 0.234375f;  break;
    case 1:                  u1 = 0.40625f;    v1 = 0.09375f;   break;
    case 2: u0 = 0.1015625f; u1 = 0.5234375f;  v1 = 0.09375f;   break;
    case 3: u0 = 0.359375f;  u1 = 0.640625f;   v1 = 0.171875f;
            tex = *FEBits2;                                     break;
    case 4: u0 = 0.578125f;  v0 = 0.65234375f; u1 = 0.296875f;
            v1 = 0.0625f;                                       break;
    case 5: u0 = 0.5078125f; v0 = 0.65234375f; u1 = 0.296875f;
            v1 = 0.0625f;                                       break;
    case 6: u0 = 0.6484375f; v0 = 0.65234375f; u1 = 0.0859375f;
            v1 = 0.0625f;                                       break;
    case 7:                  v0 = 0.4140625f;  u1 = 0.1484375f;
            v1 = 0.0625f;                                       break;
    case 8:                  v0 = 0.5703125f;  u1 = 0.22265625f;
            v1 = 0.0625f;                                       break;
    default:                                                    break;
    }

    px = (float)FE_X((float)(x - ((b->w + ((unsigned long)b->w >> 31)) >> 1)));
    py = (float)FE_Y((float)(y - ((b->h + ((unsigned long)b->h >> 31)) >> 1)));
    pw = (float)FE_W((float)b->w);
    ph = (float)FE_H((float)b->h);

    limeDrawSprite((TEXTURE *)tex, px, py, pw, ph, u0, v0, u1, v1, fontcol);

    if (interactive != 1)
        return 0;

    /* released inside? */
    if (limeTouchScreenX[0] == -1.0f) {
        float lx = limeLastTouchScreenX[0];
        float ly;

        if (px < lx && lx < px + pw
            && py < (ly = limeLastTouchScreenY[0]) && ly < py + ph) {
            b->pressed = 1.0f;
            if (Settings[3] != 0)
                limePlaySound(SFXHandle[0x68 / 4],
                              MusicVol[Settings[3]] / 100.0f, 1.0f, 0);
            r = interactive;            /* the argument, not a literal 1 */
        }
    }

    /* held inside? -- runs either way, and only draws */
    if (limeTouchScreenX[0] > px && limeTouchScreenX[0] < px + pw
        && limeTouchScreenY[0] > py && limeTouchScreenY[0] < py + ph
        && FE_FadeAdd <= 0.0f) {
        DrawRedHighlight(x - (int)((b->w + ((unsigned long)b->w >> 31)) >> 1),
                         y - (int)((b->h + ((unsigned long)b->h >> 31)) >> 1),
                         (int)b->w, (int)b->h, b->thickness);
    }

    return r;
}


/* The three live arrays are declared above as char[0x78]; these are their
 * snapshots, restored on cancel. */
extern char CancelCustomButtonsPos4[0x78];
extern char CancelCustomButtonsPos5[0x78];
extern char CancelCustomButtonsPos6[0x78];
extern long *P2Controls;                /* pointer slot */
/* A direct global, not a pointer slot: the pcrel add lands on 0x00100f84 and
 * the store is `str r?, [r3]`, one deref. It was declared `long *` and written
 * through as `*ButtonEditModePtr`, which is one deref too many. Corrected while
 * writing FE_Task_Button_Config, which reads the same flag. */
extern long ButtonEditMode;             /* 0x00100f84 */
extern BUTTONNEW BUTTON_SAVE;           /* 0x00100848 */
extern BUTTONNEW BUTTON_CANCEL;         /* 0x0010085c */

void EditButtons(void);
void DrawControls(void);
void Write_PresetButtonData(void);
void Write_SettingsData(void);
void PopFETaskDeferred(void);


/* ------------------------------------------------------- FE_Task_Button_Edit
 *
 * armv7 0x0001529c, 504 bytes.  **Complete.**
 *
 * The button-layout editor screen: backdrop, `EditButtons()` for the dragging,
 * `DrawControls()` for the preview, and a Save and a Cancel button.
 *
 *      DrawButtonNew(&BUTTON_SAVE,   0x26,  0x10, 1)   label GameText(0x57)
 *      DrawButtonNew(&BUTTON_CANCEL, 0x1ba, 0x10, 1)   label GameText(0x58)
 *
 * The Save label is left-aligned at `FE_X(16)` and the Cancel label
 * right-aligned (align 2) at `FE_X(472)`, both at `FE_Y(8)`.
 *
 * **`*P2Controls` is cleared on every frame of this screen**, before
 * `DrawControls`, so the preview always shows the player-one layout no matter
 * which player's controls are being edited.
 *
 * ### Cancel restores from a snapshot, in three parallel arrays
 *
 *      for (row = 0; row != 0x78; row += 0x14)
 *          for (k = 0; k < 0x14; k += 4) {
 *              CustomButtonsPos4[row+k] = CancelCustomButtonsPos4[row+k];
 *              CustomButtonsPos5[row+k] = CancelCustomButtonsPos5[row+k];
 *              CustomButtonsPos6[row+k] = CancelCustomButtonsPos6[row+k];
 *          }
 *
 * 0x78 bytes in rows of 0x14 is **six rows of five words**, and there are three
 * such arrays -- one per control scheme, the 4, 5 and 6 in the names being the
 * button counts `GetReal6ButtonJoyBits` dispatches on. So cancelling restores
 * all three layouts, not just the one being edited, from a snapshot something
 * else takes on the way in.
 *
 * `_ButtonEditMode` is zeroed on the cancel path only.
 *
 * Save writes both `Write_PresetButtonData()` and `Write_SettingsData()`. Both
 * paths then `PopFETaskDeferred()`, and **the two are not exclusive** -- the
 * cancel test runs first and pops, then the save test runs and can pop again.
 * A frame in which both buttons report a release pops the task twice.
 */
void FE_Task_Button_Edit(void)
{
    long save, cancel;
    long row, k;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    EditButtons();
    *P2Controls = 0;                    /* always the player-one preview */
    DrawControls();

    save = DrawButtonNew(&BUTTON_SAVE, 0x26, 0x10, 1);
    limeDrawFONT(GameFont, GameText(0x57),
                 (float)FE_X(16.0f), (float)FE_Y(8.0f),
                 0, FE_WidthScale, fontcol);

    cancel = DrawButtonNew(&BUTTON_CANCEL, 0x1ba, 0x10, 1);
    limeDrawFONT(GameFont, GameText(0x58),
                 (float)FE_X(472.0f), (float)FE_Y(8.0f),
                 2, FE_WidthScale, fontcol);

    if (cancel) {
        ButtonEditMode = 0;

        for (row = 0; row != 0x78; row += 0x14) {
            for (k = 0; k < 0x14; k += 4) {
                *(long *)&CustomButtonsPos4[row + k] =
                    *(const long *)&CancelCustomButtonsPos4[row + k];
                *(long *)&CustomButtonsPos5[row + k] =
                    *(const long *)&CancelCustomButtonsPos5[row + k];
                *(long *)&CustomButtonsPos6[row + k] =
                    *(const long *)&CancelCustomButtonsPos6[row + k];
            }
        }
        PopFETaskDeferred();
    }

    if (save) {                         /* not an else -- see above */
        Write_PresetButtonData();
        Write_SettingsData();
        PopFETaskDeferred();
    }
}


extern char ButtonSplitText[];          /* 0x00184730, 256 bytes a line */


/* ------------------------------------------------------- DrawOptionAsButton
 *
 * armv7 0x0000deb0, 620 bytes.  **Complete.**
 *
 * `DrawOptionAsText`'s sibling: wraps the text the same way, draws it the same
 * way, and then **hit-tests it**. Returns 1 while a finger is inside, 0
 * otherwise.
 *
 * The wrap goes into `_ButtonSplitText` (0x00184730) where the other uses
 * `_ButtonSplitText2` -- two 256-byte-per-line buffers so the two can be live
 * at once.
 *
 * The layout is identical to `DrawOptionAsText`: lines 20 apart, the block
 * centred by subtracting `lines * 10 - 10`, and the same integer line offset
 * carried in a float register.
 *
 * ### The hit box is the widest LINE, not the block
 *
 *      left   = FE_X(x - 8) + widest * -0.5
 *      right  = FE_X(x + 8) + widest *  0.5
 *      top    = FE_Y(y - 10 - (lines * 10 - 10))
 *      bottom = FE_Y(y) + FE_H(30) + FE_H(lines * 10 - 10)
 *
 * `widest` is the longest scaled line width measured during the draw, so a
 * one-word option has a narrow target and a wrapped one a wide one. The 8 is
 * added to x on **both** sides before the half-width, which widens the box by
 * 16 either way -- not a centring correction, a margin.
 *
 * Note the vertical bounds are not symmetric: the top subtracts the half-block
 * from `y` and the bottom **adds** the full block plus a fixed `FE_H(30)`, so
 * the box hangs further below the text than above it.
 *
 * ### It only responds at the two ends of a fade
 *
 *      FE_Fade == 1.0f  ->  test
 *      FE_Fade == 0.0f  ->  test
 *      anything else    ->  return 0
 *
 * That is `_FE_Fade`, the fade LEVEL, not `_FE_FadeAdd`, the per-frame step
 * everything else in the front end gates on. So this button is live both when
 * the screen is fully up and when it is fully dark, and dead only mid-fade --
 * a different rule from `drawPage2x1Wide` and friends, which require the step
 * to be exactly zero.
 *
 * ### It measures the same line three times
 *
 * Per line: `limeUC` + `limeGetStringWidth` to compare against the running
 * maximum, and then **both again inside the branch** to store the value it just
 * computed. Plus the `limeUC` for the draw itself. Three `limeUC` calls a line,
 * the same shape `DrawOptionAsText` has -- and the same six-line ceiling on the
 * sixteen-buffer ring.
 *
 * Unlike `DrawOptionAsText`, the maximum here is actually used.
 */
/* x, y and scale are FLOATS, for the same reason as DrawOptionAsText above:
 * `vmov s20, r1`, `vmov s22, r2`, `vmov s16, r3`, no conversion. */
long DrawOptionAsButton(const char *text, float x, float y, float scale,
                        const float *colour, float maxWidth)
{
    long lines = 0;
    long i, lineOffset;
    float widest = 0.0f;
    float tx, ty, edge;

    CreateWrappedTextArrays(text, ButtonSplitText, &lines, (long)maxWidth,
                            GameFont, scale * FE_WidthScale);

    if (lines > 0) {
        lineOffset = 0;
        for (i = 0; i < lines; i++, lineOffset += 0x14) {
            char *line = &ButtonSplitText[i * 256];
            float py = y - (float)(lines * 10 - 10) + (float)lineOffset;
            float w;

            limeDrawFONT(GameFont, limeUC(line),
                         FE_X(x), FE_Y(py),
                         1, scale * FE_WidthScale, colour);

            w = (float)limeGetStringWidth(GameFont, limeUC(line))
                * FE_WidthScale * scale;

            if (w > widest)             /* recomputed, as in DrawOptionAsText */
                widest = (float)limeGetStringWidth(GameFont, limeUC(line))
                         * FE_WidthScale * scale;
        }
    }

    if (FE_Fade != 1.0f && FE_Fade != 0.0f)
        return 0;

    tx = limeTouchScreenX[0];

    edge = FE_X(x - 8.0f) + widest * -0.5f;
    if (tx < edge)
        return 0;

    edge = FE_X(x + 8.0f) + widest * 0.5f;
    if (tx > edge)
        return 0;

    ty = limeTouchScreenY[0];

    edge = FE_Y(y - 10.0f - (float)(lines * 10 - 10));
    if (ty < edge)
        return 0;

    edge = FE_Y(y) + FE_H(30.0f) + FE_H((float)(lines * 10 - 10));

    return (ty <= edge) ? 1 : 0;
}


char *limeUC(const char *s);
const char *UC(const char *s);
const char *GameTextNoHeader(long id);
long usprintf(char *dst, const char *fmt, ...);


/* ------------------------------------------------------- BasicMenuWithWidth
 *
 * armv7 0x0000e8d4, 740 bytes.  **Complete.**
 *
 * `BasicMenuMod` with a panel behind it and a heading, and a caller-supplied
 * width. Returns the index released on, or 0.
 *
 * ### The scale is derived from the screen, not taken from FE_WidthScale
 *
 *      scale = limeScreenWidth / 480.0f
 *
 * -- computed here rather than read from `_FE_WidthScale`, which every other
 * front-end function uses. The two agree on a 480-wide screen and are not
 * guaranteed to anywhere else, so a port must not substitute one for the other.
 *
 * Row pitch is `32 * scale` and the block is centred by starting at
 *
 *      base = (long)(limeScreenHeight / 2  -  scale * (count * 16))
 *
 * with `count * 16` being half of `count * 32` -- the same straddle
 * construction `BasicMenuMod` and `DrawOptionAsText` use.
 *
 * ### The panel
 *
 *      limeFillRect(limeScreenWidth / 2 - width / 2, base - 8,
 *                   width, count * 32 * scale,
 *                   0.0f, 0.0f, 0.0f, 0.7f)
 *
 * A flat black rectangle at 70%, drawn before anything else. The `-8` on Y is a
 * raw unscaled inset while the height is scaled -- the same mixed-units shape
 * recorded in issue #22, here inside one call.
 *
 * ### Index 0 IS drawn, as a heading
 *
 *      usprintf(buf, UC("--- %s ---"), GameTextNoHeader(items[0]))
 *      limeDrawFONT(GameFont, limeUC(buf), centre, y, 1, scale, fontcol)
 *
 * `BasicMenuMod` skips index 0 entirely; this one decorates it and prints it.
 * Same array convention, two different readings of the first slot -- so a menu
 * array is not portable between the two functions without knowing which draws
 * the header.
 *
 * The heading uses `GameTextNoHeader`, the variant that does not expect a BOM,
 * because `usprintf` is about to add one through `limeUC`.
 *
 * ### The hit band
 *
 *      horizontally   centre - w/2 .. centre + w/2, w the line's own width
 *      vertically     y - 6 (unscaled) .. y + 22 * scale
 *
 * Asymmetric: the top margin is a raw 6 and the bottom is a scaled 22. Only a
 * release counts (`limeLastTouchScreenX[0] == -1`), and **the heading row is
 * not hit-tested** -- index 0 takes the drawing branch and skips straight to
 * the increment.
 */
long BasicMenuWithWidth(const long *items, int width)
{
    char buf[0x100];
    float scale = (float)*limeScreenWidth / 480.0f;
    float pitch, base, blockH;
    long count = 0;
    long selected = 0;
    long i;

    if (items[0] != -1)
        for (count = 1; items[count] != -1; count++)
            ;

    pitch  = scale * 32.0f;
    blockH = pitch * (float)count;
    base   = (float)(long)((float)(*limeScreenHeight / 2)
                           - scale * (float)(count * 16));

    limeFillRect((float)(*limeScreenWidth / 2) + (float)width * -0.5f,
                 base - 8.0f, (float)width, blockH,
                 0.0f, 0.0f, 0.0f, 0.7f);

    if (count <= 0)
        return 0;

    for (i = 0; i < count; i++) {
        float y = base + (float)i * pitch;
        float cx = (float)(*limeScreenWidth / 2);
        float tx, ty, w;

        if (i == 0) {                   /* the heading, never hit-tested */
            usprintf(buf, UC("--- %s ---"), GameTextNoHeader(items[0]));
            limeDrawFONT(GameFont, limeUC(buf), cx, y, 1, scale, fontcol);
            continue;
        }

        w = (float)limeGetStringWidth(GameFont, GameText(items[i]));
        limeDrawFONT(GameFont, GameText(items[i]), cx, y, 1, scale, fontcol);

        if (limeLastTouchScreenX[0] != -1.0f)
            continue;

        tx = limeTouchScreenX[0];
        if (tx < cx + w * scale * -0.5f)
            continue;
        if (tx > cx + w * scale * 0.5f)
            continue;

        ty = limeTouchScreenY[0];
        if (ty < y - 6.0f)              /* raw 6 above */
            continue;
        if (ty > y + 22.0f * scale)     /* scaled 22 below */
            continue;

        selected = i;
    }

    return selected;
}


extern long  tickerLoaded;              /* 0x001008a8 */
extern long  displayTicker;             /* 0x001008a0 */
extern long  hideTicker;                /* 0x001008a4 */
extern float tickeroff;                 /* 0x000ff8d4 */

void *EASDK_GetLoadedTicker(long i);
const char *EASDK_GetTickerMsg(void);
const char *EASDK_GetTickerUrl(void *t);
long  EASDK_GetTickerId(void *t);
void  EASDK_LogEventEnumEnum(long id, long a, long b, long c);
void  limeLoadURLInternal(const char *url);


/* ----------------------------------------------------------------- DrawTicker
 *
 * armv7 0x0001892c, 744 bytes.  **Complete.**
 *
 * EA's scrolling news bar across the top of the front end. Does nothing unless
 * `_tickerLoaded` is set.
 *
 *      limeFillRect(0, (displayTicker - 24) * FE_HeightScale,
 *                   limeScreenWidth, 24 * FE_HeightScale,
 *                   0, 0, 0, 0.6f)
 *
 * -- a black bar at 60%, 24 units tall, whose Y is driven entirely by
 * `_displayTicker`.
 *
 * ### The slide is a counter from 0 to 23
 *
 *      hideTicker  ->  if (displayTicker > 0)    displayTicker--
 *      otherwise   ->  if (displayTicker <= 23)  displayTicker++
 *
 * At 0 the bar sits at `-24 * scale`, entirely above the screen; at 23 it is
 * one unit short of flush. **It never reaches 24**, so the bar always hangs a
 * scaled unit above its resting place -- the `<=` on a 23 bound rather than a
 * `<` on 24.
 *
 * ### The scroll is two pixels a frame, unscaled
 *
 *      tickeroff -= 2.0f
 *      if (tickeroff < -(totalWidth + limeScreenWidth + 64 * FE_WidthScale))
 *          tickeroff = 0
 *
 * **Not divided by `limeFPSScaleFactor`**, unlike `MaintainFESlide` and
 * `Task_MultiplayerSync`. So this is the third frame-rate-dependent counter in
 * the tree, alongside `AnimateBG`'s background frame: a 60 fps port scrolls the
 * news twice as fast unless it is changed on purpose.
 *
 * The wrap point accounts for the full run of messages **plus a whole screen
 * width**, so the last message is completely off the left edge before the first
 * one reappears -- there is no visible seam and no second copy drawn.
 *
 * ### Messages are laid end to end with a 64-unit gap
 *
 * Each message is drawn at `limeScreenWidth + tickeroff + x`, where `x`
 * accumulates `messageWidth + 64 * FE_WidthScale`. The messages come from
 * `EASDK_GetLoadedTicker(i)` until it returns NULL, so the count is whatever
 * the server sent.
 *
 * ### A message with a URL is tappable, and opens it in-app
 *
 *      if (url[0] != 0 && released && inside the message's own box) {
 *          limeLoadURLInternal(url);
 *          printf(..., url);
 *          EASDK_LogEventEnumEnum(0x753c, 16, EASDK_GetTickerId(t), 0);
 *      }
 *
 * The hit box is the message's measured width at its current scrolled
 * position -- so the target moves with the text -- and vertically anything
 * between 0 and `displayTicker * FE_HeightScale`. `0x753c` is 30012.
 *
 * `limeUC` is called twice per message, once to draw and once to measure.
 */
void DrawTicker(void)
{
    long i = 0;
    float x = 0.0f;
    void *t;

    if (tickerLoaded == 0)
        return;

    limeFillRect(0.0f, (float)(displayTicker - 0x18) * FE_HeightScale,
                 (float)*limeScreenWidth, 24.0f * FE_HeightScale,
                 0.0f, 0.0f, 0.0f, 0.6f);

    for (t = EASDK_GetLoadedTicker(i); t != 0;
         t = EASDK_GetLoadedTicker(i)) {
        const char *msg = EASDK_GetTickerMsg();
        const char *url;
        float left = (float)*limeScreenWidth + tickeroff + x;
        float w;

        limeDrawFONT(GameFont, limeUC(msg), left,
                     (float)(displayTicker - 0x15) * FE_HeightScale,
                     0, FE_WidthScale, fontcol);

        w = (float)limeGetStringWidth(GameFont, limeUC(msg)) * FE_WidthScale;

        url = EASDK_GetTickerUrl(t);

        if (url[0] != 0 && limeLastTouchScreenX[0] == -1.0f) {
            float tx = limeTouchScreenX[0];
            float ty = limeTouchScreenY[0];

            if (tx > left && tx < left + w
                && ty < (float)displayTicker * FE_HeightScale
                && ty > 0.0f) {
                limeLoadURLInternal(url);
                printf("%s", url);
                EASDK_LogEventEnumEnum(0x753c, 16, EASDK_GetTickerId(t), 0);
            }
        }

        i++;
        x += w + 64.0f * FE_WidthScale;
    }

    tickeroff -= 2.0f;                  /* not frame-rate scaled */
    if (tickeroff < -(x + (float)*limeScreenWidth + 64.0f * FE_WidthScale))
        tickeroff = 0.0f;

    if (hideTicker != 0) {
        if (displayTicker > 0)
            displayTicker--;
    } else {
        if (displayTicker <= 0x17)      /* never reaches 24 */
            displayTicker++;
    }
}


extern long leaderboardsConnectionAVailable;    /* 0x00100f94 */
extern long leaderboardsInit;                   /* 0x00100f98 */
extern long leaderboardsInitSK;                 /* 0x00100f9c */
extern long currentLeaderBoardPage;             /* 0x000ff8e8 */
extern BUTTONNEW BUTTON_BACK;                   /* 0x001007bc */

long EASDK_ConnectedToNetwork(void);
void EASOC_MayhemReset(void);
void limeModalNoInternet(void);
void PushFETaskDeferred(int task);


/* --------------------------------------------------- FE_Task_Select_Leaderboard
 *
 * armv7 0x00013e6c, 596 bytes.  **Complete.**
 *
 * Picks which leaderboard to open. Backdrop, two wide buttons through
 * `drawPage2x1Wide(0, 0x1e)`, four labels, and a Back button.
 *
 *      GameText(0x35f)  at (240,  74)      GameText(0x361) at (240, 174)
 *      GameText(0x360)  at (240,  90)      GameText(0x362) at (240, 190)
 *      GameText(7)      at (423, 296)      the Back label
 *
 * Two labels per button, sixteen apart -- a title and a subtitle each.
 *
 * ### The network check happens on the press, not on entry
 *
 *      button 1 -> if (EASDK_ConnectedToNetwork()) PushFETaskDeferred(0x0d)
 *                  else limeModalNoInternet()
 *      button 2 -> if (EASDK_ConnectedToNetwork()) PushFETaskDeferred(0x32)
 *                  else limeModalNoInternet()
 *
 * So the buttons are always drawn live and the "no internet" dialog only
 * appears after a tap. Both branches then reset the same three globals --
 * `leaderboardsInitSK`, `leaderboardsInit` and `currentLeaderBoardPage` to
 * zero -- **but only on the connected path**. A failed tap leaves them as they
 * were.
 *
 * ### And then it clobbers the availability flag anyway
 *
 * After the button handling, every path falls through to
 *
 *      leaderboardsConnectionAVailable = -1;
 *
 * unconditionally -- whether a button was pressed, whether the network was
 * there, or whether nothing happened at all. So that global is reset once per
 * frame from here and cannot carry state across frames while this screen is up.
 *
 * Back calls `EASOC_MayhemReset()` before `PopFETaskDeferred()`, so leaving
 * this screen tears down the social session rather than just popping the task.
 */
void FE_Task_Select_Leaderboard(void)
{
    long choice, back;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    choice = drawPage2x1Wide(0, 0x1e);

    limeDrawFONT(GameFont, GameText(0x35f), (float)FE_X(240.0f),
                 (float)FE_Y(74.0f),  1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x360), (float)FE_X(240.0f),
                 (float)FE_Y(90.0f),  1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x361), (float)FE_X(240.0f),
                 (float)FE_Y(174.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x362), (float)FE_X(240.0f),
                 (float)FE_Y(190.0f), 1, FE_WidthScale, fontcol);

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(7), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (choice == 1) {
        if (EASDK_ConnectedToNetwork()) {
            PushFETaskDeferred(0x0d);
            leaderboardsInitSK      = 0;
            leaderboardsInit        = 0;
            currentLeaderBoardPage  = 0;
        } else {
            limeModalNoInternet();
        }
    } else if (choice == 2) {
        if (EASDK_ConnectedToNetwork()) {
            PushFETaskDeferred(0x32);
            leaderboardsInitSK      = 0;
            leaderboardsInit        = 0;
            currentLeaderBoardPage  = 0;
        } else {
            limeModalNoInternet();
        }
    }

    leaderboardsConnectionAVailable = -1;   /* every path, every frame */

    if (back) {
        EASOC_MayhemReset();
        PopFETaskDeferred();
    }
}


extern BUTTONNEW BUTTON_1X1_1D;         /* 0x0010053c */
extern char *strBuf;                    /* pointer slot -> _str, 0x001f3cac */


/* --------------------------------------------------- FE_Task_About_Usage_Sharing
 *
 * armv7 0x0000e11c, 640 bytes.  **Complete.**
 *
 * The opt-in screen for EA's usage tracking. One toggle button, a status line,
 * an explanation line, and Back.
 *
 * ### The status line is built with three different text calls
 *
 *      usprintf(str, UC("%s : %s"),
 *               GameTextNoHeader(0xd9),
 *               GameTextNoHeader(Settings[9] ? 0xe1 : 0xe2))
 *      limeDrawFONT(GameFont, limeUC(str), FE_X(240), FE_Y(64), ...)
 *
 * `GameTextNoHeader` for both halves because `usprintf` is about to prefix the
 * BOM through `limeUC`, and `UC` for the format string itself. Four of the
 * UTF-16 functions in one statement.
 *
 * **The `on` and `off` strings are 0xe1 and 0xe2**, and the label is 0xd9.
 *
 * ### `Settings[9]` is the toggle, and it is read three separate times
 *
 *      once to choose 0xe1 vs 0xe2 for the status line
 *      once to choose GameText(0xaf) vs GameText(0xb0) for the explanation
 *      and never written here
 *
 * So this screen only displays the setting; pressing the button pushes task
 * 0x19 and that is where the change happens. Nothing is written back from
 * here, which is why leaving via Back needs no save.
 *
 * ### The press is latched before the draw, not after
 *
 *      pressed = DrawButtonNew(&BUTTON_1X1_1D, 0xf0, 0xa0, 1)
 *      if (pressed) pressed = (FE_FadeAdd == 0.0f)
 *      ... draw everything ...
 *      if (pressed) PushFETaskDeferred(0x19)
 *
 * The button is drawn first and its result carried through the whole frame
 * before being acted on, so the screen always draws one more complete frame in
 * its old state after the tap.
 *
 * The Back button is the usual `BUTTON_BACK` at `(0x1a7, 0x130)` with
 * `GameText(7)` at `(423, 296)` -- identical placement to
 * `FE_Task_Select_Leaderboard`, so that pair is a shared front-end convention
 * rather than a per-screen choice.
 */
void FE_Task_About_Usage_Sharing(void)
{
    long pressed;
    long back;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    pressed = DrawButtonNew(&BUTTON_1X1_1D, 0xf0, 0xa0, 1);
    if (pressed)
        pressed = (FE_FadeAdd == 0.0f);

    usprintf(strBuf, UC("%s : %s"),
             GameTextNoHeader(0xd9),
             GameTextNoHeader(Settings[9] != 0 ? 0xe1 : 0xe2));

    limeDrawFONT(GameFont, limeUC(strBuf),
                 (float)FE_X(240.0f), (float)FE_Y(64.0f),
                 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont,
                 GameText(Settings[9] != 0 ? 0xaf : 0xb0),
                 240.0f * FE_WidthScale, (float)FE_Y(152.0f),
                 1, FE_WidthScale, fontcol);

    if (pressed == 1)
        PushFETaskDeferred(0x19);

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(7),
                 (float)FE_X(423.0f), (float)FE_Y(296.0f),
                 1, FE_WidthScale, fontcol);

    if (back)
        PopFETaskDeferred();
}


extern BUTTONNEW BUTTON_BOXRT;          /* 0x0010049c */
extern long *Player2NumButtonsP;        /* pointer slot -> 0x0010de68 */
extern long  currentAchievementPage;    /* 0x000ff96c */

void Reset_Stats(void);
void Write_Stats(void);
void Reset_SaveData(void);
void achievementsReset(void);
void ResetSettingsData(void);
void Reset_PresetButtonData(void);
void limeStopTune(void);
void limePlayTune(const char *file, long vol, long arg);


/* ------------------------------------------- FE_Task_ResetAllDataConfirmation
 *
 * armv7 0x00015cbc, 776 bytes.  **Complete.**
 *
 * "Are you sure?" for wiping every saved thing. Two box buttons -- `BOXLT` at
 * `(0x9c, 0xa0)` for yes and `BOXRT` at `(0x145, 0xa0)` for no -- with
 * `GameText(0xeb)` at 156 and `GameText(0xec)` at 325, both at y 152, plus the
 * prompt at `GameText(0x11b)`, y 52, and a heading at y 240.
 *
 * ### What "reset all" actually resets, in order
 *
 *      Reset_Stats()               Write_Stats()
 *      Reset_SaveData()
 *      achievementsReset()         Write_AchievementsData()
 *      ResetSettingsData()         Write_SettingsData()
 *      Reset_PresetButtonData()    Write_PresetButtonData()
 *
 * Four reset/write pairs -- **except `Reset_SaveData`, which is never followed
 * by a write here**. The save file is left holding the old data until something
 * else writes it. That asymmetry is the one thing in this function a port could
 * get wrong without noticing, because everything looks correct until the app is
 * killed before the next save.
 *
 * Then two fixups that are not part of any reset function:
 *
 *      *Player2NumButtons = 5;
 *      currentAchievementPage = 0;
 *
 * **`Player1NumButtons` is not touched.** So a factory reset leaves player one
 * on whatever button count they had and forces player two to five.
 *
 * ### The music is handled from both ends
 *
 *      Settings[2] != 0  ->  limeStopTune() before the reset
 *      Settings[2] == 0  ->  after the reset, limePlayTune("MainMenu.mp3",
 *                            (long)MusicVol[Settings[2]], ...)
 *
 * -- the branch is taken on the value **before** `ResetSettingsData` runs and
 * the tune is restarted with the value **after**, so a reset that changes
 * `Settings[2]` starts the menu music at the new volume without a stop.
 *
 * Both the confirm and the cancel paths end in `PopFETaskDeferred()`, and both
 * are gated on `FE_FadeAdd == 0` in the usual way.
 */
void FE_Task_ResetAllDataConfirmation(void)
{
    long yes, no;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    limeDrawFONT(GameFont, GameText(0x11c),
                 (float)FE_X(240.0f), (float)FE_Y(240.0f),
                 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont, GameText(0x11b),
                 (float)FE_X(240.0f), (float)FE_Y(52.0f),
                 1, FE_WidthScale, fontcol);

    yes = DrawButtonNew(&BUTTON_BOXLT, 0x9c,  0xa0, 1);
    no  = DrawButtonNew(&BUTTON_BOXRT, 0x145, 0xa0, 1);

    if (no && FE_FadeAdd == 0.0f) {
        limeDrawFONT(GameFont, GameText(0xeb), (float)FE_X(156.0f),
                     (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);
        limeDrawFONT(GameFont, GameText(0xec), (float)FE_X(325.0f),
                     (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);
        PopFETaskDeferred();
        return;
    }

    limeDrawFONT(GameFont, GameText(0xeb), (float)FE_X(156.0f),
                 (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0xec), (float)FE_X(325.0f),
                 (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);

    if (!yes)
        return;

    if (Settings[2] != 0)
        limeStopTune();

    Reset_Stats();
    Write_Stats();
    Reset_SaveData();               /* no Write_SaveData -- see above */
    achievementsReset();
    Write_AchievementsData();
    ResetSettingsData();
    Write_SettingsData();
    Reset_PresetButtonData();
    Write_PresetButtonData();

    *Player2NumButtonsP = 5;        /* player ONE is left alone */

    if (Settings[2] != 0)
        limePlayTune("MainMenu.mp3", (long)MusicVol[Settings[2]], 0);
    else
        currentAchievementPage = 0;

    PopFETaskDeferred();
}


/* --------------------------------------------------- FE_Task_Catagory_Select
 *
 * armv7 0x000075ec, 748 bytes.  **Complete.**  (The spelling is the binary's.)
 *
 * Training's category picker: three choices on a 1x3 page, and Back.
 *
 *      1 -> TrainingCatagory = 0
 *      2 -> TrainingCatagory = 1
 *      3 -> TrainingCatagory = 2
 *
 * and each of the three does the same two things afterwards: start the fade
 * out (`FE_FadeAdd = -0.033333335f`) and `FadeMusicOut = 1`. The labels are
 * `GameText(0xee)`, `0xef` and `0xf2` -- note the third is not `0xf0`, so the
 * three strings are not contiguous in the text table.
 *
 * ### The transition happens on a later frame, not on the click
 *
 *      if (FE_FadeAdd == 0.0f && FE_Fade == 0.0f) {
 *          Character2 = Character1;
 *          CurrentTask = 4;
 *          PopFETask(); PopAllFETasksDeferred(0);
 *          VSWait = 0;
 *          Write_SaveData();
 *      }
 *
 * Both conditions together mean "the fade has finished AND the screen is
 * black": `FE_FadeAdd` back to zero is the fade having stopped, `FE_Fade` at
 * zero is it having reached the end rather than having been cancelled. The
 * click only arms it; this block runs on whichever later frame satisfies both.
 *
 * **`Character2 = Character1`** -- training puts the player's character on
 * both sides. That is also why nothing here picks an opponent.
 *
 * The check runs on every frame including the ones where Back was pressed, so
 * `PopFETaskDeferred()` and this block can both happen in one frame.
 */
extern long TrainingCatagory;           /* 0x0017809c */
extern long FadeMusicOut;               /* 0x0010dee8 */

void Write_SaveData(void);

void FE_Task_Catagory_Select(void)
{
    long choice, back;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    choice = drawPage1x3Small();

    limeDrawFONT(GameFont, GameText(0xee), (float)FE_X(240.0f),
                 (float)FE_Y(82.0f),  1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0xef), (float)FE_X(240.0f),
                 (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0xf2), (float)FE_X(240.0f),
                 (float)FE_Y(222.0f), 1, FE_WidthScale, fontcol);

    if (choice == 1 || choice == 2 || choice == 3) {
        TrainingCatagory = choice - 1;
        FE_FadeAdd = -0.033333335f;
        FadeMusicOut = 1;
    }

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(7), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (back)
        PopFETaskDeferred();

    if (FE_FadeAdd == 0.0f && FE_Fade == 0.0f) {
        Character2 = Character1;
        CurrentTask = 4;
        PopFETask();
        PopAllFETasksDeferred(0);
        VSWait = 0;
        Write_SaveData();
    }
}


/* ------------------------------------------------------------- Task_FEDestroy
 *
 * armv7 0x0001b1fc, 848 bytes.  **Complete.**
 *
 * Tears the whole front end down on the way into a fight. Almost all of it is
 * a flat list of `limeDeleteTexture` calls, and the interesting parts are the
 * three places where the list is NOT flat.
 *
 * ### The array bounds confirm the character count independently
 *
 *      CharacterVSTexture   0x00183d80 .. 0x00183de8   0x68 = 26 pointers
 *      CharacterVSTexture2  0x00183de8 .. 0x00183e50   0x68 = 26 pointers
 *
 * and the loop walks indices 1..25 after doing 0 by hand. Twenty-six, the same
 * number `Players.c` measured from the gap between `FECharacters` and the next
 * symbol. Two unrelated pieces of the binary agreeing on 26 is what makes it a
 * fact rather than a reading.
 *
 *      FireLogo             0x00183e54   ten pointers
 *      TowerPortraitTexture 0x00183e88   twenty-eight pointers
 *      SpotlightTextures    0x00183f14   two pointers
 *
 * all measured the same way, from the loop bound and the next symbol.
 *
 * ### Four sound handles are never released
 *
 *      limeDeleteSound(SFXHandle[0])
 *      for (i = 4; i <= 25; i++) limeDeleteSound(SFXHandle[i])
 *
 * Indices **1, 2 and 3 are skipped**, and index 26 -- the "Gstart" handle
 * `Task_LoadGeneralData` loads at boot -- is past the end of the loop. Whether
 * those four are freed somewhere else is not established; nothing found so far
 * frees them. Four handles is not a lot, but this function runs on every entry
 * into a fight, so if they are genuinely leaked it is per fight, not once.
 *
 * ### The music is stopped only when it was on
 *
 *      if (Settings[2]) limeStopTune();
 *
 * `Settings[2]` is the music volume index, and 0 is muted. So a player who
 * turned music off -- or whose own music turned it off, via
 * `limeCheckForUserMusic` at boot -- skips the stop entirely.
 *
 * Ends by handing control on: `CurrentTask = 8`, `NextTask = 5`.
 */
extern void **ButtonsTPage;             /* pointer slot */
extern void **FEBits3;                  /* pointer slot */
extern void **SmokeTexture;             /* pointer slot */
extern void **FBIconTexture;            /* pointer slot */
extern void **FBLoginTexture;           /* pointer slot */
extern void **FBLogoutTexture;          /* pointer slot */
extern void **GreenFrameTexture;        /* pointer slot */
extern void **RedFrameTexture;          /* pointer slot */

extern void *CharacterVSTexture[26];    /* 0x00183d80 */
extern void *CharacterVSTexture2[26];   /* 0x00183de8 */
extern void *OrangeTexture;             /* 0x00183e50 */
extern void *FireLogo[10];              /* 0x00183e54 */
extern void *LightningTexture;          /* 0x00183e84 */
extern void *TowerPortraitTexture[28];  /* 0x00183e88 */
extern void *FloorTexture;              /* 0x00183ef8 */
extern void *BricksTexture;             /* 0x00183efc */
extern void *MainMenuBGTexture;         /* 0x00183f00 */
extern void *GameOverTopTexture;        /* 0x00183f04 */
extern void *GameOverBottomTexture;     /* 0x00183f08 */
extern void *MetalScreenTexture;        /* 0x00183f0c */
extern void *VSTexture;                 /* 0x00183f10 */
extern void *SpotlightTextures[2];      /* 0x00183f14 */
extern void *KodesTexture;              /* 0x00183f1c */
extern void *MainLogoTexture;           /* 0x00183f20 */
extern void *SelectBGTexture;           /* 0x00183f24 */
extern void *PortraitBorderTexture;     /* 0x00183f2c */

extern long *NextTask;                  /* pointer slot -> 0x0015058c */

void FreeFrontEndCharacters(void);
void limeDeleteSound(long handle);
void limeDeleteTexture(void *tex);

void Task_FEDestroy(void)
{
    int i;

    FadeMusicOut = 0;
    CharacterConfirmed = -1;
    CharacterSelected  = -1;

    if (Settings[2])
        limeStopTune();

    FreeFrontEndCharacters();

    /* Sounds. Note where this starts and where it stops. */
    limeDeleteSound(SFXHandle[0]);
    for (i = 4; i <= 25; i++)
        limeDeleteSound(SFXHandle[i]);

    limeDeleteTexture(CharacterVSTexture[0]);
    limeDeleteTexture(CharacterVSTexture2[0]);
    for (i = 1; i < 26; i++) {
        limeDeleteTexture(CharacterVSTexture[i]);
        limeDeleteTexture(CharacterVSTexture2[i]);
    }

    limeDeleteTexture(*ButtonsTPage);
    limeDeleteTexture(OrangeTexture);
    for (i = 0; i < 10; i++)
        limeDeleteTexture(FireLogo[i]);

    limeDeleteTexture(*FEBits1);
    limeDeleteTexture(*FEBits2);
    limeDeleteTexture(*FEBits3);
    limeDeleteTexture(*FEBackground);
    limeDeleteTexture(SpotlightTextures[0]);
    limeDeleteTexture(SpotlightTextures[1]);

    limeDeleteTexture(KodesTexture);
    limeDeleteTexture(MainMenuBGTexture);
    limeDeleteTexture(GameOverTopTexture);
    limeDeleteTexture(GameOverBottomTexture);
    limeDeleteTexture(MetalScreenTexture);
    limeDeleteTexture(VSTexture);
    limeDeleteTexture(FENew1Texture);
    limeDeleteTexture(Vortex1Texture);
    limeDeleteTexture(Vortex2Texture);
    limeDeleteTexture(LightningTexture);

    limeDeleteTexture(TowerPortraitTexture[0]);
    for (i = 1; i < 28; i++)
        limeDeleteTexture(TowerPortraitTexture[i]);

    limeDeleteTexture(FloorTexture);
    limeDeleteTexture(BricksTexture);
    limeDeleteTexture(*SmokeTexture);
    limeDeleteTexture(MainLogoTexture);
    limeDeleteTexture(SelectBGTexture);
    limeDeleteTexture(PortraitBorderTexture);
    limeDeleteTexture(*FBIconTexture);
    limeDeleteTexture(*FBLoginTexture);
    limeDeleteTexture(*FBLogoutTexture);
    limeDeleteTexture(*GreenFrameTexture);
    limeDeleteTexture(*RedFrameTexture);

    DestroyFEMeshSets();

    CurrentTask = 8;
    *NextTask   = 5;
}


/* --------------------------------------------- FE_Task_Manage_Social_Features
 *
 * armv7 0x00012e28, 760 bytes.  **Complete.**
 *
 * Two privacy toggles on one page, with Back. Together with
 * `FE_Task_About_Usage_Sharing` (`Settings[9]`) this accounts for
 * `Settings[7]`, `[8]` and `[9]` -- the three consecutive words at the end of
 * the settings block are the three things the game asks permission for.
 *
 *      Settings[8]   toggled by choice 1, label drawn at y = 60
 *      Settings[7]   toggled by choice 2, label drawn at y = 160
 *
 * Both toggle with `x ^= 1`, and both use the same pair of strings for their
 * state -- `GameText(0xe1)` for on and `0xe2` for off, the same two
 * `FE_Task_About_Usage_Sharing` uses. The headings are `0xe8` and `0x396`.
 *
 * ### The network check is cached in a sentinel, and never invalidated
 *
 *      if (socialConnectionAvailable == -1)
 *          socialConnectionAvailable = EASDK_ConnectedToNetwork();
 *
 * -1 means "not asked yet"; 0 and 1 are real answers. So the network is
 * probed on the first frame this screen is ever shown and the answer is kept
 * from then on. Nothing in this function ever writes -1 back, so losing or
 * gaining connectivity while the game runs does not change what this screen
 * believes -- unlike `FE_Task_Select_Leaderboard`, which sets its own
 * `leaderboardsConnectionAVailable` back to -1 on every frame and therefore
 * re-probes constantly. Two screens, two opposite policies.
 *
 * Note also that the answer is never *used* here. It is computed, cached, and
 * the page draws the same either way.
 *
 * ### Leaving saves, twice over
 *
 * Choice 5 -- the page's own confirm -- and the Back button both do
 * `PopFETaskDeferred(); Write_SettingsData();`. Written out twice in the
 * original, which is why pressing both in one frame would save twice.
 */
extern long socialConnectionAvailable;  /* 0x00100e2c */

void FE_Task_Manage_Social_Features(void)
{
    long choice, back;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    if (socialConnectionAvailable == -1)
        socialConnectionAvailable = EASDK_ConnectedToNetwork();

    choice = drawPage2x1Wide(0, 0);

    limeDrawFONT(GameFont, GameText(0xe8), (float)FE_X(240.0f),
                 (float)FE_Y(44.0f), 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont, GameText(Settings[8] ? 0xe1 : 0xe2),
                 (float)FE_X(240.0f), (float)FE_Y(60.0f),
                 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont, GameText(0x396), (float)FE_X(240.0f),
                 (float)FE_Y(144.0f), 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont, GameText(Settings[7] ? 0xe1 : 0xe2),
                 (float)FE_X(240.0f), (float)FE_Y(160.0f),
                 1, FE_WidthScale, fontcol);

    if (choice == 1) {
        Settings[8] ^= 1;
    } else if (choice == 2) {
        Settings[7] ^= 1;
    } else if (choice == 5) {
        PopFETaskDeferred();
        Write_SettingsData();
    }

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(7), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (back) {
        PopFETaskDeferred();
        Write_SettingsData();
    }
}


/* -------------------------------------------------------- RenderFECharacters
 *
 * armv7 0x00009568, 1080 bytes.  **Complete.**
 *
 * Draws the one or two characters that stand on the front-end screens -- the
 * select screen, the versus screen -- in 3D, over whatever 2D background was
 * already drawn. The two arguments are character indices, and -1 in either
 * slot means "nobody there".
 *
 * ### The whole camera is exposed as debug sliders
 *
 *      LIME_Slider(1, &FECAMPOSX,        "camx",      -10,  10, 0, 0)
 *      LIME_Slider(1, &FECAMPOSY,        "camy",      -10,  10, 0, 0)
 *      LIME_Slider(1, &FECAMPOSZ,        "camz",      -10,  10, 0, 0)
 *      LIME_Slider(1, &CameraLookAt[0],  "atx",      -100, 100, 0, 0)
 *      LIME_Slider(1, &CameraLookAt[1],  "aty",      -100, 100, 0, 0)
 *      LIME_Slider(1, &CameraLookAt[2],  "atz",      -100, 100, 0, 0)
 *      LIME_Slider(1, SceneGroundOffset, "groundoff", -100, 100, 0, 0)
 *
 * Seven sliders, still in the shipped binary. **These call sites are what
 * fixed `LIME_Slider`'s signature** -- decomp/lime/DS_DebugWin.c could see
 * that it took seven arguments but not what they were, because the values only
 * pass through it. Here they are named, ranged and typed, all at once.
 *
 * The camera itself is then placed by hand every frame:
 *
 *      FECamPos[0]     = FECAMPOSX + FEPlayer1Offset      (slot 0)
 *                      = FEPlayer2Offset - FECAMPOSX      (slot 1)
 *      FECamPos[1]     = FECAMPOSY
 *      FECamPos[2]     = FECAMPOSZ
 *      CameraLookAt    = { FECamPos[0], FECAMPOSY + 1.0f, FECAMPOSZ }
 *
 * The target is the camera's own position lifted by exactly 1.0 -- a level
 * shot aimed one unit up, which is what puts a standing fighter's chest in the
 * middle of the frame instead of their feet. **The X offset is applied with
 * opposite sign for the two slots**, and it is the offset that moves, not the
 * camera: the second character is framed from the mirror-image position.
 *
 * ### The mirroring, and the flag that goes with it
 *
 * The second character is drawn with its X offset negated, then
 * `glScalef(-1, 1, 1)`, and around that scale the character's `+0x540` is set
 * to 0 and then back to 1. Setting the flag back to 1 *after* the mirroring
 * scale is what tells the renderer this one is inside a negative-determinant
 * matrix -- the same condition that needs `glCullFace(GL_FRONT)`, documented in
 * `runtime/demo.c`. Front-end and in-game agree on the convention.
 *
 * ### The per-character scale comes from the character definition
 *
 *      scale = PlayerDefs[FEChars[i]].field04 * PlayerSize
 *      glScalef(scale, scale, scale)
 *      glRotatef(90, 1, 0, 0)
 *
 * `PLAYERDEF` stride 52 again, and its `+0x04` is a per-character size
 * multiplier -- so the roster is not all one height, and the difference is
 * data, not art. The 90 degree rotation about X is the Z-up to Y-up flip the
 * whole front end uses.
 *
 * ### Same character on both sides gets the alternate skin
 *
 *      char->field528 = anim->field14                 (the default skin)
 *      if (both slots hold the same character)
 *          char->field528 = anim->field24             (the alternate)
 *
 * `field14` and `field24` are the two skins; `RenderPlayer` reads `field528`
 * as the one to use. Which side gets the alternate depends on the mode:
 *
 *      GameMode != 1   slot 1 takes it
 *      GameMode == 1   isParent() ? slot 1 : slot 0
 *
 * In a network versus the HOST keeps the default and the guest gets the
 * alternate -- decided by `isParent`, so both machines agree without having to
 * negotiate it. Outside a network game the rule is simply "the one on the
 * right".
 *
 * ### Nothing is drawn until the frames are in memory
 *
 *      if (!HaveFrameInList(&char[0x5f4], char->field664)) continue;
 *
 * so a slot whose animation has not finished loading is skipped for that frame
 * rather than drawn wrong -- which is what makes the select screen tolerable
 * while `Preload1Character` is still working.
 */
#define FE_CHARACTER_STRIDE 0x668

extern long   FEChars[2];               /* 0x0018ed78 */
extern float *SceneGroundOffset;        /* pointer slot -> 0x0014df8c */
extern float *ShadowOffset;             /* pointer slot */
extern float  FECAMPOSX;                /* 0x00101710 */
extern float  FECAMPOSY;                /* 0x00101714 */
extern float  FECAMPOSZ;                /* 0x00101718 */
extern float  FEPlayer1Offset;          /* 0x00183d68 */
extern float  FEPlayer2Offset;          /* 0x00183d64 */
extern char  *TheFECharacters;          /* pointer slot -> 0x0020e634 */
extern char  *PlayerDefs;               /* pointer slot -> 0x00170950 */
extern float *PlayerSize;               /* pointer slot */

void ClearDebugWindow(int index);
void LIME_Slider(int window, float *value, const char *label,
                 float lo, float hi, long step, long e);
void LIME_PushMatrix(void);
void LIME_PopMatrix(void);
void limeGetCurrentModelMatrix(float *out);
void glMatrixMode(unsigned mode);
void glLoadIdentity(void);
void glRotatef(float angle, float x, float y, float z);
void RenderPlayer(void *player, long a, long b);

void RenderFECharacters(long slot0, long slot1)
{
    int i;

    FEChars[0] = slot0;
    FEChars[1] = slot1;

    LIMEDS_Set3dMode();
    *SceneGroundOffset = 0.0f;
    *ShadowOffset = 0.0f;
    ClearDebugWindow(1);

    LIME_Slider(1, &FECAMPOSX, "camx", -10.0f, 10.0f, 0, 0);
    LIME_Slider(1, &FECAMPOSY, "camy", -10.0f, 10.0f, 0, 0);
    LIME_Slider(1, &FECAMPOSZ, "camz", -10.0f, 10.0f, 0, 0);
    LIME_Slider(1, &CameraLookAt[0], "atx", -100.0f, 100.0f, 0, 0);
    LIME_Slider(1, &CameraLookAt[1], "aty", -100.0f, 100.0f, 0, 0);
    LIME_Slider(1, &CameraLookAt[2], "atz", -100.0f, 100.0f, 0, 0);
    LIME_Slider(1, SceneGroundOffset, "groundoff", -100.0f, 100.0f, 0, 0);

    for (i = 0; i < 2; i++) {
        char  *ch;
        float *def;
        void **anim;
        float  scale;
        long   which;

        if (i == 0)
            FECamPos[0] = FECAMPOSX + FEPlayer1Offset;
        else
            FECamPos[0] = FEPlayer2Offset - FECAMPOSX;

        FECamPos[1] = FECAMPOSY;
        FECamPos[2] = FECAMPOSZ;

        CameraLookAt[1] = FECAMPOSY + 1.0f;
        CameraLookAt[2] = FECAMPOSZ;
        CameraLookAt[0] = FECamPos[0];

        SetToUseCamera(FECamPos);

        which = FEChars[i];
        if (which == -1)
            continue;

        ch = TheFECharacters + which * FE_CHARACTER_STRIDE;

        if (!HaveFrameInList((const long *)(ch + 0x5f4),
                             *(const long *)(ch + 0x664)))
            continue;

        *(long *)ch = FEChars[i];
        GetCharacterOffsetPos((int)FEChars[i], (limeVECTOR3 *)(ch + 0x5c8));

        if (i != 0)
            *(float *)(ch + 0x5c8) = -*(float *)(ch + 0x5c8);

        def = (float *)(PlayerDefs + FEChars[i] * 52);
        scale = def[1] * *PlayerSize;   /* PLAYERDEF+0x04 */

        LIME_PushMatrix();
        glMatrixMode(0x1700);           /* GL_MODELVIEW */
        glLoadIdentity();
        glScalef(scale, scale, scale);
        glRotatef(90.0f, 1.0f, 0.0f, 0.0f);

        *(long *)(ch + 0x540) = 0;
        if (i != 0) {
            glScalef(-1.0f, 1.0f, 1.0f);
            *(long *)(ch + 0x540) = 1;
        }

        limeGetCurrentModelMatrix((float *)(ch + 0x548));

        *(long *)(ch + 0x578) = *(const long *)(ch + 0x5c8);
        *(long *)(ch + 0x57c) = *(const long *)(ch + 0x5d0);
        *(long *)(ch + 0x580) = *(const long *)(ch + 0x5cc);

        LIME_PopMatrix();

        *(float *)(ch + 0x5d8) = 0.65f;
        *(float *)(ch + 0x5dc) = 0.65f;
        *(float *)(ch + 0x5e0) = 0.7f;

        anim = *(void ***)(ch + 4);
        *(void **)(ch + 0x528) = anim[0x14 / 4];
        *(long *)(ch + 0x52c) = 0;

        if (GameMode == 1) {
            if (slot0 == slot1 && (isParent() ? i != 0 : i == 0))
                *(void **)(ch + 0x528) = anim[0x24 / 4];
        } else {
            if (i != 0 && slot0 == slot1)
                *(void **)(ch + 0x528) = anim[0x24 / 4];
        }

        RenderPlayer(ch, 1, 0);
    }
}


/* ---------------------------------------- FE_Task_About_Usage_Sharing_Confirm
 *
 * armv7 0x000129c0, 1128 bytes.  **Complete.**
 *
 * The "are you sure" screen behind the usage-sharing toggle. It reads
 * `Settings[9]` -- the same word `FE_Task_About_Usage_Sharing` toggles -- and
 * asks the opposite question depending on which way it is currently set.
 *
 *      Settings[9] on    heading GameText(0xaf)   body GameText(0xb1)
 *      Settings[9] off   heading GameText(0xb0)   body GameText(0xb2)
 *
 * ### Chinese and Korean get a different text scale
 *
 *      if (!strcmp(Language, "ZH") || !strcmp(Language, "KO")) {
 *          headingScale = 1.25f;   bodyScale = 1.0f;
 *      } else {
 *          headingScale = 1.0f;    bodyScale = 0.75f;
 *      }
 *
 * Two language codes, compared by `strcmp` against string literals, deciding
 * two font multipliers. CJK glyphs carry more detail per character, so they are
 * drawn a third larger and the body is not shrunk at all. **This is the only
 * place found so far where the layout branches on the language**, and it is
 * worth knowing for the port: a new language with a dense script needs adding
 * here, not just a new text file.
 *
 * ### The OK button is drawn by one thing and tested by another
 *
 * `DrawButtonNew(&BUTTON_OK, 0x39, 0x130, 1)` draws it -- and **its return
 * value is thrown away**. The press is detected instead by a hit test written
 * out by hand right below it:
 *
 *      limeLastTouchScreenX[0] == -1.0f                  (a fresh press)
 *      limeTouchScreenX[0] <= 114.0f * FE_WidthScale
 *      limeTouchScreenY[0] >= limeScreenHeight - 64.0f * FE_HeightScale
 *
 * The Back button, three lines earlier, does use its return value. So one
 * screen contains both conventions, and the hand-rolled one uses numbers
 * (114, 64) that have nothing to do with the button's own drawn position
 * (0x39, 0x130). Any port that moves or resizes this button has to change two
 * unrelated places or the artwork and the touch target come apart.
 *
 * ### The fade suppresses the text but not the buttons
 *
 *      if (FE_FadeAdd < 0.0f) skip the heading and the body
 *
 * Only the text is skipped; the two buttons are still drawn and the touch test
 * still runs while the screen fades out.
 *
 * ### Opting out is logged; opting in is not
 *
 *      if (Settings[9]) EASDK_LogEvent(0x7548, 0, NULL, 0, 0);
 *      Settings[9] ^= 1;
 *      Write_SettingsData();
 *      PopFETaskDeferred();
 *
 * The event fires on the way out only -- EA records the opt-out, and the
 * opt-in is silent. Both write the settings and leave the screen.
 */
extern char Language[10];               /* 0x001ab980 */
extern BUTTONNEW BUTTON_OK;             /* 0x001007a8 */
extern char HelpSpiltText[];            /* 0x00182c84, 256 bytes a line */

/* Five fixed arguments, and the LAST ONE IS A STRING. This screen passes 0
 * for it, which said nothing; FE_Task_Main_Menu passes "OPTIONS", "EXTRAS",
 * "PLAY" and so on, which settles it -- the shape is the same as
 * EASDK_LogEventEnumEnumString. */
void EASDK_LogEvent(long id, long a, const char *s1, long b, const char *s2);
int  strcmp(const char *a, const char *b);

void FE_Task_About_Usage_Sharing_Confirm(void)
{
    float headingScale, bodyScale;
    long  lines, i;
    long  back;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    if (strcmp(Language, "ZH") == 0 || strcmp(Language, "KO") == 0) {
        headingScale = 1.25f;
        bodyScale    = 1.0f;
    } else {
        headingScale = 1.0f;
        bodyScale    = 0.75f;
    }

    if (FE_FadeAdd >= 0.0f) {
        const char *body;

        limeDrawFONT(GameFont, GameText(Settings[9] ? 0xaf : 0xb0),
                     (float)FE_X(240.0f), (float)FE_Y(32.0f),
                     1, headingScale * FE_WidthScale, fontcol);

        body = GameText(Settings[9] ? 0xb1 : 0xb2);

        CreateWrappedTextArrays(body, HelpSpiltText, &lines,
                                *limeScreenWidth - 0x20,
                                GameFont, bodyScale * FE_WidthScale);

        for (i = 0; i < lines; i++)
            limeDrawFONT(GameFont, limeUC(&HelpSpiltText[i * 256]),
                         (float)(*limeScreenWidth / 2),
                         (float)FE_Y((float)(i * 16 + 0x48)),
                         1, bodyScale * FE_WidthScale, fontcol);
    }

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(0x58), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (back)
        PopFETaskDeferred();

    /* Drawn, and the result deliberately discarded -- see above. */
    DrawButtonNew(&BUTTON_OK, 0x39, 0x130, 1);

    limeDrawFONT(GameFont, GameText(0xc), (float)FE_X(57.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (limeLastTouchScreenX[0] == -1.0f
        && limeTouchScreenX[0] <= 114.0f * FE_WidthScale
        && limeTouchScreenY[0] >= (float)*limeScreenHeight
                                  + -64.0f * FE_HeightScale) {
        puts("OPTOUT CONFIRMED!");

        if (Settings[9])
            EASDK_LogEvent(0x7548, 0, 0, 0, 0);

        Settings[9] ^= 1;
        Write_SettingsData();
        PopFETaskDeferred();
    }
}


/* ------------------------------------------------- FE_Task_Multiplayer_Summary
 *
 * armv7 0x00015fc0, 1048 bytes.  **Complete.**
 *
 * The lobby both players sit in once a session is up: three options, of which
 * only the guest's third one is ever live for them.
 *
 *      BUTTON_1X3_1 at (0xed, 0x5a)   -> 1   start a fight
 *      BUTTON_1X3_2 at (0xed, 0xa0)   -> 2   back to the menu
 *      BUTTON_1X3_3 at (0xed, 0xe6)   -> 3   end the session
 *
 * ### Only the host can drive the session, and the UI says so twice
 *
 *      interactive = (WaitForOpponent == 0) && isParent()
 *
 * That same expression gates the first two buttons -- computed twice, once
 * per button, from freshly re-read state -- and it also chooses the colour of
 * the first two labels: `fontcol` when it is true, and a **local grey
 * {0.5, 0.5, 0.5, 0.5}** built on the stack when it is false. So the guest sees
 * the same two rows greyed and inert. The third button passes 1 unconditionally
 * and its label always uses `fontcol`: leaving is never taken away from you.
 *
 * ### A press only counts once the fade has stopped
 *
 *      if (DrawButtonNew(...)) choice = (FE_FadeAdd == 0.0f) ? n : 0;
 *
 * Written out separately for all three. A button pressed while the screen is
 * already fading is swallowed, which is what stops a double transition when
 * the player taps twice.
 *
 * ### The heartbeat is a modulo on a frame counter
 *
 *      sendInd++;
 *      if (sendInd % 60 == 22) sendGenericPacket(0x3f800000, 0);
 *
 * One packet every sixtieth frame -- once a second at 60fps -- and at offset
 * **22**, not 0. An offset means this screen's keep-alive does not collide
 * with anything else that fires on a round multiple of 60. The divide is the
 * usual reciprocal multiply, magic `0x88888889` with the add-back and a shift
 * of five: `2290649225 / 2^37` is exactly `1/60`.
 *
 * ### Every frame resets the sync state
 *
 *      resetCountersBeforeMP(); startTime = 0; syncState = 0; readyToSync = 0;
 *
 * unconditionally, before the heartbeat. So the lobby is not just idle -- it
 * actively holds the sync machinery at zero for as long as it is on screen,
 * and whatever the network layer was mid-way through is discarded once per
 * frame. That is why entering a fight from here always starts from a clean
 * sync rather than from whatever the lobby left behind.
 *
 * ### The three exits
 *
 *      1  requestedLevel = getRandomLevel(); PopFETaskDeferred();
 *         resetCharacterSelection(); enableHeartbeat(3);
 *         sendFEMenuPacket(-1) x3
 *      2  PopFETaskDeferred2(); sendFEMenuPacket(-2) x3;
 *         resetCharacterSelection(); enableHeartbeat(3)
 *      3  PopAllFETasksDeferred(0); disableHeartbeat(); endMP()
 *
 * **The menu packet is sent three times, not once**, on both of the first two
 * paths -- there is no loop, it is written out three times. This is an
 * unreliable channel and the sender is spamming the transition rather than
 * waiting for an acknowledgement. A port with a reliable transport can send it
 * once; a port that keeps the original protocol must keep all three, because
 * the receiver is presumably tolerant of duplicates precisely because of this.
 *
 * All three paths then bump `thisSessionId` and set `startDebug = 1`, and all
 * three are reached only after `dumpStack()` -- a debug routine still wired
 * into the shipped release build.
 */
extern long  pressedPlay;               /* 0x000ff824 */
extern long  opponentPressedPlay;       /* 0x000ff828 */
extern long *WaitForOpponent;           /* pointer slot -> 0x0010df18 */
extern long *startTime;                 /* pointer slot */
extern long *syncState;                 /* pointer slot */
extern long *readyToSync;               /* pointer slot */
extern long  sendInd;                   /* 0x00100ebc */
extern long *requestedLevel;            /* pointer slot */
extern long  thisSessionId;             /* 0x000ff81c */
extern long  startDebug;                /* 0x000ff800 */

void sendGenericPacket(long a, long b);
void enableHeartbeat(long mode);
void disableHeartbeat(void);
void sendFEMenuPacket(long item);
void endMP(void);

void FE_Task_Multiplayer_Summary(void)
{
    /* C.381, four words on the stack. The greyed-out label colour. */
    float grey[4];
    long  choice;
    long  live;

    grey[0] = 0.5f;
    grey[1] = 0.5f;
    grey[2] = 0.5f;
    grey[3] = 0.5f;

    pressedPlay = 0;
    opponentPressedPlay = 0;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    choice = 0;

    live = (*WaitForOpponent == 0) && isParent();
    if (DrawButtonNew(&BUTTON_1X3_1, 0xed, 0x5a, (int)live))
        choice = (FE_FadeAdd == 0.0f) ? 1 : 0;

    live = (*WaitForOpponent == 0) && isParent();
    if (DrawButtonNew(&BUTTON_1X3_2, 0xed, 0xa0, (int)live)) {
        if (FE_FadeAdd == 0.0f)
            choice = 2;
    }

    if (DrawButtonNew(&BUTTON_1X3_3, 0xed, 0xe6, 1)) {
        if (FE_FadeAdd == 0.0f)
            choice = 3;
    }

    if (*WaitForOpponent == 0 && isParent()) {
        limeDrawFONT(GameFont, GameText(0xf7), (float)FE_X(235.0f),
                     (float)FE_Y(82.0f), 1, FE_WidthScale, fontcol);
        limeDrawFONT(GameFont, GameText(0xc6), (float)FE_X(235.0f),
                     (float)FE_Y(152.0f), 1, FE_WidthScale, fontcol);
    } else {
        limeDrawFONT(GameFont, GameText(0xf7), (float)FE_X(235.0f),
                     (float)FE_Y(82.0f), 1, FE_WidthScale, grey);
        limeDrawFONT(GameFont, GameText(0xc6), (float)FE_X(235.0f),
                     (float)FE_Y(152.0f), 1, FE_WidthScale, grey);
    }

    limeDrawFONT(GameFont, GameText(0xc7), (float)FE_X(235.0f),
                 (float)FE_Y(222.0f), 1, FE_WidthScale, fontcol);

    resetCountersBeforeMP();
    *startTime   = 0;
    *syncState   = 0;
    *readyToSync = 0;

    sendInd++;
    if (sendInd % 60 == 22) {
        /* 0x3f800000 is the bit pattern of 1.0f, but it is forwarded to
         * sendPacket as a raw payload word and nothing on the way reads it as
         * a number -- so it stays the bits. */
        sendGenericPacket(0x3f800000, 0);
    }

    if (choice == 0)
        return;

    dumpStack();

    if (choice == 1) {
        *requestedLevel = getRandomLevel();
        PopFETaskDeferred();
        resetCharacterSelection();
        enableHeartbeat(3);
        sendFEMenuPacket(-1);
        sendFEMenuPacket(-1);
        sendFEMenuPacket(-1);
        dumpStack();
        thisSessionId++;
        startDebug = 1;
    } else if (choice == 2) {
        PopFETaskDeferred2();
        sendFEMenuPacket(-2);
        sendFEMenuPacket(-2);
        sendFEMenuPacket(-2);
        resetCharacterSelection();
        enableHeartbeat(3);
        thisSessionId++;
        startDebug = 1;
    } else if (choice == 3) {
        PopAllFETasksDeferred(0);
        disableHeartbeat();
        endMP();
        thisSessionId++;
        startDebug = 1;
    }
}


/* ------------------------------------------------------ FE_Task_Continue_Screen
 *
 * armv7 0x0000a6b0, 1188 bytes.  **Complete.**
 *
 * "CONTINUE?" with a ten-second countdown. Two hand-drawn touch areas rather
 * than `BUTTONNEW` objects, a black fill under two sprite halves, and a number
 * that counts down in real time.
 *
 * ### The countdown is in seconds, per frame, from a double literal
 *
 *      KontinueTime += -0.016666666666666666 / limeFPSScaleFactor
 *      if (KontinueTime <= 0.0f) KontinueTime = 0.0f
 *
 * **-1/60 exactly**, computed in double precision and stored back as a float.
 * `limeFPSScaleFactor` divides it, so the countdown is wall-clock seconds and
 * not frames -- a slower device counts down at the same rate. `QuitAsLose`
 * starts it at 19.999001f, so the "ten seconds" is really twenty.
 *
 * The number shown is `(long)KontinueTime + 1`, so it reads 20 down to 1 and
 * then the string switches to a literal `"0"` rather than formatting it -- the
 * `+1` would have shown 1 for the whole of the last second otherwise.
 *
 * ### The two buttons are `TouchAreaWH`, not `DrawButtonNew`
 *
 *      yes  at (0x10,  0xb8) size 0xd0 x 0x66
 *      no   at (0x100, 0xb8) size 0xd0 x 0x66
 *
 * `TouchAreaWH` returns 2 for "finger down inside" and 1 for "released
 * inside", and the 2 case draws an 11-pixel red highlight over the area. So
 * the pressed state here is drawn by the screen, not by a button object --
 * this is the older of the two UI conventions in the front end, and the one
 * `FE_Task_About_Usage_Sharing_Confirm` half-reverts to.
 *
 * ### "No" also fires when the clock runs out
 *
 *      if (no == 1 || KontinueTime == 0.0f) { if (FE_FadeAdd == 0) action = 2; }
 *
 * One condition, two causes: releasing on "no", or the timer reaching zero.
 * They are the same code path, which is why letting the clock run out lands
 * you in exactly the state declining would have.
 *
 *      action 1 (continue)  PushFETaskDeferred(0x1b), then log 0x754a
 *      action 2 (give up)   PopAllFETasksDeferred(0), GameStarted = 0,
 *                           PopulateTower(), Destiny = -1, Stage = 0,
 *                           Write_SaveData()
 *
 * Giving up **rebuilds the tower** rather than just leaving it: `PopulateTower`
 * reshuffles the ladder, so the run you declined cannot be resumed by going
 * back in. `Destiny = -1` is the "no tower" value, the same one `QuitAsWin`
 * writes when a tower is cleared.
 *
 * Both actions are gated on `FE_FadeAdd == 0.0f` -- a press during a fade does
 * nothing, as everywhere else in the front end.
 */
extern float KontinueTime;              /* 0x000ff960 */
extern const char **DestinyNames;       /* pointer slot -> 0x00176760 */

int  sprintf(char *dst, const char *fmt, ...);

const char *getStageName(long stage);
void EASDK_LogEventEnumEnumString(long id, long a, const char *s1,
                                  long b, const char *s2);

void FE_Task_Continue_Screen(void)
{
    long yes, no, action;

    limeFillRect(0.0f, 0.0f,
                 (float)*limeScreenWidth, (float)*limeScreenHeight,
                 0.0f, 0.0f, 0.0f, 1.0f);

    limeDrawSprite((TEXTURE *)GameOverTopTexture, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 0.75f, col);

    limeDrawSprite((TEXTURE *)GameOverBottomTexture,
                   0.0f, (float)FE_Y(143.0f),
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 0.75f, col);

    limeDrawFONT(GameFont, GameText(0x51), (float)FE_X(120.0f),
                 (float)FE_Y(208.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x52), (float)FE_X(120.0f),
                 (float)FE_Y(224.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x5b), (float)FE_X(360.0f),
                 (float)FE_Y(224.0f), 1, FE_WidthScale, fontcol);

    KontinueTime = (float)((double)KontinueTime
                           + -0.016666666666666666 / (double)limeFPSScaleFactor);
    if (KontinueTime <= 0.0f)
        KontinueTime = 0.0f;

    action = 0;

    yes = TouchAreaWH(0x10, 0xb8, 0xd0, 0x66);
    if (yes == 2) {
        DrawRedHighlight(0x10, 0xb8, 0xd0, 0x66, 0xb);
    } else if (yes == 1) {
        if (FE_FadeAdd == 0.0f)
            action = 1;
    }

    no = TouchAreaWH(0x100, 0xb8, 0xd0, 0x66);
    if (no == 2)
        DrawRedHighlight(0x100, 0xb8, 0xd0, 0x66, 0xb);

    if (no == 1 || KontinueTime == 0.0f) {
        if (FE_FadeAdd == 0.0f)
            action = 2;
    }

    if (KontinueTime != 0.0f) {
        sprintf(strBuf, "%d", (int)((long)KontinueTime + 1));
        limeDrawFONT(GameFont, strBuf, (float)FE_X(120.0f),
                     (float)FE_Y(240.0f), 1, FE_WidthScale, fontcol);
    } else {
        limeDrawFONT(GameFont, "0", (float)FE_X(120.0f),
                     (float)FE_Y(240.0f), 1, FE_WidthScale, fontcol);
    }

    if (action == 1) {
        PushFETaskDeferred(0x1b);
        EASDK_LogEventEnumEnumString(0x754a, 15, DestinyNames[Destiny],
                                     15, getStageName(Stage));
    } else if (action == 2) {
        PopAllFETasksDeferred(0);
        GameStarted = 0;
        PopulateTower();
        Destiny = -1;
        Stage = 0;
        Write_SaveData();
    }
}


/* ------------------------------------------------------------ FE_Task_Main_Menu
 *
 * armv7 0x0001ac64, 1200 bytes.  **Complete.**
 *
 * The main menu. Five touch areas, the 3D vortex behind them, the logo riding
 * the slide, and the EA ticker on top.
 *
 * ### It is also where a run is torn down
 *
 *      otherPlayerPaused = 0;  playerLostRound = 1;  defeatedBySK = 0;
 *      limeRand();             mpLobbyCurrentPage = 0;  GamePaused = 0;
 *      resetKodeSelector();
 *
 * every frame, unconditionally, before anything is drawn. `playerLostRound`
 * is set to **1**, not 0 -- so simply being on the main menu marks the player
 * as having lost a round, which is what stops the flawless-tower achievement
 * (`QuitAsWin` checks `playerLostRound == 0` on tower 3) from surviving a trip
 * out to the menu. `defeatedBySK` going to 0 likewise resets the three
 * consecutive losses `QuitAsLose` counts.
 *
 * The bare `limeRand()` call keeps no result: it is there to stir the sequence
 * so that the tower shuffle differs between runs that reach the menu at
 * different times.
 *
 * ### Five touch areas, and the odd one out
 *
 *      Touch_MMPlay     (0,   0x5a) 0xed x 0x34   -> 0
 *      Touch_MMOptions  (0,   0)    0xc4 x 0x44   -> 1
 *      Touch_MMHelp     (0,   0xa0) 0xd2 x 0x32   -> 2
 *      Touch_MMExtra    (0,   0xd2) 0xc4 x 0x3c   -> 3
 *      Touch_MMMore     (0,  0x11c) 0xa8 x 0x32   -> 4
 *
 * All five are tested every frame and their raw results are kept in globals,
 * because `DrawMainMenu` reads them back as colour indices:
 *
 *      DrawMainMenu(opt >> 1) + 1, (play >> 1) + 1, (help >> 1) + 1,
 *                  (extra >> 1) + 1, (more >> 1) + 3)
 *
 * `TouchAreaWH` returns 2 while held and 1 on release, so `>> 1` is "is it
 * held", and the +1 turns that into a row in `mmfontcol`. **The fifth gets +3
 * rather than +1** -- "More Games" is coloured from a different pair of rows,
 * which is how it reads as an external link rather than a menu entry.
 *
 * ### While the slide runs, the menu is drawn dead
 *
 *      if (FESlideOffset != 0.0f) DrawMainMenu(0, 0, 0, 0, 5);
 *
 * Zero for the four, and **5** for More Games -- its own inert row. The touch
 * areas were still evaluated above, and their results still went into the
 * globals, but the selection is thrown away (`sel = -1`) so nothing can be
 * chosen mid-slide.
 *
 * The logo is drawn on both paths, at
 *
 *      x = FE_X(FESlideOffset * 240.0f + 220.0f)
 *
 * so it slides at 240 units per unit of offset while the menu text underneath
 * is handled by `DrawMainMenu`'s own offsetting.
 *
 * ### The exits
 *
 *      0  PLAY           flawlessVictories = 0, FESlideNextTask = 1
 *      1  OPTIONS        FESlideNextTask = 5
 *      2  HELP & ABOUT   FESlideNextTask = 7
 *      3  EXTRAS         FESlideNextTask = 6
 *      4  MORE GAMES     EASDK_GetMoreGames(Language, 0)   -- leaves the game
 *
 * All four internal ones set `FESlideDir = 1` and let `MaintainFESlide` do the
 * transition on later frames. Every one of the five logs
 * `EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, <name>)` with its own literal.
 *
 * ### A dead level-cycler
 *
 * The tail contains a complete "advance `LevelSelect` to the next level whose
 * `Level_Info[i] + 0x70` is zero, wrapping at 16" block, guarded by
 * `sel == 5`. **`sel` is only ever -1, 0, 1, 2, 3 or 4** -- the five touch
 * areas plus the no-selection default, and the slide path forces -1. Nothing
 * writes 5. So the block cannot run.
 *
 * It is transcribed below rather than dropped, because it is the only place in
 * the front end that walks `Level_Info` looking for a free slot, and it is
 * almost certainly a debug level-skip whose trigger was removed and whose body
 * was not. Its own inner `if (r3 > 15) restore and give up` is dead a second
 * time over, since the index is wrapped to 0..15 on the line before.
 */
extern long *otherPlayerPaused;         /* pointer slot */
extern long  playerLostRound;           /* 0x000ff8b8 */
extern long *defeatedBySK;              /* pointer slot */
extern long *GamePaused;                /* pointer slot */
extern long  Touch_MMOptions;           /* 0x00100e5c */
extern long  Touch_MMPlay;              /* 0x00100e60 */
extern long  Touch_MMHelp;              /* 0x00100e64 */
extern long  Touch_MMExtra;             /* 0x00100e68 */
extern long  Touch_MMMore;              /* 0x00100e6c */
extern long *flawlessVictories;         /* pointer slot */
extern long  LevelSelect;               /* 0x000ff7f8 */

int  EASOC_MayhemNeedsUserName(void);
void limeSet2DDrawing(void);
void EASDK_ShowMessage(void);
void EASDK_SetLoggingDisable(long off);
void EASDK_GetMoreGames(const char *language, long a);
void achievementsDraw(void);
int  puts(const char *s);

static void DrawMainMenuLogo(void)
{
    limeDrawSprite((TEXTURE *)MainLogoTexture,
                   (float)FE_X(FESlideOffset * 240.0f + 220.0f),
                   (float)FE_H(26.0f),
                   (float)FE_W(420.0f),
                   (float)FE_H(420.0f),
                   0.0f, 0.0f, 1.0f, 1.0f, col);
}

void FE_Task_Main_Menu(void)
{
    long sel;

    *otherPlayerPaused = 0;
    playerLostRound    = 1;
    *defeatedBySK      = 0;
    limeRand();                         /* result discarded: stirs the sequence */
    mpLobbyCurrentPage = 0;
    *GamePaused        = 0;
    resetKodeSelector();

    if (EASOC_MayhemNeedsUserName())
        EASOC_MayhemReset();

    limeEnableAlphaBlending_Basic();
    limeSet2DDrawing();

    limeDrawSprite((TEXTURE *)MainMenuBGTexture, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 0.75f, col);

    DrawVortex3D();
    limeEnableAlphaBlending_Basic();
    limeSet2DDrawing();

    Touch_MMOptions = TouchAreaWH(0, 0, 0xc4, 0x44);
    sel = (Touch_MMOptions & 1) ? 1 : -1;

    Touch_MMPlay = TouchAreaWH(0, 0x5a, 0xed, 0x34);
    if (Touch_MMPlay & 1)
        sel = 0;

    Touch_MMHelp = TouchAreaWH(0, 0xa0, 0xd2, 0x32);
    if (Touch_MMHelp & 1)
        sel = 2;

    Touch_MMExtra = TouchAreaWH(0, 0xd2, 0xc4, 0x3c);
    if (Touch_MMExtra & 1)
        sel = 3;

    Touch_MMMore = TouchAreaWH(0, 0x11c, 0xa8, 0x32);
    if (Touch_MMMore & 1)
        sel = 4;

    MaintainFESlide();

    if (FESlideOffset != 0.0f) {
        DrawMainMenu(0, 0, 0, 0, 5);
        DrawMainMenuLogo();
        sel = -1;
    } else {
        DrawMainMenu((int)((Touch_MMOptions >> 1) + 1),
                     (int)((Touch_MMPlay    >> 1) + 1),
                     (int)((Touch_MMHelp    >> 1) + 1),
                     (int)((Touch_MMExtra   >> 1) + 1),
                     (int)((Touch_MMMore    >> 1) + 3));
        DrawMainMenuLogo();

        if (sel == 1) {
            FESlideDir      = 1;
            FESlideNextTask = 5;
            EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, "OPTIONS");
        } else if (sel == 3) {
            FESlideDir      = 1;
            FESlideNextTask = 6;
            EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, "EXTRAS");
        } else if (sel == 2) {
            FESlideDir      = 1;
            FESlideNextTask = 7;
            EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, "HELP & ABOUT");
        } else if (sel == 0) {
            *flawlessVictories = 0;
            FESlideDir      = 1;
            FESlideNextTask = 1;
            EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, "PLAY");
        } else if (sel == 4) {
            puts("#########################\nENTERING STORE (opt 4");
            EASDK_LogEvent(0xc35d, 15, "MAIN MENU", 15, "MORE GAMES");
            EASDK_GetMoreGames(Language, 0);
        }
    }

    EASDK_ShowMessage();
    EASDK_SetLoggingDisable(0);
    DrawTicker();
    achievementsDraw();

    /* UNREACHABLE -- see the header. Kept as transcription. */
    if (sel == 5) {
        const char *info;
        long previous = LevelSelect;
        long cur;

        LevelSelect = previous + 1;
        if (LevelSelect > LEVEL_SLOTS - 1)
            LevelSelect = 0;

        info = *LevelInfoPtr;
        cur  = LevelSelect;

        while (*(const long *)(info + cur * LEVEL_INFO_STRIDE + 0x70) != 0) {
            if (cur > LEVEL_SLOTS - 1) {    /* dead again: cur is already wrapped */
                LevelSelect = previous;
                return;
            }
            cur++;
            if (cur == LEVEL_SLOTS)
                cur = 0;
        }
        LevelSelect = cur;
    }
}


/* ------------------------------------------------------- FE_Task_Karnage_Summary
 *
 * armv7 0x0000ffbc, 1208 bytes.  **Complete.**
 *
 * The score screen after a Karnage run: two animated spotlights, the score,
 * and an exit button that is held back until EA's leaderboard has accepted the
 * post.
 *
 * ### Two spotlights from one animation, the right one mirrored
 *
 *      DrawAnimAsSprite(0, 0, FE_WidthScale, 128, 128, SpotlightTextures,
 *                       &spotlight_SpriteDef, spotlight_Anim,
 *                       0, GameCounter, 0, spotlight_Anim[0] - 1, 1, col)
 *      ...the same again at x = limeScreenWidth - 128 * FE_WidthScale,
 *         with mirror = 1
 *
 * One animation, played twice at the two edges, the second flipped. The frame
 * range is `0 .. spotlight_Anim[0] - 1`, read out of the table's own first
 * word, so the animation length is data and not a constant here.
 *
 * ### The username handshake is a four-state machine in a global
 *
 *      userNameEntryViewed == 0  -> set it to 1, PushFETaskDeferred(0x2e)
 *                          == 2  -> printf, EASOC_MayhemSetUserName(ourName), ++
 *                          == 3  -> once !MayhemIsPending: MayhemReset(), ++
 *
 * State 1 is not handled here at all -- that is task 0x2e's, the name-entry
 * screen, which presumably moves 1 -> 2 when the player confirms. So the two
 * halves of the handshake live in different functions and communicate only
 * through this counter. It never resets: state 4 is terminal for the session.
 *
 * The whole branch is gated on `EASDK_ConnectedToNetwork() && Settings[8]` --
 * `Settings[8]` being the social toggle `FE_Task_Manage_Social_Features` owns.
 *
 * ### A formatted string that nothing reads
 *
 *      feedPosted = 1;
 *      usprintf(<128 bytes of stack>, GameTextNoHeader(0x120), KarnageScore);
 *
 * The buffer at `sp+0x40` is written and never read -- no later instruction
 * touches it. Together with `feedPosted = 1` set unconditionally on the line
 * before, this is the remains of a Facebook feed post: the text is still built
 * every frame and the flag still claims it went out, but the posting itself is
 * gone. The port can drop both; they are recorded here so the removal is a
 * decision and not an oversight.
 *
 * ### The exit button waits for the leaderboard
 *
 *      ready = !EASDK_ConnectedToNetwork() || EASOC_MayhemIsReady();
 *
 * Offline counts as ready -- there is nothing to wait for. While not ready and
 * `exitTimeout > 0`, the button is not drawn at all; instead the timeout runs
 * down by `1.0f / limeFPSScaleFactor` per frame and, once it is **below 540**,
 * `GameText(0x13)` blinks with a period of 256 units, shown while
 * `(int)exitTimeout % 256 > 128`. Above 540 nothing is shown, so the wait is
 * silent for its first stretch and only starts flashing when it has gone on
 * long enough to look stuck.
 *
 * The modulo is written out with the usual sign correction -- `(t + (t>>31 >>>
 * 24)) & 0xff` minus the same correction -- even though `exitTimeout` cannot
 * be negative here, because the compiler could not know that.
 *
 * ### Posting the score happens on the way out, not on arrival
 *
 *      PopAllFETasksDeferred(0);
 *      if (connected && Settings[8] && MayhemIsReady())
 *          EASOC_MayhemPostStatWithData("shaokahn_med", KarnageScore, stats, 12)
 *
 * so the score reaches EA only when the player leaves the screen, and only if
 * all three conditions still hold at that moment. `"shaokahn_med"` is the
 * leaderboard key, and 12 is the size of the `stats` blob that rides along.
 */
extern void **spotlight_SpriteDef;      /* pointer slot */
extern long  *spotlight_Anim;           /* pointer slot -> 0x00175608 */
extern float *GameCounter;              /* pointer slot */
extern long  *KarnageScore;             /* pointer slot -> 0x0014df88 */
extern long   stats[];                  /* 0x00100fc8 */
extern char   ourName[];                /* 0x00183d6c */
extern long   userNameEntryViewed;      /* 0x000ff8f0 */
extern long   feedPosted;               /* 0x00100e30 */
extern float  exitTimeout;              /* 0x00182c80 */
extern BUTTONNEW BUTTON_EXITBIG;        /* 0x001007d0 */

long DrawAnimAsSprite(long x, long y, float scale, long ax,
                      long ay, long unused,
                      const char *frames, const long *table,
                      long mirror, long modulus,
                      long first, long last, long wrap,
                      const float *colour);   /* GameCode.c spells the colour
                                               * `long *`; this file spells the
                                               * same four words `float *`. */
int  EASOC_MayhemIsReady(void);
int  EASOC_MayhemIsPending(void);
void EASOC_MayhemTest(long a);
void EASOC_MayhemSetUserName(const char *name);
void EASOC_MayhemPostStatWithData(const char *key, long value,
                                  const long *data, long size);
int  printf(const char *fmt, ...);

void FE_Task_Karnage_Summary(void)
{
    char feedText[128];                 /* sp+0x40 -- written, never read */
    long ready, exiting;

    limeDrawSprite((TEXTURE *)MetalScreenTexture, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 1.0f, col);

    limeEnableAlphaBlending_Additive();

    DrawAnimAsSprite(0, 0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     0, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1,
                     col);

    DrawAnimAsSprite((long)((float)*limeScreenWidth
                            + -128.0f * FE_WidthScale),
                     0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     1, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1,
                     col);

    limeEnableAlphaBlending_Basic();

    if (EASDK_ConnectedToNetwork() && Settings[8]) {
        EASOC_MayhemTest(1);
        if (EASOC_MayhemNeedsUserName()) {
            if (userNameEntryViewed == 0) {
                userNameEntryViewed = 1;
                PushFETaskDeferred(0x2e);
            } else if (userNameEntryViewed == 2) {
                printf("SUBMITTING NEW NAME: %s!\n", ourName);
                EASOC_MayhemSetUserName(ourName);
                userNameEntryViewed++;
            } else if (userNameEntryViewed == 3) {
                if (!EASOC_MayhemIsPending()) {
                    EASOC_MayhemReset();
                    userNameEntryViewed++;
                }
            }
        }
    }

    limeDrawFONT(GameFont, GameText(0x11f),
                 (float)(*limeScreenWidth / 2), (float)FE_Y(160.0f),
                 1, FE_WidthScale, fontcol);

    usprintf(strBuf, UC("%s: %d"), GameTextNoHeader(0x121), *KarnageScore);
    limeDrawFONT(GameFont, limeUC(strBuf),
                 (float)(*limeScreenWidth / 2), (float)FE_Y(180.0f),
                 1, FE_WidthScale, fontcol);

    feedPosted = 1;
    usprintf(feedText, GameTextNoHeader(0x120), *KarnageScore);

    ready = !EASDK_ConnectedToNetwork() || EASOC_MayhemIsReady();

    exiting = -1;

    if (!ready && exitTimeout > 0.0f) {
        exitTimeout = exitTimeout + -1.0f / limeFPSScaleFactor;
        if (exitTimeout < 0.0f)
            exitTimeout = 0.0f;

        {
            long t = (long)exitTimeout;

            if (t < 0x21c) {
                long corr = (t >> 31) >> 24;    /* 255 when negative, else 0 */
                if ((((t + corr) & 0xff) - corr) > 0x80)
                    limeDrawFONT(GameFont, GameText(0x13),
                                 (float)(*limeScreenWidth / 2),
                                 (float)FE_Y(200.0f),
                                 1, FE_WidthScale, fontcol);
            }
        }
    } else {
        exiting = DrawButtonNew(&BUTTON_EXITBIG, 0x1a7, 0x130, 1) ? 0 : -1;

        limeDrawFONT(GameFont, GameText(9), (float)FE_X(423.0f),
                     (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);
    }

    if (FE_FadeAdd == 0.0f && exiting == 0) {
        PopAllFETasksDeferred(0);

        if (EASDK_ConnectedToNetwork() && Settings[8] && EASOC_MayhemIsReady())
            EASOC_MayhemPostStatWithData("shaokahn_med", *KarnageScore,
                                         stats, 0xc);
    }
}


/* --------------------------------------------------------------- FE_Task_Settings
 *
 * armv7 0x00015638, 1272 bytes.  **Complete.**
 *
 * The options screen: four cells on a 2x2 page, two of which are volume
 * steppers.
 *
 *      1  controls        PushFETaskDeferred(0x2f)
 *      2  blood on/off    Settings[1] ^= 1
 *      3  music volume    Settings[2], 0..3, wrapping
 *      4  sound volume    Settings[3], 0..3, wrapping
 *
 * Both volumes share one set of four labels: `GameText(0xe2)` for level 0 and
 * `0xde`, `0xdf`, `0xe0` for 1, 2 and 3. The level-0 string is the same "off"
 * the social toggles use, so a single string does duty for every off state in
 * the front end.
 *
 * ### The music stepper acts on the OLD value and stores the new one
 *
 *      v = Settings[2];
 *      if      (v == 3) limeStopTune();
 *      else if (v == 0) limePlayTune("MainMenu.mp3", (long)MusicVol[1], 1);
 *      else if (v == 1) limeSetTuneVol((long)MusicVol[2]);
 *      else if (v == 2) limeSetTuneVol((long)MusicVol[3]);
 *      Settings[2] = (v + 1) & 3;
 *
 * Every branch is indexed by **v + 1** -- the level the player is stepping
 * *to* -- while the setting itself is written afterwards. So the sound of the
 * change and the recorded state can never disagree, and the wrap from 3 back
 * to 0 is the one case that stops the tune instead of setting a volume.
 *
 * In the original this is not a switch: it is a chain of blocks each of which
 * falls into the next comparison after **re-reading `Settings[2]`**. Since
 * nothing writes it until the end, all the re-reads see the same value, which
 * is why it collapses to the form above.
 *
 * Starting the tune from level 0 passes `1` as the third argument where
 * `FE_Task_Main_Menu`'s music start passes `0` -- worth noting, as it is the
 * only distinction between the two calls.
 *
 * ### The user's own music wins, silently
 *
 *      if (limeCheckForUserMusic()) { Settings[2] = 0; }
 *
 * checked *before* the stepper runs, so pressing the music button while the
 * player has their own music playing does not step the volume: it forces the
 * setting to 0 and nothing else happens. Same rule `Task_LoadGeneralData`
 * applies once at boot, applied again here on every press.
 *
 * ### The sound stepper clicks at the volume it just chose
 *
 *      Settings[3] = (Settings[3] + 1) & 3;
 *      if (Settings[3] != 0)
 *          limePlaySound(SFXHandle[0x68/4], MusicVol[Settings[3]] / 100.0f, 1, 0);
 *      Write_SettingsData();
 *
 * Here the index IS the new value, because the point is to demonstrate it.
 * Level 0 plays nothing, which is the demonstration for "off". `SFXHandle[26]`
 * is the "Gstart" click `Task_LoadGeneralData` loads, and the /100 is the same
 * scaling every other click in the game uses.
 *
 * The settings are written on both stepper paths and again on Back, so
 * stepping a volume commits immediately rather than on leaving.
 */
void limeSetTuneVol(long vol);

void FE_Task_Settings(void)
{
    long choice, back;
    long musicLabel, sfxLabel;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    choice = drawPage2x2BigForSettings();

    limeDrawFONT(GameFont, GameText(0x118), (float)FE_X(152.0f),
                 (float)FE_Y(72.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0x119), (float)FE_X(152.0f),
                 (float)FE_Y(88.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0xdc), (float)FE_X(152.0f),
                 (float)FE_Y(208.0f), 1, FE_WidthScale, fontcol);

    musicLabel = (Settings[2] == 3) ? 0xe0
               : (Settings[2] == 2) ? 0xdf
               : (Settings[2] == 1) ? 0xde : 0xe2;
    limeDrawFONT(GameFont, GameText(musicLabel), (float)FE_X(152.0f),
                 (float)FE_Y(224.0f), 1, FE_WidthScale, fontcol);

    limeDrawFONT(GameFont, GameText(0xdd), (float)FE_X(320.0f),
                 (float)FE_Y(208.0f), 1, FE_WidthScale, fontcol);

    sfxLabel = (Settings[3] == 3) ? 0xe0
             : (Settings[3] == 2) ? 0xdf
             : (Settings[3] == 1) ? 0xde : 0xe2;
    limeDrawFONT(GameFont, GameText(sfxLabel), (float)FE_X(320.0f),
                 (float)FE_Y(224.0f), 1, FE_WidthScale, fontcol);

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

    limeDrawFONT(GameFont, GameText(7), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (choice == 1) {
        PushFETaskDeferred(0x2f);
    } else if (choice == 2) {
        Settings[1] ^= 1;
    } else if (choice == 3) {
        if (limeCheckForUserMusic()) {
            Settings[2] = 0;
        } else {
            long v = Settings[2];

            if (v == 3)
                limeStopTune();
            else if (v == 0)
                limePlayTune("MainMenu.mp3", (long)MusicVol[1], 1);
            else if (v == 1)
                limeSetTuneVol((long)MusicVol[2]);
            else if (v == 2)
                limeSetTuneVol((long)MusicVol[3]);

            Settings[2] = (int)((v + 1) & 3);
            Write_SettingsData();
        }
    } else if (choice == 4) {
        Settings[3] = (Settings[3] + 1) & 3;
        if (Settings[3] != 0)
            limePlaySound(SFXHandle[0x68 / 4],
                          MusicVol[Settings[3]] / 100.0f, 1.0f, 0);
        Write_SettingsData();
    }

    if (back) {
        PopFETaskDeferred();
        Write_SettingsData();
    }
}


/* ----------------------------------------------------------- FE_Task_Achievements
 *
 * armv7 0x0000afd4, 1284 bytes.  **Complete.**
 *
 * The achievements list: six rows a page, four pages, prev/back/next along the
 * bottom.
 *
 * ### Twenty achievements in twenty-four slots
 *
 *      idx = currentAchievementPage * 6 + row      (row 0..5)
 *      if (idx > 0x13) skip the row entirely
 *
 * so the last page shows four entries and two blanks. The page arrows are
 * gated by the same number:
 *
 *      prevEnabled = (page <= 0)            ? 2 : 1
 *      nextEnabled = ((page + 1) * 6 > 0x13) ? 2 : 1
 *
 * **1 and 2, not 1 and 0.** Those values go straight into `DrawButtonNew`'s
 * fourth argument *and* are used as a divisor for the label colour:
 *
 *      colour = 1.0f / enabled
 *
 * giving white for an available arrow and exactly half-grey for a dead one.
 * One number doing both jobs is why the disabled state is 2 rather than 0 --
 * zero would have divided by zero.
 *
 * ### The row colour is the lock state
 *
 *      unlocked  colour 1.0f, marker GameText(0x11)
 *      locked    colour 0.5f, marker GameText(0x10)
 *
 * written into the same four-word stack buffer the whole screen passes as its
 * font colour, so each row overwrites it just before drawing. The buffer starts
 * as `{1,1,1,1}` (the C.599 literal) for the title and the Back label.
 *
 * `achievementTracker[idx] != 0` is the unlocked test -- the same array
 * `QuitAsWin` sets a bit in at `[0x54/4]` for the tower achievements.
 *
 * ### This call site names `ACHIEVEMENTDESCR + 0x04`
 *
 *      GameText(achievementsDescr[idx].id)    at y,      scale 1.05
 *      GameText(achievementsDescr[idx].descr) at y + 18, scale 0.80
 *
 * `achievements.c` could only say that +0x00 was a GameText id and that +0x04
 * was unread. Here it is read and handed to `GameText` as well: **+0x04 is the
 * description's text id**, drawn smaller and eighteen units below the name.
 * Two ids per entry, one entry per achievement, sixteen bytes apart.
 *
 * Rows step by 40 units. The name is left-aligned at x = 20 and the lock
 * marker right-aligned at x = 460, which is what makes the row read as one
 * line even though it is three separate draws.
 *
 * ### The page number is not stored anywhere the rest of the game reads
 *
 * `currentAchievementPage` is bumped by +1 or -1 here and reset to 0 by the
 * screens that enter this one. Nothing clamps it on the way in; the clamping
 * is entirely in the two `enabled` tests above, which is safe only because the
 * same test also disables the button that would move it.
 */
extern BUTTONNEW BUTTON_MINI_1;         /* 0x00100550 */
extern BUTTONNEW BUTTON_MINI_2;         /* 0x00100564 */
extern BUTTONNEW BUTTON_MINI_3;         /* 0x00100578 */

/* Sixteen bytes an entry -- see decomp/gamecode/achievements.c, which named
 * +0x00 and left +0x04 unread. This function reads it. */
typedef struct FEACHIEVEMENTDESCR {
    long id;                            /* 0x00  GameText id of the name */
    long descr;                         /* 0x04  GameText id of the description */
    long pad08;                         /* 0x08 */
    long timer;                         /* 0x0c */
} FEACHIEVEMENTDESCR;

extern FEACHIEVEMENTDESCR *achievementsDescr;   /* pointer slot -> 0x0017684c */
extern int achievementTracker[24];              /* 0x00379c60 */

void FE_Task_Achievements(void)
{
    float rowcol[4];                    /* sp+0x28, the C.599 literal */
    long  prevEnabled, nextEnabled;
    long  sel;
    long  row, y;

    rowcol[0] = 1.0f;
    rowcol[1] = 1.0f;
    rowcol[2] = 1.0f;
    rowcol[3] = 1.0f;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    prevEnabled = (currentAchievementPage <= 0) ? 2 : 1;
    nextEnabled = ((currentAchievementPage + 1) * 6 > 0x13) ? 2 : 1;

    limeDrawFONT(GameFont, GameText(0xcc), (float)FE_X(240.0f),
                 (float)FE_Y(4.0f), 1, FE_WidthScale, rowcol);

    limeDrawSprite((TEXTURE *)*FEBits3,
                   (float)FE_X(6.0f), (float)FE_Y(26.0f),
                   (float)FE_W(468.0f), (float)FE_H(256.0f),
                   0.0f, 0.4296875f, 0.9140625f, 0.5f, col);

    sel = DrawButtonNew(&BUTTON_MINI_1, 0x52, 0x12e, (int)prevEnabled) ? 1 : 0;
    if (DrawButtonNew(&BUTTON_MINI_2, 0xf0, 0x12e, 1))
        sel = 2;
    if (DrawButtonNew(&BUTTON_MINI_3, 0x18e, 0x12e, (int)nextEnabled))
        sel = 3;

    limeDrawFONT(GameFont, GameText(7), (float)FE_X(240.0f),
                 (float)FE_Y(294.0f), 1, FE_WidthScale, rowcol);

    y = 40;
    for (row = 0; row < 6; row++) {
        long idx = currentAchievementPage * 6 + row;

        if (idx <= 0x13) {
            long marker;
            float shade;

            if (achievementTracker[idx] != 0) {
                shade  = 1.0f;
                marker = 0x11;
            } else {
                shade  = 0.5f;
                marker = 0x10;
            }
            rowcol[0] = shade;
            rowcol[1] = shade;
            rowcol[2] = shade;

            limeDrawFONT(GameFont, GameText(marker),
                         (float)FE_X(460.0f), (float)FE_Y((float)y),
                         2, 1.0499999f * FE_WidthScale, rowcol);

            limeDrawFONT(GameFont, GameText(achievementsDescr[idx].id),
                         (float)FE_X(20.0f), (float)FE_Y((float)y),
                         0, 1.0499999f * FE_WidthScale, rowcol);

            limeDrawFONT(GameFont, GameText(achievementsDescr[idx].descr),
                         (float)FE_X(20.0f), (float)FE_Y((float)(y + 0x12)),
                         0, 0.80000001f * FE_WidthScale, rowcol);
        }
        y += 40;
    }

    /* The two arrows' labels, dimmed by the same number that disabled them. */
    {
        float shade = 1.0f / (float)nextEnabled;

        rowcol[0] = shade;
        rowcol[1] = shade;
        rowcol[2] = shade;
        limeDrawFONT(GameFont, GameText(8),
                     (float)(long)FE_X(398.0f), (float)(long)FE_Y(294.0f),
                     1, FE_WidthScale, rowcol);
    }
    {
        float shade = 1.0f / (float)prevEnabled;

        rowcol[0] = shade;
        rowcol[1] = shade;
        rowcol[2] = shade;
        limeDrawFONT(GameFont, GameText(0x12),
                     (float)FE_X(82.0f), (float)FE_Y(294.0f),
                     1, FE_WidthScale, rowcol);
    }

    if (nextEnabled == 1 && sel == 3) {
        currentAchievementPage += 1;
        puts("NEXT");
    } else if (prevEnabled == 1 && sel == 1) {
        currentAchievementPage -= 1;
        puts("PREV");
    } else if (sel == 2) {
        PopFETaskDeferred();
    }
}


/* ------------------------------------------------------------------ FE_Task_Stats
 *
 * armv7 0x0000e39c, 1336 bytes.  **Complete.**
 *
 * The statistics screen: two pages of seven rows, over the same two spotlights
 * `FE_Task_Karnage_Summary` draws.
 *
 * ### The completion percentage adds up to exactly 100
 *
 *      completion = 0
 *      for each of 10 TreasureGained[]      if set: += 3.7
 *      for each of 23 EndingsGained[]       if set: += 1.0   (and count them)
 *      for each of 20 achievementTracker[]  if set: += 2.0
 *      Stats[10] = min((long)completion, 100)
 *
 * 10 x 3.7 = 37, 23 x 1 = 23, 20 x 2 = 40. **Thirty-seven plus twenty-three
 * plus forty is one hundred**, so the clamp at the end can never fire on a
 * legitimate save -- the odd-looking 3.7 is exactly what makes ten treasures
 * carry 37% of the total. The clamp exists for a corrupt or hand-edited save,
 * not for the game.
 *
 * The treasure weight is a **double** in the constant pool and the running
 * total is a float, so each of the ten additions round-trips float -> double
 * -> float. The endings and achievements are added as plain floats. Three
 * different additions in one accumulator, which is the kind of thing that
 * makes an exact 100 worth checking rather than assuming.
 *
 * `Stats[9]` gets the endings count on the way past -- one loop doing two jobs.
 *
 * ### The favourite character is a linear max over 23 counters
 *
 *      Stats[11] = -1
 *      best = 0
 *      for (i = 0; i < 23; i++)
 *          if (Stats[15 + i] > best) { Stats[11] = i; best = Stats[15 + i]; }
 *
 * Strictly greater, so ties keep the earliest character, and a save with every
 * counter at zero leaves `Stats[11]` at **-1**, which row 11 below tests for.
 * The 23 counters start at `Stats + 0x3c` and are indexed into
 * `CharacterNames` -- so this is the per-character play count.
 *
 * ### The seven rows, and the four that are not just a number
 *
 *      row 11   "%s : %s"  or "%s :"    the favourite character, or nothing
 *      row 12   "%s : %d"  Stats[12] / Stats[14]
 *      row 13   "%s : %d"  Stats[13] / Stats[14]
 *      other    "%s : %d"  StatsNames[row] and Stats[row]
 *
 * Rows 12 and 13 are averages over the same denominator, and **both are
 * guarded**: a zero `Stats[14]` prints 0 rather than dividing. The division is
 * a call to `___divsi3` -- this binary has no hardware integer divide.
 *
 * Row 11 with `Stats[11] == -1` switches to a format with no value at all
 * (`"%s :"`), so a fresh save shows the label and an empty right-hand side
 * instead of a wrong name.
 *
 * ### The row Y cancels the page out of its own arithmetic
 *
 *      y = 32 - page * 168 + slot,   slot starting at (page * 7 + 1) * 24
 *                                    and stepping by 24
 *
 * `(page * 7 + 1) * 24` is `page * 168 + 24`, so the `- page * 168` deletes it
 * again and every page draws its rows at y = 56, 80, 104, ... The page term is
 * computed, carried through two multiplies and subtracted off. Transcribed as
 * written; a port can simply use `56 + 24 * row`.
 *
 * ### Two pages, toggled by XOR
 *
 *      if (DrawButtonNew(&BUTTON_NEXTSTATS, ...)) StatsPage ^= 1;
 *
 * so there is no clamping and no wrap logic -- there are exactly two pages by
 * construction, and the button is always live.
 */
/* `Stats` is read as words here; `STATW` (defined further up this file, byte
 * offset in, word out) is the spelling this file already uses for that. */

extern long  StatsNames[];              /* 0x00100fdc */
extern long  StatsPage;                 /* 0x00100fd8 */
extern long  EndingsGained[23];         /* 0x00101088 */
extern const char *CharacterNames[];    /* pointer slot -> 0x0014fe54 */
extern BUTTONNEW BUTTON_NEXTSTATS;      /* 0x001007f8 */

void FE_Task_Stats(void)
{
    float completion;
    long  best, endings;
    long  i, row, slot;

    /* --- the favourite character: index of the largest of 23 counters */
    STATW(0x2c) = -1;
    best = 0;
    for (i = 0; i < 23; i++) {
        if (STATW(0x3c + i * 4) > best) {
            STATW(0x2c) = i;
            best = STATW(0x3c + i * 4);
        }
    }

    /* --- the completion percentage */
    STATW(0x28) = 0;
    completion = 0.0f;
    for (i = 0; i < 10; i++)
        if (TreasureGained[i])
            completion = (float)((double)completion + 3.7);

    endings = 0;
    for (i = 0; i < 23; i++)
        if (EndingsGained[i]) {
            endings++;
            completion = completion + 1.0f;
        }
    STATW(0x24) = endings;

    for (i = 0; i < 20; i++)
        if (achievementTracker[i])
            completion = completion + 2.0f;

    STATW(0x28) = (long)completion;
    if (STATW(0x28) > 100)
        STATW(0x28) = 100;          /* unreachable on a sane save */

    /* --- the screen */
    limeDrawSprite((TEXTURE *)MetalScreenTexture, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 1.0f, col);

    limeEnableAlphaBlending_Additive();

    DrawAnimAsSprite(0, 0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     0, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1, col);

    DrawAnimAsSprite((long)((float)*limeScreenWidth
                            + -128.0f * FE_WidthScale),
                     0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     1, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1, col);

    limeEnableAlphaBlending_Basic();

    /* --- seven rows for this page */
    slot = (StatsPage * 7 + 1) * 24;

    for (row = StatsPage * 7; row < (StatsPage + 1) * 7; row++) {
        long y;

        if (row == 11) {
            if (STATW(0x2c) == -1)
                usprintf(strBuf, UC("%s :"),
                         GameTextNoHeader(StatsNames[11]));
            else
                usprintf(strBuf, UC("%s : %s"),
                         GameTextNoHeader(StatsNames[11]),
                         UC(CharacterNames[STATW(0x2c)]));
        } else if (row == 12) {
            long v = STATW(0x38) ? STATW(0x30) / STATW(0x38) : 0;

            usprintf(strBuf, UC("%s : %d"),
                     GameTextNoHeader(StatsNames[12]), v);
        } else if (row == 13) {
            long v = STATW(0x38) ? STATW(0x34) / STATW(0x38) : 0;

            usprintf(strBuf, UC("%s : %d"),
                     GameTextNoHeader(StatsNames[13]), v);
        } else {
            usprintf(strBuf, UC("%s : %d"),
                     GameTextNoHeader(StatsNames[row]), STATW(row * 4));
        }

        y = 32 - StatsPage * 168 + slot;
        slot += 24;

        limeDrawFONT(GameFont, limeUC(strBuf),
                     (float)(*limeScreenWidth / 2), (float)FE_Y((float)y),
                     1, FE_WidthScale, fontcol);
    }

    if (DrawButtonNew(&BUTTON_NEXTSTATS, 0x39, 0x130, 1))
        StatsPage ^= 1;

    limeDrawFONT(GameFont, GameText(8), (float)FE_X(57.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    if (DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1))
        PopFETaskDeferred();

    limeDrawFONT(GameFont, GameText(9), (float)FE_X(423.0f),
                 (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);
}


/* ----------------------------------------------------- FE_Task_Survival_Summary
 *
 * armv7 0x00010474, 1356 bytes.  **Complete.**
 *
 * The survival score screen. It is `FE_Task_Karnage_Summary` with a different
 * number and a different leaderboard key, and the two are worth reading
 * together -- the spotlights, the username handshake, the exit timeout and the
 * blinking wait message are all the same code written out twice.
 *
 *      Karnage    KarnageScore           key "shaokahn_med"
 *      Survival   DisplaySurvivalStage   key "survival_easy"
 *
 * ### Two singular/plural strings, chosen by stage == 1
 *
 *      stage == 1   GameTextNoHeader(0xb8) on screen, 0xba into the feed text
 *      otherwise    GameTextNoHeader(0xb9) on screen, 0xbb into the feed text
 *
 * A dedicated string for "1 round" against "%d rounds" -- four ids for what is
 * one sentence, which is what a language without a two-way plural needs.
 *
 * ### The title is the one Y on this screen that ignores FE_YOffset
 *
 *      y = 160.0f * FE_HeightScale        (the title)
 *      y = FE_Y(180.0f)                   (everything else)
 *
 * and `FE_Y(v)` is `v * FE_HeightScale + FE_YOffset`. So the title is placed
 * with the scale but **without the offset**, while the line directly under it
 * gets both. On a screen where `FE_YOffset` is zero the two agree; on a
 * letterboxed one the title sits twenty units too high relative to its own
 * subtitle. Transcribed as written -- a port that fixes it is changing the
 * layout, which is a decision, so it is flagged rather than silently repaired.
 *
 * ### A kilobyte of stack for a string nothing reads
 *
 *      sub.w sp, sp, #0x430
 *      usprintf(<sp+0x3c>, GameTextNoHeader(0xba or 0xbb), stage, stageAtEntry)
 *
 * The frame is 0x43c bytes and the buffer at `sp+0x3c` is about a kilobyte of
 * it. Nothing reads it back -- the same dead feed-post `FE_Task_Karnage_Summary`
 * carries, and see docs/GAME-BUGS.md. Here it also costs 1KB of stack on every
 * frame the screen is up.
 *
 * The two values handed to it are `DisplaySurvivalStage` read now and the same
 * global read in the function prologue. Nothing between the two reads writes
 * it, so they always agree; the second read exists because the compiler
 * spilled the prologue value and reloaded it.
 *
 * ### `feedPosted` is set only when the stage is not positive
 *
 *      if (DisplaySurvivalStage <= 0) feedPosted = 1;
 *
 * The opposite of `FE_Task_Karnage_Summary`, which sets it unconditionally.
 * With the posting code gone from both, the flag has no consistent meaning
 * left; it is recorded here because the inconsistency is itself the evidence
 * that the feature was removed piecemeal.
 *
 * ### The exit button's interactivity is the readiness flag
 *
 *      DrawButtonNew(&BUTTON_EXITBIG, 0x1a7, 0x130, ready)
 *
 * where Karnage passes a literal 1. And the "EXIT" label is drawn only when
 * `ready` is set, so while the leaderboard is still pending the button is
 * there, inert and unlabelled, with the blinking `GameText(0x13)` in the
 * middle of the screen instead.
 */
extern long DisplaySurvivalStage;       /* 0x000ff984 */

void FE_Task_Survival_Summary(void)
{
    char  feedText[0x400];              /* sp+0x3c, never read */
    long  stageAtEntry = DisplaySurvivalStage;
    long  ready, exiting;

    limeDrawSprite((TEXTURE *)MetalScreenTexture, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 1.0f, 1.0f, col);

    limeEnableAlphaBlending_Additive();

    DrawAnimAsSprite(0, 0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     0, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1, col);

    DrawAnimAsSprite((long)((float)*limeScreenWidth
                            + -128.0f * FE_WidthScale),
                     0, FE_WidthScale, 0x80,
                     0x80, (long)(uintptr_t)SpotlightTextures,
                     (const char *)&spotlight_SpriteDef, spotlight_Anim,
                     1, (long)*GameCounter,
                     0, spotlight_Anim[0] - 1, 1, col);

    limeEnableAlphaBlending_Basic();

    if (EASDK_ConnectedToNetwork() && Settings[8]) {
        EASOC_MayhemTest(1);
        if (EASOC_MayhemNeedsUserName()) {
            if (userNameEntryViewed == 0) {
                userNameEntryViewed = 1;
                PushFETaskDeferred(0x2e);
            } else if (userNameEntryViewed == 2) {
                printf("SUBMITTING NEW NAME: %s!\n", ourName);
                EASOC_MayhemSetUserName(ourName);
                userNameEntryViewed++;
            } else if (userNameEntryViewed == 3) {
                if (!EASOC_MayhemIsPending()) {
                    EASOC_MayhemReset();
                    userNameEntryViewed++;
                }
            }
        }
    }

    /* The title -- scaled but not offset; see the header. */
    limeDrawFONT(GameFont, GameText(0x5a),
                 (float)(*limeScreenWidth / 2), 160.0f * FE_HeightScale,
                 1, FE_WidthScale, fontcol);

    if (DisplaySurvivalStage == 1)
        usprintf(strBuf, GameTextNoHeader(0xb8), DisplaySurvivalStage);
    else
        usprintf(strBuf, GameTextNoHeader(0xb9), DisplaySurvivalStage);

    limeDrawFONT(GameFont, limeUC(strBuf),
                 (float)(*limeScreenWidth / 2), (float)FE_Y(180.0f),
                 1, FE_WidthScale, fontcol);

    if (DisplaySurvivalStage <= 0)
        feedPosted = 1;

    if (DisplaySurvivalStage == 1)
        usprintf(feedText, GameTextNoHeader(0xba),
                 DisplaySurvivalStage, stageAtEntry);
    else
        usprintf(feedText, GameTextNoHeader(0xbb),
                 DisplaySurvivalStage, stageAtEntry);

    ready = !EASDK_ConnectedToNetwork() || EASOC_MayhemIsReady();

    exiting = -1;

    if (!ready && exitTimeout > 0.0f) {
        exitTimeout = exitTimeout + -1.0f / limeFPSScaleFactor;
        if (exitTimeout < 0.0f)
            exitTimeout = 0.0f;

        {
            long t = (long)exitTimeout;

            if (t < 0x21c) {
                long corr = (t >> 31) >> 24;
                if ((((t + corr) & 0xff) - corr) > 0x80)
                    limeDrawFONT(GameFont, GameText(0x13),
                                 (float)(*limeScreenWidth / 2),
                                 (float)FE_Y(200.0f),
                                 1, FE_WidthScale, fontcol);
            }
        }
    } else {
        ready = 1;

        exiting = DrawButtonNew(&BUTTON_EXITBIG, 0x1a7, 0x130,
                                (int)ready) ? 0 : -1;

        limeDrawFONT(GameFont, GameText(9), (float)FE_X(423.0f),
                     (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);
    }

    if (FE_FadeAdd == 0.0f && exiting == 0) {
        PopAllFETasksDeferred(0);

        if (EASDK_ConnectedToNetwork() && Settings[8] && EASOC_MayhemIsReady())
            EASOC_MayhemPostStatWithData("survival_easy",
                                         DisplaySurvivalStage, stats, 0xc);
    }
}


/* ------------------------------------------------------- FE_Task_Character_Select
 *
 * armv7 0x0000ab54, 1152 bytes.  **Complete.**
 *
 * The character grid. `drawCharacterSelection(-1)` draws the portraits and does
 * the picking; this function is the frame around it -- the background, the
 * heading, Back, Play, and what each game mode does once a character is
 * confirmed.
 *
 * ### Three state words, and what each one means
 *
 *      CharacterSelected    the cell the finger is on, -1 for none
 *      CharacterConfirmed   the cell Play was pressed on, -1 for none
 *      opponentCharacter    the other player's, in mode 6 only
 *
 * Play is drawn only once `CharacterSelected != -1`, and in mode 6 only once
 * **both** it and `opponentCharacter` are set -- so the button appears when the
 * choice is complete rather than being drawn and disabled.
 *
 * Back is drawn only when `FE_TaskStackPointer > 0`: there is nothing to go back
 * to from the bottom of the stack, so the button is absent rather than inert.
 * Pressing it resets all three state words and `Character_SelectWait`.
 *
 * ### The background is one of a set, chosen elsewhere
 *
 *      limeDrawSprite(SelectBGTexture[BGRandomised], ...  0.9375f, 0.625f)
 *
 * `BGRandomised` indexes the array; nothing here picks it. The V range stops at
 * **0.625** and the U at 0.9375, so the art occupies five eighths of its
 * texture's height and fifteen sixteenths of its width -- not a power-of-two
 * fit, unlike the loading screen's clean 0.75.
 *
 * ### Confirming a character does something different in every mode
 *
 *      mode 0 (arcade)   if newGameFlag: Write_SaveData(); PopulateTower();
 *                        newGameFlag = 0
 *                        TowerState = -1; PushFETaskDeferred(0x1c)
 *      mode 3 (karnage)  Character2 = 0x19, start the fade
 *      mode 4 (survival) Character2 = TowerRand[abs(limeRand()) % 22],
 *                        start the fade
 *      mode 5            Character2 = 0x19, start the fade
 *      mode 6 (2 players) Character2 = opponentCharacter, start the fade
 *
 * **0x19 is the same opponent for karnage and mode 5** -- character 25, the
 * boss `PopulateTower` pins at the end of every ladder. Survival draws its
 * first opponent from `TowerRand`, the same 22-entry shuffle table `QuitAsWin`
 * redraws from after every survival win, with the same `abs()` before the
 * modulo.
 *
 * Arcade is the only mode that does not start a fade here: it pushes front-end
 * task 0x1c (the tower screen) instead, and `newGameFlag` decides whether the
 * ladder is rebuilt first. Committing the save **before** repopulating is the
 * order that makes an interrupted new game keep the old tower rather than half
 * of a new one.
 *
 * ### Once the fade has finished, the mode picks the next task
 *
 *      if (FE_FadeAdd == 0.0f && FE_Fade == 0.0f) {
 *          modes 3, 4, 5   CurrentTask = 4
 *          mode 6          LevelSelect = GetNextLevel(LevelSelect);
 *                          CurrentTask = 4;
 *                          log 0x7556 "2 Players on 1 iPad"
 *      }
 *
 * Only mode 6 advances the level. The other three go into the fight on whatever
 * `LevelSelect` already held, which is what makes the arena feel fixed in
 * karnage and survival and rotate in two-player.
 */
extern long  BGRandomised;              /* 0x000ff8b4 */
extern void *SelectBGTexture;           /* 0x00183f24, an ARRAY here */
extern long  Character_SelectWait;      /* 0x000ff8c8 */
extern long  newGameFlag;               /* 0x000ff850 */
extern long  TowerState;                /* 0x000ff9ac */
extern BUTTONNEW BUTTON_PLAY;           /* 0x001007e4 */

void EASDK_LogEventEnumEnumStringNum(long id, long a, const char *s,
                                     long b, long n);

void drawCharacterSelection(long sel);
int  GetNextLevel(int cur);

void FE_Task_Character_Select(void)
{
    long back = 0;

    limeEnableAlphaBlending_Basic();
    limeSet2DDrawing();

    limeDrawSprite((TEXTURE *)(&SelectBGTexture)[BGRandomised],
                   0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0f, 0.9375f, 0.625f, col);

    limeDrawFONT(GameFont, GameText(0x4a), (float)FE_X(240.0f),
                 (float)FE_Y(8.0f), 1, FE_WidthScale, fontcol);

    drawCharacterSelection(-1);

    if (FE_TaskStackPointer > 0) {
        back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);

        limeDrawFONT(GameFont, GameText(7), (float)FE_X(423.0f),
                     (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);

        if (back) {
            PopFETaskDeferred();
            Character_SelectWait = 0;
            CharacterConfirmed   = -1;
            CharacterSelected    = -1;
            opponentCharacter    = -1;
        }
    }

    /* The fade has finished AND the screen is black: hand over to the fight. */
    if (FE_FadeAdd == 0.0f && FE_Fade == 0.0f) {
        if (GameMode == 3 || GameMode == 4 || GameMode == 5) {
            CurrentTask = 4;
        } else if (GameMode == 6) {
            LevelSelect = GetNextLevel(LevelSelect);
            CurrentTask = 4;
            EASDK_LogEventEnumEnumStringNum(0x7556, 15,
                                            "2 Players on 1 iPad", 0, 0);
        }
    }

    if (GameMode == 6) {
        /* Both sides have to have chosen before Play appears. */
        if (CharacterSelected != -1 && opponentCharacter != -1) {
            if (DrawButtonNew(&BUTTON_PLAY, 0xf0, 0x130, 1))
                CharacterConfirmed = CharacterSelected;

            limeDrawFONT(GameFont, GameText(0xc), (float)FE_X(240.0f),
                         (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);
        }
    } else {
        if (CharacterSelected != -1) {
            if (DrawButtonNew(&BUTTON_PLAY, 0xf0, 0x130, 1))
                CharacterConfirmed = CharacterSelected;

            limeDrawFONT(GameFont, GameText(0xc), (float)FE_X(240.0f),
                         (float)FE_Y(296.0f), 1, FE_WidthScale, fontcol);
        }
    }

    if (CharacterConfirmed == -1)
        return;

    Character1 = CharacterConfirmed;

    if (GameMode == 0) {
        if (newGameFlag != 0) {
            Write_SaveData();
            PopulateTower();
            newGameFlag = 0;
        }
        TowerState = -1;
        PushFETaskDeferred(0x1c);
    }

    if (GameMode == 3) {
        FE_FadeAdd = -0.033333335f;
        Character2 = 0x19;
    } else if (GameMode == 4) {
        long r;

        FE_FadeAdd = -0.033333335f;
        r = limeRand();
        if (r < 0)
            r = -r;
        Character2 = TowerRand[r % 22];
    } else if (GameMode == 5) {
        FE_FadeAdd = -0.033333335f;
        Character2 = 0x19;
    } else if (GameMode == 6) {
        Character2 = opponentCharacter;
        FE_FadeAdd = -0.033333335f;
    }
}


/* ------------------------------------------------------- FE_Task_Button_Config
 *
 * armv7 0x000140c0, 1,304 bytes.  **Complete.**
 *
 * The controls screen: a half-size preview of the on-screen pad with four
 * toggle boxes around it, and a Back button that saves.
 *
 * ### It draws its background and then, sometimes, nothing else
 *
 * `ButtonEditMode` is checked **after** the background sprite goes out. When
 * the button editor is up this task still paints the page behind it every frame
 * and then returns, so the editor draws over a live background rather than a
 * frozen one.
 *
 * ### Four boxes, three settings and an editor
 *
 *      BOXLT (0x9c, 0x59)    Settings[4]   number of buttons, 5 or 6
 *      BOXRT (0x145, 0x59)   Settings[5]   preset layout or custom
 *      BOXLB (0x9c, 0xe0)    Settings[6]   button opacity, three steps
 *      BOXRB (0x145, 0xe0)   opens the button editor -- only when Settings[5]
 *
 * Every one is gated on `FE_FadeAdd == 0.0f`, so nothing responds mid-fade, and
 * the selection is remembered in one local that the tail acts on. The last box
 * exists only while `Settings[5]` is set: with a preset layout there is nothing
 * to edit, and the same flag also chooses which of two labels is drawn under
 * the heading and whether a fourth caption appears at all.
 *
 * ### Each setting wraps by clamping the ends, not by modulo
 *
 *      Settings[4]++;  if (n <= 4 || n > 6) n = 5;      two states, 5 and 6
 *      Settings[5]++;  if (n <  0 || n > 1) n = 0;      two states
 *      Settings[6]++;  if (n <  0 || n > 2) n = 0;      three states
 *
 * The `< 0` arms cannot fire from an increment; they are the compiler covering
 * the signed compare it was given. Written as they stand.
 *
 * ### Opacity is read here and applied to a single sample button
 *
 *      0 -> 0.5      1 -> 0.75      anything else -> 1.0
 *
 * -- the same three steps `DrawControlsPreview` applies to the whole pad, read
 * a second time here for the one 64x64 sample at (0x7c, 0xd0). That sample goes
 * through `drawSingleButton`, whose third argument this call site is the first
 * to pin down as a float.
 *
 * ### The preview's origin is computed backwards out of the scalers
 *
 *      DrawControlsPreview(-36, (long)(-40 - FE_YOffset / FE_HeightScale))
 *
 * so the y origin undoes the front end's vertical transform before the preview
 * applies it again: `FE_Y` will multiply by `FE_HeightScale` and add
 * `FE_YOffset`, and this pre-divides so the result lands 40 above the layout
 * origin whatever the screen. The x origin is a flat -36 with no such
 * correction, because `FE_X` has no offset term to undo.
 *
 * ### Entering the editor takes a snapshot first
 *
 * `PushFETaskDeferred(0x30)` is preceded by copying all three custom layouts
 * into their `Cancel...` twins, 0x78 bytes each, written as six rows of five
 * words rather than one flat copy. `FE_Task_Button_Edit` copies them back the
 * other way when its Cancel button is pressed -- the two halves of one undo.
 *
 * ### Back saves both files
 *
 * `Write_PresetButtonData()` then `Write_SettingsData()` then
 * `PopFETaskDeferred()`. The save happens on the way out and nowhere else, so a
 * setting changed and then backed out of by any other route is not persisted.
 */

#define BTNCFG_BUTTONS_LOW    5
#define BTNCFG_BUTTONS_HIGH   6
#define BTNCFG_TASK_EDIT      0x30
#define BTNCFG_LAYOUT_ROWS    0x78      /* six entries of five words */
#define BTNCFG_LAYOUT_ROW     0x14

extern BUTTONNEW BUTTON_BOXRT;          /* 0x0010049c */

void DrawControlsPreview(long originX, long originY);
void drawSingleButton(int x, int y, float alpha);

void FE_Task_Button_Config(void)
{
    long  sel = 0;
    long  back;
    long  row, k;
    float alpha;

    limeDrawSprite((TEXTURE *)*FEBackground, 0.0f, 0.0f,
                   (float)*limeScreenWidth, (float)*limeScreenHeight,
                   0.0f, 0.0234375f, 1.0f, 0.703125f, col);

    if (ButtonEditMode)
        return;                         /* the editor draws over this */

    if (DrawButtonNew(&BUTTON_BOXLT, 0x9c, 0x59, 1) && FE_FadeAdd == 0.0f)
        sel = 1;
    if (DrawButtonNew(&BUTTON_BOXRT, 0x145, 0x59, 1) && FE_FadeAdd == 0.0f)
        sel = 2;
    if (DrawButtonNew(&BUTTON_BOXLB, 0x9c, 0xe0, 1) && FE_FadeAdd == 0.0f)
        sel = 3;
    if (Settings[5] != 0
        && DrawButtonNew(&BUTTON_BOXRB, 0x145, 0xe0, 1) && FE_FadeAdd == 0.0f)
        sel = 4;

    DrawControlsPreview(-36, (long)(-40.0f - FE_YOffset / FE_HeightScale));

    limeDrawFONT(GameFont, GameText(0xe5),
                 FE_X(322.0f), FE_Y(72.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(Settings[5] ? 0x111 : 0x122),
                 FE_X(322.0f), FE_Y(88.0f), 1, FE_WidthScale, fontcol);
    limeDrawFONT(GameFont, GameText(0xe6),
                 FE_X(153.0f), FE_Y(184.0f), 1, FE_WidthScale, fontcol);

    if (Settings[6] == 0)
        alpha = 0.5f;
    else if (Settings[6] == 1)
        alpha = 0.75f;
    else
        alpha = 1.0f;
    drawSingleButton(0x7c, 0xd0, alpha);

    if (Settings[5] != 0)
        limeDrawFONT(GameFont, GameText(0x59),
                     FE_X(322.0f), FE_Y(216.0f), 1, FE_WidthScale, fontcol);

    back = DrawButtonNew(&BUTTON_BACK, 0x1a7, 0x130, 1);
    limeDrawFONT(GameFont, GameText(7),
                 FE_X(423.0f), FE_Y(296.0f), 1, FE_WidthScale, fontcol);

    switch (sel) {
    case 1:
        Settings[4]++;
        if (Settings[4] <= 4 || Settings[4] > BTNCFG_BUTTONS_HIGH)
            Settings[4] = BTNCFG_BUTTONS_LOW;
        break;
    case 2:
        Settings[5]++;
        if (Settings[5] < 0 || Settings[5] > 1)
            Settings[5] = 0;
        break;
    case 3:
        Settings[6]++;
        if (Settings[6] < 0 || Settings[6] > 2)
            Settings[6] = 0;
        break;
    case 4:
        /* snapshot all three layouts so the editor's Cancel can put them back */
        for (row = 0; row != BTNCFG_LAYOUT_ROWS; row += BTNCFG_LAYOUT_ROW)
            for (k = 0; k < BTNCFG_LAYOUT_ROW; k += 4) {
                *(long *)&CancelCustomButtonsPos4[row + k] =
                    *(const long *)&CustomButtonsPos4[row + k];
                *(long *)&CancelCustomButtonsPos5[row + k] =
                    *(const long *)&CustomButtonsPos5[row + k];
                *(long *)&CancelCustomButtonsPos6[row + k] =
                    *(const long *)&CustomButtonsPos6[row + k];
            }
        PushFETaskDeferred(BTNCFG_TASK_EDIT);
        break;
    default:
        break;
    }

    if (back) {
        Write_PresetButtonData();
        Write_SettingsData();
        PopFETaskDeferred();
    }
}
