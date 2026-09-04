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
void inc_p_hit(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
long t_suspend_wait_action(MK3THREAD *thread);
long tl_do_scorp_tele(MK3THREAD *thread);
long t_local_reaction_exit(MK3THREAD *thread);
void match_me_with_him(MK3OBJ *obj);
void multi_adjust_xy(MK3OBJ *obj);
void is_he_left(MK3OBJ *obj);
void is_he_right(MK3OBJ *obj);
void face_opponent(MK3OBJ *obj);
long t_tele_scan(MK3THREAD *thread);
void air_init_special(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
void init_special_act(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
void find_ani_last_frame(MK3OBJ *obj);
void do_next_a9_frame(MK3OBJ *obj);
long t_main_hover_loop(MK3THREAD *thread);
long t_lfly5(MK3THREAD *thread);
void MKEvent_Add(long a, long b, long c, long d);
void match_him_with_me_f(MK3OBJ *obj);
void adjust_him_a0(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
void advance_him(MK3OBJ *obj);

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


/* --------------------------------------------------------------- t_biked_suspend
 *
 * armv7 0x0003fa2c, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      inc_p_hit(obj)
 *      obj->field1c          = 0x20d
 *      *(uint32_t *)((char *)obj->field00 + 0x48) = 0x20d
 *      frame[frame].handler = t_suspend_wait_action
 *      frame[frame+1].w0 = 0
 *
 * A hit is counted, the same number goes to the object's 0x1c and to the
 * PROC's 0x48, and then the thread hands over to the routine that waits for
 * an action. Writing one value to a slot on each struct is how this directory
 * makes something visible both to the thread that set it and to whatever
 * reads the PROC.
 */
long t_biked_suspend(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    inc_p_hit(obj);

    obj->field1c          = 0x20d;
    /* PROC+0x48 falls in the unnamed run there; written by offset rather
     * than given a field one store is not enough to establish. */
    *(uint32_t *)((char *)obj->field00 + 0x48) = 0x20d;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_suspend_wait_action);
}


/* -------------------------------------------------------------- tl_do_ermac_tele
 *
 * armv7 0x00040a48, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      am_i_airborn(obj)
 *      if (obj->field5c == 0) {        ; on the ground
 *          obj->field1c = 0x1e
 *          create_fx(obj)
 *      }
 *      set_inviso(obj)
 *      frame[frame].handler = tl_do_scorp_tele
 *      frame[frame+1].w0 = 0
 *
 * **Ermac's teleport ends by installing SCORPION's.** The two characters share
 * the rest of the move; what is different is only this preamble, and even that
 * is one conditional effect. Reached through a direct pc-relative address
 * rather than a pointer slot, so `tl_do_scorp_tele` is in this same file.
 *
 * The effect only spawns when the fighter is on the ground: `am_i_airborn`
 * answers into 0x5c and a zero there takes the branch. The 0x1e is derived
 * from that same zero with `adds r3, #0x1e` -- the register already held the
 * answer, so the constant costs no load.
 */
long tl_do_ermac_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_airborn(obj);

    if (obj->field5c == 0) {            /* on the ground: leave a puff */
        obj->field1c = 0x1e;            /* adds r3, #0x1e on the zero */
        create_fx(obj);
    }

    set_inviso(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_do_scorp_tele);
}


/* -------------------------------------------------------------- t_bike_scan_call
 *
 * armv7 0x0003c0ec, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 3
 *      *(uint16_t *)(G + 0x456) = 3
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * Three into the object's 0x1c and into the halfword at G+0x456 -- the same
 * global slot the `sans_repell` family writes, and the same constant into
 * both, held in `ip` across the pair.
 *
 * Then the return-up shape: the frame index is DECREMENTED to go back to the
 * caller, and the handler is only installed when there is nowhere to go back
 * to. `frame` is signed here -- `cmp #0` then `ble`, not `cbz`.
 */
long t_bike_scan_call(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 3;
    *(uint16_t *)(G_BYTES + 0x456) = 3;

    if ((long)thread->frame > 0) {      /* cmp #0 / ble: signed */
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------- t_do_body_propell
 *
 * armv7 0x0003c148, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      n = obj->field1c
 *      if (n <= 0x1c) { h = propell_table[n]; obj->field1c = h }
 *      else           { h = t_local_reaction_exit }
 *      frame[frame].handler = h
 *      frame[frame+1].w0 = 0
 *
 * **This is where every special move is dispatched from.** 0x1c arrives as a
 * move number, `_propell_table` at 0x00166f4c turns it into a handler, and the
 * thread hands over to it. Out of range falls back to the reaction exit, so a
 * bad number ends the move instead of jumping somewhere.
 *
 * The chosen handler is written back into 0x1c as well as installed -- the
 * same address in both places -- and only on the in-range path.
 *
 * The bound is `bhi` on 0x1c, so **twenty-nine entries, 0 through 0x1c**, and
 * every one of them is a named symbol:
 *
 *       0 tl_kano_cannon_ball     10 tl_do_tele_explode     20 tl_do_sg_quake
 *       1 tl_sonya_bike_kick      11 tl_do_lia_stay_afloat  21 tl_do_ninja_slide
 *       2 tl_ind_charge           12 tl_do_square_wave      22 tl_do_scorp_tele
 *       3 tl_jax_dash_punch       13 tl_do_lk_bike          23 tl_do_reptile_dash
 *       4 tl_do_sz_decoy          14 tl_do_super_kang       24 tl_do_jade_prop
 *       5 tl_do_lia_fly           15 tl_do_sg_pounce        25 tl_do_mileena_tele
 *       6 tl_do_lao_tele          16 tl_do_slide            26 tl_do_mileena_prop
 *       7 tl_do_lao_angle         17 tl_do_swat_zoom        27 tl_do_ermac_tele
 *       8 tl_do_robo_tele         18 tl_do_stick_sweep      28 tl_do_kano_upball
 *       9 tl_do_robo_air_grab     19 tl_do_tusk_blur
 *
 * That is the catalogue of the dashes, teleports and charges, and it is worth
 * reading next to `tl_do_ermac_tele` a few functions up: entry 27 ends by
 * installing entry 22, so Ermac's teleport is Scorpion's with a preamble.
 */
extern MK3THREADFUNC propell_table[0x1d];   /* 0x00166f4c */

long t_do_body_propell(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = obj->field1c;
    if (n <= 0x1c) {
        h = propell_table[n];
        obj->field1c = (uint32_t)(uintptr_t)h;
    } else {
        h = (MK3THREADFUNC)t_local_reaction_exit;
    }

    return mk3_push_handler(thread, h);
}


/* ------------------------------------------------------------ t_upball_x_damping
 *
 * armv7 0x0003c988, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      v = obj->field08->field18
 *      obj->field20 = v >> 3
 *      obj->field1c = v - (v >> 3)
 *      set_x_vel_player(obj)
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * `jade_prop_damping` -- the same seven-eighths damping, same `asrs #3` and
 * same `rsb` for the remainder -- wrapped in the return-up shape, so it runs
 * once per frame while the thread stays where it is and only ends when there
 * is no caller left to return to.
 *
 * Three routines in this file now damp the same way with different shifts:
 * 3 here and in `jade_prop_damping`, 6 in `zoom_damping`.
 */
long t_upball_x_damping(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    int32_t v;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    v = (int32_t)obj->field08->field18;
    obj->field20 = (uint32_t)(v >> 3);
    obj->field1c = (uint32_t)(v - (v >> 3));
    set_x_vel_player(obj);

    if ((long)thread->frame > 0) {
        thread->frame -= 1;
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------- teleport_next_to
 *
 * armv7 0x0003e534, 112 bytes.  **Complete.**
 *
 *      obj->field40 = 0x54
 *      him  = obj->field00->him
 *      obj->field1c = him
 *      hisx = (int16_t)him[+0x0e]
 *      obj->field28 = hisx
 *
 *      obj->field20 = |(*(long *)(G + 0xb4) + 0x18f) - hisx|
 *      if (obj->field20 > 0x80) {
 *          obj->field20 = |*(long *)(G + 0xb0) - hisx|
 *          if (obj->field20 > 0x80)
 *              obj->field40 = -obj->field40
 *      }
 *
 *      match_me_with_him(obj)
 *      obj->field20 = 0
 *      obj->field1c = obj->field40
 *      multi_adjust_xy(obj)
 *
 * **Which side of the opponent to land on.** 0x54 is the offset, positive by
 * default, and it is negated only when he is far from BOTH bounds in the
 * global state -- more than 0x80 from `G + 0xb4` plus 0x18f, and more than
 * 0x80 from `G + 0xb0`. Near either one the default side stands, which is what
 * keeps a teleport from putting the attacker through a wall.
 *
 * Both distances are made positive the same way, with `rsblt` in an IT block
 * rather than a branch, and both are compared against the same 0x80.
 *
 * The 0x18f is built as `+0x18c` then `+3`, two instructions for one constant,
 * because 0x18f is not a single Thumb immediate.
 */
void teleport_next_to(MK3OBJ *obj)
{
    MK3OBJ *him;
    int32_t hisx, d;

    obj->field40 = 0x54;

    him = (MK3OBJ *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(uintptr_t)him;

    hisx = *(int16_t *)((char *)him + 0x0e);
    obj->field28 = (uint32_t)hisx;

    d = (*(int32_t *)(G_BYTES + 0xb4) + 0x18f) - hisx;
    obj->field20 = (uint32_t)(d < 0 ? -d : d);

    if ((int32_t)obj->field20 > 0x80) {
        d = *(int32_t *)(G_BYTES + 0xb0) - hisx;
        obj->field20 = (uint32_t)(d < 0 ? -d : d);

        if ((int32_t)obj->field20 > 0x80)
            obj->field40 = (uint32_t)(-(int32_t)obj->field40);
    }

    match_me_with_him(obj);

    obj->field20 = 0;
    obj->field1c = obj->field40;
    multi_adjust_xy(obj);
}


/* ----------------------------------------------------------------- t_tele_scan2
 *
 * armv7 0x0003c07c, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      v = obj->field08->field1c
 *      obj->field1c = v
 *      if (v < 0) {
 *          frame[frame].handler = t_tele_scan
 *      } else if (thread->frame > 0) {
 *          thread->frame -= 1
 *          return 0
 *      } else {
 *          frame[frame].handler = t_local_reaction_exit
 *      }
 *      frame[frame+1].w0 = 0
 *
 * **A sign test picks between going back and going round again.** A negative
 * value at the other object's 0x1c installs `t_tele_scan` -- the scan runs
 * another pass -- and anything else returns up a level, or ends if there is
 * no level to return to.
 *
 * `t_tele_scan` is reached as a direct pc-relative address rather than through
 * a pointer slot, so it is in this file; `t_local_reaction_exit` comes through
 * the slot at 0x000f3708, so it is not.
 */
long t_tele_scan2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    int32_t v;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    v = (int32_t)obj->field08->field1c;
    obj->field1c = (uint32_t)v;

    if (v >= 0) {
        if ((long)thread->frame > 0) {
            thread->frame -= 1;         /* back up a level */
            return 0;
        }
        return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_tele_scan);
}


/* --------------------------------------------------------------- flight_move_ani
 *
 * armv7 0x0003cf24, 112 bytes.  **Complete.**
 *
 *      obj->field1c = |obj->field08->field18|
 *      if (obj->field1c < 0x60000) return
 *      m = obj->field00[+0x30]
 *      obj->field20 = m
 *      if (m == 1 || m == 2) return
 *      obj->field1c = 1
 *      obj->field34 = (obj->field48 < 0) ? is_he_left : is_he_right
 *      ((void (*)(MK3OBJ *))obj->field34)(obj)
 *      if (obj->field5c == 0) obj->field1c = 2
 *      saved = obj->field1c
 *      face_opponent(obj)
 *      obj->field1c = saved
 *      set_float_ani(obj)
 *
 * **A function pointer chosen by a sign, parked in 0x34 and called through.**
 * `is_he_left` and `is_he_right` are the same question asked two ways, and
 * which one runs is decided by the sign of 0x48 -- so the answer at 0x5c means
 * "is he on the side I am moving toward" rather than a fixed direction. Both
 * arrive through pointer slots, so neither is in this file.
 *
 * The two early exits are a speed floor and a mode filter: nothing happens
 * below 0x60000 -- six units in the 16.16 this directory uses -- and nothing
 * happens in modes 1 or 2, whatever PROC+0x30 counts.
 *
 * 0x1c is written four times with four meanings: a magnitude, then 1, then 2
 * on one branch, then restored around `face_opponent` because that routine
 * uses the slot itself. The save into r5 is the only reason the value survives.
 */
void flight_move_ani(MK3OBJ *obj)
{
    int32_t  v = (int32_t)obj->field08->field18;
    uint32_t m, saved;

    obj->field1c = (uint32_t)(v < 0 ? -v : v);
    if ((int32_t)obj->field1c < 0x60000)        /* a speed floor */
        return;

    m = *(uint32_t *)((char *)obj->field00 + 0x30);
    obj->field20 = m;
    if (m == 1 || m == 2)                       /* not in those modes */
        return;

    obj->field1c = 1;
    obj->field34 = (uint32_t)(uintptr_t)
                   (((int32_t)obj->field48 < 0) ? is_he_left : is_he_right);

    ((void (*)(MK3OBJ *))(uintptr_t)obj->field34)(obj);

    if (obj->field5c == 0)
        obj->field1c = 2;

    saved = obj->field1c;
    face_opponent(obj);                 /* which uses 0x1c itself */
    obj->field1c = saved;

    set_float_ani(obj);
}


/* ------------------------------------------------------------ tl_do_lia_stay_afloat
 *
 * armv7 0x0003df1c, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      air_init_special(obj)
 *      obj->field40 = 2
 *      get_char_ani2(obj)
 *      find_part2(obj)
 *      obj->field40 += 0x18
 *      back_to_normal(obj)
 *      obj->field20          = 0x203
 *      obj->field00->field18 = 0x203
 *      frame[frame].handler = t_main_hover_loop
 *
 * Entry 11 of the propell table -- the one that keeps her in the air. The
 * animation is found in two steps: 2 into 0x40 and `get_char_ani2` resolves
 * it, then `find_part2` picks the part, then **0x18 is ADDED to whatever 0x40
 * holds afterwards**. So the second number is an offset from the resolved
 * animation, not an animation of its own.
 *
 * 0x203 goes to the object's 0x20 and to the PROC's 0x18, the action pair this
 * directory writes together so the value is visible from both structs.
 *
 * `t_main_hover_loop` is a direct pc-relative address, so it lives here.
 */
long tl_do_lia_stay_afloat(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    air_init_special(obj);

    obj->field40 = 2;
    get_char_ani2(obj);
    find_part2(obj);
    obj->field40 += 0x18;               /* an offset from what was resolved */

    back_to_normal(obj);

    obj->field20          = 0x203;
    obj->field00->field18 = 0x203;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_main_hover_loop);
}


/* --------------------------------------------------------------- tl_do_square_wave
 *
 * armv7 0x0003f3e4, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x207
 *      init_special_act(obj)
 *      obj->field1c = 4
 *      ochar_sound(obj)
 *      obj->field40 = 0x16
 *      find_ani_last_frame(obj)
 *      do_next_a9_frame(obj)
 *      obj->field1c          = 0xfff40000
 *      obj->field08->field1c = 0xfff40000
 *      frame[frame].handler = t_lfly5
 *
 * Entry 12 of the propell table. **0xfff40000 is -12.0** in the 16.16 this
 * directory uses, written to the object's 0x1c and to the other object's, both
 * from one register -- so the launch speed is set on both sides in one go.
 *
 * The animation is started rather than chosen: 0x16 into 0x40,
 * `find_ani_last_frame` to place it, and `do_next_a9_frame` to run a frame
 * before the handler takes over.
 *
 * `t_lfly5` is a direct pc-relative address, so it is in this file.
 */
long tl_do_square_wave(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x207;
    init_special_act(obj);

    obj->field1c = 4;
    ochar_sound(obj);

    obj->field40 = 0x16;
    find_ani_last_frame(obj);
    do_next_a9_frame(obj);

    obj->field1c          = 0xfff40000u;    /* -12.0 in 16.16 */
    obj->field08->field1c = 0xfff40000u;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_lfly5);
}


/* ------------------------------------------------------------------ bike_hit_call
 *
 * armv7 0x0003d980, 124 bytes.  **Complete.**
 *
 *      obj->field1c = 3
 *      *(uint16_t *)(G + 0x456) = 3
 *      n = obj->field00[+0x2c] - 1
 *      obj->field1c = n
 *      if (n == 0) return
 *      obj->field00[+0x2c] = n
 *      match_him_with_me_f(obj)
 *      obj->field1c = 0xffe0ffd0
 *      adjust_him_a0(obj)
 *      ((MK3OBJ *)obj->a10)->field20 = obj->field08->field20
 *      ((MK3OBJ *)obj->a10)->field18 = obj->field08->field18
 *      ((MK3OBJ *)obj->a10)->field1c = obj->field08->field1c
 *      obj->field30 = obj->field40
 *      next_anirate(obj)
 *      if (obj->field40 != obj->field30) advance_him(obj)
 *
 * **A counter at PROC+0x2c that runs down and stops the call.** It is read,
 * decremented, and written back only if it did not reach zero -- so the last
 * hit leaves the counter at 1 rather than 0, and the routine simply returns
 * on the pass that would have taken it to zero.
 *
 * 0xffe0ffd0 is another **packed pair of signed halves**: -32 high and -48
 * low, the same shape `skinny_spawn` reads out of 0x48. Here it goes into 0x1c
 * for `adjust_him_a0` rather than being unpacked in place.
 *
 * Three fields are copied one at a time from the object at 0x08 to the one at
 * 0x44, each with its own pair of loads -- 0x20, 0x18 and 0x1c -- because the
 * compiler reloaded both pointers between every copy.
 *
 * The last test compares 0x40 against the 0x30 it was just copied into: if
 * `next_anirate` moved 0x40, the opponent is advanced too.
 */
void bike_hit_call(MK3OBJ *obj)
{
    uint32_t n;

    obj->field1c = 3;
    *(uint16_t *)(G_BYTES + 0x456) = 3;

    n = *(uint32_t *)((char *)obj->field00 + 0x2c) - 1;
    obj->field1c = n;
    if (n == 0)                         /* the pass that would zero it */
        return;

    *(uint32_t *)((char *)obj->field00 + 0x2c) = n;

    match_him_with_me_f(obj);
    obj->field1c = 0xffe0ffd0u;         /* -32 high, -48 low */
    adjust_him_a0(obj);

    /* 0x44 is the argument slot, a word, and here it carries an object
     * address -- so the copies go through a cast rather than a field the
     * struct types as a pointer. */
    {
        MK3OBJ *dst = (MK3OBJ *)(uintptr_t)obj->a10;

        dst->field20 = obj->field08->field20;
        dst->field18 = obj->field08->field18;
        dst->field1c = obj->field08->field1c;
    }

    obj->field30 = obj->field40;
    next_anirate(obj);
    if (obj->field40 != obj->field30)
        advance_him(obj);
}


/* ----------------------------------------------------------------- t_s_t_scroller
 *
 * armv7 0x0003c3b8, 124 bytes.  **Complete.**
 *
 *      token == 0:       MKEvent_Add(1, 3, obj->field00->field08, 0)
 *                        (and on into the shared part)
 *      token == 0x297:   the shared part only
 *      otherwise:        return -3
 *
 *      shared:
 *          if ((*(MK3OBJ **)&obj->field48)->field18 == 0x215)
 *              park(token 0x297, duration 1)
 *          else {
 *              MKEvent_Add(1, 4, 0, 0)
 *              park(token 0x29c, duration 0x16462)
 *          }
 *
 * **A coroutine that re-parks with its own token until a state changes.**
 * 0x297 wakes it after one tick straight back into the shared part, so it
 * polls the field at +0x18 of whatever 0x48 points at, once a frame, for as
 * long as that reads 0x215. When it stops, the second event goes out and it
 * parks on 0x16462 with a token its own dispatch rejects -- the never-wake
 * ending this directory uses when a sequence must not unwind to its caller.
 *
 * The first event is only sent on the way in, not on the polling passes, which
 * is what the two entry points are for.
 */
long t_s_t_scroller(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0 && token != 0x297)
        return -3;

    if (token == 0)
        MKEvent_Add(1, 3, (long)obj->field00->field08, 0);

    if ((*(MK3OBJ **)(uintptr_t)&obj->field48)->field18 == 0x215) {
        *mk3_frame(thread, thread->frame + 1) = 0x297;
        thread->fieldfc = 1;            /* look again next tick */
        return 1;
    }

    MKEvent_Add(1, 4, 0, 0);

    *mk3_frame(thread, thread->frame + 1) = 0x29c;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}
