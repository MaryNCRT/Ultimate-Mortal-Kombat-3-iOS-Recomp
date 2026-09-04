/*
 * mkslam.c -- gamecode/logic/mkslam.c, decompiled.
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

long t_common_slam(struct MK3THREAD *thread);
long t_noob_slam(struct MK3THREAD *thread);

/* t_nj_smoke_slam -- armv7 0x00049c7c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_noob_slam
 *      frame[frame+1].w0 = 0
 */

long t_nj_smoke_slam(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_noob_slam);
}

/* t_thrown_by_lao -- armv7 0x00049e28, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0x20
 *      frame[frame].handler = t_common_slam
 *      frame[frame+1].w0 = 0
 */

long t_thrown_by_lao(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0x20;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_common_slam);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* t_thrown_by_jax -- armv7 0x00049df0, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0   (the register the guard proved)
 *      frame[frame].handler = t_common_slam
 *      frame[frame+1].w0 = 0
 */

long t_thrown_by_jax(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_common_slam);
}

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

long do_next_a9_frame(MK3OBJ *obj);
void find_last_frame(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);

/* throw_voice -- armv7 0x00049fdc, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x4
 *      group_sound(obj)
 */
void throw_voice(MK3OBJ *obj)
{
    obj->field1c = 0x4;
    group_sound(obj);
}


/* grab_voice -- armv7 0x00049fec, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x3
 *      group_sound(obj)
 */
void grab_voice(MK3OBJ *obj)
{
    obj->field1c = 0x3;
    group_sound(obj);
}


/* last_knockdown_frame -- armv7 0x0004b6b8, 28 bytes.  **Complete.**
 *
 *      obj->field40 = 0x1e
 *      get_char_ani(obj)
 *      find_last_frame(obj)
 *      do_next_a9_frame(obj)
 */
void last_knockdown_frame(MK3OBJ *obj)
{
    obj->field40 = 0x1e;
    get_char_ani(obj);
    find_last_frame(obj);
    do_next_a9_frame(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_njsl3(struct MK3THREAD *thread);
long body_slam_init(MK3OBJ *obj);

/* t_nj_slam -- armv7 0x0004a3ac, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      body_slam_init(obj)
 *      frame[frame].handler = t_njsl3
 *      frame[frame+1].w0 = 0
 */

long t_nj_slam(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    body_slam_init(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_njsl3);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_land_on_my_back(MK3THREAD *thread);
void damage_to_me(MK3OBJ *obj);

/* t_post_broken_back -- armv7 0x00049ebc, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x38000
 *          obj->field20 = 0xfff80000
 *          obj->field24 = 0xa000
 *          obj->field28 = 0xfff
 *          token := 0x429, then descend into t_flight
 *      token == 0x429:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_post_broken_back(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x38000;
        obj->field20 = 0xfff80000;
        obj->field24 = 0xa000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x429;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x429)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_thrown_by_sz -- armv7 0x0004b6d4, 156 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x60000
 *          obj->field20 = 0xfffa0000
 *          obj->field24 = 0xa000
 *          obj->field28 = 0xfff
 *          token := 0x413, then descend into t_flight
 *      token == 0x413:
 *          obj->a10 = 0x19
 *          damage_to_me(obj)
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_thrown_by_sz(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x60000;
        obj->field20 = 0xfffa0000;
        obj->field24 = 0xa000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x413;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x413)
        return -3;

    obj->a10 = 0x19;
    damage_to_me(obj);
    return mk3_push_handler(thread, (MK3THREADFUNC)t_land_on_my_back);
}
