/*
 * mkdrone.c -- gamecode/logic/mkdrone.c, decompiled.
 *
 * The AI: what the computer opponent decides to do, and the thread it becomes
 * to do it. *
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

long c_air_fan(struct MK3THREAD *thread);
long c_bike(struct MK3THREAD *thread);
long c_duck_kickh(struct MK3THREAD *thread);
long c_duck_kickl(struct MK3THREAD *thread);
long c_elbow(struct MK3THREAD *thread);
long c_fast_orb(struct MK3THREAD *thread);
long c_flypunch(struct MK3THREAD *thread);
long c_ind_charge(struct MK3THREAD *thread);
long c_jax_dash(struct MK3THREAD *thread);
long c_juppunch(struct MK3THREAD *thread);
long c_kano_roll(struct MK3THREAD *thread);
long c_kroll_sd(struct MK3THREAD *thread);
long c_kswipe_sd(struct MK3THREAD *thread);
long c_lia_scream(struct MK3THREAD *thread);
long c_mileena_tele(struct MK3THREAD *thread);
long c_proj_sd(struct MK3THREAD *thread);
long c_sbike(struct MK3THREAD *thread);
long c_sbike_sd(struct MK3THREAD *thread);
long c_screamed(struct MK3THREAD *thread);
long c_st_zap3(struct MK3THREAD *thread);
long c_superkang(struct MK3THREAD *thread);
long c_tusk_blur(struct MK3THREAD *thread);
long c_tusk_zap_air(struct MK3THREAD *thread);
long c_zoom_sd(struct MK3THREAD *thread);
long ckik3(struct MK3THREAD *thread);
long cpch3(struct MK3THREAD *thread);
long funcs_11119(struct MK3THREAD *thread);
long funcs_11165(struct MK3THREAD *thread);
long funcs_11195(struct MK3THREAD *thread);
long funcs_11229(struct MK3THREAD *thread);
long funcs_11243(struct MK3THREAD *thread);
long funcs_11298(struct MK3THREAD *thread);
long funcs_11346(struct MK3THREAD *thread);
long funcs_11380(struct MK3THREAD *thread);
long funcs_11414(struct MK3THREAD *thread);
long funcs_11449(struct MK3THREAD *thread);
long funcs_11528(struct MK3THREAD *thread);
long funcs_11623(struct MK3THREAD *thread);
long funcs_12230(struct MK3THREAD *thread);
long funcs_12891(struct MK3THREAD *thread);
long funcs_12990(struct MK3THREAD *thread);
long funcs_13044(struct MK3THREAD *thread);
long funcs_13084(struct MK3THREAD *thread);
long funcs_13115(struct MK3THREAD *thread);
long funcs_13142(struct MK3THREAD *thread);
long funcs_13191(struct MK3THREAD *thread);
long funcs_13283(struct MK3THREAD *thread);
long funcs_13351(struct MK3THREAD *thread);
long funcs_13378(struct MK3THREAD *thread);
long funcs_13464(struct MK3THREAD *thread);
long funcs_13578(struct MK3THREAD *thread);
long funcs_14131(struct MK3THREAD *thread);
long funcs_14174(struct MK3THREAD *thread);
long funcs_14207(struct MK3THREAD *thread);
long funcs_14271(struct MK3THREAD *thread);
long q_is_proj_gone(struct MK3THREAD *thread);
long t_cornered_attack(struct MK3THREAD *thread);
long t_counter_grounded_sd(struct MK3THREAD *thread);
long t_crossover_scan(struct MK3THREAD *thread);
long t_d_block(struct MK3THREAD *thread);
long t_d_body_propell(struct MK3THREAD *thread);
long t_d_crossover_kick(struct MK3THREAD *thread);
long t_d_fatality_abort(struct MK3THREAD *thread);
long t_d_fflip_jump(struct MK3THREAD *thread);
long t_d_fflip_scan_jump(struct MK3THREAD *thread);
long t_d_hi_kick(struct MK3THREAD *thread);
long t_d_jump_up_kick(struct MK3THREAD *thread);
long t_d_stalk_a11(struct MK3THREAD *thread);
long t_d_sweep_kick(struct MK3THREAD *thread);
long t_d_uppercut(struct MK3THREAD *thread);
long t_d_zap_jump(struct MK3THREAD *thread);
long t_diff_no_propell(struct MK3THREAD *thread);
long t_fflip_scan(struct MK3THREAD *thread);
long t_if_u_can(struct MK3THREAD *thread);
long t_jade_anti_zap(struct MK3THREAD *thread);
long t_lk_jump_up_zap(struct MK3THREAD *thread);
long t_react_jump_table_act(struct MK3THREAD *thread);
long t_run_in_close(struct MK3THREAD *thread);
long t_stance_wait_no(struct MK3THREAD *thread);
long t_tusk_jump_up_zap(struct MK3THREAD *thread);

/* t_d_stalk_a11_ntl -- armv7 0x0006777c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->a10 = 0x7d00
 *      frame[frame].handler = t_d_stalk_a11
 *      frame[frame+1].w0 = 0
 */

long t_d_stalk_a11_ntl(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->a10 = 0x7d00;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_stalk_a11);
}

/* t_far_airborn -- armv7 0x00067d70, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_fflip_jump
 *      frame[frame+1].w0 = 0
 */

long t_far_airborn(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fflip_jump);
}

/* t_very_close_airborn -- armv7 0x00067e28, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_jump_up_kick
 *      frame[frame+1].w0 = 0
 */

long t_very_close_airborn(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_jump_up_kick);
}

/* t_d_cornered -- armv7 0x00067e5c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_cornered_attack
 *      frame[frame+1].w0 = 0
 */

long t_d_cornered(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_cornered_attack);
}

/* t_diff_no_zap -- armv7 0x00067e90, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_diff_no_propell
 *      frame[frame+1].w0 = 0
 */

long t_diff_no_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_diff_no_propell);
}

/* t_stw_proj_proc -- armv7 0x0006847c, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = q_is_proj_gone
 *      obj->a10 = 0x50
 *      frame[frame].handler = t_stance_wait_no
 *      frame[frame+1].w0 = 0
 */

long t_stw_proj_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = (uint32_t)(uintptr_t)q_is_proj_gone;
    obj->a10 = 0x50;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stance_wait_no);
}

/* t_d_crossover_kick -- armv7 0x000686c4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field34 = t_crossover_scan
 *      frame[frame].handler = t_d_fflip_scan_jump
 *      frame[frame+1].w0 = 0
 */

long t_d_crossover_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field34 = (uint32_t)(uintptr_t)t_crossover_scan;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fflip_scan_jump);
}

/* t_d_fflip_kick_jsrp -- armv7 0x00068704, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field34 = t_fflip_scan
 *      frame[frame].handler = t_d_fflip_scan_jump
 *      frame[frame+1].w0 = 0
 */

long t_d_fflip_kick_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field34 = (uint32_t)(uintptr_t)t_fflip_scan;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fflip_scan_jump);
}

/* t_nr_sweep_if_u_can -- armv7 0x00068c44, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      obj->a10 = t_d_sweep_kick
 *      frame[frame].handler = t_if_u_can
 *      frame[frame+1].w0 = 0
 */

long t_nr_sweep_if_u_can(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    obj->a10 = (uint32_t)(uintptr_t)t_d_sweep_kick;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_if_u_can);
}

/* t_nr_uppercut_if_u_can -- armv7 0x00068c88, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x8
 *      obj->a10 = t_d_uppercut
 *      frame[frame].handler = t_if_u_can
 *      frame[frame+1].w0 = 0
 */

long t_nr_uppercut_if_u_can(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x8;
    obj->a10 = (uint32_t)(uintptr_t)t_d_uppercut;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_if_u_can);
}

/* t_d_fatality_cornered -- armv7 0x000695c4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_fatality_abort
 *      frame[frame+1].w0 = 0
 */

long t_d_fatality_cornered(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fatality_abort);
}

/* t_kitana_jump_up_zap -- armv7 0x00069944, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_lk_jump_up_zap
 *      frame[frame+1].w0 = 0
 */

long t_kitana_jump_up_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_lk_jump_up_zap);
}

/* t_lk_jump_up_zap -- armv7 0x00069978, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_tusk_jump_up_zap
 *      frame[frame+1].w0 = 0
 */

long t_lk_jump_up_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_tusk_jump_up_zap);
}

/* c_reptile_dash -- armv7 0x0006a09c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_tusk_blur
 *      frame[frame+1].w0 = 0
 */

long c_reptile_dash(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_tusk_blur);
}

/* c_bomb -- armv7 0x0006a0d0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_run_in_close
 *      frame[frame+1].w0 = 0
 */

long c_bomb(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_run_in_close);
}

/* c_robo_bomb -- armv7 0x0006a104, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11119
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_robo_bomb(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11119;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_st_zap2 -- armv7 0x0006a1ac, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_st_zap3
 *      frame[frame+1].w0 = 0
 */

long c_st_zap2(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_st_zap3);
}

/* c_st_zap3 -- armv7 0x0006a1e0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11165
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_st_zap3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11165;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_lk_zap_lo -- armv7 0x0006a220, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11195
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_lk_zap_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11195;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_lao_zap -- armv7 0x0006a260, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11229
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_lao_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11229;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_robo_net -- armv7 0x0006a2a0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11243
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_robo_net(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11243;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_robo_zap2 -- armv7 0x0006a2e0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11298
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_robo_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11298;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_lia_anglez -- armv7 0x0006a320, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11346
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_lia_anglez(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11346;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_swat_bomb_lo -- armv7 0x0006a360, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11380
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_swat_bomb_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11380;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_swat_bomb_hi -- armv7 0x0006a3a0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11414
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_swat_bomb_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11414;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_sky_ice -- armv7 0x0006a490, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11449
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_sky_ice(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11449;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_jax_zap2 -- armv7 0x0006a4d0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11528
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_jax_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11528;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_kano_zap -- armv7 0x0006a510, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.11623
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_kano_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_11623;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* t_lk_zap_low -- armv7 0x0006a658, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x17
 *      frame[frame].handler = t_d_zap_jump
 *      frame[frame+1].w0 = 0
 */

long t_lk_zap_low(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x17;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_zap_jump);
}

/* t_jade_anti_orb -- armv7 0x0006a810, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_jade_anti_zap
 *      frame[frame+1].w0 = 0
 */

long t_jade_anti_orb(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_jade_anti_zap);
}

/* c_reptile_orb -- armv7 0x0006a8c4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_fast_orb
 *      frame[frame+1].w0 = 0
 */

long c_reptile_orb(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_fast_orb);
}

/* c_mil_air_zap -- armv7 0x0006a9f4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_air_fan
 *      frame[frame+1].w0 = 0
 */

long c_mil_air_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_air_fan);
}

/* c_lk_zap_air -- armv7 0x0006aa90, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_tusk_zap_air
 *      frame[frame+1].w0 = 0
 */

long c_lk_zap_air(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_tusk_zap_air);
}

/* c_floor_zap -- armv7 0x0006ab74, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.12230
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_floor_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_12230;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_slam_bounce -- armv7 0x0006abb4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_hi_kick
 *      frame[frame+1].w0 = 0
 */

long c_slam_bounce(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_hi_kick);
}

/* c_upball_sd -- armv7 0x0006ad1c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_sbike_sd
 *      frame[frame+1].w0 = 0
 */

long c_upball_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_sbike_sd);
}

/* c_speared -- armv7 0x0006ad50, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_screamed
 *      frame[frame+1].w0 = 0
 */

long c_speared(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_screamed);
}

/* c_swat_gun_sd -- armv7 0x0006ae40, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_proj_sd
 *      frame[frame+1].w0 = 0
 */

long c_swat_gun_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_proj_sd);
}

/* t_d_bike_kick -- armv7 0x0006afcc, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xd
 *      frame[frame].handler = t_d_body_propell
 *      frame[frame+1].w0 = 0
 */

long t_d_bike_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xd;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_body_propell);
}

/* c_lk_bike_sd -- armv7 0x0006b0c0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_zoom_sd
 *      frame[frame+1].w0 = 0
 */

long c_lk_bike_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_zoom_sd);
}

/* c_zoom_sd -- armv7 0x0006b0f4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_kroll_sd
 *      frame[frame+1].w0 = 0
 */

long c_zoom_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_kroll_sd);
}

/* c_leg_sd -- armv7 0x0006b190, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_kswipe_sd
 *      frame[frame+1].w0 = 0
 */

long c_leg_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_kswipe_sd);
}

/* c_kswipe_sd -- armv7 0x0006b1c4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_counter_grounded_sd
 *      frame[frame+1].w0 = 0
 */

long c_kswipe_sd(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_counter_grounded_sd);
}

/* c_sg_pounce -- armv7 0x0006b2c8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.12891
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_sg_pounce(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_12891;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_kano_upball -- armv7 0x0006b390, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_sbike
 *      frame[frame+1].w0 = 0
 */

long c_kano_upball(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_sbike);
}

/* c_sbike -- armv7 0x0006b3c4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.12990
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_sbike(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_12990;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_lao_angle -- armv7 0x0006b44c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13044
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_lao_angle(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13044;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_tele_explode -- armv7 0x0006b48c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13084
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_tele_explode(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13084;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_robo_tele -- armv7 0x0006b544, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13115
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_robo_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13115;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* t_av_scorp_tele -- armv7 0x0006b584, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_block
 *      frame[frame+1].w0 = 0
 */

long t_av_scorp_tele(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_block);
}

/* c_scorp_tele -- armv7 0x0006b5b8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13142
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_scorp_tele(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13142;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_square -- armv7 0x0006b5f8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13191
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_square(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13191;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_mileena_roll -- armv7 0x0006b6bc, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_mileena_tele
 *      frame[frame+1].w0 = 0
 */

long c_mileena_roll(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_mileena_tele);
}

/* c_mileena_tele -- armv7 0x0006b6f0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_bike
 *      frame[frame+1].w0 = 0
 */

long c_mileena_tele(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_bike);
}

/* c_bike -- armv7 0x0006b724, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_superkang
 *      frame[frame+1].w0 = 0
 */

long c_bike(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_superkang);
}

/* c_superkang -- armv7 0x0006b758, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_kano_roll
 *      frame[frame+1].w0 = 0
 */

long c_superkang(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_kano_roll);
}

/* c_kano_roll -- armv7 0x0006b78c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13283
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_kano_roll(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13283;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_jade_prop -- armv7 0x0006b8b0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_ind_charge
 *      frame[frame+1].w0 = 0
 */

long c_jade_prop(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_ind_charge);
}

/* c_ind_charge -- armv7 0x0006b8e4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_jax_dash
 *      frame[frame+1].w0 = 0
 */

long c_ind_charge(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_jax_dash);
}

/* c_jax_dash -- armv7 0x0006b918, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13351
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_jax_dash(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13351;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* t_ct_zoom -- armv7 0x0006b958, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_block
 *      frame[frame+1].w0 = 0
 */

long t_ct_zoom(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_block);
}

/* c_zoom -- armv7 0x0006b98c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13378
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_zoom(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13378;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_flykick -- armv7 0x0006b9cc, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_flypunch
 *      frame[frame+1].w0 = 0
 */

long c_flykick(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_flypunch);
}

/* c_flypunch -- armv7 0x0006ba00, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13464
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_flypunch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13464;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_swat_stick -- armv7 0x0006bac4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13578
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_swat_stick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13578;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_jupkick -- armv7 0x0006bbf4, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_juppunch
 *      frame[frame+1].w0 = 0
 */

long c_jupkick(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_juppunch);
}

/* c_duckpunch -- armv7 0x0006bc28, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_duck_kickh
 *      frame[frame+1].w0 = 0
 */

long c_duckpunch(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_duck_kickh);
}

/* c_duck_kickh -- armv7 0x0006bc5c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_duck_kickl
 *      frame[frame+1].w0 = 0
 */

long c_duck_kickh(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_duck_kickl);
}

/* c_knee -- armv7 0x0006bc90, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_elbow
 *      frame[frame+1].w0 = 0
 */

long c_knee(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_elbow);
}

/* t_ct_sweep -- armv7 0x0006bd40, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_d_crossover_kick
 *      frame[frame+1].w0 = 0
 */

long t_ct_sweep(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_crossover_kick);
}

/* c_fan_lift -- armv7 0x0006bd74, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = c_lia_scream
 *      frame[frame+1].w0 = 0
 */

long c_fan_lift(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)c_lia_scream);
}

/* c_lopunch -- armv7 0x0006bda8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x102
 *      frame[frame].handler = cpch3
 *      frame[frame+1].w0 = 0
 */

long c_lopunch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x102;

    return mk3_push_handler(thread, (MK3THREADFUNC)cpch3);
}

/* c_hipunch -- armv7 0x0006bde4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x101
 *      frame[frame].handler = cpch3
 *      frame[frame+1].w0 = 0
 */

long c_hipunch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x101;

    return mk3_push_handler(thread, (MK3THREADFUNC)cpch3);
}

/* c_lokick -- armv7 0x0006be20, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x104
 *      frame[frame].handler = ckik3
 *      frame[frame+1].w0 = 0
 */

long c_lokick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x104;

    return mk3_push_handler(thread, (MK3THREADFUNC)ckik3);
}

/* c_hikick -- armv7 0x0006bec4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x103
 *      frame[frame].handler = ckik3
 *      frame[frame+1].w0 = 0
 */

long c_hikick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x103;

    return mk3_push_handler(thread, (MK3THREADFUNC)ckik3);
}

/* c_noogy -- armv7 0x0006bf00, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x112
 *      frame[frame].handler = ckik3
 *      frame[frame+1].w0 = 0
 */

long c_noogy(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x112;

    return mk3_push_handler(thread, (MK3THREADFUNC)ckik3);
}

/* c_shake -- armv7 0x0006bf3c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x111
 *      frame[frame].handler = ckik3
 *      frame[frame+1].w0 = 0
 */

long c_shake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x111;

    return mk3_push_handler(thread, (MK3THREADFUNC)ckik3);
}

/* c_quake -- armv7 0x0006bfe0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.14131
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_quake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14131;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_laospin -- armv7 0x0006c020, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.14174
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_laospin(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14174;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_kano_swipe -- armv7 0x0006c060, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.14207
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_kano_swipe(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14207;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_leg_grab -- armv7 0x0006c108, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.14271
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_leg_grab(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14271;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}


/* vq_no -- armv7 0x00067514, 8 bytes.  **Complete.**
 *
 *      obj->field5c = 0
 */
void vq_no(MK3OBJ *obj)
{
    obj->field5c = 0;
}

/* vq_yes -- armv7 0x0006751c, 8 bytes.  **Complete.**
 *
 *      obj->field5c = 1
 */
void vq_yes(MK3OBJ *obj)
{
    obj->field5c = 1;
}

/* t_d_leg_grab -- armv7 0x0006af20, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      frame[frame].handler = t_do_stationary
 *      frame[frame+1].w0 = 0
 *
 * The handler comes through the pointer slot at 0x000f3154 rather than as a
 * link-time constant, so it lives in another translation unit. */
long t_do_stationary(struct MK3THREAD *thread);

long t_d_leg_grab(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    return mk3_push_handler(thread, (MK3THREADFUNC)t_do_stationary);
}




/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_d_bflip_scan_jsrp(struct MK3THREAD *thread);
long t_d_fflip_scan_jsrp(struct MK3THREAD *thread);
long t_d_jumpup(struct MK3THREAD *thread);

/* t_d_jumpup_nocall -- armv7 0x00068164, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0   (the register the guard proved)
 *      frame[frame].handler = t_d_jumpup
 *      frame[frame+1].w0 = 0
 */

long t_d_jumpup_nocall(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_jumpup);
}

/* t_d_bflip_noscan_jsrp -- armv7 0x00068208, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field34 = 0   (the register the guard proved)
 *      frame[frame].handler = t_d_bflip_scan_jsrp
 *      frame[frame+1].w0 = 0
 */

long t_d_bflip_noscan_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field34 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_bflip_scan_jsrp);
}

/* t_d_fflip_noscan_jsrp -- armv7 0x000682a8, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field34 = 0   (the register the guard proved)
 *      frame[frame].handler = t_d_fflip_scan_jsrp
 *      frame[frame+1].w0 = 0
 */

long t_d_fflip_noscan_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field34 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fflip_scan_jsrp);
}

/* t_nr_hikick_if_u_can -- armv7 0x00068c00, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      obj->a10 = t_d_hi_kick
 *      frame[frame].handler = t_if_u_can
 *      frame[frame+1].w0 = 0
 */

long t_nr_hikick_if_u_can(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */
    obj->a10 = (uint32_t)(uintptr_t)t_d_hi_kick;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_if_u_can);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long is_he_airborn(struct MK3THREAD *thread);

/* t_swait_land_jsrp -- armv7 0x0006b404, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = is_he_airborn
 *      obj->a10 = 0x40
 *      frame[frame].handler = t_stance_wait_no
 *      frame[frame+1].w0 = 0
 */

long t_swait_land_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = (uint32_t)(uintptr_t)is_he_airborn;
    obj->a10 = 0x40;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stance_wait_no);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_d_punch(struct MK3THREAD *thread);

/* t_d_rapid_lo -- armv7 0x000687ac, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x7
 *      obj->field20 = 0x2
 *      obj->field24 = 0x3
 *      obj->field40 = 0xf
 *      frame[frame].handler = t_d_punch
 *      frame[frame+1].w0 = 0
 */

long t_d_rapid_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x7;
    obj->field20 = 0x2;
    obj->field24 = 0x3;
    obj->field40 = 0xf;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_punch);
}

/* t_d_rapid_hi -- armv7 0x000687f4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x7
 *      obj->field20 = 0x2
 *      obj->field24 = 0x2
 *      obj->field40 = 0xe
 *      frame[frame].handler = t_d_punch
 *      frame[frame+1].w0 = 0
 */

long t_d_rapid_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x7;
    obj->field20 = 0x2;
    obj->field24 = 0x2;
    obj->field40 = 0xe;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_punch);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long funcs_13619(struct MK3THREAD *thread);
long funcs_14239(struct MK3THREAD *thread);
long rpt_cornered(struct MK3THREAD *thread);
long rpt_elbow_knee(struct MK3THREAD *thread);
long t_d_bflip_jump(struct MK3THREAD *thread);
long t_d_fflip_kick_jump(struct MK3THREAD *thread);
long t_d_zap_now(struct MK3THREAD *thread);
long t_drone_proc(struct MK3THREAD *thread);
long t_react_jump_table(struct MK3THREAD *thread);
long t_run_in_close_now(struct MK3THREAD *thread);
long t_stalk_in_close(struct MK3THREAD *thread);
long ask_mr_diff(MK3OBJ *obj);
void get_his_action(MK3OBJ *obj);
long get_x_dist(MK3OBJ *obj);
long is_throwing_allowed(MK3OBJ *obj);
long is_towards_me(MK3OBJ *obj);
long ochar_begin_calls(MK3OBJ *obj);
long q_am_i_cornered(MK3OBJ *obj);
long q_will_he_reach_me(MK3OBJ *obj);

/* t_d_zap -- armv7 0x00067f90, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      is_throwing_allowed(obj)
 *      frame[frame].handler = t_d_zap_now
 *      frame[frame+1].w0 = 0
 */

long t_d_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_throwing_allowed(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_zap_now);
}

/* t_react_jump_table_act -- armv7 0x0006c5ac, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      get_his_action(obj)
 *      frame[frame].handler = t_react_jump_table
 *      frame[frame+1].w0 = 0
 */

long t_react_jump_table_act(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_his_action(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table);
}

/* t_cornered_attack -- armv7 0x0006cd3c, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = rpt_cornered
 *      ask_mr_diff(obj)
 *      frame[frame].handler = t_stalk_in_close
 *      frame[frame+1].w0 = 0
 */

long t_cornered_attack(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_cornered;
    ask_mr_diff(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stalk_in_close);
}

/* t_d_avoid_elbow_knee -- armv7 0x0006d4c0, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = rpt_elbow_knee
 *      ask_mr_diff(obj)
 *      get_x_dist(obj)
 *      frame[frame].handler = t_d_block
 *      frame[frame+1].w0 = 0
 */

long t_d_avoid_elbow_knee(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_elbow_knee;
    ask_mr_diff(obj);
    get_x_dist(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_block);
}

/* c_floor_blade -- armv7 0x0006e044, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      get_x_dist(obj)
 *      frame[frame].handler = t_run_in_close_now
 *      frame[frame+1].w0 = 0
 */

long c_floor_blade(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_run_in_close_now);
}

/* t_ct_leg -- armv7 0x0006e9e8, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_will_he_reach_me(obj)
 *      frame[frame].handler = t_d_block
 *      frame[frame+1].w0 = 0
 */

long t_ct_leg(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_will_he_reach_me(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_block);
}

/* c_axe_up -- armv7 0x0006ea38, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_will_he_reach_me(obj)
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.14239
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_will_he_reach_me(obj);
    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14239;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* c_uppercut -- armv7 0x0006ebc4, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_will_he_reach_me(obj)
 *      *(uint32_t *)((char *)obj + 0x68) = funcs.13619
 *      frame[frame].handler = t_react_jump_table_act
 *      frame[frame+1].w0 = 0
 */

long c_uppercut(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_will_he_reach_me(obj);
    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13619;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* t_close_airborn -- armv7 0x00070b8c, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      is_towards_me(obj)
 *      frame[frame].handler = t_d_fflip_kick_jump
 *      frame[frame+1].w0 = 0
 */

long t_close_airborn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_towards_me(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_fflip_kick_jump);
}

/* t_av_sweep -- armv7 0x00070f70, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_am_i_cornered(obj)
 *      frame[frame].handler = t_d_bflip_jump
 *      frame[frame+1].w0 = 0
 */

long t_av_sweep(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_am_i_cornered(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_bflip_jump);
}

/* t_sq_quake_abort -- armv7 0x0007113c, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_am_i_cornered(obj)
 *      frame[frame].handler = t_d_bflip_jump
 *      frame[frame+1].w0 = 0
 */

long t_sq_quake_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_am_i_cornered(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_d_bflip_jump);
}

/* t_drone_begin -- armv7 0x000721e4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      ochar_begin_calls(obj)
 *      frame[frame].handler = t_drone_proc
 *      frame[frame+1].w0 = 0
 */

long t_drone_begin(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    ochar_begin_calls(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_drone_proc);
}

/* --------------------------------------------------------------------
 * Straight-line leaves, read by tools/leaffn.py: stores, calls and
 * a return, with every instruction accounted for. It refuses
 * anything that branches, any return value it cannot prove, and any
 * value read from a field the function also writes -- that is a
 * saved value being put back, not a re-read.
 * -------------------------------------------------------------------- */

void beh1(MK3OBJ *obj);
void bossck(MK3OBJ *obj, MK3OBJ * arg);
void dwset3(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void get_my_dfe(MK3OBJ *obj);
void get_walk_info_b(MK3OBJ *obj);
void get_walk_info_f(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void q_is_he_lower(MK3OBJ *obj);
void set_x_vel_player(MK3OBJ *obj);

/* q_am_i_a_boss -- armv7 0x00068e14, 12 bytes.  **Complete.**
 *
 *      bossck(obj, obj->field08)
 */
void q_am_i_a_boss(MK3OBJ *obj)
{
    bossck(obj, obj->field08);
}


/* q_square_lower -- armv7 0x00068e64, 16 bytes.  **Complete.**
 *
 *      obj->field38 = 0x50
 *      q_is_he_lower(obj)
 */
void q_square_lower(MK3OBJ *obj)
{
    obj->field38 = 0x50;
    q_is_he_lower(obj);
}


/* d_behind_me_a5 -- armv7 0x00070f44, 20 bytes.  **Complete.**
 *
 *      get_my_dfe(obj)
 *      beh1(obj)
 */
void d_behind_me_a5(MK3OBJ *obj)
{
    get_my_dfe(obj);
    beh1(obj);
}


/* dwset3 -- armv7 0x000724a4, 32 bytes.  **Complete.**
 *
 *      obj->field40 = obj->field24
 *      init_anirate(obj)
 *      obj->field1c = obj->field20
 *      set_x_vel_player(obj)
 *      get_char_ani(obj)
 */
void dwset3(MK3OBJ *obj)
{
    obj->field40 = obj->field24;
    init_anirate(obj);
    obj->field1c = obj->field20;
    set_x_vel_player(obj);
    get_char_ani(obj);
}


/* d_walkb_setup -- armv7 0x000724c4, 20 bytes.  **Complete.**
 *
 *      get_walk_info_b(obj)
 *      dwset3(obj)
 */
void d_walkb_setup(MK3OBJ *obj)
{
    get_walk_info_b(obj);
    dwset3(obj);
}


/* d_walkf_setup -- armv7 0x00072928, 20 bytes.  **Complete.**
 *
 *      get_walk_info_f(obj)
 *      dwset3(obj)
 */
void d_walkf_setup(MK3OBJ *obj)
{
    get_walk_info_f(obj);
    dwset3(obj);
}
