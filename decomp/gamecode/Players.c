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
