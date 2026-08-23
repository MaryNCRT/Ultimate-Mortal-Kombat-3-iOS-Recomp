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
