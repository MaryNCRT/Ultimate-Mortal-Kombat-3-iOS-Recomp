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
