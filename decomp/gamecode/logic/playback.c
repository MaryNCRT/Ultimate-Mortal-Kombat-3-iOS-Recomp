/*
 * playback.c -- gamecode/logic/playback.c, decompiled.
 *
 * The recorded-input player. `mk3_update` uses it for special moves: an input
 * word with bit 10 set names a sequence, `seq_lookup` finds it, and this file
 * then synthesises an ordinary joystick word every frame -- so a special move
 * is replayed as if a human had done the motion.
 *
 * Four functions. Two are here. `Playback_Update` is 184 bytes and
 * `seq_lookup` is **7,608** -- the largest function in the directory by a
 * factor of three, a table-driven decoder with `tbh` jump tables and
 * twenty-three cases. Neither is written yet.
 *
 * ## The record is sixteen bytes
 *
 * `_Playback` is 32 bytes in the symbol table and there are two fighters, so
 * one record is 16 -- and `Playback_Begin` writes a word and four halfwords
 * inside that, which fits exactly.
 *
 *      0x00  the sequence               a word, the only thing Begin is given
 *      0x04  a halfword, cleared
 *      0x06  a halfword, cleared
 *      0x08  a halfword, cleared
 *      0x0a  the facing flag
 *      0x0c  THE OUTPUT WORD, and Begin does NOT clear it
 *
 * That last line matters. `mk3_update` reads `Playback[i].0x0c` as the
 * joystick word to use this frame, and `Playback_Begin` leaves it alone -- so
 * **the first frame of a new sequence replays whatever the previous one left
 * there**, until `Playback_Update` overwrites it. `mk3_update` does call
 * Update immediately after Begin, which is what makes that safe; a port that
 * separates the two will replay a stale input and not know why.
 */

#include "mk3logic.h"

/* ---------------------------------------------- Playback_Begin, Playback_Init
 *
 * armv7 0x000adb60 and 0x000adb70, 16 bytes each.  **Complete.**
 *
 *      Playback_Begin(p, seq, flip)   p->seq = seq
 *                                     p->w04 = p->w06 = p->w08 = 0
 *                                     p->flip = flip
 *
 *      Playback_Init(p)               Playback_Begin(p, 0, 0)
 *
 * The wrapper pair again, and this one is the cheapest kind: init is begin
 * with both arguments zero. A sequence of 0 is therefore "no sequence", which
 * is exactly what `mk3_update` tests -- `if (Playback[i].w0 == 0)` is how it
 * asks whether a special move is running.
 */
typedef struct MK3PLAYBACK {
    /* 0x00  **A POINTER into the sequence**, not an identifier.
     * `Playback_Begin` is handed a word and stores it; `Playback_Update`
     * fetches halfwords through it and writes the advanced pointer back. 0 is
     * "nothing is playing", which is what `mk3_update` tests. */
    const uint16_t *seq;
    uint16_t field04;            /* 0x04 */
    uint16_t field06;            /* 0x06 */
    uint16_t field08;            /* 0x08 */
    uint16_t flip;               /* 0x0a  opponent_x < my_x, per mk3_update */
    uint16_t field0c;            /* 0x0c  the synthesised joystick word */
    uint16_t field0e;            /* 0x0e */
} MK3PLAYBACK;

/* `seq` arrives as a word because that is what `seq_lookup` returns and what
 * the binary stores -- `str r1, [r0]`, no type involved. It is a pointer, as
 * `Playback_Update` proves by walking it, so the cast is here and named rather
 * than hidden in the struct. */
void Playback_Begin(MK3PLAYBACK *p, long seq, long flip)
{
    p->seq     = (const uint16_t *)(uintptr_t)seq;
    p->field04 = 0;
    p->field06 = 0;
    p->field08 = 0;
    p->flip    = (uint16_t)flip;
}

void Playback_Init(MK3PLAYBACK *p)
{
    Playback_Begin(p, 0, 0);
}


/* ------------------------------------------------------------ Playback_Update
 *
 * armv7 0x000adaa8, 184 bytes.  **Complete.**
 *
 * **A bytecode interpreter, one instruction per frame.** The sequence is an
 * array of halfwords; bits 10..12 are the opcode and everything else -- bits
 * 0..9 and 13..15, the mask 0xe3ff -- is the payload.
 *
 *      0x0400   SET      sticky |= payload
 *      0x0800   CLEAR    sticky &= ~payload
 *      0x0C00   HOLD     hold = payload           (frames to stay put)
 *      0x1000   END      seq = NULL
 *      else     EMIT     transient = payload, for this frame only
 *                        and if the NEXT word repeats this one, hold 1
 *
 *      output = sticky | transient
 *
 * Every opcode costs a frame: SET and CLEAR emit and return like the rest, so
 * "hold left for five" is six words of wall-clock, not five. A port that
 * executes opcodes until it finds an EMIT will run every special move faster
 * than the original.
 *
 * The sticky word at 0x08 survives between frames and the transient at 0x06
 * does not -- it is cleared at the top of every call. That is the whole state
 * model: a button you hold is SET once, a tap is one EMIT.
 *
 * ## The flip settles which bits are the horizontal pair
 *
 * When `flip` is set the output has **bits 2 and 3 exchanged**, and nothing
 * else changes:
 *
 *      out = (out & 0xfff3) | ((out & 8) ? 4 : 0) | ((out & 4) ? 8 : 0)
 *
 * Mirroring a recorded motion swaps left and right and leaves up and down
 * alone. So **bits 2 and 3 are the horizontal pair and bits 0 and 1 are the
 * vertical one** -- which the input contract at the top of joy.c had to leave
 * open, because `joystick_in_a0` masks all four with 0xf and never separates
 * them.
 *
 * It does NOT say which of 2 and 3 is left: swapping a pair is symmetric. Same
 * for 0 and 1. The PAIRING is settled and the polarity is not.
 *
 * `flip` is read with `ldrsh` and tested against zero, and `mk3_update` sets it
 * from `opponent_x < my_x` -- so a sequence is authored facing one way and
 * mirrored when the fighter is facing the other.
 */
void Playback_Update(MK3PLAYBACK *p)
{
    uint16_t sticky, out;

    p->field06 = 0;             /* the transient bits last one frame */
    p->field0c = 0;

    if (p->seq == NULL)
        return;

    if (p->field04 != 0) {
        /* Still holding: no instruction is fetched this frame. */
        sticky = p->field08;
        p->field04 = (uint16_t)(p->field04 - 1);
    } else {
        uint16_t        word    = *p->seq;
        uint16_t        payload = (uint16_t)(word & 0xe3ffu);
        unsigned        op      = (unsigned)(word & 0x1c00u);
        const uint16_t *next    = p->seq + 1;

        p->seq = next;

        switch (op) {
        case 0x0400:                            /* SET */
            sticky = (uint16_t)(payload | p->field08);
            p->field08 = sticky;
            break;

        case 0x0800:                            /* CLEAR */
            sticky = (uint16_t)(~payload & p->field08);
            p->field08 = sticky;
            break;

        case 0x0c00:                            /* HOLD */
            sticky = p->field08;
            p->field04 = payload;
            break;

        case 0x1000:                            /* END */
            sticky = p->field08;
            p->seq = NULL;
            break;

        default:                                /* EMIT */
            sticky = p->field08;
            p->field06 = payload;
            /* A repeated word means hold it one more frame. The peek is at the
             * ALREADY ADVANCED pointer, so it compares this word with the one
             * after it. */
            if (word == *next)
                p->field04 = 1;
            break;
        }
    }

    out = (uint16_t)(sticky | p->field06);

    if ((int16_t)p->flip != 0) {
        uint16_t swapped = (uint16_t)(out & 0xfff3u);
        if (out & 8u) swapped = (uint16_t)(swapped | 4u);
        if (out & 4u) swapped = (uint16_t)(swapped | 8u);
        out = swapped;
    }

    p->field0c = out;
}

