/*
 * Players.c — src/gamecode/Players.cpp
 *
 * 28 functions in the original. Verified against the oracle by
 * tests/test_gamecode2_diff.c.
 */

#include <stdint.h>

typedef struct TEXTURE TEXTURE;
void limeDeleteTexture(TEXTURE *tex);

/* Only the one field this file touches is named. */
typedef struct PLAYER {
    uint8_t  _pad000[0x530];
    TEXTURE *altCostume;         /* 0x530 */
} PLAYER;

void DumpAltCostume(PLAYER *p);


/* ----------------------------------------------------------- DumpAltCostume
 *
 * armv7 0x0005bef0, 24 bytes.
 *
 * Frees the alternate-costume texture and clears the pointer. The clear is
 * inside the guard, so a player who never had one is left alone rather than
 * written to -- and a second call after the first is a no-op rather than a
 * double free. Both of those fall out of `cbz` skipping the store as well as
 * the call, which is easy to lose when the guard is rewritten as an early
 * return.
 */
void DumpAltCostume(PLAYER *p)
{
    if (p->altCostume != NULL) {
        limeDeleteTexture(p->altCostume);
        p->altCostume = NULL;
    }
}


/* Declared here rather than pulled from a header gamecode does not have. */
extern long WantedFrames[];             /* 0x00295cd4, terminated by -1 */
int printf(const char *fmt, ...);


/* --------------------------------------------------------------------- Error
 *
 * armv7 0x0005c334, 20 bytes.  **Complete.**
 *
 *      mov r1, r0
 *      ldr r0, ="!!!!! FATAL ERROR: %s\n"
 *      blx _printf
 *      b   .                       <- 0x5c342 branches to ITSELF
 *
 * **It does not return, and it does not exit.** The last instruction is a
 * branch to its own address: a deliberate hang, with the message already
 * printed. On a 2011 iPhone that is a frozen screen and a watchdog kill, which
 * is a reasonable thing to do when there is no console to read.
 *
 * A port must not quietly turn this into a return. Anything calling Error()
 * has decided the process is finished, and callers are written on that
 * assumption -- there is no error path after the call because the original
 * never comes back from it.
 */
void Error(const char *msg)
{
    printf("!!!!! FATAL ERROR: %s\n", msg);
    for (;;)
        ;                           /* b 0x5c342 -- the branch is to itself */
}


/* ------------------------------------------------------------- WantThisFrame
 *
 * armv7 0x0005b9b4, 40 bytes.  **Complete.**
 *
 * Linear search of `_WantedFrames` for `frame`, with -1 ending the list.
 * Returns 1 on a hit and 0 otherwise.
 *
 * The disassembly reads oddly because the compiler peeled the first iteration:
 * the entry test loads [r2] and jumps straight into the comparison, and only
 * the loop body advances by 4 and re-checks for the terminator. Written as a
 * plain loop below, which is the same thing.
 */
int WantThisFrame(long frame)
{
    long i;

    for (i = 0; WantedFrames[i] != -1; i++)
        if (WantedFrames[i] == frame)
            return 1;
    return 0;
}


/* ----------------------------------------------------------- IsOstrichProblem
 *
 * armv7 0x0005bb1c, 40 bytes.  **Complete.**
 *
 *      ldr  r3, [r0]
 *      cmp  r3, #0xc               <- character 12 and no other
 *      bne  return 0
 *      ldr  r3, [r0, #0x51c]
 *      movw r2, #0x127             <- 295
 *      cmp  r3, r2
 *      beq  return 1
 *      ldr  r0, [r0, #0x520]
 *      cmp  r0, r2
 *      -> r0 = (equal)
 *
 * Character 12 with either of two adjacent fields equal to 295. The name is the
 * developers': something about that character's animation misbehaves and this
 * is the test that spots it. Which character 12 is, and what 295 indexes, are
 * not established here -- the shape of the test is, and inventing names for the
 * two fields would be inventing the finding.
 */
int IsOstrichProblem(PLAYER *p)
{
    const long *w = (const long *)p;

    if (w[0] != 12)
        return 0;
    if (w[0x51c / 4] == 295)
        return 1;
    return w[0x520 / 4] == 295;
}


/* `_FrameRemapTable` — 0x002003d4. Pairs of words, and the loop below gives its
 * length: it runs from the base to base + 0xe268 in steps of 8, so 7,245
 * entries of two words. */
#define FRAME_REMAP_ENTRIES  7245

extern long FrameRemapTable[FRAME_REMAP_ENTRIES][2];    /* 0x002003d4 */


/* ------------------------------------------------------- ClearAnimRemapTables
 *
 * armv7 0x0005b8dc, 40 bytes.  **Complete.**
 *
 *      movs r3, #0
 *      str  r3, [r2, #-0x8]        <- first word: 0
 *      subs r3, #1
 *      str  r3, [r2, #-0x4]        <- second word: -1
 *      adds r2, #8
 *
 * **The two words are cleared to different values**, and that is the point: 0
 * in the first and -1 in the second. `subs r3, #1` on a register holding zero
 * is how the compiler produced the -1 without a second literal, which is easy
 * to read past.
 *
 * A memset would put zero in both and quietly change what an empty entry means.
 */
void ClearAnimRemapTables(void)
{
    int i;

    for (i = 0; i < FRAME_REMAP_ENTRIES; i++) {
        FrameRemapTable[i][0] = 0;
        FrameRemapTable[i][1] = -1;
    }
}


typedef int EPLAYER;
typedef struct FRONTEND_CHARACTER FRONTEND_CHARACTER;
void Preload1Character(EPLAYER who, FRONTEND_CHARACTER *fe, long a, long b);


/* ------------------------------------------------------ PreloadGameCharacters
 *
 * armv7 0x0005ce74, 40 bytes.  **Complete.**
 *
 * Walks a -1 terminated list of player ids and preloads each one, passing NULL
 * for the front-end character and 0 for the third argument, with the caller's
 * argument going through unchanged as the fourth.
 *
 * `ldr r0, [r4, #4]!` is the advance: pre-indexed with writeback, so the
 * terminator check at the bottom sees the NEXT entry and the loop needs no
 * separate increment.
 */
void PreloadGameCharacters(const EPLAYER *list, long arg)
{
    long i;

    for (i = 0; list[i] != -1; i++)
        Preload1Character(list[i], 0, 0, arg);
}


#define FE_CHARACTER_SLOTS  25
#define FE_CHARACTER_STRIDE 0x668

typedef struct ANIMATEDCHARACTER ANIMATEDCHARACTER;
void FreeAnimatedCharacter(ANIMATEDCHARACTER *c);
void LIME_FreeScene(void *scene);

extern char TheFECharacters[FE_CHARACTER_SLOTS][FE_CHARACTER_STRIDE];  /* 0x0020e634 */


/* ------------------------------------------------------ FreeFrontEndCharacters
 *
 * armv7 0x0005bff8, 60 bytes.  **Complete.**
 *
 * Twenty-five slots of 0x668 bytes -- the loop runs from the base to base +
 * 0xa028 in steps of 0x668, which is where both numbers come from.
 *
 * Per slot, the character pointer lives at +4:
 *
 *      if (!c) continue
 *      if (c->scene) { LIME_FreeScene(c->scene); c->scene = 0; }
 *      FreeAnimatedCharacter(c)
 *
 * **The pointer is re-read from the slot after the scene is freed** (`ldr r2,
 * [r4, #4]` and again `ldr r0, [r4, #4]`), rather than being kept in a
 * register across the call. Transcribed as written: LIME_FreeScene taking a
 * path that could touch the slot is not something this function assumes it
 * cannot.
 */
void FreeFrontEndCharacters(void)
{
    int i;

    for (i = 0; i < FE_CHARACTER_SLOTS; i++) {
        void **slot = (void **)(TheFECharacters[i] + 4);
        void **c = (void **)*slot;

        if (c == 0)
            continue;

        if (c[0x10 / 4] != 0) {
            LIME_FreeScene(c[0x10 / 4]);
            ((void **)*slot)[0x10 / 4] = 0;
        }
        FreeAnimatedCharacter((ANIMATEDCHARACTER *)*slot);
    }
}


typedef struct PLAYERDEF PLAYERDEF;
void Load1Character(PLAYER *p, EPLAYER who, FRONTEND_CHARACTER *fe, long a, long b);


/* ---------------------------------------------------------- LoadGameCharacter
 *
 * armv7 0x0005cd70, 48 bytes.  **Complete.**
 *
 *      Load1Character(p, def[0], fe, 0, arg)
 *      p->[0x5e8] = 0
 *      p->[0]     = def[0]
 *      p->[0x5ec] = -1
 *      p->[0x530] = 0
 *
 * **`def[0]` is re-read from memory after the call** rather than kept in a
 * register, so Load1Character is allowed to change it and the value stored into
 * the player is whatever it holds afterwards. Caching it would be a different
 * program.
 *
 * +0x5ec starts at -1, the same "nobody" sentinel GameCodeInit uses for the
 * camera. +0x530 is the alt-costume texture DumpAltCostume frees, cleared here
 * so a freshly loaded character never inherits the previous one's.
 */
void LoadGameCharacter(PLAYER *p, PLAYERDEF *def, FRONTEND_CHARACTER *fe,
                       long arg)
{
    long *pw = (long *)p;
    const long *dw = (const long *)def;

    Load1Character(p, (EPLAYER)dw[0], fe, 0, arg);

    pw[0x5e8 / 4] = 0;
    pw[0]         = dw[0];          /* re-read, not cached across the call */
    pw[0x5ec / 4] = -1;
    pw[0x530 / 4] = 0;              /* the alt costume DumpAltCostume frees */
}


#define PRELOAD_STRIDE 0x5f4

extern int  NumPreloadedCharacters;     /* 0x00171358 */
extern char PreloadedCharacters[][PRELOAD_STRIDE];  /* 0x0028bc10 */
int IsAFrameVisible(ANIMATEDCHARACTER *c, long frame);


/* -------------------------------------------------------------- IsFrameVisible
 *
 * armv7 0x0005ba54, 68 bytes.  **Complete.**
 *
 *      if (c->field8 == 12 && (a == 295 || b == 295))
 *          return 0
 *      return IsAFrameVisible(c, b) | IsAFrameVisible(c, a)
 *
 * **The same 12 and 295 that IsOstrichProblem tests**, in a different file and
 * for a different purpose: that one asks whether a player is in the broken
 * state, this one refuses to draw the frame. Two functions independently
 * special-casing the same character and the same id says 295 is a real frame
 * that character 12 must not show, not a coincidence of constants.
 *
 * Note the argument order in the tail call: `b` is tested first, then `a`. The
 * OR makes it irrelevant to the result and it is transcribed as written.
 */
int IsFrameVisible(ANIMATEDCHARACTER *c, long a, long b)
{
    if (((const long *)c)[2] == 12 && (a == 295 || b == 295))
        return 0;

    return IsAFrameVisible(c, b) | IsAFrameVisible(c, a);
}


/* ------------------------------------------------- FreePreloadedCharacters
 *
 * armv7 0x0005c038, 56 bytes.  **Complete.**
 *
 * Frees the character at +8 of each of `NumPreloadedCharacters` slots, stride
 * 0x5f4, then zeroes the count.
 *
 * **The count is re-read from memory every iteration** (`mov r3, r6; add r3,
 * pc; ldr r3, [r3]`) rather than held in a register, so FreeAnimatedCharacter
 * is allowed to change it and the loop would notice. Hoisting it is the obvious
 * optimisation and it is a different program.
 */
void FreePreloadedCharacters(void)
{
    int i;

    if (NumPreloadedCharacters == 0)
        return;

    for (i = 0; i != NumPreloadedCharacters; i++)
        FreeAnimatedCharacter(*(ANIMATEDCHARACTER **)
                              (PreloadedCharacters[i] + 8));

    NumPreloadedCharacters = 0;
}


/* --------------------------------------------------- HavePreloadedCharacter
 *
 * armv7 0x0005b90c, 84 bytes.  **Complete.**
 *
 * Linear search of the preloaded slots for one whose first word is `who`,
 * returning the ANIMATEDCHARACTER at +8 of that slot, or NULL.
 *
 * The stride is built out of shifts rather than a multiply: `i*12`, then
 * `(i*12) << 7` for `i*1536`, then a subtract for `i*1524` -- 0x5f4, the same
 * stride FreePreloadedCharacters walks.
 *
 * The compiler peeled the first comparison, which is why slot 0 is tested
 * before the loop and the loop body starts at slot 1.
 */
ANIMATEDCHARACTER *HavePreloadedCharacter(EPLAYER who)
{
    int i;

    for (i = 0; i < NumPreloadedCharacters; i++)
        if (*(const long *)PreloadedCharacters[i] == (long)who)
            return *(ANIMATEDCHARACTER **)(PreloadedCharacters[i] + 8);

    return 0;
}


#define PLAYER_STRIDE  0x5f0

extern ANIMATEDCHARACTER *OrigLoadedPlayers[2];  /* 0x00295ccc */
extern char Players[];                           /* 0x001fa4d4 */


/* --------------------------------------------------------- FreeLevelCharacters
 *
 * armv7 0x0005c080, 68 bytes.  **Complete.**
 *
 *      FreePreloadedCharacters()
 *      if (OrigLoadedPlayers[0]) FreeAnimatedCharacter(it)
 *      if (OrigLoadedPlayers[1]) FreeAnimatedCharacter(it)
 *      OrigLoadedPlayers[1] = 0
 *      OrigLoadedPlayers[0] = 0                <- cleared in that order
 *      if (Players[0xb20]) DumpAltCostume(&Players[0x5f0])
 *
 * **The last test cross-checks two numbers from elsewhere in the file.** It
 * reads `Players + 0xb20` and, if set, calls DumpAltCostume on `Players +
 * 0x5f0`. 0xb20 - 0x5f0 = 0x530, which is exactly the field LoadGameCharacter
 * clears and DumpAltCostume frees. So the PLAYER stride is 0x5f0 and the alt
 * costume lives at +0x530 -- three functions in agreement, none of which
 * mentions the other.
 *
 * Only player TWO is checked. Player one's alt costume is not dumped here.
 */
void FreeLevelCharacters(void)
{
    FreePreloadedCharacters();

    if (OrigLoadedPlayers[0])
        FreeAnimatedCharacter(OrigLoadedPlayers[0]);
    if (OrigLoadedPlayers[1])
        FreeAnimatedCharacter(OrigLoadedPlayers[1]);

    OrigLoadedPlayers[1] = 0;
    OrigLoadedPlayers[0] = 0;

    /* player two only: 0x5f0 + 0x530 = 0xb20 */
    if (*(const long *)(Players + PLAYER_STRIDE + 0x530) != 0)
        DumpAltCostume((PLAYER *)(Players + PLAYER_STRIDE));
}


extern int *DoIntroPtr;                 /* pointer slot -> 0x0014e1c0 */
extern int *CurrentTaskPtr;             /* pointer slot -> 0x00150590 */


/* ------------------------------------------------------------- IsLiaProblem
 *
 * armv7 0x0005ba98, 132 bytes.  **Complete.**
 *
 *      if (DoIntro)          return 0
 *      if (CurrentTask == 3) return 0
 *      if (p->field00 != 6)  return 0
 *      return  p->field51c is one of {0xf1, 0x101, 0x105, 0xf8, 0xf9}
 *           || p->field520 is one of the same five
 *
 * **The same shape as IsOstrichProblem, one character over.** That one tests
 * character 12 against a single id; this tests character 6 against five, in the
 * same two adjacent fields at +0x51c and +0x520, and IsFrameVisible tests the
 * pair again from a third file. Four functions, three files, one pattern: a
 * character id plus an animation id, checked in two neighbouring slots.
 *
 * The two extra guards are this one's own. It gives up during the intro and
 * during task 3, so whatever "the Lia problem" is, it is a fight-time artefact
 * and the code that asks about it runs in both places.
 *
 * The compiler built each set of comparisons as `ite` pairs OR-ed together
 * rather than a switch, which is why the disassembly reads as arithmetic.
 */
int IsLiaProblem(PLAYER *p)
{
    const long *w = (const long *)p;
    long a, b;

    if (*DoIntroPtr != 0)
        return 0;
    if (*CurrentTaskPtr == 3)
        return 0;
    if (w[0] != 6)
        return 0;

    a = w[0x51c / 4];
    if (a == 0xf1 || a == 0x105 || a == 0xf8 || a == 0xf9 || a == 0x101)
        return 1;

    b = w[0x520 / 4];
    return (b == 0xf1 || b == 0x105 || b == 0xf8 || b == 0xf9 || b == 0x101);
}
