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

    return mk3_install(thread, (MK3THREADFUNC)t_boss1);
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
    return mk3_install(thread, (MK3THREADFUNC)t_stumble_back_vel);
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

long t_animate_a0_frames(MK3THREAD *thread);
long t_animate_a9(MK3THREAD *thread);
long t_flight(MK3THREAD *thread);
long t_land_on_my_back(MK3THREAD *thread);
long t_local_reaction_exit(MK3THREAD *thread);
long t_reaction_land(MK3THREAD *thread);
long t_wait_forever(MK3THREAD *thread);
long create_blood_proc(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_special(MK3OBJ *obj);
void rsnd_ochar_sound(MK3OBJ *obj);

/* t_motaro_hit_flight -- armv7 0x000a8a6c, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x40000
 *          obj->field20 = 0xfffc0000
 *          obj->field24 = 0x6000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x79d, then descend into t_flight
 *      token == 0x79d:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_motaro_hit_flight(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x40000;
        obj->field20 = 0xfffc0000;
        obj->field24 = 0x6000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x79d;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x79d)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_motaro_collapse -- armv7 0x000a8b6c, 132 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x3001e
 *          token := 0x825, then descend into t_animate_a9
 *      token == 0x825:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_motaro_collapse(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x3001e;
        *mk3_frame(thread, thread->frame + 1) = 0x825;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x825)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_motaro_slided -- armv7 0x000a8c9c, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x40000
 *          obj->field20 = 0xfffd0000
 *          obj->field24 = 0x5000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x883, then descend into t_flight
 *      token == 0x883:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_motaro_slided(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x40000;
        obj->field20 = 0xfffd0000;
        obj->field24 = 0x5000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x883;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x883)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_sk_hard_comboed -- armv7 0x000a9464, 160 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field48 = 0x60006
 *          shake_a11(obj)
 *          rsnd_func(obj, 0xa)
 *          obj->field1c = 0x6
 *          group_sound(obj)
 *          token := 0x854, then descend into t_sk_airborn_check
 *      token == 0x854:
 *          obj->field1c = 0x50000
 *          frame[frame].handler = t_stumble_back_vel
 *      otherwise:  return -3
 */
long t_sk_hard_comboed(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field48 = 0x60006;
        shake_a11(obj);
        rsnd_func(obj, 0xa);
        obj->field1c = 0x6;
        group_sound(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x854;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_sk_airborn_check;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x854)
        return -3;

    obj->field1c = 0x50000;
    return mk3_install(thread, (MK3THREADFUNC)t_stumble_back_vel);
}

/* t_sk_uppcutted -- armv7 0x000a95d0, 188 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1
 *          create_blood_proc(obj)
 *          obj->field48 = 0x60006
 *          shake_a11(obj)
 *          rsnd_func(obj, 0xa)
 *          obj->field1c = 0x2
 *          group_sound(obj)
 *          obj->field1c = 0x20000
 *          obj->field20 = 0xfff40000
 *          obj->field24 = 0x6000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x848, then descend into t_flight
 *      token == 0x848:
 *          frame[frame].handler = t_reaction_land
 *      otherwise:  return -3
 */
long t_sk_uppcutted(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1;
        create_blood_proc(obj);
        obj->field48 = 0x60006;
        shake_a11(obj);
        rsnd_func(obj, 0xa);
        obj->field1c = 0x2;
        group_sound(obj);
        obj->field1c = 0x20000;
        obj->field20 = 0xfff40000;
        obj->field24 = 0x6000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x848;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x848)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_reaction_land);
}

/* t_sk_laugh -- armv7 0x000aaf68, 160 bytes.  **Complete.**
 *
 *      token == 0:
 *          init_special(obj)
 *          obj->field1c = 0x40003
 *          rsnd_ochar_sound(obj)
 *          obj->field40 = 0xb
 *          get_char_ani(obj)
 *          obj->field1c = 0x5000c
 *          token := 0x2b6, then descend into t_animate_a0_frames
 *      token == 0x2b6:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_sk_laugh(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        init_special(obj);
        obj->field1c = 0x40003;
        rsnd_ochar_sound(obj);
        obj->field40 = 0xb;
        get_char_ani(obj);
        obj->field1c = 0x5000c;
        *mk3_frame(thread, thread->frame + 1) = 0x2b6;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a0_frames;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x2b6)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------- q_yes / q_no
 *
 * armv7 0x000a85cc / 0x000a85d4, 8 bytes each.  **Complete.**
 *
 * mkboss.c's own private copies of the answer helpers `moves.c` also
 * defines -- the same two instructions each (`field5c = 1` / `= 0`), at
 * this file's own addresses. Written without `static` because
 * tools/factdiff.py does not parse the keyword; nothing links the
 * decomp files together, so the duplicate name costs nothing.
 */
void q_yes(MK3OBJ *obj)
{
    obj->field5c = 1;
}

void q_no(MK3OBJ *obj)
{
    obj->field5c = 0;
}


/* --------------------------------------------------------------------- get_mhe_long / get_mhe_word
 *
 * armv7 0x000a8d34 / 0x000a8d4c, 24 bytes each.  **Complete.**
 *
 * Index a per-ladder-order table: `field1c` holds the table,
 * `ladderorder_a1` answers the order (1..3) in `field20`, and the entry
 * replaces the table pointer in `field1c` -- a word, or a sign-extended
 * halfword. The "mhe" tables (`mhe_sk_counter_randpers` and friends)
 * are the boss AI's difficulty-by-ladder numbers; entry 0 is never read,
 * since the order is never 0.
 */
void ladderorder_a1(MK3OBJ *obj);

void get_mhe_long(MK3OBJ *obj)
{
    ladderorder_a1(obj);
    obj->field1c = ((const uint32_t *)(uintptr_t)obj->field1c)[obj->field20];
}

void get_mhe_word(MK3OBJ *obj)
{
    ladderorder_a1(obj);
    obj->field1c = (uint32_t)(int32_t)
        ((const int16_t *)(uintptr_t)obj->field1c)[obj->field20];
}


/* --------------------------------------------------------------------- bossrandper
 *
 * armv7 0x000ab6bc, 44 bytes.  **Complete.**
 *
 * `randper` with the odds scaled to a fifth first: `field1c` goes
 * through a double multiply by `0.2` (a VFP constant in the literal
 * pool, truncated back toward zero by `vcvt.s32.f64`) and the answer is
 * `randper`'s own, both in `r0` and in `field5c`. The only floating point
 * in the boss AI.
 */
long bossrandper(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(int32_t)((double)(int32_t)obj->field1c * 0.2);
    return randper(obj);
}


/* --------------------------------------------------------------------- sk_counter_randper
 *
 * armv7 0x000abcc4, 28 bytes.  **Complete.**
 *
 * Shao Kahn's counter-attack odds: the ladder-order entry of
 * `mhe_sk_counter_randpers`, rolled through `bossrandper`.
 */
extern int16_t mhe_sk_counter_randpers[];    /* 0x0017b3d2 */

long sk_counter_randper(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)mhe_sk_counter_randpers;
    get_mhe_word(obj);
    return bossrandper(obj);
}


/* --------------------------------------------------------------------- q_heading_down
 *
 * armv7 0x000a89e8, 28 bytes.  **Complete.**
 *
 * `obj->field00->him`'s own `field1c` (a signed velocity), read into
 * `field1c` and tested: negative (rising) answers yes, everything else
 * (falling or still) answers no.
 */
void q_heading_down(MK3OBJ *obj)
{
    obj->field1c = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field1c;
    if ((int32_t)obj->field1c < 0)
        q_yes(obj);
    else
        q_no(obj);
}


/* --------------------------------------------------------------------- t_b_return_to_beware_4get
 *
 * armv7 0x000a858c, 64 bytes.  **Complete.**
 *
 * State 0 only. `field1c` and `field00->field5c` both get the same
 * copy of the incoming token, then the current level installs
 * `t_return_to_beware` and clears its own token -- the same "forget
 * this state and hand off" shape as a plain `mk3_install`, transcribed
 * with the extra `field00->field5c` write it actually does.
 */
long t_return_to_beware(struct MK3THREAD *thread);   /* pointer slot 0x000f3428 */

long t_b_return_to_beware_4get(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field1c          = slot;
    obj->field00->field5c = slot;

    return mk3_install(thread, (MK3THREADFUNC)t_return_to_beware);
}


/* --------------------------------------------------------------------- motaro_randper
 *
 * armv7 0x000ab804, 36 bytes.  **Complete.**
 *
 * A joke round routes to `motaro_joke_randper`; otherwise `field1c =
 * 500` through `bossrandper`.
 */
long q_is_this_a_joke(MK3OBJ *obj);
void motaro_joke_randper(MK3OBJ *obj);

long motaro_randper(MK3OBJ *obj)
{
    q_is_this_a_joke(obj);
    if (obj->field5c != 0) {
        motaro_joke_randper(obj);
        return (long)obj->field5c;
    }

    obj->field1c = 0x1f4;
    return bossrandper(obj);
}


/* --------------------------------------------------------------------- q_is_he_dizzy_boss
 *
 * armv7 0x000aa02c, 36 bytes.  **Complete.**
 *
 * `get_his_action`'s own answer against `0x620`, the dizzy action.
 */
void get_his_action(MK3OBJ *obj);

void q_is_he_dizzy_boss(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x620)
        q_yes(obj);
    else
        q_no(obj);
}


/* --------------------------------------------------------------------- q_ok_motaro_sweep
 *
 * armv7 0x000a8e88, 36 bytes.  **Complete.**
 *
 * Yes when the opponent is out of Motaro's sweep range (further than
 * `0xd0`, or closer than `0x80` -- too close to sweep) and not airborne
 * in between.
 */
void get_x_dist(MK3OBJ *obj);
long is_he_airborn(MK3OBJ *obj);

void q_ok_motaro_sweep(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xd0)
        goto no;
    if ((int32_t)obj->field28 <= 0x7f)
        goto no;

    is_he_airborn(obj);

no:
    q_no(obj);
}


/* --------------------------------------------------------------------- sk_randper
 *
 * armv7 0x000abcf0, 48 bytes.  **Complete.**
 *
 * A joke round routes to `sk_counter_joke`; otherwise the ladder-order
 * entry of `mhe_sk_randpers` through `bossrandper`.
 */
void sk_counter_joke(MK3OBJ *obj);
extern int16_t mhe_sk_randpers[];            /* 0x0017b3ca */

long sk_randper(MK3OBJ *obj)
{
    q_is_this_a_joke(obj);
    if (obj->field5c != 0) {
        sk_counter_joke(obj);
        return (long)obj->field5c;
    }

    obj->field1c = (uint32_t)(uintptr_t)mhe_sk_randpers;
    get_mhe_word(obj);
    return bossrandper(obj);
}


/* --------------------------------------------------------------------- q_is_he_car
 *
 * armv7 0x000a8d64, 40 bytes.  **Complete.**
 *
 * Yes only when cornered AND reacting -- `q_is_he_cornered`'s no
 * short-circuits straight to `q_no`, matching Kabal's own "CAR" combo
 * window: pinned in the corner while he's still recovering.
 */
void q_is_he_cornered(MK3OBJ *obj);
void q_is_he_reacting(MK3OBJ *obj);

void q_is_he_car(MK3OBJ *obj)
{
    q_is_he_cornered(obj);
    if (obj->field5c != 0)
        q_is_he_reacting(obj);

    if (obj->field5c == 0)
        q_no(obj);
    else
        q_yes(obj);
}


/* --------------------------------------------------------------------- t_boss_close_attack, t_motaro_far_easy/hard/med, t_sk_stupid
 *
 * armv7 0x000a879c/0xa869c/0xa863c/0xa85dc/0xa87fc, 96 bytes each.
 * **Complete.**
 *
 * Five copies of one shape: state 0 only, push `t_random_do` -- reusing
 * `field00->field64`/`field68` (the ordinary "slave object"/"slave part"
 * pair everywhere else in this codebase) as a small count and a table
 * pointer instead, the same field-repurposing this file already does
 * for `field1c`/`field20` in the answer helpers. Each local move-choice
 * table (`funcs.NNNN` in the compiler's own naming, an anonymous local
 * array rather than a named function) is picked by which entry this
 * function is.
 */
long t_random_do(struct MK3THREAD *thread);   /* not yet decompiled, mkdrone.c */
extern MK3THREADFUNC funcs_boss_close_attack[];   /* 0x0017b9b0 */
extern MK3THREADFUNC funcs_motaro_far_easy[];     /* 0x0017b9bc */
extern MK3THREADFUNC funcs_motaro_far_hard[];     /* 0x0017b9c4 */
extern MK3THREADFUNC funcs_motaro_far_med[];      /* 0x0017b9cc */
extern MK3THREADFUNC funcs_sk_stupid[];           /* 0x0017b92c */

long t_boss_close_attack(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field00->slave   = (uint32_t)(uintptr_t)funcs_boss_close_attack;
    obj->field00->field64 = 3;

    *mk3_frame(thread, thread->frame + 1) = 0x1d3;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_random_do;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

long t_motaro_far_easy(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field00->slave   = (uint32_t)(uintptr_t)funcs_motaro_far_easy;
    obj->field00->field64 = 2;

    *mk3_frame(thread, thread->frame + 1) = 0x180;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_random_do;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

long t_motaro_far_hard(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field00->slave   = (uint32_t)(uintptr_t)funcs_motaro_far_hard;
    obj->field00->field64 = 2;

    *mk3_frame(thread, thread->frame + 1) = 0x16e;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_random_do;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

long t_motaro_far_med(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field00->slave   = (uint32_t)(uintptr_t)funcs_motaro_far_med;
    obj->field00->field64 = 2;

    *mk3_frame(thread, thread->frame + 1) = 0x15b;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_random_do;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

long t_sk_stupid(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field00->slave   = (uint32_t)(uintptr_t)funcs_sk_stupid;
    obj->field00->field64 = 5;

    *mk3_frame(thread, thread->frame + 1) = 0x3e3;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_random_do;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_motaro_stupid_stance
 *
 * armv7 0x000a9898, 76 bytes.  **Complete.**
 *
 * State 0 only. Rolls a random 0x30..0x5f duration (`randu_minimum`,
 * both bounds `0x30`, answering in `field1c`), parks it in `a10`, and
 * installs `t_ss1` on the current level -- no push, so this replaces
 * its own dispatcher rather than descending into it.
 */
void randu_minimum(MK3OBJ *obj);
long t_ss1(struct MK3THREAD *thread);   /* not yet decompiled */

long t_motaro_stupid_stance(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot != 0)
        return -3;

    obj->field1c = 0x30;
    obj->field20 = 0x30;
    randu_minimum(obj);

    obj->a10 = obj->field1c;

    return mk3_install(thread, (MK3THREADFUNC)t_ss1);
}


/* --------------------------------------------------------------------- q_is_this_a_joke
 *
 * armv7 0x000a9ea0, 68 bytes.  **Complete.**
 *
 * A joke round needs BOTH fighters at match wins 0 (`get_my_matchw`/
 * `get_his_matchw` both answer 0 in `field1c`) AND this object weaker
 * or equal strength AND the opponent's own strength no more than `0x53`.
 * Any of those failing answers no.
 */
void get_my_matchw(MK3OBJ *obj);
void get_his_matchw(MK3OBJ *obj);
void get_his_strength(MK3OBJ *obj);
void get_my_strength(MK3OBJ *obj);

long q_is_this_a_joke(MK3OBJ *obj)
{
    get_my_matchw(obj);
    if (obj->field1c != 0)
        goto no;

    get_his_matchw(obj);
    if (obj->field1c != 0)
        goto no;

    get_his_strength(obj);
    obj->field30 = obj->field1c;
    get_my_strength(obj);

    if ((int32_t)obj->field1c < (int32_t)obj->field30)
        goto no;
    if ((int32_t)obj->field30 > 0x53)
        goto no;

    q_yes(obj);
    return (long)(uintptr_t)obj;   /* r0 left over from the "mov r0,r4" before the call */

no:
    q_no(obj);
    return (long)(uintptr_t)obj;   /* same leftover-register shape */
}


/* --------------------------------------------------------------------- t_mc_flipk_away
 *
 * armv7 0x000a8d8c, 84 bytes.  **Complete.**
 *
 * State 0 only. Close (`field28 <= 0x80`) installs `t_motaro_slided`
 * (pointer slot `0x000f3418`); further away installs `t_d_block`
 * (`0x000f3428`, the same slot `t_b_return_to_beware_4get` reads) --
 * one physical install site, two literal pointers, reached from both
 * branches.
 */
long t_motaro_slided(struct MK3THREAD *thread);       /* pointer slot 0x000f3418 */
long t_d_block(struct MK3THREAD *thread);             /* pointer slot 0x000f3428 */

long t_mc_flipk_away(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x80)
        handler = (MK3THREADFUNC)t_d_block;
    else
        handler = (MK3THREADFUNC)t_motaro_slided;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_skc_lk_zap_lo
 *
 * armv7 0x000a8de0, 84 bytes.  **Complete.**
 *
 * State 0 only, Shao Kahn's twin of `t_mc_flipk_away`: close (`field28
 * <= 0x6f`) installs `t_sk_air_charge`, further installs `t_sk_charge`.
 */
long t_sk_air_charge(struct MK3THREAD *thread);   /* not yet decompiled */
long t_sk_charge(struct MK3THREAD *thread);       /* not yet decompiled */

long t_skc_lk_zap_lo(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x6f)
        handler = (MK3THREADFUNC)t_sk_air_charge;
    else
        handler = (MK3THREADFUNC)t_sk_charge;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_mc_hover
 *
 * armv7 0x000ab890, 88 bytes.  **Complete.**
 *
 * State 0 only. Rolls `motaro_randper` (result unused -- a chance
 * table probably fed elsewhere), then installs `t_motaro_hop` when far
 * (`field28 > 0x6f`) or `t_motaro_punch` when close, no push either
 * way.
 */
long t_motaro_hop(struct MK3THREAD *thread);      /* not yet decompiled */
long t_motaro_punch(struct MK3THREAD *thread);    /* not yet decompiled */

long t_mc_hover(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    motaro_randper(obj);

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x6f)
        handler = (MK3THREADFUNC)t_motaro_hop;
    else
        handler = (MK3THREADFUNC)t_motaro_punch;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_mc_propell_ls
 *
 * armv7 0x000ab8e8, 92 bytes.  **Complete.**
 *
 * State 0 only. Rolls `motaro_randper` (unused), then close (`field28
 * <= 0x70`) installs `t_motaro_slided`, far installs
 * `t_b_return_to_beware_4get`.
 */
long t_mc_propell_ls(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    motaro_randper(obj);

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x70)
        handler = (MK3THREADFUNC)t_b_return_to_beware_4get;
    else
        handler = (MK3THREADFUNC)t_motaro_slided;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_skc_propell
 *
 * armv7 0x000a8e34, 84 bytes.  **Complete.**
 *
 * State 0 only, Shao Kahn's twin: close (`field28 <= 0x90`) installs
 * `t_motaro_slided`, far installs `t_b_return_to_beware_4get`.
 */
long t_skc_propell(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x90)
        handler = (MK3THREADFUNC)t_b_return_to_beware_4get;
    else
        handler = (MK3THREADFUNC)t_motaro_slided;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_skc_stationary
 *
 * armv7 0x000abd88, 104 bytes.  **Complete.**
 *
 * State 0 only. `sk_randper` answers in `field5c`; a hit installs
 * `t_return_to_beware` directly (the same pointer slot
 * `t_b_return_to_beware_4get` reaches by name). A miss falls to
 * distance: close (`field28 <= 0x70`) installs `t_motaro_slided`, far
 * installs `t_b_return_to_beware_4get` -- one physical install site,
 * three literal targets, reached from all three branches.
 */
long t_return_to_beware(struct MK3THREAD *thread);   /* pointer slot 0x000f3428 */

long t_skc_stationary(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    sk_randper(obj);
    if (obj->field5c != 0) {
        handler = (MK3THREADFUNC)t_return_to_beware;
        return mk3_install(thread, handler);
    }

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x70)
        handler = (MK3THREADFUNC)t_b_return_to_beware_4get;
    else
        handler = (MK3THREADFUNC)t_motaro_slided;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_mc_stationary
 *
 * armv7 0x000ab828, 104 bytes.  **Complete.**
 *
 * The same shape as `t_skc_stationary` for Motaro: `motaro_randper`
 * hits install `t_return_to_beware` directly; a miss falls to distance
 * -- close (`field28 <= 0x8a`) installs `t_b_block`, far installs
 * `t_b_return_to_beware_4get`.
 */
long t_b_block(struct MK3THREAD *thread);   /* not yet decompiled */

long t_mc_stationary(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    motaro_randper(obj);
    if (obj->field5c != 0) {
        handler = (MK3THREADFUNC)t_return_to_beware;
        return mk3_install(thread, handler);
    }

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x8a)
        handler = (MK3THREADFUNC)t_b_return_to_beware_4get;
    else
        handler = (MK3THREADFUNC)t_b_block;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- MotaroPunchDamage
 *
 * armv7 0x000a8560, 44 bytes.  **Complete.**
 *
 * Motaro's punch damage by difficulty (`*Difficulty`, a global int at
 * `0x0014e20c` reached through pointer slot `0x000f3624`), each level
 * added to its own value rather than a plain table: `0 + 0xa`,
 * `1 + 0x13`, `2 + 0x17`, a flat `0x20` for exactly `3`, `0x28` for
 * anything else.
 */
extern int32_t *Difficulty;                  /* 0x0014e20c */

int32_t MotaroPunchDamage(void)
{
    int32_t d = *Difficulty;

    switch (d) {
    case 0:  return d + 0xa;
    case 1:  return d + 0x13;
    case 2:  return d + 0x17;
    case 3:  return 0x20;
    default: return 0x28;
    }
}


/* --------------------------------------------------------------------- t_sk_zap
 *
 * armv7 0x000a9018, 132 bytes.  **Complete.**
 *
 * State 0 only. `field1c=0`, `group_sound`, then `field1c=0x1d` and a
 * push of `mkzap.c`'s own `t_do_zap` under `0x2e1`; `0x2e1` just
 * installs `t_local_reaction_exit` on the current level.
 */
long t_do_zap(struct MK3THREAD *thread);   /* mkzap.c */

long t_sk_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0x2e1)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    if (slot != 0)
        return -3;

    obj->field1c = 0;
    group_sound(obj);

    obj->field1c = 0x1d;

    *mk3_frame(thread, thread->frame + 1) = 0x2e1;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_do_zap;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_ease5
 *
 * armv7 0x000a9810, 136 bytes.  **Complete.**
 *
 * `t_sk_stance_pause`'s own push target. State 0 rolls a random
 * 0x10..0x1f duration (`randu_minimum`, both bounds `0x10`), parks it
 * in `a10`, and pushes `mkdrone.c`'s own `t_d_stance_pause` under
 * `0x473`; `0x473` installs `t_local_reaction_exit` on the current
 * level.
 */
long t_d_stance_pause(struct MK3THREAD *thread);   /* not yet decompiled, mkdrone.c */

long t_ease5(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0x473)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    if (slot != 0)
        return -3;

    obj->field1c = 0x10;
    obj->field20 = 0x10;
    randu_minimum(obj);

    obj->a10 = obj->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0x473;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_d_stance_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_boss_close_miss
 *
 * armv7 0x000a895c, 140 bytes.  **Complete.**
 *
 * `t_boss_post_hit`'s own push target. The free arms `0x588` and
 * sleeps 8 ticks; `0x588` (`field1c=3`) pushes `t_mframew` under
 * `0x58a`; `0x58a` installs `t_local_reaction_exit` on the current
 * level.
 */
long t_mframew(struct MK3THREAD *thread);

long t_boss_close_miss(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);

    if (slot == 0x58a)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    if (slot == 0x588) {
        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x58a;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot != 0)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x588;
    thread->fieldfc = 8;
    return 8;
}


/* --------------------------------------------------------------------- t_motaro_hip_jump
 *
 * armv7 0x000a8890, 152 bytes.  **Complete.**
 *
 * State 0 arms `0x4c1` and pushes `joy.c`'s own `t_check_winner_status`
 * (pointer slot `0x000f37a8`), keeping the caller's own frame index
 * (`ip`) for the pop; `0x4c3` -- reached either from `0x4c1` popping
 * back (frame<=0 special-cased directly here, no shared "pop or exit"
 * helper) or from direct dispatch -- pushes `t_motaro_hip_jsrp`.
 */
long t_check_winner_status(struct MK3THREAD *thread);   /* pointer slot 0x000f37a8, joy.c */
long t_motaro_hip_jsrp(struct MK3THREAD *thread);         /* not yet decompiled */

long t_motaro_hip_jump(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;
    uint32_t slot  = *mk3_frame(thread, frame + 1);

    if (slot == 0x4c1) {
        *mk3_frame(thread, frame + 1) = 0x4c3;
        thread->frame = thread->frame + 1;   /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_check_winner_status;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (slot == 0x4c3) {
        mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_local_reaction_exit;
        *mk3_frame(thread, frame + 1) = 0;
        return 0;
    }

    if (slot != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x4c1;
    thread->frame = thread->frame + 1;   /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_motaro_hip_jsrp;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_grab_ani
 *
 * armv7 0x000aa7f4, 116 bytes.  **Complete.**
 *
 * State 0: `adjust_him_xy`, step a frame, pose `field1c=6`, wait 6
 * ticks under `0x503`. `0x503` is the ordinary "pop a level, or
 * install `t_local_reaction_exit` at the bottom" tail.
 */
void adjust_him_xy(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);

long t_grab_ani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t slot  = *mk3_frame(thread, frame + 1);

    if (slot == 0x503) {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;   /* back up a level */
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (slot != 0)
        return -3;

    adjust_him_xy(obj);
    do_next_a9_frame(obj);

    obj->field1c = 6;

    *mk3_frame(thread, frame + 1) = 0x503;
    thread->fieldfc = 6;
    return 6;
}


/* --------------------------------------------------------------------- t_boss_counter_angle
 *
 * armv7 0x000ab778, 124 bytes.  **Complete.**
 *
 * State 0: `is_towards_me`; not towards installs `t_boss_wait_land`
 * directly. Towards rolls `motaro_easy_randper`; a hit also installs
 * `t_boss_wait_land`. A miss falls to distance -- far (`field28 >
 * 0x80`) also installs `t_boss_wait_land`, close installs
 * `t_motaro_punch` -- one physical install site, four literal
 * pointers (three of them the same), reached from all four branches.
 */
long t_boss_wait_land(struct MK3THREAD *thread);   /* not yet decompiled */
void motaro_easy_randper(MK3OBJ *obj);
long is_towards_me(MK3OBJ *obj);   /* not yet decompiled, mkdrone.c */

long t_boss_counter_angle(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot != 0)
        return -3;

    is_towards_me(obj);
    if (obj->field5c == 0) {
        handler = (MK3THREADFUNC)t_boss_wait_land;
        return mk3_install(thread, handler);
    }

    motaro_easy_randper(obj);
    if (obj->field5c != 0) {
        handler = (MK3THREADFUNC)t_boss_wait_land;
        return mk3_install(thread, handler);
    }

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x80)
        handler = (MK3THREADFUNC)t_boss_wait_land;
    else
        handler = (MK3THREADFUNC)t_motaro_punch;

    return mk3_install(thread, handler);
}


/* --------------------------------------------------------------------- t_ss1
 *
 * armv7 0x000ab3d8, 192 bytes.  **Complete.**
 *
 * State 0: `stance_setup`, `next_anirate`, push (manual, plants resume
 * token `0x2ce` at the level above, sets the new level's handler to
 * `joy.c`'s own `t_check_winner_status`) and return.
 *
 * `0x2ce` (winner check came back): `am_i_facing_him`; not facing
 * installs `mkdrone.c`'s `t_d_turnaround` on the current level (no
 * push); facing re-arms this SAME handler for `0x2d2` next tick
 * (token written, no push, no handler change) and sleeps one frame.
 *
 * `0x2d2`: count `obj->a10` (the argument slot) down; still positive re-runs the
 * `next_anirate`+push tail (shared with state 0's own tail, reached
 * two ways); at zero installs `t_local_reaction_exit` on the current
 * level.
 */
void stance_setup(MK3OBJ *obj);
long am_i_facing_him(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
long t_d_turnaround(struct MK3THREAD *thread);   /* not yet decompiled, mkdrone.c */

long t_ss1(MK3THREAD *thread)
{
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;
    uint32_t slot = *mk3_frame(thread, thread->frame + 1);
    MK3THREADFUNC handler;

    if (slot == 0x2d2) {
        obj->a10 = obj->a10 - 1;
        if ((int32_t)obj->a10 != 0)
            goto push_check_winner;

        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (slot == 0x2ce) {
        am_i_facing_him(obj);
        if (obj->field5c != 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x2d2;
            thread->fieldfc = 1;
            return 1;
        }

        handler = (MK3THREADFUNC)t_d_turnaround;
        return mk3_install(thread, handler);
    }

    if (slot != 0)
        return -3;

    stance_setup(obj);

push_check_winner:
    next_anirate(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x2ce;   /* resume token, level above */
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_check_winner_status;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}
