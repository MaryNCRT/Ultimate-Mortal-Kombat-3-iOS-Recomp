/*
 * mkrepell.c -- gamecode/logic/mkrepell.c, decompiled.
 *
 * One function, 440 bytes, and it is the whole file. `DisplayUpdate` calls it
 * first, before gravity and before the walls, so whatever it does to the two
 * fighters' velocities is what gravity and the arena then correct.
 *
 * ## It is TWO rules, not one
 *
 * The name says repel and the file does repel -- but that is only half of it,
 * and the halves are at opposite ends of the same measurement:
 *
 *      |dx| <= 0x3c    PUSH APART at 3.0 units a frame
 *      |dx| >  0x130   PULL TOGETHER by half the excess
 *
 * So the two fighters are held in a band between 60 and 304 units of each
 * other. The push is a velocity; the pull moves the positions directly.
 *
 * **The pull is what keeps a two-player fight on one screen.** Neither fighter
 * can walk away: past 304 units the excess is halved out of the gap every
 * frame, both of them moving, so the pair converges rather than one being
 * dragged. That is why the arena can be 1,394 units wide and the camera never
 * has to choose whom to follow.
 *
 * Between the two bounds the routine does nothing to the positions at all, and
 * only arbitrates the velocities.
 *
 * ## G's fighter stride, confirmed
 *
 * The two velocities it arbitrates are `G[0xb8]` and `G[0x210]`, and
 * **0x210 - 0xb8 = 0x158**, which is `G_FIGHTER_STRIDE` exactly. mk3logic.h
 * derived that stride from elsewhere and noted that the base of the per-fighter
 * block was unknown; this is a second sighting of the same spacing, from a
 * different function, on a different field.
 *
 * ## The escape hatch, again
 *
 * Bit 10 of a GrObj's 0x30 turns the pull off for either fighter -- the same
 * bit `gravity_n_bounds` reads to turn the arena walls off. One flag means
 * "this object is not subject to the arena", and it covers the walls and the
 * leash together. A pit fall needs both.
 *
 * ## What is not settled
 *
 * `G + 0x456` is a halfword counted down here and nowhere else that has been
 * read. While it is non-zero the velocity arbitration is skipped entirely --
 * every path that tests it takes the other branch -- so it is a "leave them
 * alone for N frames" timer. What sets it is unknown.
 *
 * `Pp[n] + 0x40` is compared against each fighter's y. It gates which of the
 * two vertical tests applies, so it is a height threshold per fighter, but no
 * writer has been read.
 */

#include "mk3logic.h"

/* The two GrObj records, reached the way the binary reaches them: one base
 * pointer and an offset of GROBJ_STRIDE for the second. Every constant below
 * is the binary's own -- 0x5a is 0x4c + 0x0e, 0x8c is 0x4c + 0x40, and so on.
 */
#define P_XI   0x0e             /* x, integer half, signed */
#define P_YI   0x12             /* y, integer half, signed */
#define P_VX   0x18             /* x velocity */
#define P_TOP  0x38             /* the bounding box, per mk3logic.h */
#define P_BOT  0x40
#define P_FLG  0x30             /* bit 10: not subject to the arena */

#define NEAR_GAP   0x3c         /* closer than this and they are pushed apart */
#define FAR_GAP   0x130         /* further than this and they are pulled in */
#define PUSH_VEL  0x30000       /* 3.0 in 16.16 */

extern char *GrObj;             /* slot 0x000f320c -> 0x0038c698 */
extern char *Pp;                /* slot 0x000f3158 -> 0x0038dc9c */

void repell_func(void)
{
    char *g   = G_BYTES;
    char *pl0 = GrObj;
    char *pl1 = GrObj + GROBJ_STRIDE;

    long  hold;                 /* G[0x456], counted down */
    long  x1, x2, y1, y2, dx, adx;
    long  vx1, vx2, excess;
    long  shift;

    /* The hold timer. Decremented only when it is already non-zero, so it
     * stops at 0 rather than wrapping. */
    hold = (int16_t)*(uint16_t *)(void *)(g + 0x456);
    if (*(uint16_t *)(void *)(g + 0x456) != 0) {
        hold -= 1;
        *(uint16_t *)(void *)(g + 0x456) = (uint16_t)hold;
    }

    x1  = *(int16_t *)(void *)(pl0 + P_XI);
    x2  = *(int16_t *)(void *)(pl1 + P_XI);
    y1  = *(int16_t *)(void *)(pl0 + P_YI);
    y2  = *(int16_t *)(void *)(pl1 + P_YI);

    dx  = x2 - x1;
    adx = dx < 0 ? -dx : dx;    /* the eor/sub asr#31 pair */

    /* Do the two fighters overlap vertically? Two tests, one per ordering, and
     * which one applies is decided by each fighter's own Pp + 0x40. */
    if ((*(long *)(void *)(pl0 + P_BOT) - 0x30) + y1
            < *(long *)(void *)(pl1 + P_TOP) + y2) {
        if (y1 < *(long *)(void *)(Pp + 0x40))
            goto setup;
    } else if (y1 + *(long *)(void *)(pl0 + P_TOP)
                   <= (*(long *)(void *)(pl1 + P_BOT) - 0x30) + y2) {
        if (hold == 0)
            goto apart;
        goto arbitrate_1;
    } else if (y2 < *(long *)(void *)(Pp + PP_STRIDE + 0x40)) {
        goto setup;
    } else if (hold != 0) {
        goto arbitrate_1;
    } else {
        goto apart;
    }

    /* ------------------------------------------------------------------ */
arbitrate_1:
    vx1 = *(long *)(void *)(g + 0xb8);
    if (vx1 == 0 || adx > 0x3f || hold != 0)
        goto arbitrate_2;
    if (vx1 < 0) {
        if (x1 <= x2)
            goto arbitrate_2;
        if (*(long *)(void *)(g + 0x210) > 0)
            goto stop_both;
        vx2 = vx1 >> 1;
        vx1 = vx1 >> 1;
        goto check;
    }
    if (x1 >= x2)
        goto arbitrate_2;
    if (*(long *)(void *)(g + 0x210) < 0)
        goto stop_both;
    vx2 = vx1 >> 1;
    vx1 = vx1 >> 1;
    goto check;

arbitrate_2:
    vx2 = *(long *)(void *)(g + 0x210);
    vx1 = *(long *)(void *)(g + 0xb8);
    if (vx2 == 0 || adx > 0x3f || hold != 0)
        goto check;
    if (vx2 < 0) {
        if (x1 >= x2)
            goto check;
        if (vx1 > 0)
            goto stop_both;
        vx2 = vx2 >> 1;
        vx1 = vx2;
        goto check;
    }
    if (x1 <= x2)
        goto check;
    if (vx1 < 0)
        goto stop_both;
    vx2 = vx2 >> 1;
    vx1 = vx2;
    goto check;

    /* **The repel.** Close enough and overlapping, so drive them apart at a
     * fixed 3.0 a frame, each away from the other. */
apart:
    if (adx > NEAR_GAP)
        goto arbitrate_1;
    if (x1 >= x2) {
        vx1 =  PUSH_VEL;
        vx2 = -PUSH_VEL;
    } else {
        vx1 = -PUSH_VEL;
        vx2 =  PUSH_VEL;
    }
    goto check;

stop_both:
    vx1 = 0;
    vx2 = 0;
    goto store;

setup:
    vx1 = *(long *)(void *)(g + 0xb8);
    vx2 = *(long *)(void *)(g + 0x210);
    /* fall through */

    /* **The leash.** Past FAR_GAP the excess is halved out of the gap, both
     * fighters moving, unless either one has opted out of the arena. */
check:
    if (adx <= FAR_GAP)
        goto store;
    if ((*(uint32_t *)(void *)(pl0 + P_FLG) & 0x400u) != 0)
        goto store;
    if ((*(uint32_t *)(void *)(pl1 + P_FLG) & 0x400u) != 0)
        goto store;

    excess = adx - FAR_GAP;

    /* **The clamps are applied whether or not the move happens.** The two
     * bit-twiddles sit before the branch that skips the rest, so a pair only
     * four units too far apart still has its velocities clamped. Worth keeping:
     * moving them after the branch would be tidier and wrong. */
    if (x1 >= x2) {
        if (vx2 < 0) vx2 = 0;           /* bic r0, r0, asr #31 -- max(v, 0) */
        if (vx1 > 0) vx1 = 0;           /* and r1, r1, asr #31 -- min(v, 0) */
        if (excess <= 3)
            goto store;
        shift = -(excess >> 1);
    } else {
        if (vx2 > 0) vx2 = 0;           /* min */
        if (vx1 < 0) vx1 = 0;           /* max */
        if (excess <= 3)
            goto store;
        shift = excess >> 1;
    }

    /* Both positions move, by the same amount, in opposite directions -- so
     * the pair converges on its own midpoint rather than one being dragged to
     * the other. Stored as halfwords, which is what the coordinate is. */
    *(uint16_t *)(void *)(pl0 + P_XI) =
        (uint16_t)((uint16_t)shift + *(uint16_t *)(void *)(pl0 + P_XI));
    *(uint16_t *)(void *)(pl1 + P_XI) =
        (uint16_t)(*(uint16_t *)(void *)(pl1 + P_XI) - (uint16_t)shift);

store:
    *(long *)(void *)(pl0 + P_VX) = vx1;
    *(long *)(void *)(pl1 + P_VX) = vx2;
}
