/*
 * mkstat.c -- gamecode/logic/mkstat.c, decompiled.
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

long t_retract_strike_act(struct MK3THREAD *thread);

/* t_retract_strike -- armv7 0x0004cb48, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_retract_strike_act
 *      frame[frame+1].w0 = 0
 */

long t_retract_strike(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_retract_strike_act);
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

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

long create_blood_proc(MK3OBJ *obj);

/* upcut_blood_me -- armv7 0x0004f05c, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x1
 *      create_blood_proc(obj)
 */
void upcut_blood_me(MK3OBJ *obj)
{
    obj->field1c = 0x1;
    create_blood_proc(obj);
}


/* jade_normpal -- armv7 0x0004fd00, 12 bytes.  **Complete.**
 *
 *      player_normpal(obj)
 */
void jade_normpal(MK3OBJ *obj)
{
    player_normpal(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

void set_half_damage(struct MK3THREAD *thread);
long t_act_mframew(struct MK3THREAD *thread);
long t_axeup3(struct MK3THREAD *thread);
long t_local_reaction_exit(struct MK3THREAD *thread);
long t_victory_animation(struct MK3THREAD *thread);
void call_a0_for_him(MK3OBJ *obj);
void clear_inviso(MK3OBJ *obj);
void death_blow_complete(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

/* t_do_block_hi -- armv7 0x0004cea0, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      stop_me_player(obj)
 *      obj->field40 = 0xc
 *      get_char_ani(obj)
 *      obj->field1c = 0x3
 *      obj->field20 = 0x700
 *      frame[frame].handler = t_act_mframew
 *      frame[frame+1].w0 = 0
 */

long t_do_block_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stop_me_player(obj);
    obj->field40 = 0xc;
    get_char_ani(obj);
    obj->field1c = 0x3;
    obj->field20 = 0x700;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_act_mframew);
}

/* tl_stat_do_fast_axe_up -- armv7 0x0004d078, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = set_half_damage
 *      call_a0_for_him(obj)
 *      obj->field40 = 0x20002
 *      obj->field48 = 0x4
 *      frame[frame].handler = t_axeup3
 *      frame[frame+1].w0 = 0
 */

long tl_stat_do_fast_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)set_half_damage;
    call_a0_for_him(obj);
    obj->field40 = 0x20002;
    obj->field48 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_axeup3);
}

/* t_do_un_inviso -- armv7 0x0004f684, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      clear_inviso(obj)
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 */

long t_do_un_inviso(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    clear_inviso(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* tl_babality_complete -- armv7 0x0004fcb4, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      death_blow_complete(obj)
 *      player_normpal(obj)
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long tl_babality_complete(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    death_blow_complete(obj);
    player_normpal(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}
