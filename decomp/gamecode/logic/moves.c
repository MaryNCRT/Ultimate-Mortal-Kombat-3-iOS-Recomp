/*
 * moves.c -- gamecode/logic/moves.c, decompiled.
 *
 * armv7 0x000501ac .. 0x00054e48, 357 functions in nineteen kilobytes. The
 * median is thirty-six bytes and three hundred of them are under sixty-four:
 * this file is a directory of names, not of code. A typical entry is a
 * character, a button and a range -- `ermac_block_close`, `sz_lk_close` -- and
 * its whole body is which table to hand to `secret_move_search`.
 *
 * The small ones in this first pass were matched by `tools/microfn.py`, which
 * checks a whole body against a template and refuses anything with one
 * instruction out of place. That is a stricter reading than doing three
 * hundred by eye, not a looser one: a body with an extra store does not get
 * emitted with the store dropped, it lands on the unrecognised list and gets
 * read by hand.
 *
 * The shapes it recognises here:
 *
 *   125  a table and a tail call to `secret_move_search`
 *    83  the frame-push family, a constant into 0x1c and a handler out of a
 *        pointer slot
 *    17  two constants and a tail call
 *     2  a bare tail call
 *     2  `obj->field5c = <constant>`
 *     1  `bx lr`, and nothing else
 *
 * Eighty-six more are larger or one-of-a-kind and are read individually.
 */

#include "mk3logic.h"

/* The callees these reach, declared from what the call sites
 * pass. One written later with a different signature will
 * conflict here, which is what the check is for. */
void q_animal_dist(MK3OBJ *obj);
void q_fatal_dist(MK3OBJ *obj);
void q_is_he_a_boss(MK3OBJ *obj);
void check_sonya_legs(MK3OBJ *obj);
void q_is_he_cornered(MK3OBJ *obj);
extern uint32_t sm_sz_lpc[];              /* 0x0016c640 */
long am_i_airborn(MK3OBJ *obj);
void get_his_action(MK3OBJ *obj);
long is_stick_away(MK3OBJ *obj);
long is_stick_down(MK3OBJ *obj);
void q_mercy(MK3OBJ *obj);
void q_fatality_req(MK3OBJ *obj);
long free_xfer(MK3OBJ *obj, MK3OBJ *other);
long get_x_dist(MK3OBJ *obj);
long stick_look_lr(MK3OBJ *obj, uint32_t a, uint32_t b,
                   uint32_t *pair);
long button_bit_check(MK3OBJ *obj);
/* Its two paths disagree about producing a value -- one falls through
 * after q_mercy, the other tail-calls fatality_xfer -- so it computes
 * none. Declared long at first; the compiler caught it. */
void animality_xfer(MK3OBJ *obj, MK3OBJ *other);
void q_friend(MK3OBJ *obj);
void q_jade_flash(MK3OBJ *obj);
void q_scorp_tele(MK3OBJ *obj);
long is_he_joy(MK3OBJ *obj);
long mercy_xfer(MK3OBJ *obj, MK3OBJ *other);
long secret_move_search(MK3OBJ *obj, uint32_t arg, uint32_t *table);
long slide_check(MK3OBJ *obj);

/* q_yes -- armv7 0x000501ac, 8 bytes.  **Complete.**
 *
 *      obj->field5c = 1
 */
void q_yes(MK3OBJ *obj)
{
    obj->field5c = 1;
}

/* q_no -- armv7 0x000501b4, 8 bytes.  **Complete.**
 *
 *      obj->field5c = 0
 */
void q_no(MK3OBJ *obj)
{
    obj->field5c = 0;
}

/* t_do_ermac_slam -- armv7 0x0005037c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1c
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */
long t_do_stationary(struct MK3THREAD *thread);

long t_do_ermac_slam(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1c;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_reptile_inv -- armv7 0x000503b8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1b
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_reptile_inv(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1b;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_jade_flash -- armv7 0x000503f4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1a
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_flash(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1a;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_fan_lift -- armv7 0x00050430, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x19
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_fan_lift(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x19;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_baby -- armv7 0x0005046c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x18
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_baby(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x18;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_swat_gun -- armv7 0x000504a8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xb
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_swat_gun(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xb;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_kano_swipe -- armv7 0x000504e4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xa
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_kano_swipe(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xa;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_leg_throw -- armv7 0x00050520, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_leg_throw(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_inviso -- armv7 0x0005055c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x8
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_inviso(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x8;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_quake -- armv7 0x00050598, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x7
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_quake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x7;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_noogy -- armv7 0x000505d4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x6
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_noogy(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x6;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_shake -- armv7 0x00050610, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x5
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_shake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x5;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_reflect -- armv7 0x0005064c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_reflect(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_axe_up -- armv7 0x00050688, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_lia_scream -- armv7 0x000506c4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lia_scream(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_bike -- armv7 0x00050778, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */
long t_do_body_propell(struct MK3THREAD *thread);

long t_do_bike(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_ind_charge -- armv7 0x000507b4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_ind_charge(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_jax_dash_punch -- armv7 0x000507f0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x3
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_jax_dash_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x3;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_sz_decoy -- armv7 0x0005082c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sz_decoy(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_lia_fly -- armv7 0x00050868, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x5
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lia_fly(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x5;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_lao_tele -- armv7 0x000508a4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x6
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lao_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x6;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_lao_angle_kick -- armv7 0x000508e0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x7
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lao_angle_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x7;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_robo_tele -- armv7 0x00050950, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x8
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_robo_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x8;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_robo_air_grab -- armv7 0x0005098c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_robo_air_grab(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_tele_explode -- armv7 0x000509c8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xa
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_tele_explode(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xa;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_square_wave -- armv7 0x00050a04, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xc
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_square_wave(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xc;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_lk_bike_kick -- armv7 0x00050a40, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xd
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_lk_bike_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xd;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_super_kang -- armv7 0x00050a7c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xe
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_super_kang(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xe;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_sg_pounce -- armv7 0x00050ab8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xf
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sg_pounce(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xf;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_slide -- armv7 0x00050af4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x10
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_slide(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x10;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_swat_zoom -- armv7 0x00050b30, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x11
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_swat_zoom(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x11;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_stick_sweep -- armv7 0x00050b6c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x12
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_stick_sweep(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x12;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_tusk_blur -- armv7 0x00050ba8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x13
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_tusk_blur(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x13;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_sg_quake -- armv7 0x00050be4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x14
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sg_quake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x14;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_ninja_slide -- armv7 0x00050c20, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x15
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_ninja_slide(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x15;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_scorp_tele -- armv7 0x00050c5c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x16
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_scorp_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x16;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_reptile_dash -- armv7 0x00050c98, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x17
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_reptile_dash(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x17;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_jade_prop -- armv7 0x00050cd4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x18
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_prop(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x18;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_mileena_tele -- armv7 0x00050d10, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x19
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_mileena_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x19;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_mileena_roll -- armv7 0x00050d4c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1a
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_mileena_roll(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1a;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_ermac_tele -- armv7 0x00050d88, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1b
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_ermac_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1b;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_kano_upball -- armv7 0x00050dc4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1c
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f31a0 rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_kano_upball(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1c;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_sonya_zap -- armv7 0x00050e3c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */
long t_do_zap(struct MK3THREAD *thread);

long t_do_sonya_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jax_zap1 -- armv7 0x00050e78, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jax_zap1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jax_zap2 -- armv7 0x00050eb4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x3
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jax_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x3;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_ind_zap -- armv7 0x00050ef0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_ind_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_sky_ice_on -- armv7 0x00050f2c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x5
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sky_ice_on(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x5;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_sky_ice_behind -- armv7 0x00050f68, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x6
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sky_ice_behind(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x6;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_sky_ice_front -- armv7 0x00050fa4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x7
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sky_ice_front(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x7;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_robo_zap -- armv7 0x00050fe0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_robo_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_robo_zap2 -- armv7 0x0005101c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xa
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_robo_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xa;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_robo_net -- armv7 0x00051058, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xb
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_robo_net(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xb;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_sz_forward_zap -- armv7 0x00051094, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xc
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sz_forward_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xc;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_lia_anglez -- armv7 0x000510d0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xd
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lia_anglez(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xd;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_lao_zap -- armv7 0x0005110c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xe
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lao_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xe;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_bomb_full -- armv7 0x00051148, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xf
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_bomb_full(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xf;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_bomb_mid -- armv7 0x00051184, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x10
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_bomb_mid(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x10;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_tusk_zap -- armv7 0x000511c0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x11
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_tusk_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x11;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_summon -- armv7 0x000511fc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x12
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_summon(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x12;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_st_zap1 -- armv7 0x00051238, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x13
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_st_zap1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x13;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_st_zap2 -- armv7 0x00051274, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x14
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_st_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x14;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_st_zap3 -- armv7 0x000512b0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x15
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_st_zap3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x15;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_lk_zap_hi -- armv7 0x000512ec, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x16
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_lk_zap_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x16;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_lk_zap_lo -- armv7 0x00051328, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x17
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_lk_zap_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x17;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_sg_zap -- armv7 0x00051364, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x18
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_sg_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x18;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_swat_bomb_hi -- armv7 0x000513a0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x19
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_swat_bomb_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x19;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_swat_bomb_lo -- armv7 0x000513dc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1a
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_swat_bomb_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1a;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_lia_forward -- armv7 0x00051418, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1b
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_lia_forward(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1b;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_floor_blade -- armv7 0x00051454, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1c
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_floor_blade(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1c;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_smoke_spear -- armv7 0x00051490, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1e
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_smoke_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1e;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_kitana_zap -- armv7 0x000514cc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x20
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_kitana_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x20;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jade_zap_med -- armv7 0x00051508, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x21
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_zap_med(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x21;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_reptile_orb -- armv7 0x00051544, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x22
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_reptile_orb(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x22;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_spit -- armv7 0x00051580, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x23
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_spit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x23;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_scorpion_spear -- armv7 0x000515bc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x24
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_scorpion_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x24;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jade_zap_hi -- armv7 0x000515f8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x25
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_zap_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x25;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jade_zap_lo -- armv7 0x00051634, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x26
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_zap_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x26;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_jade_zap_ret -- armv7 0x00051670, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x27
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_jade_zap_ret(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x27;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_reptile_orb_fast -- armv7 0x000516ac, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x28
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_reptile_orb_fast(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x28;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_mileena_zap -- armv7 0x000516e8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x29
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_mileena_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x29;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_osz_zap -- armv7 0x00051724, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2a
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_osz_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2a;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_floor_ice -- armv7 0x00051760, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2b
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_floor_ice(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2b;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* t_do_ermac_zap -- armv7 0x0005179c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2c
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f314c rather than as a
 * link-time constant, so it lives in another translation unit. */

long t_do_ermac_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2c;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
}

/* tusk_lp_close -- armv7 0x00052520, 4 bytes.  **Complete.**
 *
 * `bx lr`, and nothing else. The function exists so that a table can name it;
 * whatever it is asked, the answer is whatever the caller already had. */
void tusk_lp_close(MK3OBJ *obj)
{
    (void)obj;
}

/* q_smoke_animal -- armv7 0x000531dc, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 160
 *      obj->field34 = 336
 *      q_animal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_smoke_animal(MK3OBJ *obj)
{
    obj->field30 = 160;
    obj->field34 = 336;
    q_animal_dist(obj);
}

/* q_lk_animal -- armv7 0x000531f0, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 88
 *      obj->field34 = 144
 *      q_animal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_lk_animal(MK3OBJ *obj)
{
    obj->field30 = 88;
    obj->field34 = 144;
    q_animal_dist(obj);
}

/* q_swat_animal -- armv7 0x00053204, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 88
 *      obj->field34 = 120
 *      q_animal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_swat_animal(MK3OBJ *obj)
{
    obj->field30 = 88;
    obj->field34 = 120;
    q_animal_dist(obj);
}

/* q_kit_animal -- armv7 0x00053218, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 72
 *      obj->field34 = 112
 *      q_animal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_kit_animal(MK3OBJ *obj)
{
    obj->field30 = 72;
    obj->field34 = 112;
    q_animal_dist(obj);
}

/* q_half_screen_fatal -- armv7 0x000532c8, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 128
 *      obj->field34 = 176
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_half_screen_fatal(MK3OBJ *obj)
{
    obj->field30 = 128;
    obj->field34 = 176;
    q_fatal_dist(obj);
}

/* q_close_fatal_pit -- armv7 0x000532dc, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 32
 *      obj->field34 = 78
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_close_fatal_pit(MK3OBJ *obj)
{
    obj->field30 = 32;
    obj->field34 = 78;
    q_fatal_dist(obj);
}

/* q_close_fatal -- armv7 0x000532f0, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 32
 *      obj->field34 = 80
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_close_fatal(MK3OBJ *obj)
{
    obj->field30 = 32;
    obj->field34 = 80;
    q_fatal_dist(obj);
}

/* q_far_fatal -- armv7 0x000533f0, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 240
 *      obj->field34 = 336
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_far_fatal(MK3OBJ *obj)
{
    obj->field30 = 240;
    obj->field34 = 336;
    q_fatal_dist(obj);
}

/* q_skull_fatal -- armv7 0x00053404, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 160
 *      obj->field34 = 224
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_skull_fatal(MK3OBJ *obj)
{
    obj->field30 = 160;
    obj->field34 = 224;
    q_fatal_dist(obj);
}

/* q_vomit_fatal -- armv7 0x00053418, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 96
 *      obj->field34 = 128
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_vomit_fatal(MK3OBJ *obj)
{
    obj->field30 = 96;
    obj->field34 = 128;
    q_fatal_dist(obj);
}

/* q_grow_fatal -- armv7 0x0005342c, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 208
 *      obj->field34 = 320
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_grow_fatal(MK3OBJ *obj)
{
    obj->field30 = 208;
    obj->field34 = 320;
    q_fatal_dist(obj);
}

/* q_lia_hair_fatal -- armv7 0x00053440, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 80
 *      obj->field34 = 144
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_lia_hair_fatal(MK3OBJ *obj)
{
    obj->field30 = 80;
    obj->field34 = 144;
    q_fatal_dist(obj);
}

/* q_lao_hat_fatal -- armv7 0x00053454, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 32
 *      obj->field34 = 112
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_lao_hat_fatal(MK3OBJ *obj)
{
    obj->field30 = 32;
    obj->field34 = 112;
    q_fatal_dist(obj);
}

/* q_earth_fatal -- armv7 0x00053468, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 208
 *      obj->field34 = 320
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_earth_fatal(MK3OBJ *obj)
{
    obj->field30 = 208;
    obj->field34 = 320;
    q_fatal_dist(obj);
}

/* q_ermac_decap -- armv7 0x000534c0, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 48
 *      obj->field34 = 80
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_ermac_decap(MK3OBJ *obj)
{
    obj->field30 = 48;
    obj->field34 = 80;
    q_fatal_dist(obj);
}

/* q_robo_flame_fatal -- armv7 0x000534e8, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 192
 *      obj->field34 = 256
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_robo_flame_fatal(MK3OBJ *obj)
{
    obj->field30 = 192;
    obj->field34 = 256;
    q_fatal_dist(obj);
}

/* q_robo_crush_fatal -- armv7 0x000534fc, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 96
 *      obj->field34 = 144
 *      q_fatal_dist(obj)
 *
 * The second constant is formed by adding to the first, which is how the
 * compiler gets two numbers out of one `movs`. */
void q_robo_crush_fatal(MK3OBJ *obj)
{
    obj->field30 = 96;
    obj->field34 = 144;
    q_fatal_dist(obj);
}

/* robo2_lk_close -- armv7 0x0005380c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo2_lkc` (0x0016bf4c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo2_lkc[];            /* 0x0016bf4c */

long robo2_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo2_lkc);
}

/* robo1_up -- armv7 0x00053820, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo1_uc` (0x0016bd40) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo1_uc[];            /* 0x0016bd40 */

long robo1_up(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo1_uc);
}

/* robo1_down_close -- armv7 0x00053834, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo1_dc` (0x0016bcac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo1_dc[];            /* 0x0016bcac */

long robo1_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo1_dc);
}

/* robo2_hp_close -- armv7 0x00053848, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo2_hpc` (0x0016be6c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo2_hpc[];            /* 0x0016be6c */

long robo2_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo2_hpc);
}

/* robo2_run_close -- armv7 0x0005385c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo2_rc` (0x0016bf98) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo2_rc[];            /* 0x0016bf98 */

long robo2_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo2_rc);
}

/* robo_block_close -- armv7 0x00053870, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo_bc` (0x0016bdd8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo_bc[];            /* 0x0016bdd8 */

long robo_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo_bc);
}

/* robo_hk_close -- armv7 0x00053884, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo_hkc` (0x0016bd8c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo_hkc[];            /* 0x0016bd8c */

long robo_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo_hkc);
}

/* robo2_down_close -- armv7 0x00053898, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo2_dc` (0x0016bf00) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo2_dc[];            /* 0x0016bf00 */

long robo2_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo2_dc);
}

/* robo2_up_close -- armv7 0x000538ac, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_robo2_uc` (0x0016bc60) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_robo2_uc[];            /* 0x0016bc60 */

long robo2_up_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_robo2_uc);
}

/* sw_hp_close -- armv7 0x000538c0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_swat_hpc` (0x0016d198) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_swat_hpc[];            /* 0x0016d198 */

long sw_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_swat_hpc);
}

/* sw_lp_close -- armv7 0x000538d4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_swat_lpc` (0x0016d074) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_swat_lpc[];            /* 0x0016d074 */

long sw_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_swat_lpc);
}

/* sw_hk_close -- armv7 0x000538e8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_swat_hkc` (0x0016cfe0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_swat_hkc[];            /* 0x0016cfe0 */

long sw_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_swat_hkc);
}

/* sw_lk_close -- armv7 0x000538fc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sw_lkc` (0x0016cf48) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sw_lkc[];            /* 0x0016cf48 */

long sw_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sw_lkc);
}

/* sw_block_close -- armv7 0x00053910, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sw_bc` (0x0016ceb4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sw_bc[];            /* 0x0016ceb4 */

long sw_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sw_bc);
}

/* sz_hk_close -- armv7 0x00053924, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sz_hkc` (0x0016c5ac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sz_hkc[];            /* 0x0016c5ac */

long sz_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sz_hkc);
}

/* sz_up -- armv7 0x00053938, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sz_uc` (0x0016c518) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sz_uc[];            /* 0x0016c518 */

long sz_up(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sz_uc);
}

/* sz_run_close -- armv7 0x0005394c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sz_rc` (0x0016c484) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sz_rc[];            /* 0x0016c484 */

long sz_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sz_rc);
}

/* osz_block_close -- armv7 0x00053960, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_osz_bc` (0x0016c438) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_osz_bc[];            /* 0x0016c438 */

long osz_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_osz_bc);
}

/* osz_lk_close -- armv7 0x00053974, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_osz_lkc` (0x0016c3a4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_osz_lkc[];            /* 0x0016c3a4 */

long osz_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_osz_lkc);
}

/* osz_lp_close -- armv7 0x00053988, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_osz_lpc` (0x0016c310) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_osz_lpc[];            /* 0x0016c310 */

long osz_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_osz_lpc);
}

/* osz_hp_close -- armv7 0x0005399c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_osz_hpc` (0x0016c27c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_osz_hpc[];            /* 0x0016c27c */

long osz_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_osz_hpc);
}

/* osm_lp_close -- armv7 0x000539c4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_lpc` (0x0016a6b8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_lpc[];            /* 0x0016a6b8 */

long osm_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_lpc);
}

/* ind_hk_close -- armv7 0x000539d8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_hkc` (0x0016c974) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_hkc[];            /* 0x0016c974 */

long ind_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_hkc);
}

/* ind_lk_close -- armv7 0x000539ec, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_lkc` (0x0016c6d4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_lkc[];            /* 0x0016c6d4 */

long ind_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_lkc);
}

/* ind_lp_close -- armv7 0x00053a00, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_lpc` (0x0016c720) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_lpc[];            /* 0x0016c720 */

long ind_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_lpc);
}

/* ind_hp_open -- armv7 0x00053a14, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_hpo` (0x0016c8dc) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_hpo[];            /* 0x0016c8dc */

long ind_hp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_hpo);
}

/* ind_hp_close -- armv7 0x00053a28, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_hpc` (0x0016c928) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_hpc[];            /* 0x0016c928 */

long ind_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_hpc);
}

/* ind_down_close -- armv7 0x00053a3c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_dc` (0x0016c848) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_dc[];            /* 0x0016c848 */

long ind_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_dc);
}

/* ind_block_close -- armv7 0x00053a50, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ind_bc` (0x0016c7b4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ind_bc[];            /* 0x0016c7b4 */

long ind_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ind_bc);
}

/* kano_hp_open -- armv7 0x00053a64, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_hpo` (0x0016bc14) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_hpo[];            /* 0x0016bc14 */

long kano_hp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_hpo);
}

/* kano_lk_close -- armv7 0x00053a78, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_lkc` (0x0016bb80) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_lkc[];            /* 0x0016bb80 */

long kano_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_lkc);
}

/* kano_hp_close -- armv7 0x00053a8c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_hpc` (0x0016baa0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_hpc[];            /* 0x0016baa0 */

long kano_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_hpc);
}

/* jax_hk_close -- armv7 0x00053aa0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_hkc` (0x0016cc60) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_hkc[];            /* 0x0016cc60 */

long jax_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_hkc);
}

/* jax_lp_close -- armv7 0x00053ab4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_lpc` (0x0016ccac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_lpc[];            /* 0x0016ccac */

long jax_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_lpc);
}

/* jax_hp_close -- armv7 0x00053ac8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_hpc` (0x0016cbcc) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_hpc[];            /* 0x0016cbcc */

long jax_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_hpc);
}

/* jax_lp_open -- armv7 0x00053adc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_lpo` (0x0016ce68) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_lpo[];            /* 0x0016ce68 */

long jax_lp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_lpo);
}

/* jax_block_open -- armv7 0x00053af0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_bo` (0x0016ce1c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_bo[];            /* 0x0016ce1c */

long jax_block_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_bo);
}

/* jax_lk_close -- armv7 0x00053b04, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jax_lkc` (0x0016cd40) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jax_lkc[];            /* 0x0016cd40 */

long jax_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jax_lkc);
}

/* all_run_open -- armv7 0x00053b18, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_all_ro` (0x0016e6c0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_all_ro[];            /* 0x0016e6c0 */

long all_run_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_all_ro);
}

/* lao_run_close -- armv7 0x00053b2c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lao_rc` (0x0016d6d4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lao_rc[];            /* 0x0016d6d4 */

long lao_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lao_rc);
}

/* lao_hp_close -- armv7 0x00053b40, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lao_hpc` (0x0016d5f4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lao_hpc[];            /* 0x0016d5f4 */

long lao_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lao_hpc);
}

/* lao_down_close -- armv7 0x00053b54, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lao_dc` (0x0016d688) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lao_dc[];            /* 0x0016d688 */

long lao_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lao_dc);
}

/* lao_block_close -- armv7 0x00053b68, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lao_bc` (0x0016d5a8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lao_bc[];            /* 0x0016d5a8 */

long lao_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lao_bc);
}

/* lao_lk_close -- armv7 0x00053b7c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lao_lkc` (0x0016d514) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lao_lkc[];            /* 0x0016d514 */

long lao_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lao_lkc);
}

/* lia_hp_close -- armv7 0x00053b90, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lia_hpc` (0x0016c0c0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lia_hpc[];            /* 0x0016c0c0 */

long lia_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lia_hpc);
}

/* lia_lp_close -- armv7 0x00053ba4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lia_lpc` (0x0016c1e8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lia_lpc[];            /* 0x0016c1e8 */

long lia_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lia_lpc);
}

/* lia_block_close -- armv7 0x00053bb8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lia_bc` (0x0016c154) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lia_bc[];            /* 0x0016c154 */

long lia_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lia_bc);
}

/* lia_up_close -- armv7 0x00053bcc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lia_uc` (0x0016c02c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lia_uc[];            /* 0x0016c02c */

long lia_up_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lia_uc);
}

/* sonya_hp_close -- armv7 0x00053be0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sonya_hpc` (0x0016c9c0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sonya_hpc[];            /* 0x0016c9c0 */

long sonya_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sonya_hpc);
}

/* sonya_lk_close -- armv7 0x00053bf4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sonya_lkc` (0x0016cb80) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sonya_lkc[];            /* 0x0016cb80 */

long sonya_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sonya_lkc);
}

/* sonya_lp_open -- armv7 0x00053c08, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sonya_lpo` (0x0016cb34) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sonya_lpo[];            /* 0x0016cb34 */

long sonya_lp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sonya_lpo);
}

/* sonya_run_close -- armv7 0x00053c1c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sonya_rc` (0x0016caa0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sonya_rc[];            /* 0x0016caa0 */

long sonya_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sonya_rc);
}

/* sonya_down_close -- armv7 0x00053c30, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sonya_dc` (0x0016ca54) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sonya_dc[];            /* 0x0016ca54 */

long sonya_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sonya_dc);
}

/* kano_lp_open -- armv7 0x00053c44, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_lpo` (0x0016bb34) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_lpo[];            /* 0x0016bb34 */

long kano_lp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_lpo);
}

/* kano_hk_close -- armv7 0x00053c58, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_hkc` (0x0016e550) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_hkc[];            /* 0x0016e550 */

long kano_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_hkc);
}

/* kano_lp_close -- armv7 0x00053c6c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kano_lpc` (0x0016e62c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kano_lpc[];            /* 0x0016e62c */

long kano_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kano_lpc);
}

/* smoke_lp_close -- armv7 0x00053c80, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_lpc` (0x0016ba08) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_lpc[];            /* 0x0016ba08 */

long smoke_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_lpc);
}

/* smoke_run_close -- armv7 0x00053c94, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_rc` (0x0016ba54) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_rc[];            /* 0x0016ba54 */

long smoke_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_rc);
}

/* smoke_hk_close -- armv7 0x00053ca8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_hkc` (0x0016b928) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_hkc[];            /* 0x0016b928 */

long smoke_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_hkc);
}

/* smoke_down_close -- armv7 0x00053cbc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_dc` (0x0016b8dc) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_dc[];            /* 0x0016b8dc */

long smoke_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_dc);
}

/* smoke_up_close -- armv7 0x00053cd0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_uc` (0x0016b890) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_uc[];            /* 0x0016b890 */

long smoke_up_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_uc);
}

/* smoke_lk_close -- armv7 0x00053ce4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_smoke_lkc` (0x0016b7fc) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_smoke_lkc[];            /* 0x0016b7fc */

long smoke_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_smoke_lkc);
}

/* tusk_hp_open -- armv7 0x00053cf8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_hpo` (0x0016e2ac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_hpo[];            /* 0x0016e2ac */

long tusk_hp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_hpo);
}

/* tusk_hp_close -- armv7 0x00053d0c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_zap` (0x0016e504) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_zap[];            /* 0x0016e504 */

long tusk_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_zap);
}

/* tusk_lk_close -- armv7 0x00053d20, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_lkc` (0x0016e3d8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_lkc[];            /* 0x0016e3d8 */

long tusk_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_lkc);
}

/* tusk_run_close -- armv7 0x00053d34, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_rc` (0x0016e4b8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_rc[];            /* 0x0016e4b8 */

long tusk_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_rc);
}

/* tusk_block_close -- armv7 0x00053d48, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_bc` (0x0016e46c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_bc[];            /* 0x0016e46c */

long tusk_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_bc);
}

/* tusk_hk_close -- armv7 0x00053d5c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_hkc` (0x0016e344) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_hkc[];            /* 0x0016e344 */

long tusk_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_hkc);
}

/* tusk_up -- armv7 0x00053d70, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_tusk_uc` (0x0016e2f8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_tusk_uc[];            /* 0x0016e2f8 */

long tusk_up(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_tusk_uc);
}

/* st_hp_close -- armv7 0x00053d84, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_hpc` (0x0016e0ac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_hpc[];            /* 0x0016e0ac */

long st_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_hpc);
}

/* st_lp_close -- armv7 0x00053d98, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_lpc` (0x0016dfd0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_lpc[];            /* 0x0016dfd0 */

long st_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_lpc);
}

/* st_block_close -- armv7 0x00053dac, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_bc` (0x0016def4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_bc[];            /* 0x0016def4 */

long st_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_bc);
}

/* st_down_close -- armv7 0x00053dc0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_dc` (0x0016db38) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_dc[];            /* 0x0016db38 */

long st_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_dc);
}

/* st_up_close -- armv7 0x00053dd4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_uc` (0x0016de60) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_uc[];            /* 0x0016de60 */

long st_up_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_uc);
}

/* st_lk_close -- armv7 0x00053de8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_lkc` (0x0016e1d0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_lkc[];            /* 0x0016e1d0 */

long st_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_lkc);
}

/* st_hk_close -- armv7 0x00053dfc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_hkc` (0x0016dd3c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_hkc[];            /* 0x0016dd3c */

long st_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_hkc);
}

/* st_run_close -- armv7 0x00053e10, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_rc` (0x0016dc18) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_rc[];            /* 0x0016dc18 */

long st_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_rc);
}

/* st_lk_open -- armv7 0x00053e24, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_lko` (0x0016dbcc) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_lko[];            /* 0x0016dbcc */

long st_lk_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_lko);
}

/* st_lp_open -- armv7 0x00053e38, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_lpo` (0x0016daa4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_lpo[];            /* 0x0016daa4 */

long st_lp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_lpo);
}

/* st_hp_open -- armv7 0x00053e4c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_st_hpo` (0x0016da58) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_st_hpo[];            /* 0x0016da58 */

long st_hp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_st_hpo);
}

/* lk_lk_open -- armv7 0x00053e60, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_lko` (0x0016d978) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_lko[];            /* 0x0016d978 */

long lk_lk_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_lko);
}

/* lk_hk_close -- armv7 0x00053e74, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_hkc` (0x0016d898) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_hkc[];            /* 0x0016d898 */

long lk_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_hkc);
}

/* lk_lp_close -- armv7 0x00053e88, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_lpc` (0x0016d9c4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_lpc[];            /* 0x0016d9c4 */

long lk_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_lpc);
}

/* lk_hp_close -- armv7 0x00053e9c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_hpc` (0x0016d92c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_hpc[];            /* 0x0016d92c */

long lk_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_hpc);
}

/* lk_lk_close -- armv7 0x00053eb0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_lkc` (0x0016d804) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_lkc[];            /* 0x0016d804 */

long lk_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_lkc);
}

/* lk_block_close -- armv7 0x00053ec4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_bc` (0x0016d7b8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_bc[];            /* 0x0016d7b8 */

long lk_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_bc);
}

/* lk_up_close -- armv7 0x00053ed8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_uc` (0x0016d76c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_uc[];            /* 0x0016d76c */

long lk_up_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_uc);
}

/* lk_down_close -- armv7 0x00053eec, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_lk_dc` (0x0016d720) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_lk_dc[];            /* 0x0016d720 */

long lk_down_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_lk_dc);
}

/* sg_hp_close -- armv7 0x00053f00, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_hpc` (0x0016d434) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_hpc[];            /* 0x0016d434 */

long sg_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_hpc);
}

/* sg_up -- armv7 0x00053f14, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_uc` (0x0016d4c8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_uc[];            /* 0x0016d4c8 */

long sg_up(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_uc);
}

/* sg_hk_close -- armv7 0x00053f28, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_hkc` (0x0016d3a0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_hkc[];            /* 0x0016d3a0 */

long sg_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_hkc);
}

/* sg_lp_close -- armv7 0x00053f3c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_lpc` (0x0016d30c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_lpc[];            /* 0x0016d30c */

long sg_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_lpc);
}

/* sg_hk_open -- armv7 0x00053f50, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_hko` (0x0016d2c0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_hko[];            /* 0x0016d2c0 */

long sg_hk_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_hko);
}

/* sg_block_close -- armv7 0x00053f64, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_sg_bc` (0x0016d274) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_sg_bc[];            /* 0x0016d274 */

long sg_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_sg_bc);
}

/* jad_hk_close -- armv7 0x00053f78, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jad_hkc` (0x0016b3ac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jad_hkc[];            /* 0x0016b3ac */

long jad_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jad_hkc);
}

/* jad_lk_close -- armv7 0x00053f8c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jad_lkc` (0x0016b288) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jad_lkc[];            /* 0x0016b288 */

long jad_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jad_lkc);
}

/* jad_run_close -- armv7 0x00053fa0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jad_rc` (0x0016b1f4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jad_rc[];            /* 0x0016b1f4 */

long jad_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jad_rc);
}

/* jad_lp_close -- armv7 0x00053fb4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jad_lpc` (0x0016b118) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jad_lpc[];            /* 0x0016b118 */

long jad_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jad_lpc);
}

/* jad_hp_close -- armv7 0x00053fc8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_jad_hpc` (0x0016b03c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_jad_hpc[];            /* 0x0016b03c */

long jad_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_jad_hpc);
}

/* mil_hp_open -- armv7 0x00053fdc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_mil_hpo` (0x0016aff0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_mil_hpo[];            /* 0x0016aff0 */

long mil_hp_open(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_mil_hpo);
}

/* mil_lp_close -- armv7 0x00053ff0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_mil_lpc` (0x0016ae34) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_mil_lpc[];            /* 0x0016ae34 */

long mil_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_mil_lpc);
}

/* mil_hp_close -- armv7 0x00054004, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_mil_hpc` (0x0016ada0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_mil_hpc[];            /* 0x0016ada0 */

long mil_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_mil_hpc);
}

/* mil_hk_close -- armv7 0x00054018, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_mil_hkc` (0x0016af5c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_mil_hkc[];            /* 0x0016af5c */

long mil_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_mil_hkc);
}

/* mil_lk_close -- armv7 0x0005402c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_mil_lkc` (0x0016aec8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_mil_lkc[];            /* 0x0016aec8 */

long mil_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_mil_lkc);
}

/* kit_run_close -- armv7 0x00054040, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kt_rc` (0x0016b7b0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kt_rc[];            /* 0x0016b7b0 */

long kit_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kt_rc);
}

/* kit_lk_close -- armv7 0x00054054, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kt_lkc` (0x0016b71c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kt_lkc[];            /* 0x0016b71c */

long kit_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kt_lkc);
}

/* kit_hk_close -- armv7 0x00054068, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kt_hkc` (0x0016b688) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kt_hkc[];            /* 0x0016b688 */

long kit_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kt_hkc);
}

/* kit_hp_close -- armv7 0x0005407c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kt_hpc` (0x0016b5ac) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kt_hpc[];            /* 0x0016b5ac */

long kit_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kt_hpc);
}

/* kit_lp_close -- armv7 0x00054090, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_kt_lpc` (0x0016b4d0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_kt_lpc[];            /* 0x0016b4d0 */

long kit_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_kt_lpc);
}

/* rep_hk_close -- armv7 0x000540a4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_rep_hkc` (0x0016aba0) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_rep_hkc[];            /* 0x0016aba0 */

long rep_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_rep_hkc);
}

/* rep_lk_close -- armv7 0x000540b8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_rep_lkc` (0x0016acc4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_rep_lkc[];            /* 0x0016acc4 */

long rep_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_rep_lkc);
}

/* rep_block_close -- armv7 0x000540cc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_rep_bc` (0x0016aac4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_rep_bc[];            /* 0x0016aac4 */

long rep_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_rep_bc);
}

/* rep_lp_close -- armv7 0x000540e0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_rep_lpc` (0x0016a9e8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_rep_lpc[];            /* 0x0016a9e8 */

long rep_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_rep_lpc);
}

/* rep_hp_close -- armv7 0x000540f4, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_rep_hpc` (0x0016a8c4) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_rep_hpc[];            /* 0x0016a8c4 */

long rep_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_rep_hpc);
}

/* scorp_run_close -- armv7 0x00054108, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_rc` (0x0016a878) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_rc[];            /* 0x0016a878 */

long scorp_run_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_rc);
}

/* scorp_lk_close -- armv7 0x0005411c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_lkc` (0x0016a82c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_lkc[];            /* 0x0016a82c */

long scorp_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_lkc);
}

/* scorp_hk_close -- armv7 0x00054130, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_hkc` (0x0016a798) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_hkc[];            /* 0x0016a798 */

long scorp_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_hkc);
}

/* scorp_block_close -- armv7 0x00054144, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_bc` (0x0016a74c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_bc[];            /* 0x0016a74c */

long scorp_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_bc);
}

/* scorp_lp_close -- armv7 0x00054158, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_lpc` (0x0016a6b8) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_lpc[];            /* 0x0016a6b8 */

long scorp_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_lpc);
}

/* scorp_hp_close -- armv7 0x0005416c, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_scorp_hpc` (0x0016a624) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_scorp_hpc[];            /* 0x0016a624 */

long scorp_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_scorp_hpc);
}

/* ermac_block_close -- armv7 0x00054180, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_bc` (0x0016a024) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ermac_bc[];            /* 0x0016a024 */

long ermac_block_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ermac_bc);
}

/* ermac_lp_close -- armv7 0x00054194, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_lpc` (0x0016a150) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ermac_lpc[];            /* 0x0016a150 */

long ermac_lp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ermac_lpc);
}

/* ermac_hp_close -- armv7 0x000541a8, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_hpc` (0x0016a19c) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ermac_hpc[];            /* 0x0016a19c */

long ermac_hp_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ermac_hpc);
}

/* ermac_lk_close -- armv7 0x000541bc, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_lkc` (0x0016a104) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ermac_lkc[];            /* 0x0016a104 */

long ermac_lk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ermac_lkc);
}

/* ermac_hk_close -- armv7 0x000541d0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_hkc` (0x0016a070) in r2. r0 and r1 are
 * untouched, so the second argument is the caller's. */
extern uint32_t sm_ermac_hkc[];            /* 0x0016a070 */

long ermac_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg, sm_ermac_hkc);
}

/* sz_block_close -- armv7 0x0005482c, 12 bytes.  **Complete.**
 *
 * A tail call to `slide_check` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long sz_block_close(MK3OBJ *obj)
{
    return slide_check(obj);
}

/* sz_lk_close -- armv7 0x00054838, 12 bytes.  **Complete.**
 *
 * A tail call to `slide_check` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long sz_lk_close(MK3OBJ *obj)
{
    return slide_check(obj);
}



/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* t_do_smoke_tele -- armv7 0x0005091c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_do_robo_tele
 *      frame[frame+1].w0 = 0
 */

long t_do_smoke_tele(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_robo_tele);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* t_do_lao_spin -- armv7 0x00050700, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 */

long t_do_lao_spin(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}

/* t_do_kano_roll -- armv7 0x0005073c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      frame[frame].handler = t_do_body_propell
 *      frame[frame+1].w0 = 0
 */

long t_do_kano_roll(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_do_kano_zap -- armv7 0x00050e00, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      frame[frame].handler = t_do_zap
 *      frame[frame+1].w0 = 0
 */

long t_do_kano_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_zap);
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

/* q_taser_fatal -- armv7 0x000534d4, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 0x100
 *      obj->field34 = 0x130
 *      q_fatal_dist(obj)
 */
void q_taser_fatal(MK3OBJ *obj)
{
    obj->field30 = 0x100;
    obj->field34 = 0x130;
    q_fatal_dist(obj);
}


/* get_his_p_hit -- armv7 0x0005031c, 12 bytes.  **Complete.**
 *
 *      obj->field1c = obj->field00->field00->field00->p_hit
 *
 * Four loads to reach one field: this object's proc, the object that proc
 * points back at, THAT object's proc, and its 0x44. The chain goes out to the
 * opponent and back down, which is why a routine called "his" starts from the
 * object it was handed. */
void get_his_p_hit(MK3OBJ *obj)
{
    obj->field1c = obj->field00->field00->field00->p_hit;
}

/* q_four_button -- armv7 0x000502c0, 12 bytes.  **Complete.**
 *
 *      obj->field5c = (int16)obj->field00->field7c
 *
 * Read with `ldrsh`, so the gate at 0x7c is signed even though the field is
 * declared as a halfword. Answers through 0x5c like the rest of the q_ family. */
void q_four_button(MK3OBJ *obj)
{
    obj->field5c = (uint32_t)(int32_t)(int16_t)obj->field00->field7c;
}

/* q_jade_zap_ret -- armv7 0x00054c84, 12 bytes.  **Complete.**
 *
 * The whole body is a call to `is_he_joy` whose value is returned. It also
 * answers through 0x5c, because that is what is_he_joy writes -- the return
 * value and the field carry the same answer. */
long q_jade_zap_ret(MK3OBJ *obj)
{
    return is_he_joy(obj);
}

/* fatality_xfer -- armv7 0x00054b24, 20 bytes.  **Complete.**
 *
 *      *(uint16_t *)((char *)other->field00 + 0x80) = 0
 *      return mercy_xfer(obj, other)
 *
 * Clears a halfword in the OTHER fighter's proc and then hands over. 0x80 has
 * no name in the struct, so it is reached as an offset. */
long fatality_xfer(MK3OBJ *obj, MK3OBJ *other)
{
    *(uint16_t *)((char *)other->field00 + 0x80) = 0;
    return mercy_xfer(obj, other);
}

/* osm_hk_close -- armv7 0x000539b0, 20 bytes.  **Complete.**
 *
 * `secret_move_search` with `_sm_ermac_hkc` (0x0016a070) in r2 -- **plus
 * 0x48**. Every other member of this family passes the table's own address;
 * this one starts eighteen words in, and the `adds r2, #0x48` that does it is
 * the only instruction telling them apart. r0 and r1 are untouched, so the
 * second argument is the caller's. */
long osm_hk_close(MK3OBJ *obj, uint32_t arg)
{
    return secret_move_search(obj, arg,
                              (uint32_t *)((char *)sm_ermac_hkc + 0x48));
}

/* q_ermac_fatal -- armv7 0x000534ac, 20 bytes.  **Complete.**
 *
 *      obj->field30 = 0x60
 *      obj->field34 = 0xc0
 *      return q_fatal_dist(obj)
 *
 * The second constant is the first doubled in place (`adds r3, r3, r3`), so
 * the near and far bounds of the range are one instruction apart and cannot
 * drift. */
void q_ermac_fatal(MK3OBJ *obj)
{
    obj->field30 = 0x60;
    obj->field34 = 0x60 + 0x60;
    q_fatal_dist(obj);
}


/* q_six_button -- armv7 0x000502cc, 20 bytes.  **Complete.**
 *
 *      obj->field5c = ((int16)obj->field00->field7c == 0)
 *
 * `rsbs r3, r3, #1` then `movlo r3, #0` is the compiler's `x == 0`: one minus
 * the value, and zero whenever the subtraction borrowed -- which it does for
 * everything except 0 and 1. So this is the NEGATION of q_four_button, and
 * the two together say what the suffixes mean. Four wants the gate at 0x7c
 * set; six wants it clear. */
void q_six_button(MK3OBJ *obj)
{
    obj->field5c = ((int16_t)obj->field00->field7c == 0) ? 1u : 0u;
}

/* q_friend_four -- armv7 0x000502a8, 24 bytes.  **Complete.**
 *
 *      if ((int16)obj->field00->field7c == 0) q_no(obj); else q_friend(obj);
 *
 * The four-button gate in front of another question. Both arms end in a call
 * whose value is not used, so this answers only through 0x5c. */
void q_friend_four(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c == 0)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_jade_flash_four -- armv7 0x00052bb0, 24 bytes.  **Complete.**
 *
 * The same gate in front of `q_jade_flash`. */
void q_jade_flash_four(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c == 0)
        q_no(obj);
    else
        q_jade_flash(obj);
}

/* q_jade_flash_six -- armv7 0x00052b98, 24 bytes.  **Complete.**
 *
 * **The same twenty-four bytes as q_jade_flash_four with `cbz` where it has
 * `cbnz`.** One instruction is the whole difference between the four-button
 * and six-button forms of a move, and it agrees with q_six_button being the
 * negation of q_four_button. */
void q_jade_flash_six(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c != 0)
        q_no(obj);
    else
        q_jade_flash(obj);
}

/* q_scorp_tele_four -- armv7 0x00052a5c, 24 bytes.  **Complete.**
 *
 * The same gate in front of `q_scorp_tele`. */
void q_scorp_tele_four(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c == 0)
        q_no(obj);
    else
        q_scorp_tele(obj);
}

/* DbgTableDump -- armv7 0x000517d8, 24 bytes.  **Complete.**
 *
 *      if ((uint32_t)(table[0] - 1) > 8) return
 *      i = 0
 *      do { i += 1 } while ((uint32_t)(table[i] - 1) <= 8)
 *
 * **A loop with nothing in it.** The routine walks the table while each word
 * is between 1 and 9 and does nothing with what it reads -- no store, no call,
 * no return value. Whatever it printed was behind a debug macro that compiled
 * to nothing, and the scan is all that survived the build. Transcribed as it
 * stands, because the walk is real code and its emptiness is the finding.
 *
 * r0 is indexed as an array of words, not dereferenced as an object, so the
 * parameter is a table pointer. */
void DbgTableDump(uint32_t *table)
{
    uint32_t i;

    if ((uint32_t)(table[0] - 1) > 8)
        return;

    i = 0;
    do {
        i += 1;
    } while ((uint32_t)(table[i] - 1) <= 8);
}


/* q_scorp_tele_six -- armv7 0x00052a44, 24 bytes.  **Complete.**
 *
 * `q_scorp_tele_four` with `cbz` where that has `cbnz` -- the second pair in
 * this file to differ by exactly one instruction. */
void q_scorp_tele_six(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c != 0)
        q_no(obj);
    else
        q_scorp_tele(obj);
}

/* stick_look_lr2 -- armv7 0x000541e4, 24 bytes.  **Complete.**
 *
 *      pair[0] = c        ; r3, the fourth argument
 *      pair[1] = d        ; [sp,#0x10], the fifth
 *      return stick_look_lr(obj, a, b, pair)
 *
 * **A shim that turns two arguments into an array.** `stick_look_lr` takes its
 * last argument by pointer, so this builds the two words on the stack and
 * passes their address. The fifth argument is read from `[sp, #0x10]` --
 * eight bytes of pushed registers plus the eight this routine subtracts --
 * which is where the caller's first stacked argument lands. */
long stick_look_lr2(MK3OBJ *obj, uint32_t a, uint32_t b,
                    uint32_t c, uint32_t d)
{
    uint32_t pair[2];

    pair[0] = c;
    pair[1] = d;
    return stick_look_lr(obj, a, b, pair);
}

/* close_animality_xfer -- armv7 0x00054b5c, 28 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      if (obj->field28 <= 0x50) animality_xfer(obj, other)
 *
 * Both arguments are kept in callee-saved registers across `get_x_dist` and
 * handed on unchanged. Too far apart and nothing happens at all -- the
 * routine has no other exit. */
void close_animality_xfer(MK3OBJ *obj, MK3OBJ *other)
{
    get_x_dist(obj);
    if ((long)obj->field28 <= 0x50)
        animality_xfer(obj, other);
}

/* q_both_punches -- armv7 0x00052858, 28 bytes.  **Complete.**
 *
 *      obj->field1c = 0x00010010
 *      obj->field20 = 0x00101000
 *      return button_bit_check(obj)
 *
 * Two packed words in the argument slots and one call. Each is a pair of
 * halves -- (0x0001, 0x0010) and (0x0010, 0x1000) -- and what the halves
 * select is button_bit_check's business, not this routine's. */
long q_both_punches(MK3OBJ *obj)
{
    obj->field1c = 0x00010010u;
    obj->field20 = 0x00101000u;
    return button_bit_check(obj);
}

/* q_lp_block_lk -- armv7 0x0005283c, 28 bytes.  **Complete.**
 *
 * The same twenty-eight bytes as q_both_punches with two different constants:
 * (0x0003, 0x0020) and (0x0030, 0x2000). */
long q_lp_block_lk(MK3OBJ *obj)
{
    obj->field1c = 0x00030020u;
    obj->field20 = 0x00302000u;
    return button_bit_check(obj);
}


/* qorb3 -- armv7 0x00052874, 28 bytes.  **Complete.**
 *
 *      obj->field1c = ((MK3OBJ *)obj->field00->him)->field24
 *      if (obj->field1c == 0x19) q_no(obj); else q_both_punches(obj);
 *
 * The character number is read out of the opponent and compared against 0x19;
 * that one character cannot be answered and everything else falls through to
 * the button test. The value is stored into 0x1c before the branch, so it is
 * live for whichever call follows -- and q_both_punches overwrites it with its
 * own masks straight away, which is what makes the store a scratch use rather
 * than an argument.
 *
 * Both arms end in a call whose value this routine does not compute, so it
 * answers only through 0x5c. */
void qorb3(MK3OBJ *obj)
{
    obj->field1c = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field24;
    if (obj->field1c == 0x19)
        q_no(obj);
    else
        q_both_punches(obj);
}

/* q_reptile_orb_slow -- armv7 0x00052890, 28 bytes.  **Complete.**
 *
 *      obj->field1c = &G + 0x438
 *      qorb3(obj)
 *
 * **The address it stores is dead.** `qorb3` overwrites 0x1c with the
 * opponent's character number on its first three instructions, before anything
 * reads it. The store is in the binary and nothing between the two touches the
 * field, so it is transcribed as it stands. */
void q_reptile_orb_slow(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x438);
    qorb3(obj);
}

/* airborn_xfer -- armv7 0x0005442c, 32 bytes.  **Complete.**
 *
 *      *(uint16_t *)((char *)other->field00 + 0x80) = 0
 *      if ((other->field00->field10 & 0x1c) == 0) free_xfer(obj, other)
 *
 * The same halfword `fatality_xfer` clears, cleared here too, and then three
 * bits of the proc's 0x10 decide whether the transfer happens at all. The
 * clear is unconditional; only the hand-over is gated. */
void airborn_xfer(MK3OBJ *obj, MK3OBJ *other)
{
    *(uint16_t *)((char *)other->field00 + 0x80) = 0;
    if ((other->field00->field10 & 0x1cu) == 0)
        free_xfer(obj, other);
}

/* q_animal_req -- armv7 0x00050230, 32 bytes.  **Complete.**
 *
 *      q_mercy(obj)
 *      if (obj->field5c == 0) q_no(obj); else q_fatality_req(obj);
 *
 * A question asked in front of another question: mercy first, and only if that
 * answered yes is the fatality requirement asked. Both answer through 0x5c, so
 * the second overwrites the first. */
void q_animal_req(MK3OBJ *obj)
{
    q_mercy(obj);
    if (obj->field5c == 0)
        q_no(obj);
    else
        q_fatality_req(obj);
}

/* q_close_animal -- armv7 0x0005339c, 32 bytes.  **Complete.**
 *
 * The same thirty-two bytes as q_animal_req with `q_close_fatal` in place of
 * `q_fatality_req`. */
void q_close_animal(MK3OBJ *obj)
{
    q_mercy(obj);
    if (obj->field5c == 0)
        q_no(obj);
    else
        q_close_fatal(obj);
}


/* q_close_friend -- armv7 0x00053158, 32 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      if (obj->field28 > 0x70) q_no(obj); else q_friend(obj);
 *
 * The near end of a family of three. See q_ind_friend for the rest. */
void q_close_friend(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((long)obj->field28 > 0x70)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_ind_friend -- armv7 0x000530f8, 32 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      if (obj->field28 <= 0x9f) q_no(obj); else q_friend(obj);
 *
 * **Three routines, one shape, three thresholds -- and not all the same way
 * round.** All of them measure the horizontal distance and hand off to
 * q_friend, but q_close_friend answers yes when the gap is 0x70 or LESS while
 * this one and q_dinger_friend answer yes when it is MORE, at 0x9f and 0xbf.
 * The sense is carried by `ble` against `bgt`, one instruction, exactly as the
 * four/six button pairs are. */
void q_ind_friend(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((long)obj->field28 <= 0x9f)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_dinger_friend -- armv7 0x00053138, 32 bytes.  **Complete.**
 *
 * The far end of the same family: yes above 0xbf. */
void q_dinger_friend(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((long)obj->field28 <= 0xbf)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_fan_lift -- armv7 0x00050328, 32 bytes.  **Complete.**
 *
 *      get_his_p_hit(obj)
 *      if ((long)obj->field1c > 0) q_no(obj); else q_yes(obj);
 *
 * **The consumer of get_his_p_hit, and it settles where that routine leaves
 * its answer.** get_his_p_hit walks four pointers to reach the opponent's
 * proc and stores 0x44 into 0x1c; this reads 0x1c straight back. The lift is
 * allowed only while his hit count is zero or below -- one hit and the answer
 * turns to no. */
void q_fan_lift(MK3OBJ *obj)
{
    get_his_p_hit(obj);
    if ((long)obj->field1c > 0)
        q_no(obj);
    else
        q_yes(obj);
}


/* q_smoke_friend -- armv7 0x00053118, 32 bytes.  **Complete.**
 *
 * A fourth distance gate in front of q_friend, at 0xcf and the far way round.
 * With q_close_friend at 0x70, q_ind_friend at 0x9f and q_dinger_friend at
 * 0xbf, the four thresholds are all different and only the first is a near
 * test. */
void q_smoke_friend(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((long)obj->field28 <= 0xcf)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_sonya_friend -- armv7 0x0005367c, 32 bytes.  **Complete.**
 *
 *      is_stick_down(obj)
 *      if (obj->field5c == 0) q_no(obj); else q_friend(obj);
 *
 * **Not every friendship gate is a distance.** The same thirty-two bytes as
 * the four that measure a gap, with a stick reading where they have
 * get_x_dist -- and the answer comes back in 0x5c instead of 0x28, so the
 * comparison disappears entirely. */
void q_sonya_friend(MK3OBJ *obj)
{
    is_stick_down(obj);
    if (obj->field5c == 0)
        q_no(obj);
    else
        q_friend(obj);
}

/* q_slide -- armv7 0x00053510, 32 bytes.  **Complete.**
 *
 *      is_stick_away(obj)
 *      if (obj->field5c == 0) q_no(obj); else q_lp_block_lk(obj);
 *
 * The stick has to be held away before the button pattern is even looked at. */
void q_slide(MK3OBJ *obj)
{
    is_stick_away(obj);
    if (obj->field5c == 0)
        q_no(obj);
    else
        q_lp_block_lk(obj);
}

/* q_mercy -- armv7 0x0005020c, 36 bytes.  **Complete.**
 *
 *      obj->field30 = (int16)*(uint16_t *)(G + 0x45a)
 *      if (*(uint16_t *)(G + 0x45a) == 0) q_no(obj); else q_yes(obj);
 *
 * **Stored signed, tested unsigned.** The halfword is loaded with `ldrh`, kept
 * for the test, and sign-extended with `sxth` only for the store -- so 0x30
 * can come out negative while the yes/no answer never can. Nothing is lost
 * either way, because both readings agree about zero. */
void q_mercy(MK3OBJ *obj)
{
    uint16_t v = *(uint16_t *)(G_BYTES + 0x45a);

    obj->field30 = (uint32_t)(int32_t)(int16_t)v;
    if (v == 0)
        q_no(obj);
    else
        q_yes(obj);
}

/* q_fatality_req -- armv7 0x000501e8, 36 bytes.  **Complete.**
 *
 *      obj->field2c = (int16)*(int16_t *)(G + 0x45c)
 *      if (obj->field2c == 3) q_yes(obj); else q_no(obj);
 *
 * The neighbouring halfword to q_mercy's, two bytes along, and this one is
 * loaded signed. Exactly three answers yes -- not "at least three".
 *
 * It is also **a writer of 0x2c**, which `tl_jax_dash_punch` reads without
 * ever writing. That does not prove the two are the same use of the field, and
 * nothing here settles it; it is noted so the next reader has somewhere to
 * start.
 *
 * G + 0x456, 0x45a and 0x45c are three halfwords in a row: the sans_repell
 * slot, the mercy flag and this. */
void q_fatality_req(MK3OBJ *obj)
{
    obj->field2c = (uint32_t)(int32_t)*(int16_t *)(G_BYTES + 0x45c);
    if (obj->field2c == 3)
        q_yes(obj);
    else
        q_no(obj);
}


/* q_kano_swipe -- armv7 0x00052fbc, 36 bytes.  **Complete.**
 *
 *      get_his_action(obj)
 *      if (obj->field20 == 0x60c) q_no(obj); else q_yes(obj);
 *
 * **The equal case is the NO.** These read as "is he not doing that", which
 * is why the yes is the fall-through and the no is the branch target.
 * q_lao_spin and q_pounce_ok_now are the same thirty-six bytes with 0x62b and
 * 0x503 -- three routines whose whole difference is one `movw`. */
void q_kano_swipe(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x60c)
        q_no(obj);
    else
        q_yes(obj);
}

/* q_lao_spin -- armv7 0x00052f98, 36 bytes.  **Complete.**  See q_kano_swipe. */
void q_lao_spin(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x62b)
        q_no(obj);
    else
        q_yes(obj);
}

/* q_pounce_ok_now -- armv7 0x00053048, 36 bytes.  **Complete.**  See
 * q_kano_swipe. */
void q_pounce_ok_now(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x503)
        q_no(obj);
    else
        q_yes(obj);
}

/* animality_xfer -- armv7 0x00054b38, 36 bytes.  **Complete.**
 *
 *      *(uint16_t *)((char *)other->field00 + 0x80) = 0
 *      q_mercy(obj)
 *      if (obj->field5c != 0) fatality_xfer(obj, other)
 *
 * **Five routines in this file clear the same halfword.** fatality_xfer,
 * animality_xfer, close_animality_xfer (through animality_xfer), airborn_xfer
 * and restricted_xfer all write zero to `other->field00 + 0x80` before doing
 * anything else, and the two that chain do it twice. The clear is
 * unconditional in every one of them; only what follows is gated.
 *
 * Both arguments are held in callee-saved registers across q_mercy and handed
 * on unchanged. */
void animality_xfer(MK3OBJ *obj, MK3OBJ *other)
{
    *(uint16_t *)((char *)other->field00 + 0x80) = 0;
    q_mercy(obj);
    if (obj->field5c != 0)
        fatality_xfer(obj, other);
}

/* restricted_xfer -- armv7 0x00054678, 36 bytes.  **Complete.**
 *
 *      *(uint16_t *)((char *)other->field00 + 0x80) = 0
 *      am_i_airborn(obj)
 *      if (obj->field5c == 0) airborn_xfer(obj, other)
 *
 * **The name and the test point opposite ways.** The transfer to
 * `airborn_xfer` happens when am_i_airborn comes back CLEAR -- on the ground,
 * not in the air. `cbnz` skips the call, so the reading is not in doubt; what
 * the two names mean together is left as it stands.
 *
 * The halfword at 0x80 is cleared here and then cleared again by
 * airborn_xfer, which is harmless and is what the two routines separately do. */
void restricted_xfer(MK3OBJ *obj, MK3OBJ *other)
{
    *(uint16_t *)((char *)other->field00 + 0x80) = 0;
    am_i_airborn(obj);
    if (obj->field5c == 0)
        airborn_xfer(obj, other);
}


/* q_fatal_dist -- armv7 0x0005322c, 40 bytes.  **Complete.**
 *
 *      get_x_dist(obj)
 *      d = obj->field28
 *      if (d < obj->field30 || d > obj->field34) q_no(obj)
 *      else q_fatality_req(obj)
 *
 * **The band comes in through 0x30 and 0x34 and the caller sets it.**
 * q_ermac_fatal writes 0x60 and 0xc0 into those two fields and then calls
 * this; q_inflate_fatal writes 0x60 and 0xe0. Reading the two sides together
 * settles what the pair is for: a near bound and a far one, inclusive at both
 * ends, tested with `blt` then `ble`. */
void q_fatal_dist(MK3OBJ *obj)
{
    long d;

    get_x_dist(obj);
    d = (long)obj->field28;
    if (d < (long)obj->field30 || d > (long)obj->field34)
        q_no(obj);
    else
        q_fatality_req(obj);
}

/* q_animal_dist -- armv7 0x00053178, 40 bytes.  **Complete.**
 *
 * The same forty bytes as q_fatal_dist with `q_animal_req` in place of
 * `q_fatality_req`. */
void q_animal_dist(MK3OBJ *obj)
{
    long d;

    get_x_dist(obj);
    d = (long)obj->field28;
    if (d < (long)obj->field30 || d > (long)obj->field34)
        q_no(obj);
    else
        q_animal_req(obj);
}

/* q_inflate_fatal -- armv7 0x00054bfc, 40 bytes.  **Complete.**
 *
 *      q_is_he_cornered(obj)
 *      if (obj->field5c != 0) q_no(obj)
 *      else { obj->field30 = 0x60; obj->field34 = 0xe0; q_fatal_dist(obj) }
 *
 * A cornered opponent is refused outright; otherwise the band is built the
 * same way q_ermac_fatal builds its own -- a constant and then an add on the
 * register that already holds it, so the two bounds cannot drift apart. The
 * far bound is 0x80 above the near one here and 0x60 above it there. */
void q_inflate_fatal(MK3OBJ *obj)
{
    q_is_he_cornered(obj);
    if (obj->field5c != 0) {
        q_no(obj);
        return;
    }
    obj->field30 = 0x60;
    obj->field34 = 0x60 + 0x80;
    q_fatal_dist(obj);
}

/* sonya_block_close -- armv7 0x000549ac, 36 bytes.  **Complete.**
 *
 *      check_sonya_legs(obj)
 *      if (obj->field5c != 0) {
 *          obj->field38 = t_do_leg_throw
 *          restricted_xfer(obj, other)
 *      }
 *
 * The handler goes into 0x38 one instruction before the transfer, which is the
 * slot that family reads -- the same order tl_do_swat_zoom uses to hand a
 * thread over. Nothing happens at all when the check comes back clear. */
void sonya_block_close(MK3OBJ *obj, MK3OBJ *other)
{
    check_sonya_legs(obj);
    if (obj->field5c != 0) {
        obj->field38 = (uint32_t)(uintptr_t)t_do_leg_throw;
        restricted_xfer(obj, other);
    }
}

/* sz_lp_close -- armv7 0x00054808, 36 bytes.  **Complete.**
 *
 *      slide_check(obj)
 *      if (obj->field5c == 0) secret_move_search(obj, arg, sm_sz_lpc)
 *
 * A member of the osm_/ind_ table family with a gate in front of it, and the
 * gate is the CLEAR case: a slide already in progress stops the search. The
 * table address is passed as it stands, without the 0x48 that makes
 * osm_hk_close different from its own siblings. */
void sz_lp_close(MK3OBJ *obj, uint32_t arg)
{
    slide_check(obj);
    if (obj->field5c == 0)
        secret_move_search(obj, arg, sm_sz_lpc);
}


/* q_friend -- armv7 0x0005027c, 44 bytes.  **Complete.**
 *
 *      i = obj->field00->field08                     ; the strength index
 *      obj->field1c = *(uint16_t *)(G + 0x3b0 + i * 2)
 *      if (obj->field1c == 0) q_fatality_req(obj); else q_no(obj);
 *
 * **A halfword table indexed by the strength index.** The index is shifted
 * left one, not two, so the entries are sixteen bits; the base is G + 0x3b0.
 * A ZERO entry is the permissive one -- it passes the question on -- and any
 * other value refuses outright.
 *
 * This is what the whole friendship family funnels into: q_close_friend,
 * q_ind_friend, q_dinger_friend and q_smoke_friend all gate on distance and
 * then land here, and q_sonya_friend gates on the stick instead. */
void q_friend(MK3OBJ *obj)
{
    obj->field1c = *(uint16_t *)(G_BYTES + 0x3b0
                                 + obj->field00->field08 * 2);
    if (obj->field1c == 0)
        q_fatality_req(obj);
    else
        q_no(obj);
}

/* q_friend_ez -- armv7 0x00050250, 44 bytes.  **Complete.**
 *
 * The same forty-four bytes as q_friend reading the same table, answering yes
 * directly instead of passing the question to q_fatality_req. The easy form
 * skips the requirement, which is the whole difference between them. */
void q_friend_ez(MK3OBJ *obj)
{
    obj->field1c = *(uint16_t *)(G_BYTES + 0x3b0
                                 + obj->field00->field08 * 2);
    if (obj->field1c == 0)
        q_yes(obj);
    else
        q_no(obj);
}

/* q_lia_scream -- armv7 0x0005306c, 44 bytes.  **Complete.**
 *
 *      get_his_p_hit(obj)
 *      if (obj->field1c > 2) q_no(obj)
 *      else {
 *          q_is_he_a_boss(obj)
 *          if (obj->field5c != 0) q_no(obj); else q_yes(obj);
 *      }
 *
 * Two conditions, both of which have to hold: he must have been hit no more
 * than twice, and he must not be a boss. The two tests answer through
 * different fields -- 0x1c for the count, 0x5c for the boss -- and the second
 * is only asked when the first passes. */
void q_lia_scream(MK3OBJ *obj)
{
    get_his_p_hit(obj);
    if ((long)obj->field1c > 2) {
        q_no(obj);
        return;
    }
    q_is_he_a_boss(obj);
    if (obj->field5c != 0)
        q_no(obj);
    else
        q_yes(obj);
}

/* q_lk_friend -- armv7 0x00052810, 44 bytes.  **Complete.**
 *
 *      obj->field1c = 0x00040000
 *      obj->field20 = 0x00400000
 *      button_bit_check(obj)
 *      if (obj->field5c == 0) q_no(obj); else q_friend(obj);
 *
 * The second mask is the first plus 0x3c0000 -- one literal and an add on the
 * register already holding it, the same way the velocity triples are built.
 * Both halves are (0x0004, 0x0000) and (0x0040, 0x0000), so unlike
 * q_both_punches and q_lp_block_lk the low halves are empty here. */
void q_lk_friend(MK3OBJ *obj)
{
    obj->field1c = 0x40000u;
    obj->field20 = 0x40000u + 0x3c0000u;
    button_bit_check(obj);
    if (obj->field5c == 0)
        q_no(obj);
    else
        q_friend(obj);
}


/* q_reptile_orb_fast_four -- armv7 0x000528ac, 44 bytes.  **Complete.**
 *
 *      if ((int16)obj->field00->field7c == 0) q_no(obj)
 *      else { obj->field1c = &G + 0x43c; qorb3(obj); }
 *
 * **A third caller writing a dead address into 0x1c.** q_reptile_orb_slow
 * stores &G + 0x438 and both fast forms store &G + 0x43c, and qorb3 overwrites
 * 0x1c with the opponent's character number before any of them is read. The
 * two addresses are adjacent words and they differ between the slow and fast
 * forms, which is worth knowing even though nothing here consumes them.
 *
 * The address is built with two adds, 0x430 then 0xc, rather than one. */
void q_reptile_orb_fast_four(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c == 0) {
        q_no(obj);
        return;
    }
    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x430 + 0xc);
    qorb3(obj);
}

/* q_reptile_orb_fast_six -- armv7 0x000528d8, 44 bytes.  **Complete.**
 *
 * The same forty-four bytes with cbz where the four form has cbnz -- the
 * fourth pair in this file separated by exactly one instruction. */
void q_reptile_orb_fast_six(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c != 0) {
        q_no(obj);
        return;
    }
    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x430 + 0xc);
    qorb3(obj);
}

/* q_simple_shang -- armv7 0x000501bc, 44 bytes.  **Complete.**
 *
 *      c = ((MK3OBJ *)obj->field00->him)->field24
 *      if (c <= 0x17 && c != 0xc) q_yes(obj); else q_no(obj);
 *
 * **Two conditions with no branch between them.** The compiler built the
 * whole test out of flags: a subtract that leaves 1 unless the character is
 * 0xc, then an if-then-else pair that zeroes the answer outright above 0x17
 * and otherwise keeps that bit. One branch at the end, for the result.
 *
 * The range test is signed, and the excluded character sits inside the range
 * rather than at either end. */
void q_simple_shang(MK3OBJ *obj)
{
    long c = (long)((MK3OBJ *)(uintptr_t)obj->field00->him)->field24;

    if (c <= 0x17 && c != 0xc)
        q_yes(obj);
    else
        q_no(obj);
}
