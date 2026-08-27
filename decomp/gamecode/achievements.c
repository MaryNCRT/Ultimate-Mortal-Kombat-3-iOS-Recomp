/*
 * achievements.c — src/gamecode/achievements.cpp
 *
 * Twelve functions in the original. Verified against the oracle by
 * tests/test_gamecode3_diff.c.
 */

#include <stdint.h>

/* **Twenty-four entries, bounded by the symbol table.**
 *
 * This said twenty, honestly labelled as "as far as this function reaches":
 * areAchievementsViewing's loop runs while the byte cursor is not 0x50, which
 * is 20 words, and that is a lower bound rather than a size.
 *
 * achievementsIncreaseSubzeroXerox reaches `[r2, #0x5c]` -- index 23 -- and the
 * compiler caught the contradiction at -Wextra as soon as it was written. The
 * real bound is in the symbol table: `_achievementTracker` sits at 0x00379c60
 * and the next symbol, `_SceneEvents`, at 0x00379cc0, so the block is 96 bytes,
 * 24 words, and index 23 is its last slot exactly.
 *
 * Nothing here says what an entry means, only that 1 is the value being counted
 * and that slot 23 counts Sub-Zero's clones. */
#define ACHIEVEMENT_SLOTS 24

extern int achievementTracker[ACHIEVEMENT_SLOTS];   /* 0x00379c60 */

int areAchievementsViewing(void);


/* -------------------------------------------------- areAchievementsViewing
 *
 * armv7 0x000a02ac, 32 bytes.
 *
 *      movs r0, #0 ; mov r2, r0
 *  L:  mov  r3, r1 ; add r3, pc ; ldr r3, [r2, r3]
 *      cmp  r3, #1 ; it eq ; addeq r0, #1
 *      adds r2, #4 ; cmp r2, #0x50 ; bne L
 *
 * **It returns a COUNT, not a boolean**, despite the name. Every slot equal to
 * exactly 1 adds one to the total, so a caller writing
 * `if (areAchievementsViewing())` gets the right answer by accident and a
 * caller comparing it against 1 does not.
 *
 * Equal to 1, not non-zero. Whatever other values a slot can hold are not
 * counted, which is the difference between "how many are in this state" and
 * "how many are set".
 *
 * The base address is recomputed inside the loop from a register the compiler
 * loaded once -- `mov r3, r1 ; add r3, pc`. That is the one shape
 * `tools/annotate.py` documents as its gap, so 0x00379c60 was resolved by
 * hand: 0x002d99a8 + 0x000a02b8.
 *
 * Another `it eq`, so another check that the IT-block flag fix holds.
 */
int areAchievementsViewing(void)
{
    int count = 0;
    int i;

    for (i = 0; i < ACHIEVEMENT_SLOTS; i++) {
        if (achievementTracker[i] == 1)
            count++;
    }
    return count;
}


void achievementsUnlock(int id);


/* ------------------------------------------ achievementsIncreaseSubzeroXerox
 *
 * armv7 0x000a08dc, 32 bytes.  **Complete.**
 *
 *      ldr  r3, [r2, #0x5c]
 *      adds r3, #1
 *      cmp  r3, #0x63              <- 99
 *      str  r3, [r2, #0x5c]        <- stored BEFORE the branch
 *      ble  out
 *      movs r0, #0x12              <- achievement 18
 *      bl   _achievementsUnlock
 *
 * The counter is written back whether or not the threshold is crossed, and the
 * comparison is `> 99`, so the unlock fires on the hundredth and on every one
 * after it. That is not a bug to tidy: achievementsUnlock is idempotent for an
 * already-unlocked id everywhere else in this file, and a port that fires it
 * only once would differ on a reset save.
 *
 * "Xerox" is Sub-Zero's clone move. Field 0x5c of the tracker counts them.
 */
void achievementsIncreaseSubzeroXerox(void)
{
    achievementTracker[0x5c / 4]++;
    if (achievementTracker[0x5c / 4] > 99)
        achievementsUnlock(0x12);
}


/* --------------------------------------------------------- achievementsReset
 *
 * armv7 0x000a0280, 40 bytes.  **Complete.**
 *
 * Zeroes the whole tracker: `[+0]`, then a loop from `+4` to `+0x4c`, then four
 * unrolled stores at `+0x50`, `+0x54`, `+0x58` and `+0x5c`.
 *
 * **That last store is an independent confirmation of the array's size.** The
 * bound came from the symbol table -- `_achievementTracker` at 0x00379c60 and
 * `_SceneEvents` at 0x00379cc0, so 96 bytes -- and this function clears exactly
 * 0x00 through 0x5c and stops. Twenty-four words, from a completely different
 * direction, agreeing to the word.
 */
void achievementsReset(void)
{
    int i;

    for (i = 0; i < ACHIEVEMENT_SLOTS; i++)
        achievementTracker[i] = 0;
}


/* ------------------------------------------- achievementsIncreaseMatchesWon
 *
 * armv7 0x000a08fc, 44 bytes.  **Complete.**
 *
 *      ldr  r3, [r2, #0x50]
 *      adds r3, #1
 *      cmp  r3, #0xa
 *      str  r3, [r2, #0x50]
 *      beq  unlock 7
 *      cmp  r3, #0x64
 *      beq  unlock 8
 *
 * **Exact equality, where achievementsIncreaseSubzeroXerox uses `>`.** These
 * two fire once each, on the tenth win and the hundredth; the Xerox one fires
 * on the hundredth and on every clone after it. Both are transcribed as
 * written -- the difference is in the original and a port that normalises them
 * to one style changes one of the two.
 *
 * Ten wins is achievement 7, a hundred is 8. Slot 0x50 counts matches won.
 */
void achievementsIncreaseMatchesWon(void)
{
    int n = ++achievementTracker[0x50 / 4];

    if (n == 10)
        achievementsUnlock(7);
    else if (n == 100)
        achievementsUnlock(8);
}


/* --------------------------------------------------------------- getLayoutName
 *
 * armv7 0x000a0234, 48 bytes.  **Complete.**
 *
 * Six strings from two arguments: the button count picks 4, 5 or anything else
 * (which means 6), and the flag picks CUSTOM or PRESET.
 *
 * The default is SIX, not an error -- `cmp 4 / cmp 5 / fall through` -- so a
 * count of 7 returns the six-button name. Transcribed as written; validating
 * the count here would reject inputs the original accepts.
 */
const char *getLayoutName(int buttons, int custom)
{
    if (buttons == 4)
        return custom ? "CUSTOM_LAYOUT_4_BUTTONS" : "PRESET_LAYOUT_4_BUTTONS";
    if (buttons == 5)
        return custom ? "CUSTOM_LAYOUT_5_BUTTONS" : "PRESET_LAYOUT_5_BUTTONS";
    return custom ? "CUSTOM_LAYOUT_6_BUTTONS" : "PRESET_LAYOUT_6_BUTTONS";
}


extern short *H;                        /* pointer slot -> 0x0038c674 */
extern int   *theKode;                  /* pointer slot -> 0x0010ded0 */


/* ------------------------------------------------------ preprocessPostloadKode
 *
 * armv7 0x000a02cc, 56 bytes.  **Complete.**
 *
 * Clears three HALFWORDS in `H` -- +0x18, +0x1a and +0x1c -- and then sets
 * exactly one of them from the active kode:
 *
 *      kode == 2     -> +0x18
 *      kode == 0x12  -> +0x1a
 *      kode == 0     -> +0x1c
 *      anything else -> none of them
 *
 * **Zero is a kode, not the absence of one.** The `cbnz r3` at the end returns
 * without setting anything for any value other than 0, 2 and 0x12, so kode 0
 * has its own flag rather than meaning "no kode selected". A port that treats 0
 * as empty loses whatever +0x1c enables.
 *
 * The clear order is +0x18, +0x1c, +0x1a -- not sequential. It makes no
 * difference and it is transcribed as written.
 */
void preprocessPostloadKode(void)
{
    int kode;

    H[0x18 / 2] = 0;
    H[0x1c / 2] = 0;
    H[0x1a / 2] = 0;

    kode = *theKode;
    if (kode == 2)
        H[0x18 / 2] = 1;
    else if (kode == 0x12)
        H[0x1a / 2] = 1;
    else if (kode == 0)
        H[0x1c / 2] = 1;
}
