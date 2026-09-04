/*
 * mkprop.c -- gamecode/logic/mkprop.c, decompiled.
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

long t_zoom_blocked(struct MK3THREAD *thread);
long tl_do_slide(struct MK3THREAD *thread);

/* t_scorpion_tele_blocked -- armv7 0x0003c014, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zoom_blocked
 *      frame[frame+1].w0 = 0
 */

long t_scorpion_tele_blocked(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zoom_blocked);
}

/* tl_do_ninja_slide -- armv7 0x0003c048, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = tl_do_slide
 *      frame[frame+1].w0 = 0
 */

long tl_do_ninja_slide(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_do_slide);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long am_i_airborn(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);

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

long t_square3(MK3THREAD *thread);
void away_x_vel(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);
void set_x_vel_player(MK3OBJ *obj);
void stop_him(MK3OBJ *obj);
void ground_him(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);

/* t_liz_fly_hit -- armv7 0x0003f280, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          stop_me_player(obj)
 *          obj->field40 = 0x20018
 *          pose_a9_manual(obj)
 *          park(token 0x6f5, duration 0xa)
 *      token == 0x6f5:
 *          obj->field1c = 0x20000
 *          away_x_vel(obj)
 *          frame[frame].handler = t_square3
 *      otherwise:  return -3
 */
long t_liz_fly_hit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        stop_me_player(obj);
        obj->field40 = 0x20018;
        pose_a9_manual(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x6f5;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token != 0x6f5)
        return -3;

    obj->field1c = 0x20000;
    away_x_vel(obj);
    return mk3_push_handler(thread, (MK3THREADFUNC)t_square3);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_jump_up_land_jsrp(MK3THREAD *thread);

/* t_air_grab_cancel -- armv7 0x0003d76c, 152 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x19
 *          pose_a9_manual(obj)
 *          obj->field1c = 0xd
 *          obj->field20 = 0xd
 *          obj->field24 = 0x8000
 *          obj->field28 = 0xfff
 *          token := 0x83f, then descend into t_flight
 *      token == 0x83f:
 *          frame[frame].handler = t_jump_up_land_jsrp
 *      otherwise:  return -3
 */
long t_air_grab_cancel(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x19;
        pose_a9_manual(obj);
        obj->field1c = 0xd;
        obj->field20 = 0xd;
        obj->field24 = 0x8000;
        obj->field28 = 0xfff;
        *mk3_frame(thread, thread->frame + 1) = 0x83f;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x83f)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jump_up_land_jsrp);
}


/* ------------------------------------------------------------ set_his_p_action
 *
 * armv7 0x0003c0dc, 16 bytes.  **Complete.**
 *
 *      obj->field00->field00->field00->field18 = 0x61a
 *
 * **Three dereferences to reach across to the other fighter.** The chain is
 * my PROC, then HIS object out of its 0x00, then HIS PROC out of that -- and
 * 0x18 on a PROC is the action `get_his_action` reads. So this reaches over
 * and writes what the opponent is doing, without either side holding a
 * pointer to the other's PROC directly.
 *
 * The name says it plainly, and the three `ldr r0, [r0]` in a row are the
 * shortest thing in this file.
 */
void set_his_p_action(MK3OBJ *obj)
{
    obj->field00->field00->field00->field18 = 0x61a;
}


/* ====================================== jade_prop_damping, zoom_damping
 *
 * armv7 0x0003c970 and 0x0003c958, 24 bytes each.  **Complete.**
 *
 *      v = obj->field08->field18
 *      obj->field20 = v >> N
 *      obj->field1c = v - (v >> N)
 *      set_x_vel_player(obj)
 *
 * One function with one number changed: **N is 3 for jade and 6 for zoom**, so
 * one keeps seven eighths of the speed and the other sixty-three sixty-fourths.
 * Both split the value the other object carries at 0x18 into a part that goes
 * to 0x20 and the remainder to 0x1c, then hand it to the velocity setter.
 *
 * The shift is `asrs`, arithmetic, so a negative speed damps toward zero from
 * below rather than wrapping. The remainder is `rsb r3, r3, r2` -- reverse
 * subtract, which computes `v - (v >> N)` in one instruction without needing
 * the operands the other way round.
 */
void jade_prop_damping(MK3OBJ *obj)
{
    int32_t v = (int32_t)obj->field08->field18;

    obj->field20 = (uint32_t)(v >> 3);          /* an eighth */
    obj->field1c = (uint32_t)(v - (v >> 3));    /* and the rest */
    set_x_vel_player(obj);
}

void zoom_damping(MK3OBJ *obj)
{
    int32_t v = (int32_t)obj->field08->field18;

    obj->field20 = (uint32_t)(v >> 6);          /* a sixty-fourth */
    obj->field1c = (uint32_t)(v - (v >> 6));    /* and the rest */
    set_x_vel_player(obj);
}


/* ---------------------------------------------------------- blur_blocked_setup
 *
 * armv7 0x0003fde4, 28 bytes.  **Complete.**
 *
 *      obj->field20         = 0x61f
 *      obj->field00->field18 = 0x61f
 *      set_no_block(obj)
 *      stop_me_player(obj)
 *
 * The same constant into two places: the object's own 0x20 and the action on
 * its PROC. Writing an action and a copy of it side by side is the pattern
 * this directory uses when something has to be visible both to the thread
 * that set it and to whatever reads the PROC.
 *
 * 0x61f is one past `set_his_p_action`'s 0x61a, which puts both in the same
 * run of action numbers.
 */
void blur_blocked_setup(MK3OBJ *obj)
{
    obj->field20          = 0x61f;
    obj->field00->field18 = 0x61f;

    set_no_block(obj);
    stop_me_player(obj);
}


/* ----------------------------------------------------------- pounce_ground_him
 *
 * armv7 0x0003f610, 32 bytes.  **Complete.**
 *
 *      stop_him(obj)
 *      him = obj->field00->him
 *      obj->field1c = him
 *      *(uint16_t *)((char *)him + 0x0e) =
 *          *(uint16_t *)((char *)obj->field08 + 0x0e)
 *      ground_him(obj)
 *
 * **It moves him to somewhere else's position.** The halfword at +0x0e is the
 * high half of 0x0c, the integer part of a coordinate, and it is copied out of
 * the object at 0x08 and into the opponent -- so whatever 0x08 is pointing at
 * when this runs is where he ends up. Then he is stopped and grounded.
 *
 * The opponent is loaded twice from PROC+0x04 rather than kept in a register,
 * which is the compiler not trusting `stop_him` to have left it alone.
 */
void pounce_ground_him(MK3OBJ *obj)
{
    MK3OBJ *him;

    stop_him(obj);

    him = (MK3OBJ *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(uintptr_t)him;

    *(uint16_t *)((char *)him + 0x0e) =
        *(uint16_t *)((char *)obj->field08 + 0x0e);

    ground_him(obj);
}


/* --------------------------------------------------------------- set_float_ani
 *
 * armv7 0x0003cef4, 48 bytes.  **Complete.**
 *
 *      n = obj->field1c                    ; the caller's index, kept
 *      *(uint32_t *)((char *)obj->field00 + 0x30) = n
 *      obj->field1c = n + 2
 *      obj->field40 = n + 2
 *      get_char_ani2(obj)
 *      obj->field1c = float_ani_speeds[n]  ; 0x00166f38
 *      init_anirate(obj)
 *
 * 0x1c is used three times for three different things in eight instructions:
 * it arrives as an index, becomes `index + 2` for the animation lookup, and
 * ends as the rate. The original index survives in r5 across all of it, which
 * is the only reason the table lookup at the end still has it.
 *
 * `_float_ani_speeds` reads 6, 3, 3, 3, 3 in its first five entries. **How
 * many entries it has is not established**: the words after those are six
 * figures long, which is either a different table beginning or a different
 * kind of value, and nothing here says which. Only the five are used by
 * anything read so far.
 */
extern uint32_t float_ani_speeds[];         /* 0x00166f38 */

void set_float_ani(MK3OBJ *obj)
{
    uint32_t n = obj->field1c;

    /* PROC+0x30 falls inside the unnamed run at 0x2c, so it is written by
     * offset rather than given a field the struct has not established. */
    *(uint32_t *)((char *)obj->field00 + 0x30) = n;

    obj->field1c = n + 2;
    obj->field40 = n + 2;
    get_char_ani2(obj);

    obj->field1c = float_ani_speeds[n];
    init_anirate(obj);
}


/* ---------------------------------------------------------------- accelerate_x
 *
 * armv7 0x0003c920, 56 bytes.  **Complete.**
 *
 *      step = obj->field48
 *      obj->field1c = step
 *      v = obj->field08->field18 + step
 *      obj->field20 = v
 *      obj->field24 = -0x80000
 *      if (v <= -0x80000)      obj->field20 = -0x80000
 *      else if (v >= 0x80000)  obj->field20 =  0x80000
 *      obj->field1c = obj->field20
 *      set_x_vel_player(obj)
 *
 * **The speed is clamped to plus or minus 0x80000**, and the two bounds are
 * reached differently: the low one is a pool literal (0xfff80000) that is also
 * parked in 0x24 on the way past, and the high one is an immediate built by
 * `movge.w`. Same magnitude, two spellings.
 *
 * 0x80000 is 8.0 in the 16.16 fixed point this directory uses for velocity, so
 * nothing accelerated through here goes faster than eight units a frame in
 * either direction.
 *
 * The clamp is written as an if/else so the high test only runs when the low
 * one did not fire -- with a symmetric range that is the same as clamping
 * both ways, but it is what the branches do.
 */
void accelerate_x(MK3OBJ *obj)
{
    int32_t step = (int32_t)obj->field48;
    int32_t v;

    obj->field1c = (uint32_t)step;
    v = (int32_t)obj->field08->field18 + step;

    obj->field20 = (uint32_t)v;
    obj->field24 = (uint32_t)(-0x80000);        /* parked on the way past */

    if (v <= -0x80000)
        obj->field20 = (uint32_t)(-0x80000);
    else if (v >= 0x80000)
        obj->field20 = 0x80000;

    obj->field1c = obj->field20;
    set_x_vel_player(obj);
}
