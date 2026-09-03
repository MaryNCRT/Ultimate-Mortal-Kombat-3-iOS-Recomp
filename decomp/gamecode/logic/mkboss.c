/*
 * mkboss.c -- gamecode/logic/mkboss.c, decompiled.
 *
 * Part of the fight engine. *
 * This first pass was read by two programs rather than by eye, because most of
 * what is here is one function written many times.
 *
 * `tools/pushfn.py` executes a body symbolically -- every register tracked as
 * a constant, a pc-relative address, a load or nothing at all -- and accepts
 * it only when it accounted for EVERY instruction and the effects come out as
 * the frame-push shape: some stores into the object, then the handler and the
 * cleared slot above. One instruction it cannot model and the function is
 * refused rather than guessed at.
 *
 * `tools/microfn.py` matches whole bodies against fixed templates for the
 * smaller shapes -- a tail call, a constant into 0x5c, a table handed to a
 * search routine -- and refuses anything with an instruction out of place.
 *
 * Both refuse loudly. What they could not prove is not in this file; it is
 * read one function at a time.
 */

#include "mk3logic.h"

long t_boss_close_attack(struct MK3THREAD *thread);
long t_boss_close_miss(struct MK3THREAD *thread);
long t_c_mil_tele_sd(struct MK3THREAD *thread);
long t_c_zoom_sd(struct MK3THREAD *thread);
long t_ease5(struct MK3THREAD *thread);
long t_motaro_hit0(struct MK3THREAD *thread);
long t_motaro_hit2(struct MK3THREAD *thread);
long t_sk_knocked_down(struct MK3THREAD *thread);

/* t_boss_finish_him -- armv7 0x000a8768, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_boss_close_attack
 *      frame[frame+1].w0 = 0
 */

long t_boss_finish_him(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_boss_close_attack);
}

/* t_sk_stance_pause -- armv7 0x000a885c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_ease5
 *      frame[frame+1].w0 = 0
 */

long t_sk_stance_pause(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_ease5);
}

/* t_boss_post_hit -- armv7 0x000a8928, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_boss_close_miss
 *      frame[frame+1].w0 = 0
 */

long t_boss_post_hit(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_boss_close_miss);
}

/* t_c_robo_tele_sd -- armv7 0x000a8a04, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_c_mil_tele_sd
 *      frame[frame+1].w0 = 0
 */

long t_c_robo_tele_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_c_mil_tele_sd);
}

/* t_c_mil_tele_sd -- armv7 0x000a8a38, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_c_zoom_sd
 *      frame[frame+1].w0 = 0
 */

long t_c_mil_tele_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_c_zoom_sd);
}

/* t_motaro_hit3 -- armv7 0x000a8b04, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_motaro_hit2
 *      frame[frame+1].w0 = 0
 */

long t_motaro_hit3(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_motaro_hit2);
}

/* t_motaro_hit1 -- armv7 0x000a8b38, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_motaro_hit0
 *      frame[frame+1].w0 = 0
 */

long t_motaro_hit1(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_motaro_hit0);
}

/* t_sk_slided -- armv7 0x000a8c68, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_sk_knocked_down
 *      frame[frame+1].w0 = 0
 */

long t_sk_slided(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sk_knocked_down);
}


/* The callees these reach, declared from what the call sites
 * pass. One written later with a different signature will
 * conflict here, which is what the check is for. */
long randper(MK3OBJ *obj);

/* bossrandper_org -- armv7 0x000ab5f0, 12 bytes.  **Complete.**
 *
 * A tail call to `randper` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long bossrandper_org(MK3OBJ *obj)
{
    return randper(obj);
}




/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */




