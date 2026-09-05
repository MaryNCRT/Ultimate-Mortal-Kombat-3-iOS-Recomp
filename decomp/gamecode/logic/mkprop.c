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
long is_he_left(MK3OBJ *obj);
long is_he_right(MK3OBJ *obj);
void face_opponent(MK3OBJ *obj);
long t_tele_scan(MK3THREAD *thread);
void air_init_special(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
void init_special_act(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
void find_ani_last_frame(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);
long t_main_hover_loop(MK3THREAD *thread);
long t_lfly5(MK3THREAD *thread);
void MKEvent_Add(long a, long b, long c, long d);
void match_him_with_me_f(MK3OBJ *obj);
void adjust_him_a0(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
void advance_him(MK3OBJ *obj);
long is_he_airborn(MK3OBJ *obj);
void match_him_with_me(MK3OBJ *obj);
void adjust_him_xy(MK3OBJ *obj);
long strike_check_a0(MK3OBJ *obj);
long t_lao_angle_hit(MK3THREAD *thread);
long t_shake_ob_up(MK3THREAD *thread);
void find_ani2_part2(MK3OBJ *obj);
long t_air_sleep3(MK3THREAD *thread);
long t_land_on_yer_feet(MK3THREAD *thread);
long t_lao_angle_blocked(MK3THREAD *thread);
void sans_repell_3(MK3OBJ *obj);
void q_is_he_a_boss(MK3OBJ *obj);
long t_pounce_hit(MK3THREAD *thread);
long t_liz_fly_hit(MK3THREAD *thread);
long t_square3(MK3THREAD *thread);
void flip_multi(MK3OBJ *obj);
void update_tsl(MK3OBJ *obj);
void set_noedge(MK3OBJ *obj);
MK3OBJ *NewThreadProc(MK3OBJ *obj, MK3THREADFUNC fn);
void clear_inviso(MK3OBJ *obj);
void clear_noedge(MK3OBJ *obj);
long t_sctele_calla_2(MK3THREAD *thread);
long t_bike_call(MK3THREAD *thread);
void set_nocol(MK3OBJ *obj);
long t_animate2_a9(MK3THREAD *thread);
long tl_bike3(MK3THREAD *thread);
void reset_proc_stack(MK3THREAD *thread);
long t_pounce_fall(MK3THREAD *thread);
long t_reptile_dash_hit(MK3THREAD *thread);
void distance_off_ground(MK3OBJ *obj);
void towards_x_vel(MK3OBJ *obj);
void shake_a11(MK3OBJ *obj);
long t_mframew(MK3THREAD *thread);
void group_sound(MK3OBJ *obj);
long t_flight_call(MK3THREAD *thread);
void get_char_ani(MK3OBJ *obj);
long t_jump_up_land_jump(MK3THREAD *thread);
void ground_player(MK3OBJ *obj);
void clear_nocol(MK3OBJ *obj);

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
 *          if (((MK3OBJ *)obj->field48)->field00->field18 == 0x215)
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

    /* THREE loads in the binary, not two: `ldr r3, [r5, #0x48]` then
     * `ldr r3, [r3]` then `ldr r2, [r3, #0x18]`. So it is the PROC of
     * the object at 0x48, not that object's own 0x18 -- which is what
     * `tl_do_scorp_tele` writes 0x215 into when it starts this thread. */
    if (((MK3OBJ *)(uintptr_t)obj->field48)->field00->field18 == 0x215) {
        *mk3_frame(thread, thread->frame + 1) = 0x297;
        thread->fieldfc = 1;            /* look again next tick */
        return 1;
    }

    MKEvent_Add(1, 4, 0, 0);

    *mk3_frame(thread, thread->frame + 1) = 0x29c;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}


/* ------------------------------------------------------------- t_pounce_adjust_him
 *
 * armv7 0x00040090, 136 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      is_he_airborn(obj)
 *      if (obj->field5c == 0) {
 *          pounce_ground_him(obj)          ; on the ground
 *      } else {
 *          stop_him(obj)                   ; in the air
 *          match_him_with_me(obj)
 *          obj->field1c = 0
 *          obj->field20 = 0x20
 *          adjust_him_xy(obj)
 *      }
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * **Two ways to put the opponent where the pounce needs him**, chosen by
 * whether he is already off the ground. Grounded, the whole job is handed to
 * `pounce_ground_him`, which copies a position across and grounds him.
 * Airborne, he is stopped, matched, and moved by a fixed 0x20 through
 * `adjust_him_xy`.
 *
 * The zero into 0x1c is `str r6` -- the guard value the entry test already
 * proved is zero -- so the constant costs no instruction of its own. This
 * directory does that everywhere the guard's register is still live.
 *
 * Both branches then meet at the same ending, and the compiler emitted the
 * pointer-slot load for `t_local_reaction_exit` TWICE, once per path, rather
 * than sharing one. Same slot, 0x000f3708, both times.
 */
long t_pounce_adjust_him(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_he_airborn(obj);

    if (obj->field5c == 0) {
        pounce_ground_him(obj);         /* he is standing on it */
    } else {
        stop_him(obj);
        match_him_with_me(obj);
        obj->field1c = 0;               /* str r6: the guard's zero */
        obj->field20 = 0x20;
        adjust_him_xy(obj);
    }

    if ((long)thread->frame > 0) {
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------------------- t_lao_angle_scan
 *
 * armv7 0x0003c7e0, 136 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      w = *(uint32_t *)obj->field40       ; the animation's first word
 *      obj->field1c = w
 *      if (w == 0) {
 *          obj->field1c = 0x12
 *          strike_check_a0(obj)
 *          if (obj->field5c != 0) {
 *              frame[frame].handler = t_lao_angle_hit
 *              frame[frame+1].w0 = 0
 *              return 0
 *          }
 *      }
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * **The scan only tests for a hit once the animation has run out.** 0x40 holds
 * a pointer here, not a number, and its first word being zero is what says the
 * frames are finished -- so the hat is checked against the opponent on the
 * frame the animation ends, and on every other frame the thread just returns
 * up a level.
 *
 * `strike_check_a0` answers into 0x5c, the same slot the `is_he_*` family uses.
 * A hit installs `t_lao_angle_hit`, reached as a direct pc-relative address so
 * it is in this file; a miss takes the same ending as an unfinished animation.
 *
 * The zero written to the slot above comes from r6, which still holds the word
 * the test proved was zero -- no constant is loaded for it.
 */
long t_lao_angle_scan(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t w;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    w = *(uint32_t *)(uintptr_t)obj->field40;
    obj->field1c = w;

    if (w == 0) {                       /* the animation has run out */
        obj->field1c = 0x12;
        strike_check_a0(obj);

        if (obj->field5c != 0)          /* and it connected */
            return mk3_push_handler(thread, (MK3THREADFUNC)t_lao_angle_hit);
    }

    if ((long)thread->frame > 0) {
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------------------ t_blb8
 *
 * armv7 0x0003bf88, 140 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c = 4
 *                        obj->field24 = 4
 *                        obj->field20 = 3
 *                        token := 0x32c, then descend into t_shake_ob_up
 *      token == 0x32c:   frame[frame].handler = t_local_reaction_exit
 *      otherwise:        return -3
 *
 * The two-state shape: go down a level into the shake, and when the token
 * comes back, hand over to the exit.
 *
 * **The resume installs at the ORIGINAL frame index**, held in `ip` from the
 * first instruction of the function, rather than re-reading 0xa4. That is not
 * an optimisation -- it is the same index either way, because the descend
 * happened on a different entry and this one never touched it -- but it is
 * why the resume path has no second load.
 *
 * 4 goes to both 0x1c and 0x24 from one register, and 3 to 0x20; three stores,
 * two constants.
 */
long t_blb8(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x32c)
            return -3;
        return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    obj->field1c = 4;
    obj->field24 = 4;
    obj->field20 = 3;

    *mk3_frame(thread, thread->frame + 1) = 0x32c;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------- tl_do_robo_air_grab
 *
 * armv7 0x0003cf94, 152 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20          = 0x209
 *                        obj->field00->field18 = 0x209
 *                        air_init_special(obj)
 *                        obj->field1c = 0x23
 *                        ochar_sound(obj)
 *                        obj->field40 = 6
 *                        find_ani2_part2(obj)
 *                        do_next_a9_frame(obj)
 *                        park(token 0x7ee, duration 3)
 *
 *      token == 0x7ee:   obj->field1c = 4
 *                        init_anirate(obj)
 *                        obj->a10     = obj->field00->him
 *                        obj->field48 = 6
 *                        frame[frame].handler = t_air_sleep3
 *
 *      otherwise:        return -3
 *
 * Entry 9 of the propell table. **It parks on one state and installs on the
 * other**, which is the mixed shape: three ticks of nothing after the grab
 * animation starts, then the opponent is written into the argument slot and
 * the thread hands over to the air sleep.
 *
 * 0x209 goes to the object's 0x20 and the PROC's 0x18 from one register, the
 * action pair this file writes together everywhere.
 *
 * The animation is found with `find_ani2_part2` -- the *2* variant, matching
 * the `get_char_ani2` family -- rather than the plain one used by the ground
 * moves.
 */
long tl_do_robo_air_grab(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x7ee)
            return -3;

        obj->field1c = 4;
        init_anirate(obj);

        obj->a10     = obj->field00->him;
        obj->field48 = 6;

        return mk3_push_handler(thread, (MK3THREADFUNC)t_air_sleep3);
    }

    obj->field20          = 0x209;
    obj->field00->field18 = 0x209;
    air_init_special(obj);

    obj->field1c = 0x23;
    ochar_sound(obj);

    obj->field40 = 6;
    find_ani2_part2(obj);
    do_next_a9_frame(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x7ee;
    thread->fieldfc = 3;
    return 3;
}


/* ----------------------------------------------------------------- t_lao_angle_hit
 *
 * armv7 0x0003cc30, 152 bytes.  **Complete.**
 *
 *      token == 0:       stop_me_player(obj)
 *                        if (obj->field18 != 0)
 *                            frame[frame].handler = t_lao_angle_blocked
 *                        else
 *                            park(token 0x8d1, duration 6)
 *
 *      token == 0x8d1:   obj->field24 = 0x8000
 *                        obj->field28 = 0xfff
 *                        obj->field1c = 0
 *                        obj->field20 = 0
 *                        frame[frame].handler = t_land_on_yer_feet
 *
 *      otherwise:        return -3
 *
 * The other half of `t_lao_angle_scan`, which installs this when the hat
 * connects. **0x18 decides whether it counted**: non-zero and the move goes
 * to the blocked routine straight away, zero and the thread waits six ticks
 * before setting up the landing.
 *
 * `t_lao_angle_blocked` is a direct pc-relative address, so it is in this
 * file; `t_land_on_yer_feet` comes through the slot at 0x000f3778, so it is
 * not.
 *
 * The two zeros on the resume path are `str r0` with r0 already zero from the
 * `movs r0, #0` that also feeds the slot clear -- one constant, three uses.
 */
long t_lao_angle_hit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x8d1)
            return -3;

        obj->field24 = 0x8000;
        obj->field28 = 0xfff;
        obj->field1c = 0;
        obj->field20 = 0;

        return mk3_push_handler(thread, (MK3THREADFUNC)t_land_on_yer_feet);
    }

    stop_me_player(obj);

    if (obj->field18 != 0)              /* he blocked it */
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_lao_angle_blocked);

    *mk3_frame(thread, thread->frame + 1) = 0x8d1;
    thread->fieldfc = 6;
    return 6;
}


/* ------------------------------------------------------------------- t_pounce_scan
 *
 * armv7 0x0003d224, 152 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      sans_repell_3(obj)
 *      obj->field1c = 0x12
 *      q_is_he_a_boss(obj)
 *      if (obj->field5c != 0)
 *          obj->field1c = 0x13         ; a boss gets a different box
 *      strike_check_a0(obj)
 *      if (obj->field5c != 0) {
 *          frame[frame].handler = t_pounce_hit
 *          return 0
 *      }
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * **The strike box depends on who the opponent is.** 0x12 is written first,
 * `q_is_he_a_boss` answers into 0x5c, and a boss replaces it with 0x13 before
 * the check runs. So the pounce reaches a boss differently from anyone else,
 * and it is one number's difference.
 *
 * 0x5c carries two unrelated answers in six instructions -- first whether he
 * is a boss, then whether the strike connected -- because both routines write
 * their result there. Nothing saves the first one, and nothing needs to.
 *
 * `t_pounce_hit` is a direct pc-relative address, so it is in this file.
 */
long t_pounce_scan(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    sans_repell_3(obj);

    obj->field1c = 0x12;
    q_is_he_a_boss(obj);
    if (obj->field5c != 0)
        obj->field1c = 0x13;            /* a boss gets its own box */

    strike_check_a0(obj);
    if (obj->field5c != 0)
        return mk3_push_handler(thread, (MK3THREADFUNC)t_pounce_hit);

    if ((long)thread->frame > 0) {
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ----------------------------------------------------------------------- t_lfly4
 *
 * armv7 0x0003d02c, 160 bytes.  **Complete.**
 *
 *      token == 0:       park(token 0x6dc, duration 1)
 *
 *      token == 0x6dc:   next_anirate(obj)
 *                        obj->field1c = 0x11
 *                        strike_check_a0(obj)
 *                        if (obj->field5c != 0) {
 *                            frame[frame].handler = t_liz_fly_hit
 *                            return 0
 *                        }
 *                        if (--obj->field48 > 0)
 *                            park(token 0x6dc, duration 1)
 *                        else
 *                            frame[frame].handler = t_square3
 *
 *      otherwise:        return -3
 *
 * **A one-tick poll with a countdown.** The flight checks for a strike once a
 * frame and re-parks with its own token, so 0x6dc is both what it waits on and
 * what it wakes into. 0x48 is the number of frames left; it is decremented and
 * written back every pass, and when it runs out the thread hands over to
 * `t_square3` instead.
 *
 * Entry and re-park share one piece of code -- the `beq` from the guard lands
 * on the same three instructions the countdown falls into -- which is why the
 * first tick and every later one cost the same.
 *
 * Both handlers are direct pc-relative addresses, so both are in this file.
 */
long t_lfly4(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x6dc)
            return -3;

        next_anirate(obj);

        obj->field1c = 0x11;
        strike_check_a0(obj);
        if (obj->field5c != 0)
            return mk3_push_handler(thread, (MK3THREADFUNC)t_liz_fly_hit);

        obj->field48 -= 1;
        if ((int32_t)obj->field48 <= 0)         /* out of frames */
            return mk3_push_handler(thread, (MK3THREADFUNC)t_square3);
    }

    *mk3_frame(thread, thread->frame + 1) = 0x6dc;
    thread->fieldfc = 1;                        /* look again next tick */
    return 1;
}


/* --------------------------------------------------------------- t_cyrax_implode
 *
 * armv7 0x0003d4f8, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field08[+0x2c] = 0x422
 *                        ground_player(obj)
 *                        obj->field48 = obj->field1c
 *                        obj->field1c = 9
 *                        create_fx(obj)
 *                        park(token 0x722, duration 0xa)
 *
 *      token == 0x722:   clear_nocol(obj)
 *                        park(token 0x724, duration 9)
 *
 *      token == 0x724:   if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *                        frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * **Three states, not two.** Every other coroutine read in this directory so
 * far has an entry and one resume; this one runs 0 -> 0x722 -> 0x724 and only
 * then returns up a level. `tools/parkfn.py` models two states and refuses
 * anything with a second token check, which is why routines like this stay
 * hand-read.
 *
 * The timing is ten ticks then nine: the effect is spawned and left alone for
 * ten, collision is cleared and left for nine more, and the move ends.
 *
 * 0x1c is saved into 0x48 before being overwritten with the effect number, so
 * whatever the caller left there survives the implosion.
 *
 * The frame index is read ONCE at the top into r1 and reused on every path,
 * including both parks -- so all three states address the same slot without
 * re-reading 0xa4, which the two-state routines do not bother to avoid.
 */
long t_cyrax_implode(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x722) {
        clear_nocol(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x724;
        thread->fieldfc = 9;
        return 9;
    }

    if (token == 0x724) {
        if ((long)thread->frame > 0) {
            thread->frame -= 1;         /* back up a level */
            return 0;
        }
        return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    *(uint32_t *)((char *)obj->field08 + 0x2c) = 0x422;
    ground_player(obj);

    obj->field48 = obj->field1c;        /* kept across the effect */
    obj->field1c = 9;
    create_fx(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x722;
    thread->fieldfc = 0xa;
    return 0xa;
}


/* --------------------------------------------------------------------- t_square3
 *
 * armv7 0x0003d804, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field40 = 0x10016
 *                        pose_a9_manual(obj)
 *                        face_opponent(obj)
 *                        obj->field1c = 0
 *                        obj->field20 = 0x20000
 *                        obj->field24 = 0x8000
 *                        obj->field28 = 0xfff
 *                        token := 0x6ee, then descend into t_flight
 *
 *      token == 0x6ee:   frame[frame].handler = t_jump_up_land_jsrp
 *
 *      otherwise:        return -3
 *
 * The end of the square wave: pose, face the opponent, set a velocity and go
 * down a level into the shared flight routine; when that returns, land.
 *
 * **0x8000 is derived from 0x20000 by subtraction** -- `sub.w r3, r3, #0x18000`
 * on the value already in the register -- so 2.0 and 0.5 in the 16.16 this
 * directory uses for velocity cost one literal between them.
 *
 * 0x10016 into 0x40 is the packed shape 0x40 takes when it is a number rather
 * than a pointer: 1 in the high half and 0x16 in the low.
 *
 * `t_flight` and `t_jump_up_land_jsrp` both arrive through pointer slots, so
 * neither is in this file. `t_flight` is the routine in other.c that pushes a
 * level and keeps its place -- this is one of its callers.
 */
long t_square3(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x6ee)
            return -3;
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_jump_up_land_jsrp);
    }

    obj->field40 = 0x10016;             /* 1 high, 0x16 low */
    pose_a9_manual(obj);
    face_opponent(obj);

    obj->field1c = 0;
    obj->field20 = 0x20000;             /* 2.0 */
    obj->field24 = 0x8000;              /* 0.5, reached by subtraction */
    obj->field28 = 0xfff;

    *mk3_frame(thread, thread->frame + 1) = 0x6ee;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------- t_lao_angle_blocked
 *
 * armv7 0x0003c1a4, 172 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c          = 0x60f
 *                        obj->field00->field18 = 0x60f
 *                        obj->field40 = 0x1a
 *                        get_char_ani(obj)
 *                        obj->field40 += 4
 *                        obj->field1c = 0x4000
 *                        obj->field20 = 0xfff90000
 *                        obj->field24 = 0x6000
 *                        obj->field28 = 3
 *                        token := 0x8c5, then descend into t_flight
 *
 *      token == 0x8c5:   frame[frame].handler = t_jump_up_land_jump
 *
 *      otherwise:        return -3
 *
 * What happens when the hat is blocked: the action pair goes to 0x60f, an
 * animation is resolved and then offset by 4, a velocity is set, and the
 * thread descends into the shared flight routine. When that comes back it
 * lands in a jump rather than on its feet -- `t_jump_up_land_jump`, where
 * `t_lao_angle_hit` used `t_land_on_yer_feet`. Blocked and connected end
 * differently.
 *
 * **The three velocity components are one literal and two arithmetic steps**:
 * 0x4000, then `sub #0x74000` reaches 0xfff90000, then `add #0x76000` on THAT
 * reaches 0x6000. In the 16.16 this directory uses that is 0.25, -7.0 and
 * 0.38 -- three numbers with nothing in common, produced by a chain because
 * each fits an immediate where the value itself would need a pool entry.
 *
 * 0x40 is resolved by `get_char_ani` and then has 4 ADDED to it, the same
 * offset-from-the-resolved-animation shape `tl_do_lia_stay_afloat` uses with
 * 0x18.
 */
long t_lao_angle_blocked(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x8c5)
            return -3;
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_jump_up_land_jump);
    }

    obj->field1c          = 0x60f;
    obj->field00->field18 = 0x60f;

    obj->field40 = 0x1a;
    get_char_ani(obj);
    obj->field40 += 4;                  /* an offset from what was resolved */

    obj->field1c = 0x4000;              /*  0.25 */
    obj->field20 = 0xfff90000u;         /* -7.00, by sub #0x74000 */
    obj->field24 = 0x6000;              /*  0.38, by add #0x76000 on that */
    obj->field28 = 3;

    *mk3_frame(thread, thread->frame + 1) = 0x8c5;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------- t_tele_scan
 *
 * armv7 0x0003c868, 184 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      n = obj->field00->field28
 *      obj->field1c = n
 *      if (n == 0) {
 *          obj->field00->field18 = 0x622
 *          obj->field1c = 0x13
 *          strike_check_a0(obj)
 *          if (obj->field5c != 0) {
 *              obj->field00[+0x2c]   = obj->field18
 *              obj->field1c          = 1
 *              obj->field00->field28 = 1
 *          }
 *      }
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * **PROC+0x28 is a once-only flag here.** The scan strikes only while it reads
 * zero, and sets it to 1 on a hit -- so a teleport can connect once and then
 * keeps running without hitting again on later frames.
 *
 * Every path ends the same way: return up a level, or install the reaction
 * exit if there is no level left. The compiler emitted that ending THREE
 * times, once per path, each with its own load of the same pointer slot at
 * 0x000f3708. Written once here, because the three copies do the same thing.
 *
 * PROC+0x2c is written by byte offset: it falls inside the unnamed run at
 * 0x2c and this is the second store to reach it, which is still not enough to
 * name it.
 */
long t_tele_scan(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = obj->field00->field28;
    obj->field1c = n;

    if (n == 0) {                       /* it has not connected yet */
        obj->field00->field18 = 0x622;

        obj->field1c = 0x13;
        strike_check_a0(obj);

        if (obj->field5c != 0) {        /* and it does now */
            *(uint32_t *)((char *)obj->field00 + 0x2c) = obj->field18;
            obj->field1c          = 1;
            obj->field00->field28 = 1;  /* not again */
        }
    }

    if ((long)thread->frame > 0) {
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* -------------------------------------------------------------- tl_do_lao_angle
 *
 * armv7 0x0003e99c, 192 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20          = 0x20c
 *                        obj->field00->field18 = 0x20c
 *                        air_init_special(obj)
 *                        obj->field1c = 0; group_sound(obj)
 *                        obj->field1c = 0; ochar_sound(obj)
 *                        obj->field40 = 0x19
 *                        obj->field1c = 0xfff80000
 *                        obj->field20 = 0x00030000
 *                        obj->field24 = 0x00004000
 *                        obj->field28 = 2
 *                        obj->field34 = t_lao_angle_scan
 *                        token := 0x8f8, then descend into t_flight_call
 *
 *      token == 0x8f8:   frame[frame].handler = t_jump_up_land_jsrp
 *
 *      otherwise:        return -3
 *
 * Entry 7 of the propell table, and the clearest example in this file of how a
 * special move is set up: the action pair, two sounds, an animation, three
 * velocity components, **a callback**, and then a descend.
 *
 * **0x34 is the callback slot.** `t_lao_angle_scan` is written there and
 * `t_flight_call` is what runs it -- so the flight routine is generic and the
 * per-move behaviour is the function it is handed. `flight_move_ani` writes
 * the same slot with `is_he_left` or `is_he_right` and calls it directly.
 *
 * The three velocity components are one literal and two steps again:
 * 0xfff80000, then `add #0xb0000` reaches 0x30000, then `sub #0x2c000` reaches
 * 0x4000 -- -8.0, 3.0 and 0.25 in 16.16.
 *
 * Both sounds are asked for with 0 in 0x1c, written from the register the
 * guard already proved was zero.
 */
long tl_do_lao_angle(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x8f8)
            return -3;
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_jump_up_land_jsrp);
    }

    obj->field20          = 0x20c;
    obj->field00->field18 = 0x20c;
    air_init_special(obj);

    obj->field1c = 0;
    group_sound(obj);
    obj->field1c = 0;
    ochar_sound(obj);

    obj->field40 = 0x19;

    obj->field1c = 0xfff80000u;         /* -8.00 */
    obj->field20 = 0x00030000;          /*  3.00, by add #0xb0000 */
    obj->field24 = 0x00004000;          /*  0.25, by sub #0x2c000 */
    obj->field28 = 2;

    obj->field34 = (uint32_t)(uintptr_t)t_lao_angle_scan;   /* the callback */

    *mk3_frame(thread, thread->frame + 1) = 0x8f8;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight_call;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------- t_super_kick_land
 *
 * armv7 0x0003ccc8, 196 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20          = 0x612
 *                        obj->field00->field18 = 0x612
 *                        stop_me_player(obj)
 *                        park(token 0x5d7, duration 0x14)
 *
 *      token == 0x5d7:   obj->field1c = 0
 *                        obj->field24 = 0xa000
 *                        obj->field20 = 0
 *                        obj->field34 = 0
 *                        obj->field28 = 0xfff
 *                        token := 0x5de, then descend into t_flight
 *
 *      token == 0x5de:   obj->field40 = 3
 *                        find_ani2_part2(obj)
 *                        obj->field1c = 3
 *                        frame[frame].handler = t_mframew
 *
 *      otherwise:        return -3
 *
 * **Three states**, like `t_cyrax_implode`: stop and wait twenty ticks, then
 * fall through `t_flight`, then pick the landing animation. Two tokens and a
 * descend between them.
 *
 * **0x34 is CLEARED before the descend.** That is the callback slot -- the one
 * `tl_do_lao_angle` fills with `t_lao_angle_scan` so the flight has something
 * per-move to run. Zeroing it here says this flight has none, which is the
 * other half of what that slot means.
 *
 * 0xa000 is 0.625 in the 16.16 this directory uses. It is the only velocity
 * component set; 0x1c and 0x20 are zeroed from the same register beside it.
 *
 * The frame index is shifted by `lsls r3, r6` with r6 holding 3, rather than
 * by an immediate -- the register was already 3 for `obj->field40`, so the
 * shift borrows it.
 */
long t_super_kick_land(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x5d7) {
        obj->field1c = 0;
        obj->field24 = 0xa000;          /* 0.625 */
        obj->field20 = 0;
        obj->field34 = 0;               /* no callback for this flight */
        obj->field28 = 0xfff;

        *mk3_frame(thread, thread->frame + 1) = 0x5de;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x5de) {
        obj->field40 = 3;
        find_ani2_part2(obj);
        obj->field1c = 3;
        return mk3_push_handler(thread, (MK3THREADFUNC)t_mframew);
    }

    if (token != 0)
        return -3;

    obj->field20          = 0x612;
    obj->field00->field18 = 0x612;
    stop_me_player(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x5d7;
    thread->fieldfc = 0x14;
    return 0x14;
}


/* -------------------------------------------------------------- t_blur_catchup
 *
 * armv7 0x0003d6a4, 200 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c = 1
 *                        ochar_sound(obj)
 *                        obj->field48 = 0x00070004
 *                        shake_a11(obj)
 *                        obj->field38 = 0x12
 *                        *(uint16_t *)(G + 0x456) = 0x12
 *                        obj->field40 = 0
 *                        get_char_ani2(obj)
 *                        find_part2(obj)
 *                        obj->field1c = 3
 *                        token := 0x536, then descend into t_mframew
 *
 *      token == 0x536:   if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *                        frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * 0x48 gets **another packed pair, 7 high and 4 low**, and `shake_a11` is what
 * reads it -- so the shake's two amplitudes come from one word, the same shape
 * `skinny_spawn` unpacks and `bike_hit_call` passes on.
 *
 * 0x12 goes to the object's 0x38 and to the halfword at G+0x456 from one
 * register, which is the third routine in this file to write that global slot
 * alongside a field of its own.
 *
 * The zero into 0x40 comes from the guard's register, so `get_char_ani2`
 * resolves animation zero without a constant being loaded for it.
 */
long t_blur_catchup(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x536)
            return -3;

        if ((long)thread->frame > 0) {
            thread->frame -= 1;         /* back up a level */
            return 0;
        }
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_local_reaction_exit);
    }

    obj->field1c = 1;
    ochar_sound(obj);

    obj->field48 = 0x00070004;          /* 7 high, 4 low */
    shake_a11(obj);

    obj->field38 = 0x12;
    *(uint16_t *)(G_BYTES + 0x456) = 0x12;

    obj->field40 = 0;                   /* the guard's zero */
    get_char_ani2(obj);
    find_part2(obj);

    obj->field1c = 3;

    *mk3_frame(thread, thread->frame + 1) = 0x536;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ----------------------------------------------------------------------- t_lfly5
 *
 * armv7 0x0003ea5c, 200 bytes.  **Complete.**
 *
 *      token == 0:       park(token 0x6c4, duration 1)
 *
 *      token == 0x6c4:   distance_off_ground(obj)
 *                        if (obj->field1c <= 0x5f) {
 *                            frame[frame].handler = t_lfly5   ; itself
 *                        } else {
 *                            obj->field1c = 0; group_sound(obj)
 *                            obj->field1c          = 0
 *                            obj->field08->field1c = 0
 *                            obj->field40 = 3; get_char_ani2(obj)
 *                            obj->field1c = 3; init_anirate(obj)
 *                            obj->field1c = 0xa0000
 *                            towards_x_vel(obj)
 *                            face_opponent(obj)
 *                            obj->field48 = 0x1a
 *                            frame[frame].handler = t_lfly4
 *                        }
 *
 *      otherwise:        return -3
 *
 * **It waits for height by installing itself.** Below 0x5f off the ground the
 * handler it installs is `t_lfly5` -- the same function, at a direct
 * pc-relative 0x0003ea5d, which is this function's own address with the Thumb
 * bit. Installing also clears the slot above, so the token goes back to zero,
 * the next entry parks with 0x6c4 again, and the check repeats every two
 * ticks until the fighter is high enough.
 *
 * Once he is, the move is set up in full and handed to `t_lfly4`, which is the
 * one-tick strike poll with the countdown at 0x48 -- and 0x1a is the number of
 * frames written here for it to count down.
 *
 * 0xa0000 is 10.0 in the 16.16 this directory uses for velocity.
 */
long t_lfly5(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x6c4;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x6c4)
        return -3;

    distance_off_ground(obj);
    if ((long)obj->field1c <= 0x5f)     /* not high enough yet */
        return mk3_push_handler(thread, (MK3THREADFUNC)t_lfly5);

    obj->field1c = 0;
    group_sound(obj);

    obj->field1c          = 0;
    obj->field08->field1c = 0;

    obj->field40 = 3;
    get_char_ani2(obj);
    obj->field1c = 3;
    init_anirate(obj);

    obj->field1c = 0xa0000;             /* 10.0 */
    towards_x_vel(obj);
    face_opponent(obj);

    obj->field48 = 0x1a;                /* the frames t_lfly4 counts down */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_lfly4);
}


/* ------------------------------------------------------------------ t_pounce_miss
 *
 * armv7 0x0003fd10, 212 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c          = 0x62f
 *                        obj->field00->field18 = 0x62f
 *                        set_no_block(obj)
 *                        park(token 0x50b, duration 0xc)
 *
 *      token == 0x50b:   do_next_a9_frame(obj)
 *                        park(token 0x50d, duration 4)
 *
 *      token == 0x50d:   q_is_he_a_boss(obj)
 *                        if (obj->field5c != 0)
 *                            park(token 0x512, duration 8)
 *                        else
 *                            frame[frame].handler = t_local_reaction_exit
 *
 *      token == 0x512:   frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * **Four states, and the fourth only exists against a boss.** The recovery
 * from a missed pounce is twelve ticks, then four, and then it ends -- unless
 * `q_is_he_a_boss` answers yes, in which case there are eight more before the
 * exit. Missing a boss costs longer than missing anyone else, and that is the
 * whole difference between the two endings.
 *
 * The dispatch is a **sorted comparison chain**, not a flat run of equality
 * tests: `cmp` against 0x50b, then `ble` for everything below it, then 0x50d,
 * then `adds r2, #5` to reach 0x512 from the constant already in the register.
 * With four tokens the compiler ordered them instead of testing each in turn.
 *
 * The last state addresses the frame through r1, the index read in the first
 * instruction, and `adds r3, r3, r0` with r0 still holding the thread -- that
 * path never touched either, so nothing had to be re-read.
 */
long t_pounce_miss(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x50b) {
        do_next_a9_frame(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x50d;
        thread->fieldfc = 4;
        return 4;
    }

    if (token == 0x50d) {
        q_is_he_a_boss(obj);
        if (obj->field5c != 0) {        /* a boss takes longer */
            *mk3_frame(thread, thread->frame + 1) = 0x512;
            thread->fieldfc = 8;
            return 8;
        }
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token == 0x512)
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_local_reaction_exit);

    if (token != 0)
        return -3;

    obj->field1c          = 0x62f;
    obj->field00->field18 = 0x62f;
    set_no_block(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x50b;
    thread->fieldfc = 0xc;
    return 0xc;
}


/* ------------------------------------------------------------- tl_do_reptile_dash
 *
 * armv7 0x0003ef90, 212 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20 = 0x216
 *                        init_special_act(obj)
 *                        obj->field40 = 0x46
 *                        get_char_ani(obj)
 *                        obj->field1c = 0xd0000
 *                        towards_x_vel(obj)
 *                        obj->a10 = 0x10
 *                        park(token 0x236, duration 1)
 *
 *      token == 0x236:   do_next_a9_frame(obj)
 *                        sans_repell_3(obj)
 *                        is_he_airborn(obj)
 *                        if (obj->field5c == 0) {
 *                            obj->field1c = 0x15
 *                            strike_check_a0(obj)
 *                            if (obj->field5c != 0) {
 *                                frame[frame].handler = t_reptile_dash_hit
 *                                return 0
 *                            }
 *                        }
 *                        if (--obj->a10 > 0)
 *                            park(token 0x236, duration 1)
 *                        else
 *                            frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * Entry 23 of the propell table. A one-tick loop for sixteen frames: advance
 * the animation, cancel the repel, and look for a strike.
 *
 * **The dash only strikes an opponent who is on the ground.** `is_he_airborn`
 * answers into 0x5c and a non-zero there skips the check entirely -- so a
 * jumping opponent is passed under rather than hit, and the dash still runs
 * its full sixteen frames.
 *
 * **0x44 is a frame counter here, not the argument slot.** The struct calls it
 * `a10` because that is what it usually is; this routine sets it to 0x10 and
 * counts it down, which is worth knowing before anyone reads a value out of
 * it expecting an argument.
 *
 * The park is shared between the entry and the countdown -- the `bgt` jumps
 * back to the same three instructions state 0 falls into -- so the first tick
 * and every later one cost the same.
 *
 * 0xd0000 is 13.0 in the 16.16 this directory uses.
 */
long tl_do_reptile_dash(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x236)
            return -3;

        do_next_a9_frame(obj);
        sans_repell_3(obj);

        is_he_airborn(obj);
        if (obj->field5c == 0) {        /* only a grounded opponent is hit */
            obj->field1c = 0x15;
            strike_check_a0(obj);
            if (obj->field5c != 0)
                return mk3_push_handler(thread,
                                        (MK3THREADFUNC)t_reptile_dash_hit);
        }

        obj->a10 -= 1;
        if ((int32_t)obj->a10 <= 0)     /* out of frames */
            return mk3_push_handler(thread,
                                    (MK3THREADFUNC)t_local_reaction_exit);
    } else {
        obj->field20 = 0x216;
        init_special_act(obj);

        obj->field40 = 0x46;
        get_char_ani(obj);

        obj->field1c = 0xd0000;         /* 13.0 */
        towards_x_vel(obj);

        obj->a10 = 0x10;                /* sixteen frames, counted down */
    }

    *mk3_frame(thread, thread->frame + 1) = 0x236;
    thread->fieldfc = 1;
    return 1;
}


/* -------------------------------------------------------------------- t_pounce_hit
 *
 * armv7 0x0003e36c, 232 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      <collapse one level>            ; twice, inline
 *      <collapse one level>
 *      reset_proc_stack(thread)
 *      obj->field20 = 0xd
 *      obj->field24 = 0xd
 *      obj->field28 = 0xd
 *      obj->field1c = 0
 *      obj->field34 = t_pounce_adjust_him
 *      frame[frame].handler = t_pounce_fall
 *      frame[frame+1].w0 = 0
 *
 * **It unwinds TWO levels of the thread's frame stack**, and that is the whole
 * point of the function. `t_pounce_scan` is running nested inside whatever
 * launched the pounce; when the strike connects, the fall must not stay nested
 * under it, so two levels are collapsed before the fall handler is installed.
 *
 * One collapse is:
 *
 *      if (thread->frame > 0)
 *          thread->frame -= 1
 *      else
 *          frame[frame].handler = t_local_reaction_exit, slot cleared
 *
 *      n = thread->frame
 *      h = frame[n+1].handler          ; the level above
 *      frame[n+1].w0 = frame[n+2].w0   ; its token comes down
 *      frame[n].handler = h            ; and so does its handler
 *
 * so the level above is moved down onto this one. The binary has that block
 * written out TWICE, in full, one after the other; it is a static function
 * here because two identical copies read worse than one named thing used
 * twice, and nothing else in the file needs it.
 *
 * At the bottom of the stack the else-branch installs the reaction exit
 * instead of decrementing, so a pounce that connects with nothing left to
 * unwind still ends cleanly rather than running off the end.
 *
 * 0xd goes to three fields from one register, and 0x34 -- the callback slot --
 * gets `t_pounce_adjust_him`, which is the routine `t_pounce_fall` will run
 * each frame to keep the opponent under the attacker.
 */
static void pounce_collapse_one(MK3THREAD *thread)
{
    uint32_t n;
    uint32_t h;

    if ((long)thread->frame > 0)
        thread->frame -= 1;
    else
        mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);

    n = thread->frame;
    h = mk3_frame(thread, n + 1)[1];            /* the level above */
    *mk3_frame(thread, n + 1) = *mk3_frame(thread, n + 2);
    mk3_frame(thread, n)[1] = h;
}

long t_pounce_hit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    pounce_collapse_one(thread);        /* written out twice in the binary */
    pounce_collapse_one(thread);

    reset_proc_stack(thread);

    obj->field20 = 0xd;
    obj->field24 = 0xd;
    obj->field28 = 0xd;
    obj->field1c = 0;

    obj->field34 = (uint32_t)(uintptr_t)t_pounce_adjust_him;    /* callback */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_pounce_fall);
}


/* ------------------------------------------------------------------ t_zoom_blocked
 *
 * armv7 0x0003e8bc, 224 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c          = 0x61e
 *                        obj->field00->field18 = 0x61e
 *                        match_me_with_him(obj)
 *                        f = obj->field08->field28 & ~0x10
 *                        obj->field2c          = f
 *                        obj->field08->field28 = f
 *                        obj->field1c = 0x10
 *                        v = obj->field08->field18
 *                        obj->field20 = 0
 *                        obj->field28 = v
 *                        if (v >= 0) obj->field1c = -0x10
 *                        multi_adjust_xy(obj)
 *                        face_opponent(obj)
 *                        obj->field40 = 0x1a
 *                        get_char_ani(obj)
 *                        obj->field40 += 4
 *                        obj->field1c = 0x00010000
 *                        obj->field20 = 0xfff80000
 *                        obj->field24 = 0x00006000
 *                        obj->field28 = 2
 *                        token := 0x3f6, then descend into t_flight
 *
 *      token == 0x3f6:   frame[frame].handler = t_jump_up_land_jump
 *
 *      otherwise:        return -3
 *
 * **It forces the flip bit OFF rather than toggling it.** `bic r3, r3, #0x10`
 * on the other object's 0x28 clears the same bit `flip_multi_ob` XORs, and the
 * result is written to both that field and this object's 0x2c. A blocked zoom
 * must end facing a known way, and a toggle could not guarantee that.
 *
 * The push-back distance is **signed by which side he is on**: 0x10 is written
 * first, and `mvnge r3, #0xf` replaces it with -0x10 when the other object's
 * 0x18 is not negative. One `mvn` for the negative constant, in an IT block
 * rather than a branch.
 *
 * The three velocity components are one literal and two steps once more:
 * 0x10000, then `sub #0x90000` reaches 0xfff80000, then `add #0x86000` reaches
 * 0x6000 -- 1.0, -8.0 and 0.375. That is the fourth routine in this file built
 * that way.
 *
 * It ends like `t_lao_angle_blocked`: descend into the shared flight and come
 * back to `t_jump_up_land_jump`. Blocked specials land in a jump.
 */
long t_zoom_blocked(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t f;
    int32_t  v;

    if (token != 0) {
        if (token != 0x3f6)
            return -3;
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_jump_up_land_jump);
    }

    obj->field1c          = 0x61e;
    obj->field00->field18 = 0x61e;
    match_me_with_him(obj);

    f = obj->field08->field28 & ~0x10u;         /* cleared, not toggled */
    obj->field2c          = f;
    obj->field08->field28 = f;

    obj->field1c = 0x10;
    v = (int32_t)obj->field08->field18;
    obj->field20 = 0;
    obj->field28 = (uint32_t)v;
    if (v >= 0)
        obj->field1c = (uint32_t)(-0x10);       /* mvnge r3, #0xf */

    multi_adjust_xy(obj);
    face_opponent(obj);

    obj->field40 = 0x1a;
    get_char_ani(obj);
    obj->field40 += 4;                  /* an offset from what was resolved */

    obj->field1c = 0x00010000;          /*  1.000 */
    obj->field20 = 0xfff80000u;         /* -8.000, by sub #0x90000 */
    obj->field24 = 0x00006000;          /*  0.375, by add #0x86000 on that */
    obj->field28 = 2;

    *mk3_frame(thread, thread->frame + 1) = 0x3f6;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------- t_tusk_blur_blocked
 *
 * armv7 0x0003fe00, 216 bytes.  **Complete.**
 *
 *      token == 0:       blur_blocked_setup(obj)
 *                        w = *(uint32_t *)obj->field40
 *                        obj->field1c = w
 *                        if (w != 0) {
 *                            obj->field1c = 1
 *                            token := 0x321, descend into t_mframew
 *                        }
 *                        ; and otherwise falls into the 0x321 body below
 *
 *      token == 0x321:   obj->field40 = 1
 *                        find_ani2_part2(obj)
 *                        obj->field1c = 1
 *                        token := 0x326, descend into t_mframew
 *
 *      token == 0x326:   frame[frame].handler = t_blb8
 *
 *      otherwise:        return -3
 *
 * Three states, and the first one **falls into the second's body** when the
 * animation at 0x40 has already run out. That is why the entry has two exits:
 * a first word still there means one pass through `t_mframew` under token
 * 0x321 before the second animation is chosen, and a zero means the second
 * animation is chosen straight away.
 *
 * The first word of an animation being zero is the same end-of-frames test
 * `t_lao_angle_scan` uses; there it decides whether to check for a hit, here
 * whether a wait is needed at all.
 *
 * `adds r3, r3, r6` reaches frame+1 through the register that already holds 1
 * for `obj->field40`, which is the same borrowing `t_super_kick_land` does
 * with its 3.
 */
long t_tusk_blur_blocked(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x326)
        return mk3_push_handler(thread, (MK3THREADFUNC)t_blb8);

    if (token != 0 && token != 0x321)
        return -3;

    if (token == 0) {
        uint32_t w;

        blur_blocked_setup(obj);

        w = *(uint32_t *)(uintptr_t)obj->field40;
        obj->field1c = w;

        if (w != 0) {                   /* frames left: wait one pass */
            obj->field1c = 1;
            *mk3_frame(thread, thread->frame + 1) = 0x321;
            thread->frame = thread->frame + 1;      /* push a level */
            mk3_frame(thread, thread->frame)[1] =
                (uint32_t)(uintptr_t)t_mframew;
            *mk3_frame(thread, thread->frame + 1) = 0;
            return 0;
        }
        /* and otherwise straight on into the 0x321 body */
    }

    obj->field40 = 1;
    find_ani2_part2(obj);
    obj->field1c = 1;

    *mk3_frame(thread, thread->frame + 1) = 0x326;
    thread->frame = thread->frame + 1;              /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------- tl_sonya_bike_kick
 *
 * armv7 0x0003d8a8, 216 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20 = 0x204
 *                        init_special_act(obj)
 *                        obj->field1c = 3; ochar_sound(obj)
 *                        obj->field1c = 5; ochar_sound(obj)
 *                        obj->field40 = 0x00020001
 *                        token := 0xafc, then descend into t_animate2_a9
 *
 *      token == 0xafc:   obj->field1c = 4
 *                        init_anirate(obj)
 *                        obj->field1c = 0x40000
 *                        towards_x_vel(obj)
 *                        obj->field08->field1c = 0xfffe0000
 *                        obj->field1c          = 0xffff4000
 *                        obj->field08->field20 = 0xffff4000
 *                        set_nocol(obj)
 *                        frame[frame].handler = tl_bike3
 *
 *      otherwise:        return -3
 *
 * Entry 1 of the propell table. **Two sounds, 3 then 5**, both through
 * `ochar_sound` with the number in 0x1c -- the only routine in this file so far
 * to ask for two in a row from the same call.
 *
 * 0x40 gets 0x00020001, the packed shape it takes when it is a number: 2 in
 * the high half and 1 in the low.
 *
 * The velocities are three separate pool literals here rather than a chain --
 * 4.0 forward, then -2.0 into the other object's 0x1c and -0.75 into both this
 * object's 0x1c and the other's 0x20. Nothing is derived from anything, which
 * is the exception in this file.
 *
 * `set_nocol` turns collision off before the ride begins, and `tl_bike3` is a
 * direct pc-relative address so it is in this file.
 */
long tl_sonya_bike_kick(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0xafc)
            return -3;

        obj->field1c = 4;
        init_anirate(obj);

        obj->field1c = 0x40000;                 /*  4.00 forward */
        towards_x_vel(obj);

        obj->field08->field1c = 0xfffe0000u;    /* -2.00 */
        obj->field1c          = 0xffff4000u;    /* -0.75 */
        obj->field08->field20 = 0xffff4000u;

        set_nocol(obj);                         /* no collision on the ride */

        return mk3_push_handler(thread, (MK3THREADFUNC)tl_bike3);
    }

    obj->field20 = 0x204;
    init_special_act(obj);

    obj->field1c = 3;
    ochar_sound(obj);
    obj->field1c = 5;
    ochar_sound(obj);

    obj->field40 = 0x00020001;          /* 2 high, 1 low */

    *mk3_frame(thread, thread->frame + 1) = 0xafc;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_animate2_a9;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------- tl_do_sg_pounce
 *
 * armv7 0x0003e454, 224 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20 = 0x20f
 *                        init_special_act(obj)
 *                        obj->field1c = 0; ochar_sound(obj)
 *                        obj->field40 = 0; get_char_ani2(obj)
 *                        do_next_a9_frame(obj)
 *                        obj->field48 = (int16_t)obj->field00->him[+0x0e]
 *                        obj->field08->field1c = 0xfff80000
 *                        obj->field1c          = obj->field08->field1c + 0x70000
 *                        obj->field08->field20 = that
 *                        park(token 0x4d9, duration 1)
 *
 *      token == 0x4d9:   distance_off_ground(obj)
 *                        if (obj->field1c <= 0xe7)
 *                            park(token 0x4d9, duration 1)
 *                        obj->field08[+0x0e] = (uint16_t)obj->field48
 *                        obj->field40 = 0; get_char_ani2(obj)
 *                        obj->field40 += 8
 *                        obj->field1c = 0
 *                        obj->field20 = 0x60000
 *                        obj->field24 = 0x08000
 *                        obj->field28 = 2
 *                        obj->field34 = t_pounce_scan
 *                        frame[frame].handler = t_pounce_fall
 *
 *      otherwise:        return -3
 *
 * Entry 15 of the propell table, and it **remembers where the opponent was**.
 * The halfword at his +0x0e -- the integer part of a coordinate -- is saved
 * into 0x48 on the way up and written back on the way down, so the pounce lands
 * where he stood when it started rather than where he has moved to.
 *
 * The rise is a one-tick poll like `t_lfly5`'s, waiting for 0xe7 off the
 * ground; the park is shared between the entry and the loop, so the height
 * test costs the same every tick.
 *
 * 0x34 gets `t_pounce_scan` -- the callback `t_pounce_fall` runs each frame,
 * and the routine that decides whether the landing connects. Both halves of
 * that pair were read separately and only join up here.
 *
 * Two derived constants again: the descent's -8.0 has 0x70000 added to reach
 * -1.0 for the horizontal pair, and 6.0 has 0x58000 subtracted to reach 0.5.
 */
long tl_do_sg_pounce(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x4d9)
            return -3;

        distance_off_ground(obj);
        if ((long)obj->field1c > 0xe7) {        /* high enough now */
            MK3OBJ *other = obj->field08;

            *(uint16_t *)((char *)other + 0x0e) = (uint16_t)obj->field48;

            obj->field40 = 0;
            get_char_ani2(obj);
            obj->field40 += 8;          /* an offset from what was resolved */

            obj->field1c = 0;
            obj->field20 = 0x60000;     /* 6.0 */
            obj->field24 = 0x08000;     /* 0.5, by sub #0x58000 */
            obj->field28 = 2;

            obj->field34 = (uint32_t)(uintptr_t)t_pounce_scan;  /* callback */

            return mk3_push_handler(thread, (MK3THREADFUNC)t_pounce_fall);
        }
    } else {
        MK3OBJ *him;

        obj->field20 = 0x20f;
        init_special_act(obj);

        obj->field1c = 0;
        ochar_sound(obj);

        obj->field40 = 0;
        get_char_ani2(obj);
        do_next_a9_frame(obj);

        him = (MK3OBJ *)(uintptr_t)obj->field00->him;
        obj->field48 = (uint32_t)(int32_t)
                       *(int16_t *)((char *)him + 0x0e);   /* where he stood */

        obj->field08->field1c = 0xfff80000u;                /* -8.0 */
        obj->field1c          = obj->field08->field1c + 0x70000;
        obj->field08->field20 = obj->field1c;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x4d9;
    thread->fieldfc = 1;                /* look again next tick */
    return 1;
}


/* ------------------------------------------------------------------ tl_do_lk_bike
 *
 * armv7 0x0003f2fc, 232 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20 = 0x20d
 *                        init_special_act(obj)
 *                        obj->field1c = 4; ochar_sound(obj)
 *                        obj->field1c = 0xfff70000
 *                        away_x_vel(obj)
 *                        obj->field1c = 0xfff70000
 *                        obj->field28 = 4
 *                        obj->field40 = 0x00010002
 *                        obj->field20 = 0xfffc8000
 *                        obj->field24 = obj->field20 + 0x3b000
 *                        obj->field34 = t_bike_call
 *                        obj->field48 = 6
 *                        token := 0x6b1, then descend into t_flight_call
 *
 *      token == 0x6b1:   if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *                        frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * Entry 13 of the propell table, and the second routine in this file to hand a
 * callback to `t_flight_call`: 0x34 gets `t_bike_call`, exactly as
 * `tl_do_lao_angle` gives it `t_lao_angle_scan`.
 *
 * -9.0 is used **twice from one register** -- once as the argument to
 * `away_x_vel` and once left in 0x1c afterwards -- which is why r8 holds it
 * across the call rather than the value being reloaded.
 *
 * -3.5 and its neighbour are the derived pair again: `add #0x3b000` on
 * 0xfffc8000 reaches 0x00003800, so 0.22 costs no literal of its own.
 *
 * 0x40 takes the packed number shape once more, 1 high and 2 low.
 */
long tl_do_lk_bike(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x6b1)
            return -3;

        if ((long)thread->frame > 0) {
            thread->frame -= 1;         /* back up a level */
            return 0;
        }
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_local_reaction_exit);
    }

    obj->field20 = 0x20d;
    init_special_act(obj);

    obj->field1c = 4;
    ochar_sound(obj);

    obj->field1c = 0xfff70000u;         /* -9.0, kept in r8 across the call */
    away_x_vel(obj);
    obj->field1c = 0xfff70000u;

    obj->field28 = 4;
    obj->field40 = 0x00010002;          /* 1 high, 2 low */

    obj->field20 = 0xfffc8000u;         /* -3.50 */
    obj->field24 = obj->field20 + 0x3b000;

    obj->field34 = (uint32_t)(uintptr_t)t_bike_call;    /* the callback */
    obj->field48 = 6;

    *mk3_frame(thread, thread->frame + 1) = 0x6b1;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight_call;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------- t_sctele_calla_1
 *
 * armv7 0x00040aa0, 212 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      sans_repell_3(obj)
 *      hisx = (int16_t)obj->field08[+0x0e]
 *      base = *(long *)(G + 0x468)
 *      obj->field1c = hisx
 *      obj->field20 = base
 *      obj->field28 = base + 0x18f
 *      d = obj->field08->field18
 *      obj->field24 = d
 *      if (d != 0) {
 *          if (d >= 0) {                       ; the three roles swap
 *              obj->field1c = base + 0x18f
 *              obj->field20 = hisx
 *              obj->field28 = base
 *          }
 *          if (obj->field20 >= obj->field1c) {
 *              obj->field08[+0x0e]   = (uint16_t)obj->field28
 *              obj->field34          = t_sctele_calla_2
 *              *(uint32_t *)((char *)obj->field00 + 0x34) = t_sctele_calla_2
 *              clear_inviso(obj)
 *              clear_noedge(obj)
 *          }
 *      }
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * **Which side of the arena the teleport lands on.** Two bounds come out of
 * the global state -- `G + 0x468` and that plus 0x18f -- and the opponent's
 * own 0x18 decides which is the source and which the destination. When it is
 * positive the three slots are rewritten with the roles swapped, in three
 * conditional stores under two IT blocks rather than a branch.
 *
 * The move only happens when 0x20 has ended up at or past 0x1c. That test
 * reads the slots back rather than the registers, so it sees whichever
 * assignment the swap left behind.
 *
 * **The callback goes into TWO places**: this object's 0x34 and the PROC's.
 * Every other routine in this file writes only the object's, so whatever runs
 * the second stage looks for it on the PROC as well.
 *
 * 0x18f is built as `+0x18c` then `+3`, the same two-step `teleport_next_to`
 * uses for the same constant against a different global slot.
 */
long t_sctele_calla_1(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    int32_t  hisx, base, d;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    sans_repell_3(obj);

    hisx = *(int16_t *)((char *)obj->field08 + 0x0e);
    base = *(int32_t *)(G_BYTES + 0x468);

    obj->field1c = (uint32_t)hisx;
    obj->field20 = (uint32_t)base;
    obj->field28 = (uint32_t)(base + 0x18f);

    d = (int32_t)obj->field08->field18;
    obj->field24 = (uint32_t)d;

    if (d != 0) {
        if (d >= 0) {                   /* the three roles swap */
            obj->field1c = (uint32_t)(base + 0x18f);
            obj->field20 = (uint32_t)hisx;
            obj->field28 = (uint32_t)base;
        }

        if ((int32_t)obj->field20 >= (int32_t)obj->field1c) {
            *(uint16_t *)((char *)obj->field08 + 0x0e) =
                (uint16_t)obj->field28;

            /* The PROC's 0x34 falls inside an unnamed run, so it is
             * written by offset; the object's is a named field. */
            obj->field34 = (uint32_t)(uintptr_t)t_sctele_calla_2;
            *(uint32_t *)((char *)obj->field00 + 0x34) =
                (uint32_t)(uintptr_t)t_sctele_calla_2;

            clear_inviso(obj);
            clear_noedge(obj);
        }
    }

    if ((long)thread->frame > 0) {
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------------------- tl_do_scorp_tele
 *
 * armv7 0x0004093c, 268 bytes.  **Complete.**
 *
 *      token == 0:       obj->field20          = 0x215
 *                        obj->field00->field18 = 0x215
 *                        air_init_special(obj)
 *                        obj->field1c = G + 0x418
 *                        update_tsl(obj)
 *                        obj->field1c = 0xc; ochar_sound(obj)
 *                        t = NewThreadProc(obj, t_s_t_scroller)
 *                        t->field48 = obj
 *                        face_opponent(obj)
 *                        flip_multi(obj)
 *                        set_noedge(obj)
 *                        obj->field1c = 0x000a0000
 *                        obj->field20 = 0xfffd0000
 *                        obj->field24 = 0x00005000
 *                        obj->field28 = 3
 *                        obj->field40 = 0x00010008
 *                        obj->field34 = t_sctele_calla_1
 *                        token := 0x2ca, then descend into t_flight_call
 *
 *      token == 0x2ca:   clear_inviso(obj)
 *                        if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *                        frame[frame].handler = t_local_reaction_exit
 *
 *      otherwise:        return -3
 *
 * Entry 22 of the propell table, the teleport Ermac's shares. **It starts a
 * second thread**: `NewThreadProc(obj, t_s_t_scroller)` and then the new
 * thread's 0x48 is pointed back at this object. That is the first thread
 * spawned by anything in this file.
 *
 * The two halves lock together. `t_s_t_scroller` polls
 * `((MK3OBJ *)its 0x48)->field00->field18` for 0x215 -- and 0x215 is exactly
 * what this routine writes into the PROC's 0x18 three instructions before
 * spawning it. So the scroller watches this teleport and stops when the action
 * changes.
 *
 * **Reading this pair is what found a transcription error** a few functions
 * above: `t_s_t_scroller` was written with one dereference where the binary
 * has two, which would have polled the wrong field forever. Corrected in the
 * same commit as this.
 *
 * `obj->field1c = G + 0x418` is an ADDRESS in that slot, not a value --
 * `update_tsl` takes it as a pointer into the global state.
 *
 * The velocity triple is derived again: 10.0, then `sub #0xd0000` for -3.0,
 * then `add #0x35000` for 0.3125.
 */
long tl_do_scorp_tele(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token != 0) {
        if (token != 0x2ca)
            return -3;

        clear_inviso(obj);

        if ((long)thread->frame > 0) {
            thread->frame -= 1;         /* back up a level */
            return 0;
        }
        return mk3_push_handler(thread,
                                (MK3THREADFUNC)t_local_reaction_exit);
    }

    obj->field20          = 0x215;
    obj->field00->field18 = 0x215;      /* what the scroller watches for */
    air_init_special(obj);

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x418);  /* an address */
    update_tsl(obj);

    obj->field1c = 0xc;
    ochar_sound(obj);

    {
        MK3OBJ *t = NewThreadProc(obj, (MK3THREADFUNC)t_s_t_scroller);

        t->field48 = (uint32_t)(uintptr_t)obj;      /* pointed back at us */
    }

    face_opponent(obj);
    flip_multi(obj);
    set_noedge(obj);

    obj->field1c = 0x000a0000;          /* 10.000 */
    obj->field20 = 0xfffd0000u;         /* -3.000, by sub #0xd0000 */
    obj->field24 = 0x00005000;          /*  0.312, by add #0x35000 */
    obj->field28 = 3;

    obj->field40 = 0x00010008;          /* 1 high, 8 low */
    obj->field34 = (uint32_t)(uintptr_t)t_sctele_calla_1;   /* the callback */

    *mk3_frame(thread, thread->frame + 1) = 0x2ca;
    thread->frame = thread->frame + 1;          /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_flight_call;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}
