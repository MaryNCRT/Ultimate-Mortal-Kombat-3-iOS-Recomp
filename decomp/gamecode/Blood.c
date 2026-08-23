/*
 * Blood.c — src/gamecode/Blood.cpp
 *
 * Blood and the game-event pool that drives it. Hand-written from the
 * disassembly of the armv7 slice.
 */

#include <stdint.h>

/* `_GameEvents` — 0x00370e18.
 *
 * The size comes out of InitGameEvents itself rather than from a header: the
 * loop steps the byte cursor by 0x64 and stops at 0x640, which is sixteen
 * entries of a hundred bytes. Only the first word of each is cleared, so the
 * rest of an entry is left as it was and the first word is what marks a slot
 * free. What the other 96 bytes hold is not established here. */
#define GAME_EVENT_SLOTS   16
#define GAME_EVENT_STRIDE  0x64

typedef struct GAMEEVENT {
    int32_t active;                     /* 0x00  the only field this file touches */
    uint8_t rest[GAME_EVENT_STRIDE - 4];
} GAMEEVENT;

extern GAMEEVENT GameEvents[GAME_EVENT_SLOTS];      /* 0x00370e18 */


/* ------------------------------------------------------------ InitGameEvents
 *
 * armv7 0x00072f30, 32 bytes.  **Complete.**
 *
 *      str  r2, [r3]               <- slot 0, before the loop
 *      loop:
 *      str  r2, [r1, r3]           <- r1 = 0x64, 0xc8, ... base-relative
 *      adds r1, #0x64
 *      cmp  r1, #0x640
 *      bne  loop
 *
 * Slot zero is written outside the loop and the loop starts at 0x64, so all
 * sixteen are cleared exactly once. The compiler peeled the first iteration
 * because the cursor is used as the loop counter and starting it at zero would
 * have cost a separate compare.
 *
 * **It clears one word per entry, not the entry.** A port that memsets the
 * whole array is doing more than the original and would wipe fields the game
 * expects to survive an init.
 */
void InitGameEvents(void)
{
    int i;

    for (i = 0; i < GAME_EVENT_SLOTS; i++)
        GameEvents[i].active = 0;
}
