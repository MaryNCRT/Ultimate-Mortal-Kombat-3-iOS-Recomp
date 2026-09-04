/*
 * mkfatal.c -- gamecode/logic/mkfatal.c, decompiled.
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

long a_sb_skeleton_burn(struct MK3THREAD *thread);
long t_skburn3(struct MK3THREAD *thread);

/* t_sb_skeleton_burn -- armv7 0x0003322c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = a_sb_skeleton_burn
 *      frame[frame].handler = t_skburn3
 *      frame[frame+1].w0 = 0
 */

long t_sb_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = (uint32_t)(uintptr_t)a_sb_skeleton_burn;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_skburn3);
}


/* The callees these reach, declared from what the call sites
 * pass. One written later with a different signature will
 * conflict here, which is what the check is for. */
long do_next_a9_frame(MK3OBJ *obj);

/* rip_ani -- armv7 0x00036e94, 12 bytes.  **Complete.**
 *
 * A tail call to `do_next_a9_frame` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long rip_ani(MK3OBJ *obj)
{
    return do_next_a9_frame(obj);
}




/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_victory_animation(struct MK3THREAD *thread);

/* t_null_fatality -- armv7 0x00032f40, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long t_null_fatality(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_wait_forever(struct MK3THREAD *thread);
void away_x_vel(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
void center_around_me(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
long death_scream(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);

/* t_scorp_skeleton_burn -- armv7 0x0003424c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      center_around_me(obj)
 *      frame[frame].handler = t_sb_skeleton_burn
 *      frame[frame+1].w0 = 0
 */

long t_scorp_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    center_around_me(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sb_skeleton_burn);
}

/* t_r_vomit -- armv7 0x0003511c, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      set_inviso(obj)
 *      obj->a10 = 0x5
 *      obj->field1c = 0x14
 *      create_fx(obj)
 *      death_scream(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_r_vomit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    set_inviso(obj);
    obj->a10 = 0x5;
    obj->field1c = 0x14;
    create_fx(obj);
    death_scream(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_about_2b_ripped -- armv7 0x0003a9cc, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      face_opponent(obj)
 *      back_to_normal(obj)
 *      obj->field40 = 0x25
 *      pose_a9_manual(obj)
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_about_2b_ripped(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    face_opponent(obj);
    back_to_normal(obj);
    obj->field40 = 0x25;
    pose_a9_manual(obj);
    do_next_a9_frame(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */




