/*
 * achievements.c — src/gamecode/achievements.cpp
 *
 * Twelve functions in the original. Verified against the oracle by
 * tests/test_gamecode3_diff.c.
 */

#include <stdint.h>

/* Twenty entries, as far as this function reaches: the loop runs while the
 * byte cursor is not 0x50, which is 20 words. Nothing here says what an entry
 * means, only that 1 is the value being counted. */
#define ACHIEVEMENT_SLOTS 20

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
