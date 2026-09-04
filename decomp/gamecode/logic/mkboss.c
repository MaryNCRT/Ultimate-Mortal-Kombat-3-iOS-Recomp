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






/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_d_block(struct MK3THREAD *thread);
long t_motaro_grab_punch_now(struct MK3THREAD *thread);
long t_motaro_slided(struct MK3THREAD *thread);
long t_motaro_stupid_stance(struct MK3THREAD *thread);
long t_sk_kick(struct MK3THREAD *thread);
long bossrandper(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);
long is_he_airborn(MK3OBJ *obj);
long motaro_randper(MK3OBJ *obj);
long q_is_this_a_joke(MK3OBJ *obj);
void randu_minimum(MK3OBJ *obj);
void shake_a11(MK3OBJ *obj);

/* t_motaro_grab_punch -- armv7 0x000a8eac, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      is_he_airborn(obj)
 *      frame[frame].handler = t_motaro_grab_punch_now
 *      frame[frame+1].w0 = 0
 */

long t_motaro_grab_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_he_airborn(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_motaro_grab_punch_now);
}

/* t_sk_knocked_down -- armv7 0x000a8fd4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x6
 *      group_sound(obj)
 *      frame[frame].handler = t_motaro_slided
 *      frame[frame+1].w0 = 0
 */

long t_sk_knocked_down(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x6;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_motaro_slided);
}

/* t_sk_hit3 -- armv7 0x000a932c, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *      rsnd_func(obj, 0xa)
 *      obj->field1c = 0x6
 *      group_sound(obj)
 *      frame[frame].handler = t_sk_slided
 *      frame[frame+1].w0 = 0
 */

long t_sk_hit3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x60006;
    shake_a11(obj);
    rsnd_func(obj, 0xa);
    obj->field1c = 0x6;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sk_slided);
}

/* t_sk_stupid_stance -- armv7 0x000a9fc0, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0xc0
 *      q_is_this_a_joke(obj)
 *      frame[frame].handler = t_motaro_stupid_stance
 *      frame[frame+1].w0 = 0
 */

long t_sk_stupid_stance(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0xc0;
    q_is_this_a_joke(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_motaro_stupid_stance);
}

/* t_mc_sg_pounce -- armv7 0x000ab944, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      motaro_randper(obj)
 *      frame[frame].handler = t_d_block
 *      frame[frame+1].w0 = 0
 */

long t_mc_sg_pounce(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    motaro_randper(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_block);
}

/* t_skc_sg_pounce_sd -- armv7 0x000abf24, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2bc
 *      bossrandper(obj)
 *      frame[frame].handler = t_sk_kick
 *      frame[frame+1].w0 = 0
 */

long t_skc_sg_pounce_sd(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2bc;
    bossrandper(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sk_kick);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

/* motaro_easy_randper -- armv7 0x000ab6e8, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x15e
 *      bossrandper(obj)
 */
void motaro_easy_randper(MK3OBJ *obj)
{
    obj->field1c = 0x15e;
    bossrandper(obj);
}


/* motaro_joke_randper -- armv7 0x000ab7f4, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x64
 *      bossrandper(obj)
 */
void motaro_joke_randper(MK3OBJ *obj)
{
    obj->field1c = 0x64;
    bossrandper(obj);
}


/* sk_counter_joke -- armv7 0x000abce0, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x4b
 *      bossrandper(obj)
 */
void sk_counter_joke(MK3OBJ *obj)
{
    obj->field1c = 0x4b;
    bossrandper(obj);
}


/* q_boss_stupid -- armv7 0x000abdf0, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x4b
 *      bossrandper(obj)
 */
void q_boss_stupid(MK3OBJ *obj)
{
    obj->field1c = 0x4b;
    bossrandper(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_boss1(MK3THREAD *thread);
long t_sk_airborn_check(MK3THREAD *thread);
long t_stumble_back_vel(MK3THREAD *thread);
long t_swait_land_jsrp(MK3THREAD *thread);

/* t_boss_wait_land -- armv7 0x000a86fc, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x1c5, then descend into t_swait_land_jsrp
 *      token == 0x1c5:
 *          frame[frame].handler = t_boss1
 *      otherwise:  return -3
 */
long t_boss_wait_land(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1c5;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_swait_land_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1c5)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_boss1);
}

/* t_sk_stumble -- armv7 0x000a8bf0, 120 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x85b, then descend into t_sk_airborn_check
 *      token == 0x85b:
 *          obj->field1c = 0x40000
 *          frame[frame].handler = t_stumble_back_vel
 *      otherwise:  return -3
 */
long t_sk_stumble(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x85b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_sk_airborn_check;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x85b)
        return -3;

    obj->field1c = 0x40000;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_stumble_back_vel);
}
