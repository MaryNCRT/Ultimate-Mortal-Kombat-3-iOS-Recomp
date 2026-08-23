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
