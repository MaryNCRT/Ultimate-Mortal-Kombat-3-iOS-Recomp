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
void q_is_proj_gone(MK3OBJ *obj);
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

long is_he_airborn(MK3OBJ *obj);

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
/* Read from the binary in joy.c: nothing is deliberately left in r0.
 * The `long` this used to be declared as came from a call site that
 * ignored the result. */
void get_x_dist(MK3OBJ *obj);
long is_throwing_allowed(MK3OBJ *obj);
void is_towards_me(MK3OBJ *obj);
void ochar_begin_calls(MK3OBJ *obj);
void q_am_i_cornered(MK3OBJ *obj);
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

long t_run_in_close(struct MK3THREAD *thread);

long t_cornered_attack(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_cornered;
    ask_mr_diff(obj);

    /* Corrected, 2026-09-26: the answer picks one of two routines; this
     * was first written as an unconditional install of the second. */
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_run_in_close);

    return mk3_install(thread, (MK3THREADFUNC)t_stalk_in_close);
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

long t_d_jump_up_kick(struct MK3THREAD *thread);

long t_close_airborn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_towards_me(obj);

    /* Corrected, 2026-09-26: the answer picks one of two routines; this
     * was first written as an unconditional install of the second. */
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_d_jump_up_kick);

    return mk3_install(thread, (MK3THREADFUNC)t_d_fflip_kick_jump);
}

/* t_av_sweep -- armv7 0x00070f70, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_am_i_cornered(obj)
 *      frame[frame].handler = t_d_bflip_jump
 *      frame[frame+1].w0 = 0
 */

long t_d_duck_block(struct MK3THREAD *thread);

long t_av_sweep(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_am_i_cornered(obj);

    /* Corrected, 2026-09-26: the answer picks one of two routines; this
     * was first written as an unconditional install of the second. */
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_d_duck_block);

    return mk3_install(thread, (MK3THREADFUNC)t_d_bflip_jump);
}

/* t_sq_quake_abort -- armv7 0x0007113c, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      q_am_i_cornered(obj)
 *      frame[frame].handler = t_d_bflip_jump
 *      frame[frame+1].w0 = 0
 */

long t_d_flip_punch_jump(struct MK3THREAD *thread);

long t_sq_quake_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_am_i_cornered(obj);

    /* Corrected, 2026-09-26: the answer picks one of two routines; this
     * was first written as an unconditional install of the second. */
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_d_flip_punch_jump);

    return mk3_install(thread, (MK3THREADFUNC)t_d_bflip_jump);
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

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long c_tusk_blur_sd(MK3THREAD *thread);
long t_d_backup_jsrp(MK3THREAD *thread);
long t_d_beware_mframew(MK3THREAD *thread);
long t_d_bflip_jsrp(MK3THREAD *thread);
long t_d_fflip_jsrp(MK3THREAD *thread);
long t_d_knee(MK3THREAD *thread);
long t_d_run_a11(MK3THREAD *thread);
long t_d_slam(MK3THREAD *thread);
long t_d_stance_pause(MK3THREAD *thread);
long t_do_flip_kick(MK3THREAD *thread);
long t_do_flip_punch(MK3THREAD *thread);
long t_do_mercy(MK3THREAD *thread);
long t_do_quake(MK3THREAD *thread);
long t_do_zap(MK3THREAD *thread);
long t_dont_zap_teles(MK3THREAD *thread);
long t_drone_rfp(MK3THREAD *thread);
long t_duck_under_mproj(MK3THREAD *thread);
long t_fatality_align(MK3THREAD *thread);
long t_local_reaction_exit(MK3THREAD *thread);
long t_nr_attack_sd(MK3THREAD *thread);
long t_return_to_beware(MK3THREAD *thread);
long t_stat_do_hi_kick(MK3THREAD *thread);
long t_willy_go_round(MK3THREAD *thread);
long tl_stat_do_lia_scream(MK3THREAD *thread);

/* t_d_hi_kick -- armv7 0x0006770c, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x189, then descend into t_stat_do_hi_kick
 *      token == 0x189:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_hi_kick(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x189;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_hi_kick;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x189)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_backup_jump -- armv7 0x000678e8, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x269, then descend into t_d_backup_jsrp
 *      token == 0x269:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_backup_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x269;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_backup_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x269)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_very_far_airborn -- armv7 0x00067d08, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x3c6, then descend into t_dont_zap_teles
 *      token == 0x3c6:
 *          frame[frame].handler = t_d_zap
 *      otherwise:  return -3
 */
long t_very_far_airborn(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x3c6;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_dont_zap_teles;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x3c6)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_zap);
}

/* t_d_do_floor_ice -- armv7 0x0006807c, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x2b
 *          token := 0x53b, then descend into t_do_zap
 *      token == 0x53b:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_do_floor_ice(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x2b;
        *mk3_frame(thread, thread->frame + 1) = 0x53b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x53b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_bflip_jump -- armv7 0x000680fc, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x54e, then descend into t_d_bflip_jsrp
 *      token == 0x54e:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_bflip_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x54e;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_bflip_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x54e)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_fflip_scan_jump -- armv7 0x00068240, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x56b, then descend into t_d_fflip_scan_jsrp
 *      token == 0x56b:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_fflip_scan_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x56b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_fflip_scan_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x56b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_watch_flip_punch -- armv7 0x00068334, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x57e, then descend into t_do_flip_punch
 *      token == 0x57e:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_watch_flip_punch(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x57e;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_flip_punch;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x57e)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_watch_flip_kick -- armv7 0x000683a4, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x583, then descend into t_do_flip_kick
 *      token == 0x583:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_watch_flip_kick(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x583;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_flip_kick;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x583)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_fflip_jump -- armv7 0x00068414, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x5a6, then descend into t_d_fflip_jsrp
 *      token == 0x5a6:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_fflip_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x5a6;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_fflip_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x5a6)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_punch -- armv7 0x00068838, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x6de, then descend into t_drone_rfp
 *      token == 0x6de:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_punch(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x6de;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_drone_rfp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x6de)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_drone_mercy -- armv7 0x00069364, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0xa0
 *          token := 0xa1f, then descend into t_fatality_align
 *      token == 0xa1f:
 *          frame[frame].handler = t_do_mercy
 *      otherwise:  return -3
 */
long t_drone_mercy(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0xa0;
        *mk3_frame(thread, thread->frame + 1) = 0xa1f;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_fatality_align;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xa1f)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_do_mercy);
}

/* t_do_fast_orb -- armv7 0x00069708, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x28
 *          token := 0xc49, then descend into t_do_zap
 *      token == 0xc49:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_do_fast_orb(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x28;
        *mk3_frame(thread, thread->frame + 1) = 0xc49;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc49)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_lk_hi_zap_jump -- armv7 0x00069788, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x16
 *          token := 0xc4f, then descend into t_do_zap
 *      token == 0xc4f:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_lk_hi_zap_jump(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x16;
        *mk3_frame(thread, thread->frame + 1) = 0xc4f;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc4f)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_zap_jump -- armv7 0x00069808, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0xc54, then descend into t_do_zap
 *      token == 0xc54:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_zap_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xc54;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc54)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_run_in_juk -- armv7 0x00069878, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x30
 *          obj->field48 = 0x70
 *          token := 0xc5b, then descend into t_d_run_a11
 *      token == 0xc5b:
 *          frame[frame].handler = t_d_jump_up_kick
 *      otherwise:  return -3
 */
long t_run_in_juk(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x30;
        obj->field48 = 0x70;
        *mk3_frame(thread, thread->frame + 1) = 0xc5b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_run_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc5b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_jump_up_kick);
}

/* t_swat_zap_hi -- armv7 0x00069c18, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x19
 *          token := 0xd17, then descend into t_do_zap
 *      token == 0xd17:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_swat_zap_hi(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x19;
        *mk3_frame(thread, thread->frame + 1) = 0xd17;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd17)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_sz_sky_zap -- armv7 0x00069c98, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x7
 *          token := 0xd1d, then descend into t_do_zap
 *      token == 0xd1d:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_sz_sky_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x7;
        *mk3_frame(thread, thread->frame + 1) = 0xd1d;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_zap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd1d)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_quake -- armv7 0x00069dc8, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0xd3e, then descend into t_do_quake
 *      token == 0xd3e:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_quake(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xd3e;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_quake;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd3e)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* c_icharge_sd -- armv7 0x00069fb8, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0xd6c, then descend into t_nr_uppercut_if_u_can
 *      token == 0xd6c:
 *          frame[frame].handler = c_tusk_blur_sd
 *      otherwise:  return -3
 */
long c_icharge_sd(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xd6c;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_uppercut_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd6c)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)c_tusk_blur_sd);
}

/* c_stzap23 -- armv7 0x0006a144, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0xd94, then descend into t_nr_sweep_if_u_can
 *      token == 0xd94:
 *          frame[frame].handler = t_duck_under_mproj
 *      otherwise:  return -3
 */
long c_stzap23(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xd94;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_sweep_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd94)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_duck_under_mproj);
}

/* t_indian_reflect -- armv7 0x0006a694, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x4
 *          token := 0xedd, then descend into t_do_stationary
 *      token == 0xedd:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_indian_reflect(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0xedd;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_stationary;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xedd)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_do_mystic_drop -- armv7 0x0006a714, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1c
 *          token := 0xef6, then descend into t_do_stationary
 *      token == 0xef6:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_do_mystic_drop(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1c;
        *mk3_frame(thread, thread->frame + 1) = 0xef6;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_stationary;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xef6)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_cyrax_counter_zap -- armv7 0x0006a794, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0xa
 *          token := 0xefc, then descend into t_d_body_propell
 *      token == 0xefc:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_cyrax_counter_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0xa;
        *mk3_frame(thread, thread->frame + 1) = 0xefc;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_body_propell;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xefc)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_jade_anti_zap -- armv7 0x0006a844, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1a
 *          token := 0xf03, then descend into t_do_stationary
 *      token == 0xf03:
 *          frame[frame].handler = t_run_in_close_now
 *      otherwise:  return -3
 */
long t_jade_anti_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1a;
        *mk3_frame(thread, thread->frame + 1) = 0xf03;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_stationary;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xf03)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_run_in_close_now);
}

/* t_run_in_fk -- armv7 0x0006a8f8, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x40
 *          obj->field48 = 0xd0
 *          token := 0xf46, then descend into t_d_run_a11
 *      token == 0xf46:
 *          frame[frame].handler = t_d_fflip_kick_jump
 *      otherwise:  return -3
 */
long t_run_in_fk(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x40;
        obj->field48 = 0xd0;
        *mk3_frame(thread, thread->frame + 1) = 0xf46;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_run_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xf46)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_fflip_kick_jump);
}

/* t_run_in_and_slam -- armv7 0x0006a978, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x40
 *          obj->field48 = 0x40
 *          token := 0xf55, then descend into t_d_run_a11
 *      token == 0xf55:
 *          frame[frame].handler = t_d_slam
 *      otherwise:  return -3
 */
long t_run_in_and_slam(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x40;
        obj->field48 = 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0xf55;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_run_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xf55)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_slam);
}

/* t_drone_sweep_closeup_sd -- armv7 0x0006ae74, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x10ab, then descend into t_nr_sweep_if_u_can
 *      token == 0x10ab:
 *          frame[frame].handler = t_return_to_beware
 *      otherwise:  return -3
 */
long t_drone_sweep_closeup_sd(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x10ab;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_sweep_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x10ab)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_return_to_beware);
}

/* t_d_lia_scream -- armv7 0x0006af5c, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x10da, then descend into tl_stat_do_lia_scream
 *      token == 0x10da:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_lia_scream(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x10da;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)tl_stat_do_lia_scream;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x10da)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* c_kroll_sd -- armv7 0x0006b128, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x1129, then descend into t_nr_attack_sd
 *      token == 0x1129:
 *          frame[frame].handler = t_willy_go_round
 *      otherwise:  return -3
 */
long c_kroll_sd(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1129;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_attack_sd;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1129)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_willy_go_round);
}

/* t_av_robo_tele -- armv7 0x0006b4cc, 120 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x6
 *          token := 0x1222, then descend into t_d_stance_pause
 *      token == 0x1222:
 *          frame[frame].handler = t_d_block
 *      otherwise:  return -3
 */
long t_av_robo_tele(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x6;
        *mk3_frame(thread, thread->frame + 1) = 0x1222;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_stance_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1222)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_block);
}

/* t_kick_will_miss -- armv7 0x0006be5c, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x1414, then descend into t_nr_sweep_if_u_can
 *      token == 0x1414:
 *          frame[frame].handler = t_return_to_beware
 *      otherwise:  return -3
 */
long t_kick_will_miss(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1414;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_sweep_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1414)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_return_to_beware);
}

/* t_ct_quake -- armv7 0x0006bf78, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x142b, then descend into t_nr_hikick_if_u_can
 *      token == 0x142b:
 *          frame[frame].handler = t_d_jumpup_nocall
 *      otherwise:  return -3
 */
long t_ct_quake(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x142b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_hikick_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x142b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_jumpup_nocall);
}

/* t_ct_axe_up -- armv7 0x0006c0a0, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x1465, then descend into t_nr_sweep_if_u_can
 *      token == 0x1465:
 *          frame[frame].handler = t_d_block
 *      otherwise:  return -3
 */
long t_ct_axe_up(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1465;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_nr_sweep_if_u_can;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1465)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_block);
}

/* t_d_land -- armv7 0x0006c1d0, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x2
 *          token := 0x149b, then descend into t_d_beware_mframew
 *      token == 0x149b:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_land(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x2;
        *mk3_frame(thread, thread->frame + 1) = 0x149b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_beware_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x149b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_drone_entry(MK3THREAD *thread);
long t_wait_for_start(MK3THREAD *thread);
void d_init(MK3OBJ *obj);

/* t_drone_proc -- armv7 0x00067b30, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          d_init(obj)
 *          token := 0x346, then descend into t_wait_for_start
 *      token == 0x346:
 *          frame[frame].handler = t_drone_entry
 *      otherwise:  return -3
 */
long t_drone_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        d_init(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x346;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_wait_for_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x346)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_drone_entry);
}

/* c_tusk_blur_sd -- armv7 0x0006a020, 124 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x40
 *          obj->field48 = 0x40
 *          token := 0xd71, then descend into t_d_run_a11
 *      token == 0xd71:
 *          frame[frame].handler = t_d_knee
 *      otherwise:  return -3
 */
long c_tusk_blur_sd(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x40;
        obj->field48 = 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0xd71;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_run_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd71)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_knee);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_d_attack_close(MK3THREAD *thread);

/* t_stalk_in_close -- armv7 0x000677b8, 132 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x1900
 *          obj->field48 = 0x40
 *          token := 0x202, then descend into t_d_stalk_a11
 *      token == 0x202:
 *          frame[frame].handler = t_d_attack_close
 *      otherwise:  return -3
 */
long t_stalk_in_close(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x1900;
        obj->field48 = 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0x202;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_stalk_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x202)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_attack_close);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_do_jump_up(MK3THREAD *thread);
long t_stat_do_lo_kick(MK3THREAD *thread);
long t_stat_do_uppercut(MK3THREAD *thread);

/* t_d_lo_kick -- armv7 0x00067634, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x172, then descend into t_stat_do_lo_kick
 *      token == 0x172:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_lo_kick(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x172;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_lo_kick;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x172)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_uppercut -- armv7 0x000676a0, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x184, then descend into t_stat_do_uppercut
 *      token == 0x184:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_uppercut(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x184;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_uppercut;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x184)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_walk_in_4_combos -- armv7 0x00067ab0, 128 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x30
 *          obj->field48 = 0x4a
 *          token := 0x30c, then descend into t_d_stalk_a11
 *      token == 0x30c:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_walk_in_4_combos(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x30;
        obj->field48 = 0x4a;
        *mk3_frame(thread, thread->frame + 1) = 0x30c;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_stalk_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x30c)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_d_jumpup -- armv7 0x0006819c, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x558, then descend into t_do_jump_up
 *      token == 0x558:
 *          frame[frame].handler = t_d_land
 *      otherwise:  return -3
 */
long t_d_jumpup(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x558;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_do_jump_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x558)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_land);
}

/* t_d_stalk_crossk -- armv7 0x000685b0, 144 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->a10 = 0x40
 *          obj->field48 = 0x40
 *          token := 0x690, then descend into t_d_stalk_a11
 *      token == 0x690:
 *          frame[frame].handler = t_crossover_scan
 *      otherwise:  return -3
 */
long t_d_stalk_crossk(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x40;
        obj->field48 = 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0x690;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_stalk_a11;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x690)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_crossover_scan);
}

/* t_d_fflip_kick_jump -- armv7 0x00068744, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x6c0, then descend into t_d_fflip_kick_jsrp
 *      token == 0x6c0:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_d_fflip_kick_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x6c0;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_d_fflip_kick_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x6c0)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------- bossck, q_is_he_a_boss
 *
 * armv7 0x00068e00 and 0x00068e20; 20 and 16 bytes.  **Complete.**
 *
 *      bossck(obj, part)      obj->field54 = part->0x24
 *                             obj->field5c = (part->0x24 - 0x18 <= 1u)
 *
 *      q_is_he_a_boss(obj)    bossck(obj, obj->field00->him)
 *
 * **A boss is character 0x18 or 0x19**, tested with the range idiom -- subtract
 * the low end and compare unsigned against the span, so two characters cost one
 * branch.
 *
 * Both numbers were already known from elsewhere and this is the first place
 * they appear together: **0x18 is Motaro**, from `is_he_motaro` and from
 * `proj_strike_check`, and **0x19 is Shao Kahn**, which Blood.c spells out as
 * `#define SHAO_KAHN 0x19`. So "boss" means exactly those two and the engine
 * has no other notion of one.
 *
 * The character number comes from the PART's 0x24 -- third independent
 * confirmation that `GrObj + 0x24` is where a fighter's identity lives, after
 * `ochar_begin_calls` and `mk3_update`'s display record.
 *
 * `q_is_he_a_boss` asks it about `proc->him`, the opponent's part, and the
 * answer lands in `obj->field5c` -- the boolean return slot the `q_` family
 * uses. The wrapper shape this directory is full of: a core that takes the part
 * and a `q_` that supplies the opponent's.
 */
#define MK3_MOTARO     0x18
#define MK3_SHAO_KAHN  0x19

void bossck(MK3OBJ *obj, MK3OBJ *part)
{
    uint32_t c = part->field24;

    obj->field54 = c;
    obj->field5c = ((c - MK3_MOTARO) <= 1u);
}

void q_is_he_a_boss(MK3OBJ *obj)
{
    bossck(obj, (MK3OBJ *)(uintptr_t)obj->field00->him);
}

/* ----------------------------------------------------------- q_is_he_reacting
 *
 * armv7 0x0006c7fc, thirty-six bytes.  **Complete.**
 *
 * The single dry reaction probe: `get_his_action` drags the opponent's
 * action into `obj->field20`, and the queue answers whether it is the 0x503
 * reaction -- a `q_yes(obj)`/`q_no(obj)` straight from `field20`.
 *
 *      get_his_action(obj)
 *      if (obj->field20 == 0x503) q_yes(obj)
 *      else q_no(obj)
 */
void q_no(MK3OBJ *obj);   /* moves.c, 0x00067524 */
void q_yes(MK3OBJ *obj);  /* moves.c, 0x0006752c */

void q_is_he_reacting(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x503)
        q_yes(obj);
    else
        q_no(obj);
}


/* ======================================================================
 * Leaf predicates and small helpers.
 *
 * Written from `tools/cd.py` listings; each is verified against the binary by
 * factdiff before it counts. The `q_*` family answers in `obj->field5c`
 * through `vq_yes`/`vq_no`; the comparison in each is signed (`ble`/`bgt`).
 * ====================================================================== */

void vq_no(MK3OBJ *obj);
void vq_yes(MK3OBJ *obj);
void call_for_him(MK3OBJ *obj, void (*fn)(MK3OBJ *));
void back_to_normal(MK3OBJ *obj);
void get_his_dog(MK3OBJ *obj);
long am_i_facing_him(MK3OBJ *obj);
void *FindThreadProc(uint32_t pid);
void get_my_dfe(MK3OBJ *obj);
void d_behind_me_a5(MK3OBJ *obj);
void is_he_body_propell(MK3OBJ *obj);
void get_his_proj_proc(MK3OBJ *obj);
void q_his_proj_proc(MK3OBJ *obj);
void beh1(MK3OBJ *obj);
long rpt_counter(struct MK3THREAD *thread);

/* get_his_y_vel -- armv7 0x00068dd8: obj->field1c = him->field1c */
void get_his_y_vel(MK3OBJ *obj)
{
    obj->field1c = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field1c;
}

/* beh1 -- armv7 0x00068dc4: field2c = part->field28 (the whole word); when
 * bit 4 of it is set, field30 = field34. */
void beh1(MK3OBJ *obj)
{
    uint32_t w = *(const uint32_t *)(const void *)
                    ((const char *)(const void *)obj->field08 + 0x28);

    obj->field2c = w;
    if ((w & 0x10u) != 0)
        obj->field30 = obj->field34;
}

/* d_to_normal -- armv7 0x00072cb8 */
void d_to_normal(MK3OBJ *obj)
{
    back_to_normal(obj);
    obj->field1c = 0;
    obj->field00->field5c = 0;
}

/* q_am_i_cornered -- armv7 0x00070f58: field5c = (field30 <= 0x90) */
void q_am_i_cornered(MK3OBJ *obj)
{
    d_behind_me_a5(obj);
    obj->field5c = ((int32_t)obj->field30 > 0x90) ? 0 : 1;
}

/* q_is_he_cornered -- armv7 0x000708a8 */
void q_is_he_cornered(MK3OBJ *obj)
{
    call_for_him(obj, q_am_i_cornered);
}

/* should_i_promove -- armv7 0x0006c9f4 */
void should_i_promove(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)rpt_counter;
    ask_mr_diff(obj);
}

/* d_either_edge_a5 -- armv7 0x00071328: field30 = min(field30, field34) */
void d_either_edge_a5(MK3OBJ *obj)
{
    get_my_dfe(obj);
    if ((int32_t)obj->field34 <= (int32_t)obj->field30)
        obj->field30 = obj->field34;
}

/* d_front_me_a5 -- armv7 0x00070f28: swap field30/field34, then beh1 */
void d_front_me_a5(MK3OBJ *obj)
{
    uint32_t a, b;

    get_my_dfe(obj);
    a = obj->field30;
    b = obj->field34;
    obj->field34 = a;
    obj->field30 = b;
    beh1(obj);
}

/* scan_1_entry -- armv7 0x0006c24c: read one halfword through field1c */
void scan_1_entry(MK3OBJ *obj)
{
    const int16_t *p = (const int16_t *)(uintptr_t)obj->field1c;
    int32_t v = *p++;

    obj->field1c = (uint32_t)(uintptr_t)p;
    obj->field24 = (uint32_t)v;
    if ((int32_t)obj->field20 == v)
        obj->field28 = obj->field28 + 1;
}

/* get_his_proj_proc -- armv7 0x0006ff18 */
void get_his_proj_proc(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)FindThreadProc(
        (uint32_t)(obj->field00->field00->field00->field08 + 0x700));
}

void q_his_proj_proc(MK3OBJ *obj)
{
    get_his_proj_proc(obj);
    if (obj->field1c != 0)
        vq_yes(obj);
    else
        vq_no(obj);
}

/* q_is_he_dropping -- armv7 0x00068de4 */
void q_is_he_dropping(MK3OBJ *obj)
{
    obj->field1c = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field1c;
    if ((int32_t)obj->field1c > 0)
        vq_yes(obj);
    else
        vq_no(obj);
}

/* q_my_back_to_him -- armv7 0x0006f1d8: field5c = 1 - field5c, or 0 if it
 * was not 0 or 1 (the `rsbs` borrows) */
void q_my_back_to_him(MK3OBJ *obj)
{
    am_i_facing_him(obj);
    obj->field5c = (obj->field5c <= 1u) ? 1u - obj->field5c : 0u;
}

/* is_he_body_propell -- armv7 0x0006c5ec */
void is_he_body_propell(MK3OBJ *obj)
{
    uint32_t w;

    get_his_action(obj);
    w = obj->field20 & ~0xffu;
    obj->field20 = w;
    obj->field5c = (w == 0x200) ? 1 : 0;
}

/* The `get_x_dist` distance tests: yes inside the limit, no beyond it. */
void q_dist_lift(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xa0)
        vq_yes(obj);
    else
        vq_no(obj);
}

void q_is_he_axe_close(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x70)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_is_he_bike_close(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x80)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_is_he_scream_close(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xb0)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_willy_uppercut(MK3OBJ *obj)
{
    get_his_dog(obj);
    if ((int32_t)obj->field1c > 0x40)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_is_proj_gone(MK3OBJ *obj)
{
    get_his_proj_proc(obj);
    if (obj->field1c != 0)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_run_then_flipk(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xef)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_run_then_duck(MK3OBJ *obj)
{
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xaf)
        q_his_proj_proc(obj);
    else
        vq_yes(obj);
}

void is_flyk_close(MK3OBJ *obj)
{
    is_he_body_propell(obj);
    if (obj->field5c == 0)
        goto yes;
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x7f) {
        vq_no(obj);
        return;
    }
yes:
    vq_yes(obj);
}

void is_propell_close(MK3OBJ *obj)
{
    is_he_body_propell(obj);
    if (obj->field5c == 0)
        goto yes;
    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x6f) {
        vq_no(obj);
        return;
    }
yes:
    vq_yes(obj);
}

void q_corner_backf_land(MK3OBJ *obj)
{
    get_his_y_vel(obj);
    if ((int32_t)obj->field1c < 0)
        obj->field1c = (uint32_t)(-(int32_t)obj->field1c);
    if ((int32_t)obj->field1c > 0x20000)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_is_he_net_close(MK3OBJ *obj)
{
    get_his_y_vel(obj);
    if ((int32_t)obj->field1c < 0)
        obj->field1c = (uint32_t)(-(int32_t)obj->field1c);
    if ((int32_t)obj->field1c > 0x10000)
        vq_no(obj);
    else
        vq_yes(obj);
}

/* ======================================================================
 * Second batch of leaves: the zone, wait and dizzy probes.
 * ====================================================================== */

long strike_check_a0_test(MK3OBJ *obj);
long CountThreads(uint32_t pid);
long randper(MK3OBJ *obj);
void get_my_hitq(MK3OBJ *obj);
long t_dizzy_sleep(struct MK3THREAD *thread);
long rpt_counter_airborns(struct MK3THREAD *thread);

/* is_throwing_allowed -- armv7 0x00067f74: the round clock halfword G+0x44c,
 * above 1 means yes */
long is_throwing_allowed(MK3OBJ *obj)
{
    int32_t w = *(const int16_t *)(const void *)(G_BYTES + 0x44c);

    obj->field1c = (uint32_t)w;
    obj->field5c = (w > 1) ? 1 : 0;
    return (long)obj->field5c;
}

void q_jax_smash(MK3OBJ *obj)
{
    get_his_y_vel(obj);
    if ((int32_t)obj->field1c < 0)
        vq_no(obj);
    else
        vq_yes(obj);
}

void q_run_under_fk(MK3OBJ *obj)
{
    am_i_facing_him(obj);
    if (obj->field5c != 0)
        vq_no(obj);
    else
        vq_yes(obj);
}

/* d_init -- armv7 0x00067590 */
void d_init(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    uint32_t w = proc->field10 & ~1u;

    obj->field2c = w;
    proc->field10 = w;
    obj->field1c = 2;
    *(uint32_t *)(void *)(G_BYTES + 0x448) = 2;
}

void q_airborn_counter(MK3OBJ *obj)
{
    is_he_airborn(obj);
    if (obj->field5c != 0) {
        obj->field1c = (uint32_t)(uintptr_t)rpt_counter_airborns;
        ask_mr_diff(obj);
    }
}

void q_is_decoy_alive(MK3OBJ *obj)
{
    if (CountThreads(0x200 - obj->field00->field08 + 5) != 0)
        vq_yes(obj);
    else
        vq_no(obj);
}

void is_he_attacking(MK3OBJ *obj)
{
    uint32_t w;

    get_his_action(obj);
    w = obj->field20 & ~0xffu;
    obj->field20 = w;
    obj->field5c = (w == 0x200 || w == 0x100) ? 1 : 0;
}

/* q_will_he_reach_me -- armv7 0x0006e9c4: put the object in HIS shoes (his
 * proc, his part, his field58), run the strike test, put it back. */
long q_will_he_reach_me(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    MK3OBJ     *part = obj->field08;
    MK3OBJ     *him  = proc->field00;
    MK3OBJPROC *hp   = him->field00;
    long        r;

    obj->field00 = hp;
    obj->field08 = him->field08;
    obj->field1c = hp->field58;
    r = strike_check_a0_test(obj);
    obj->field08 = part;
    obj->field00 = proc;
    return r;
}

void q_backup_zap(MK3OBJ *obj)
{
    get_his_y_vel(obj);
    if ((int32_t)obj->field1c < 0)
        goto no;
    get_his_dog(obj);
    if ((int32_t)obj->field1c <= 0x70)
        goto yes;
no:
    vq_no(obj);
    return;
yes:
    vq_yes(obj);
}

/* ask_mr_diff -- armv7 0x0006c9c8: the difficulty (G+0x44c, 7 when it is out
 * of range) indexes the halfword table field1c points at */
long ask_mr_diff(MK3OBJ *obj)
{
    uint32_t d = (uint32_t)(int32_t)*(const int16_t *)(const void *)(G_BYTES + 0x44c);

    obj->field20 = d;
    if (d > 9u)
        obj->field20 = 7;
    obj->field1c = (uint32_t)(int32_t)
        ((const int16_t *)(uintptr_t)obj->field1c)[obj->field20];
    return randper(obj);
}

void lao_angle_wait(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 != 0x20c)
        goto yes;
    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x6f)
        goto yes;
    vq_no(obj);
    return;
yes:
    vq_yes(obj);
}

/* q_is_he_below_ground -- armv7 0x00068e74: his y (halfword at +0x12) above
 * zero and under what his proc keeps at +0x40 */
void q_is_he_below_ground(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    int32_t y = MK3_FIELD12_S((MK3OBJ *)(uintptr_t)proc->him);
    uint32_t lim = *(const uint32_t *)(const void *)
                      ((const char *)(const void *)proc->field00->field00 + 0x40);

    obj->field1c = (uint32_t)y;
    obj->field20 = lim;
    if (y < 0)
        goto no;
    if ((int32_t)lim < y)
        goto yes;
no:
    vq_no(obj);
    return;
yes:
    vq_yes(obj);
}

/* q_is_he_dizzy -- armv7 0x00068ea0: is his frame's handler t_dizzy_sleep */
void q_is_he_dizzy(MK3OBJ *obj)
{
    MK3THREAD *t = obj->field00->field00->thread;
    uint32_t h = mk3_frame(t, t->frame)[1];

    obj->field38 = h;
    obj->field5c = (h == (uint32_t)(uintptr_t)t_dizzy_sleep) ? 1 : 0;
}

void q_is_kick_over(MK3OBJ *obj)
{
    get_his_action(obj);
    if (obj->field20 == 0x50a)
        goto yes;
    is_he_airborn(obj);
    if (obj->field5c != 0) {
        vq_no(obj);
        return;
    }
yes:
    vq_yes(obj);
}

/* count_q_repeats -- armv7 0x0006c8e0: six scans of his hit queue, unrolled */
void count_q_repeats(MK3OBJ *obj)
{
    uint32_t keep = obj->field24;

    get_my_hitq(obj);
    obj->field28 = 0;
    scan_1_entry(obj);
    scan_1_entry(obj);
    scan_1_entry(obj);
    scan_1_entry(obj);
    scan_1_entry(obj);
    scan_1_entry(obj);
    obj->field24 = keep;
}

void q_drone_zone(MK3OBJ *obj)
{
    d_either_edge_a5(obj);
    if ((int32_t)obj->field30 <= 0x4f)
        goto yes;
    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0xcf)
        goto yes;
    if ((int32_t)obj->field28 <= 0x100)
        goto no;
yes:
    vq_yes(obj);
    return;
no:
    vq_no(obj);
}

/* ======================================================================
 * Flip setups, the "forget" returns and the closeup picker.
 * ====================================================================== */

long is_he_right(MK3OBJ *obj);
void reset_proc_stack(MK3THREAD *thread);
long t_victory_animation(struct MK3THREAD *thread);
long t_return_to_beware(struct MK3THREAD *thread);
extern const uint32_t tab_react_flipk[];

/* backflip_setup / frontflip_setup -- armv7 0x00070c6c, 0x00070cf8: the same
 * body with the test inverted. Both lay out the jump (0x40000, 0x70000, 0x1a,
 * 0x1b) and mirror it when the opponent is on the other side. */
void backflip_setup(MK3OBJ *obj)
{
    obj->field48 = 0x40000;
    obj->field1c = 0x1a;
    obj->field34 = 0x40000 + 0x30000;
    obj->field20 = 0x1b;
    is_he_right(obj);
    if (obj->field5c != 0) {
        obj->field20 = 0x1a;
        obj->field1c = 0x1b;
        obj->field48 = (uint32_t)(-(int32_t)obj->field48);
        obj->field34 = (uint32_t)(-(int32_t)obj->field34);
    }
}

void frontflip_setup(MK3OBJ *obj)
{
    obj->field48 = 0x40000;
    obj->field1c = 0x1a;
    obj->field34 = 0x40000 + 0x30000;
    obj->field20 = 0x1b;
    is_he_right(obj);
    if (obj->field5c == 0) {
        obj->field20 = 0x1a;
        obj->field1c = 0x1b;
        obj->field48 = (uint32_t)(-(int32_t)obj->field48);
        obj->field34 = (uint32_t)(-(int32_t)obj->field34);
    }
}

/* q_is_he_lower -- armv7 0x00068e30 */
void q_is_he_lower(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    MK3OBJ     *him  = (MK3OBJ *)(uintptr_t)proc->him;
    int32_t     y, d;

    obj->field1c = him->field1c;
    if ((int32_t)obj->field1c < 0)
        goto no;
    y = MK3_FIELD12_S(him);
    obj->field20 = (uint32_t)y;
    d = (int32_t)(*(const uint32_t *)(const void *)
                    ((const char *)(const void *)proc->field00->field00 + 0x40)
                  - (uint32_t)y);
    obj->field24 = (uint32_t)d;
    if (d <= (int32_t)obj->field38)
        goto yes;
no:
    vq_no(obj);
    return;
yes:
    vq_yes(obj);
}

/* t_return_and_4get, t_return_to_beware_4get -- armv7 0x000695f8, 0x0006c148:
 * the same two bodies, clearing the animation and the proc's answer and
 * handing over to t_return_to_beware */
long t_return_and_4get(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;
    obj->field00->field5c = 0;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_return_to_beware);
}

long t_return_to_beware_4get(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;
    obj->field00->field5c = 0;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_return_to_beware);
}

/* is_towards_me -- armv7 0x00070940: his x speed (field18) against which side
 * he is on; zero means no */
void is_towards_me(MK3OBJ *obj)
{
    int32_t v = (int32_t)((MK3OBJ *)(uintptr_t)obj->field00->him)->field18;

    obj->field1c = (uint32_t)v;
    if (v == 0)
        goto no;
    if (v < 0) {
        is_he_right(obj);
        if (obj->field5c == 0)
            goto no;
        goto yes;
    }
    is_he_right(obj);
    if (obj->field5c != 0)
        goto no;
yes:
    obj->field5c = 1;
    return;
no:
    obj->field5c = 0;
}

/* t_attack_closeup_sd -- armv7 0x0006aedc: the handler comes out of
 * tab_react_flipk[part->field24] */
long t_attack_closeup_sd(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    h = tab_react_flipk[obj->field08->field24];
    obj->field1c = h;

    return mk3_push_handler(thread, (MK3THREADFUNC)(uintptr_t)h);
}

/* t_d_fatality_abort -- armv7 0x000703c8 */
long t_d_fatality_abort(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    reset_proc_stack(thread);

    /* the refusal was above; a second one here would read the slot of the
     * stack that was just reset */
    return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
}

/* ======================================================================
 * Return-to-beware, the tracker probe, the flip scans.
 * ====================================================================== */

long t_d_propell_attack_now(struct MK3THREAD *thread);
long t_do_flip(MK3THREAD *thread);
long t_dflip3(MK3THREAD *thread);

/* t_return_to_beware -- armv7 0x0006c184: the proc keeps a saved state at
 * 0x6c (handler), 0x70 (resume token), 0x74 and 0x78 (the two words of the
 * object it overwrote); this puts them back and resumes */
long t_return_to_beware(MK3THREAD *thread)
{
    MK3OBJ     *obj  = (MK3OBJ *)thread->proc;
    MK3OBJPROC *proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    proc = obj->field00;
    obj->a10     = *(const uint32_t *)(const void *)((const char *)(const void *)proc + 0x74);
    obj->field48 = *(const uint32_t *)(const void *)((const char *)(const void *)proc + 0x78);
    mk3_frame(thread, thread->frame)[1] =
        *(const uint32_t *)(const void *)((const char *)(const void *)proc + 0x6c);
    *mk3_frame(thread, thread->frame + 1) =
        *(const uint32_t *)(const void *)((const char *)(const void *)obj->field00 + 0x70);
    return 0;
}

/* q_is_tracker_close -- armv7 0x000701d8: his projectile's x against mine,
 * absolute, inside 0x6f. No projectile counts as close. */
void q_is_tracker_close(MK3OBJ *obj)
{
    MK3OBJ *proj;
    int32_t px, mx;

    get_his_proj_proc(obj);
    if (obj->field1c == 0)
        goto yes;
    proj = (MK3OBJ *)(uintptr_t)obj->field1c;
    px = MK3_FIELD0E_S(proj->field08);
    obj->field20 = (uint32_t)px;
    mx = MK3_FIELD0E_S(obj->field08);
    obj->field24 = (uint32_t)mx;
    obj->field20 = (uint32_t)(px - mx);
    if ((int32_t)obj->field20 < 0)
        obj->field20 = (uint32_t)(-(int32_t)obj->field20);
    if ((int32_t)obj->field20 > 0x6f) {
        vq_no(obj);
        return;
    }
yes:
    vq_yes(obj);
}

/* t_d_propell_attack -- armv7 0x00067ec4: the difficulty picks the handler */
long t_d_propell_attack(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    int32_t       d;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    d = *(const int16_t *)(const void *)(G_BYTES + 0x44c);
    obj->field1c = (uint32_t)d;
    if (d > 2)
        h = (MK3THREADFUNC)t_d_propell_attack_now;
    else
        h = (MK3THREADFUNC)t_diff_no_propell;
    return mk3_install(thread, h);
}

/* t_d_bflip_scan_jsrp, t_d_fflip_scan_jsrp -- armv7 0x00070ca4, 0x00070e4c:
 * push field34 on the argument stack, set the flip up, hand over to t_dflip3 */
long t_d_bflip_scan_jsrp(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = thread->fieldf8;
    *mk3_arg(thread, n) = obj->field34;
    thread->fieldf8 = n + 1;
    backflip_setup(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_dflip3);
}

long t_d_fflip_scan_jsrp(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = thread->fieldf8;
    *mk3_arg(thread, n) = obj->field34;
    thread->fieldf8 = n + 1;
    frontflip_setup(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_dflip3);
}

/* t_dflip3 -- armv7 0x000682e0: pop field34 back, mirror it into the proc,
 * then the flip itself */
long t_dflip3(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t n, v;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = thread->fieldf8 - 1;
    thread->fieldf8 = n;
    v = *mk3_arg(thread, n);
    obj->field34 = v;
    obj->field00->field28 = v;
    return mk3_install(thread, (MK3THREADFUNC)t_do_flip);
}

/* ======================================================================
 * Distance deciders, the retp/ochar threads and the projectile probes.
 *
 * The deciders below read one distance or table entry, choose between two
 * handlers and install it -- ONE install site, which is why each picks into
 * a local first.
 * ====================================================================== */

long t_d_fflip_kick_jump(struct MK3THREAD *thread);
long t_d_crossover_kick(struct MK3THREAD *thread);
long t_swait_nonattack_jump(struct MK3THREAD *thread);
long t_asb2(struct MK3THREAD *thread);
long t_d_lo_kick(struct MK3THREAD *thread);
long t_stalk_in_close(struct MK3THREAD *thread);
long t_local_reaction_exit(struct MK3THREAD *thread);
long t_duck_under_proj(struct MK3THREAD *thread);
long t_d_zap_now(struct MK3THREAD *thread);
long t_drfp4(struct MK3THREAD *thread);
long t_random_do(struct MK3THREAD *thread);
long t_run_in_close_now(struct MK3THREAD *thread);
long c_froze_closer(struct MK3THREAD *thread);
long t_d_body_propell(struct MK3THREAD *thread);
long t_perhaps_flipk(struct MK3THREAD *thread);
long t_react_jump_table_act(struct MK3THREAD *thread);
long t_d_bflip_noscan_jsrp(struct MK3THREAD *thread);
long t_d_attack(struct MK3THREAD *thread);
long funcs_7674(struct MK3THREAD *thread);
long funcs_13651(struct MK3THREAD *thread);
void find_ani_part2(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);
extern const int32_t ochar_props[];

long c_lkzaplo(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x7f)
        h = (MK3THREADFUNC)t_d_fflip_kick_jump;
    else
        h = (MK3THREADFUNC)t_d_crossover_kick;
    return mk3_install(thread, h);
}

long t_av_sonya_bike(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x6f)
        h = (MK3THREADFUNC)t_swait_nonattack_jump;
    else
        h = (MK3THREADFUNC)t_asb2;
    return mk3_install(thread, h);
}

long t_diff_no_propell(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x47)
        h = (MK3THREADFUNC)t_stalk_in_close;
    else
        h = (MK3THREADFUNC)t_d_lo_kick;
    return mk3_install(thread, h);
}

long c_frozen(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x6f)
        h = (MK3THREADFUNC)t_run_in_close_now;
    else
        h = (MK3THREADFUNC)c_froze_closer;
    return mk3_install(thread, h);
}

long c_tusk_zap_air(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_his_dog(obj);
    if ((int32_t)obj->field1c > 0x18)
        h = (MK3THREADFUNC)t_d_zap_now;
    else
        h = (MK3THREADFUNC)t_duck_under_proj;
    return mk3_install(thread, h);
}

long t_run_in_close(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    int32_t       d;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    d = *(const int16_t *)(const void *)(G_BYTES + 0x44c);
    obj->field1c = (uint32_t)d;
    if (d > 1)
        h = (MK3THREADFUNC)t_run_in_close_now;
    else
        h = (MK3THREADFUNC)t_perhaps_flipk;
    return mk3_install(thread, h);
}

long t_d_propell_attack_now(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    int32_t       v;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    v = ochar_props[obj->field08->field24];
    obj->field1c = (uint32_t)v;
    if (v < 0)
        h = (MK3THREADFUNC)t_stalk_in_close;
    else
        h = (MK3THREADFUNC)t_d_body_propell;
    return mk3_install(thread, h);
}

long c_juppunch(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x60) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13651;
        h = (MK3THREADFUNC)t_react_jump_table_act;
    }
    return mk3_install(thread, h);
}

long t_d_bflip_jsrp(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    d_behind_me_a5(obj);
    if ((int32_t)obj->field30 > 0x6f) {
        backflip_setup(obj);
        h = (MK3THREADFUNC)t_d_bflip_noscan_jsrp;
    } else {
        reset_proc_stack(thread);
        h = (MK3THREADFUNC)t_d_attack;
    }
    return mk3_install(thread, h);
}

/* t_dist_retp -- armv7 0x0006eda4: stop, then pop a level, or become
 * t_local_reaction_exit when there is none to pop */
long t_dist_retp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stop_me_player(obj);
    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_ochar_do -- armv7 0x00067534: this level becomes t_local_reaction_exit
 * (and field20 remembers it), and one level above it the routine field1c
 * names runs */
long t_ochar_do(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = (uint32_t)(uintptr_t)t_local_reaction_exit;
    mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] = obj->field1c;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* t_drfp3 -- armv7 0x00071b28: peek the argument stack into field40, find
 * the animation part and two parts, hand over to t_drfp4 */
long t_drfp3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = *mk3_arg(thread, thread->fieldf8 - 1);
    find_ani_part2(obj);
    find_part2(obj);
    find_part2(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_drfp4);
}

/* t_run_in_close_hard -- armv7 0x0006783c: two words in the object, then a
 * push with resume token 0x226 into t_random_do */
long t_run_in_close_hard(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_7674;
    *(uint32_t *)((char *)obj + 0x64) = 3;
    *mk3_frame(thread, thread->frame + 1) = 0x226;
    thread->frame = thread->frame + 1;
    return mk3_install(thread, (MK3THREADFUNC)t_random_do);
}

/* his_proj_front_x -- armv7 0x0006ff34: where the front of his projectile is:
 * its part's x plus the offsets the proc keeps at +0x84, mirrored when the
 * part faces left */
void his_proj_front_x(MK3OBJ *obj)
{
    MK3OBJ         *proj;
    MK3OBJPROC     *pp;
    MK3OBJ         *part;
    const uint32_t *off;
    uint32_t        a, b, f;

    get_his_proj_proc(obj);
    proj = (MK3OBJ *)(uintptr_t)obj->field1c;
    pp   = proj->field00;
    obj->field38 = (uint32_t)(uintptr_t)proj;
    part = proj->field08;
    off  = (const uint32_t *)(uintptr_t)pp->field84;
    obj->field30 = (uint32_t)(uintptr_t)part;
    obj->field1c = (uint32_t)(uintptr_t)off;
    obj->field28 = (uint32_t)(int32_t)MK3_FIELD0E_S(part);
    if (off == 0)
        return;
    a = off[0];
    obj->field24 = a;
    b = off[2];
    obj->field2c = b;
    f = *(const uint32_t *)(const void *)((const char *)(const void *)part + 0x28);
    obj->field34 = f;
    if ((f & 0x10u) != 0) {
        obj->field24 = (uint32_t)(-(int32_t)a);
        obj->field2c = (uint32_t)(-(int32_t)b);
    }
    obj->field28 = obj->field24 + obj->field28 + obj->field2c;
}

/* ======================================================================
 * Zap/slam deciders and the drfp chain.
 * ====================================================================== */

long t_d_zap(struct MK3THREAD *thread);
long t_d_block(struct MK3THREAD *thread);
long t_do_body_propell(struct MK3THREAD *thread);
long t_run_in_and_slam(struct MK3THREAD *thread);
long t_block_orb(struct MK3THREAD *thread);
long t_d_knee(struct MK3THREAD *thread);
long t_drone_sweep_closeup_sd(struct MK3THREAD *thread);
long t_attack_closeup_sd(struct MK3THREAD *thread);
long t_run_in_close(struct MK3THREAD *thread);
long t_d_crossover_kick(struct MK3THREAD *thread);
void should_i_promove(MK3OBJ *obj);
void his_proj_front_x(MK3OBJ *obj);

long t_stsw_zap(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x7f)
        h = (MK3THREADFUNC)t_d_crossover_kick;
    else if ((int32_t)obj->field28 > 0xd0)
        h = (MK3THREADFUNC)t_d_zap;
    else
        h = (MK3THREADFUNC)t_d_block;
    return mk3_install(thread, h);
}

/* t_d_body_propell -- armv7 0x0006c264: this level becomes
 * t_local_reaction_exit (and field38 remembers it), one level above it the
 * body-propell routine runs */
long t_d_body_propell(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = (uint32_t)(uintptr_t)t_local_reaction_exit;
    mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    thread->frame = thread->frame + 1;
    return mk3_install(thread, (MK3THREADFUNC)t_do_body_propell);
}

/* t_drfp2 -- armv7 0x00071b84: t_drfp3 with a third find_part2 */
long t_drfp2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = *mk3_arg(thread, thread->fieldf8 - 1);
    find_ani_part2(obj);
    find_part2(obj);
    find_part2(obj);
    find_part2(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_drfp4);
}

/* The three `_sd` deciders: ask whether to promote, then pick by distance.
 * No promotion means t_return_to_beware. */
long c_er_slam_sd(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    should_i_promove(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0x9f)
            h = (MK3THREADFUNC)t_run_in_close;
        else
            h = (MK3THREADFUNC)t_attack_closeup_sd;
    }
    return mk3_install(thread, h);
}

long c_proj_sd(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    should_i_promove(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0x9f)
            h = (MK3THREADFUNC)t_drone_sweep_closeup_sd;
        else
            h = (MK3THREADFUNC)t_attack_closeup_sd;
    }
    return mk3_install(thread, h);
}

long c_jaxdash_sd(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    should_i_promove(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0x56)
            h = (MK3THREADFUNC)t_run_in_close;
        else
            h = (MK3THREADFUNC)t_d_knee;
    }
    return mk3_install(thread, h);
}

long t_scorp_anti_orb(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0xaf) {
        h = (MK3THREADFUNC)t_run_in_and_slam;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0xf0)
            h = (MK3THREADFUNC)t_d_propell_attack_now;
        else
            h = (MK3THREADFUNC)t_block_orb;
    }
    return mk3_install(thread, h);
}

/* q_proj_jclose -- armv7 0x0006ff80: is his projectile within reach of a
 * jump. The reach is 0xc0, or 0x90 unless he is character 0xe, 0x12 or
 * 0x16 (the three whose projectiles travel far). */
void q_proj_jclose(MK3OBJ *obj)
{
    uint32_t c;
    int32_t  d;

    his_proj_front_x(obj);
    obj->field30 = 0xc0;
    c = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field24;
    obj->field24 = c;
    if (!(c == 0xe || c == 0x12) && c != 0x16)
        obj->field30 = 0x90;
    obj->field24 = (uint32_t)(int32_t)MK3_FIELD0E_S(obj->field08);
    d = (int32_t)obj->field24 - (int32_t)obj->field28;
    obj->field28 = (uint32_t)d;
    if (d <= (int32_t)obj->field30)
        goto yes;
    vq_no(obj);
    return;
yes:
    vq_yes(obj);
}

/* ======================================================================
 * Duck/fan/stance setups, flip watchers and the multi-state net/turn threads.
 * ====================================================================== */

long t_mframew(struct MK3THREAD *thread);
long t_scan_flip_kick(struct MK3THREAD *thread);
long t_dont_zap_towards_jumper(struct MK3THREAD *thread);
long t_very_far_airborn(struct MK3THREAD *thread);
long t_d_fflip_noscan_jsrp(struct MK3THREAD *thread);
long t_watch_flip_punch(struct MK3THREAD *thread);
long t_watch_flip_kick(struct MK3THREAD *thread);
long t_retreat_wait_yes(struct MK3THREAD *thread);
long t_d_turnaround_jsrp(struct MK3THREAD *thread);
long t_drone_zone(struct MK3THREAD *thread);
long rpt_promoves(struct MK3THREAD *thread);
long t_d_fflip_scan_jsrp(struct MK3THREAD *thread);
long t_fflip_watchout(struct MK3THREAD *thread);
void stance_setup(MK3OBJ *obj);
void do_next_a9_frame(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void face_opponent(MK3OBJ *obj);
void distance_off_ground(MK3OBJ *obj);
void q_no(MK3OBJ *obj);

/* t_d_duck_fast -- armv7 0x000715b4 */
long t_d_duck_fast(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x302;
    obj->field00->field18 = 0x302;
    stop_me_player(obj);
    face_opponent(obj);
    obj->field40 = 4;
    get_char_ani(obj);
    obj->field1c = 1;
    return mk3_install(thread, (MK3THREADFUNC)t_mframew);
}

/* c_air_fan -- armv7 0x0006aa28: how far his y is from the floor decides */
long c_air_fan(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    int32_t       y, d;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    y = MK3_FIELD12_S((MK3OBJ *)(uintptr_t)obj->field00->him);
    obj->field28 = (uint32_t)y;
    d = (int32_t)*(const uint32_t *)(const void *)(G_BYTES + 0xac) - y;
    obj->field1c = (uint32_t)d;
    if (d > 0xa0)
        h = (MK3THREADFUNC)t_d_zap_now;
    else
        h = (MK3THREADFUNC)t_duck_under_proj;
    return mk3_install(thread, h);
}

/* d_stance_setup -- armv7 0x00071e0c: step the animation script back one
 * word (skipping runs of 8-opcodes five words long), then scan forward to the
 * next 1 and keep the pointer one word before it; the old pointer is
 * restored when it lies between the two */
void d_stance_setup(MK3OBJ *obj)
{
    const uint32_t *p, *q, *last;
    uint32_t        v, saved;

    stop_me_player(obj);
    obj->field30 = obj->field40;
    stance_setup(obj);
    do_next_a9_frame(obj);

    p = (const uint32_t *)(uintptr_t)obj->field40;
    p = p - 1;
    obj->field40 = (uint32_t)(uintptr_t)p;
    v = *p;
    obj->field2c = v;
    while (v == 8) {
        const uint32_t *old = p;

        p = old + 5;
        obj->field40 = (uint32_t)(uintptr_t)p;
        v = *p;
        obj->field2c = v;
    }

    q = p;
    obj->field2c = (uint32_t)(uintptr_t)q;
    do {
        last = q;
        v = *q++;
        obj->field20 = v;
        obj->field2c = (uint32_t)(uintptr_t)q;
    } while (v != 1);

    saved = obj->field30;
    obj->field2c = (uint32_t)(uintptr_t)(last - 1);
    if ((int32_t)saved >= (int32_t)(uintptr_t)p &&
        (int32_t)(uintptr_t)(last - 1) >= (int32_t)saved)
        obj->field40 = saved;
}

/* t_fflip_scan -- armv7 0x0006e754: close enough scans, otherwise the level
 * pops (or becomes t_local_reaction_exit at the bottom) */
long t_fflip_scan(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x6f) {
        h = (MK3THREADFUNC)t_scan_flip_kick;
    } else {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        h = (MK3THREADFUNC)t_local_reaction_exit;
    }
    return mk3_install(thread, h);
}

/* c_swat_gun -- armv7 0x0006d350 */
long c_swat_gun(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_counter;
    ask_mr_diff(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0xd0)
            h = (MK3THREADFUNC)t_d_zap_now;
        else
            h = (MK3THREADFUNC)t_d_block;
    }
    return mk3_install(thread, h);
}

/* c_floor_ice -- armv7 0x0006dfd4 */
long c_floor_ice(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_promoves;
    ask_mr_diff(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0x6f)
            h = (MK3THREADFUNC)t_drone_zone;
        else
            h = (MK3THREADFUNC)t_run_in_close;
    }
    return mk3_install(thread, h);
}

/* t_d_attack_very_far -- armv7 0x00070bf4: two install sites, as the binary
 * has them */
long t_d_attack_very_far(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_towards_me(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_dont_zap_towards_jumper;
    } else {
        q_airborn_counter(obj);
        if (obj->field5c == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_dont_zap_towards_jumper);
        h = (MK3THREADFUNC)t_very_far_airborn;
    }
    return mk3_install(thread, h);
}

/* t_d_fflip_jsrp -- armv7 0x00070de0 */
long t_d_fflip_jsrp(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    int32_t       d;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    frontflip_setup(obj);
    d = *(const int16_t *)(const void *)(G_BYTES + 0x44c);
    obj->field1c = (uint32_t)d;
    if (d > 3) {
        obj->field34 = (uint32_t)(uintptr_t)t_fflip_watchout;
        h = (MK3THREADFUNC)t_d_fflip_scan_jsrp;
    } else {
        h = (MK3THREADFUNC)t_d_fflip_noscan_jsrp;
    }
    return mk3_install(thread, h);
}

/* t_fflip_watchout -- armv7 0x000705fc: refuses while he is far (over 0xa0),
 * then picks the watch by whether he is in the air */
long t_fflip_watchout(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xa0)
        return -3;

    reset_proc_stack(thread);
    is_he_airborn(obj);
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_watch_flip_punch);
    return mk3_install(thread, (MK3THREADFUNC)t_watch_flip_kick);
}

/* t_tusk_jup_scan -- armv7 0x00070758 */
long t_tusk_jup_scan(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    distance_off_ground(obj);
    if ((int32_t)obj->field1c > 0x3f) {
        reset_proc_stack(thread);
        h = (MK3THREADFUNC)t_d_zap_now;
    } else {
        q_no(obj);
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        h = (MK3THREADFUNC)t_local_reaction_exit;
    }
    return mk3_install(thread, h);
}

/* t_robo2_delayed_net -- armv7 0x00069a60: state 0 sets the net test and
 * waits at 0xce7 behind t_retreat_wait_yes; 0xce7 becomes t_d_zap */
long t_robo2_delayed_net(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 0x40;
        obj->field48 = (uint32_t)(uintptr_t)q_is_he_net_close;
        *mk3_frame(thread, thread->frame + 1) = 0xce7;
        thread->frame = thread->frame + 1;
        return mk3_install(thread, (MK3THREADFUNC)t_retreat_wait_yes);
    }
    if (token != 0xce7)
        return -3;
    return mk3_install(thread, (MK3THREADFUNC)t_d_zap);
}

/* t_d_turnaround -- armv7 0x00070674: push the jsrp turnaround and come back
 * at 0x1bf to reset and leave */
long t_d_turnaround(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1bf;
        thread->frame = thread->frame + 1;
        return mk3_install(thread, (MK3THREADFUNC)t_d_turnaround_jsrp);
    }
    if (token != 0x1bf)
        return -3;
    reset_proc_stack(thread);
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ======================================================================
 * Two-state deciders: state 0 pushes a wait and refuses (-3 abandons this
 * frame; the pushed level runs on the next), the resume token chooses.
 * ====================================================================== */

long t_d_bflip_jump(struct MK3THREAD *thread);
long t_d_open_jumpover(struct MK3THREAD *thread);
long t_do_jumpup_kick(struct MK3THREAD *thread);
long funcs_13699(struct MK3THREAD *thread);
long funcs_13782(struct MK3THREAD *thread);
long c_tusk_blur(struct MK3THREAD *thread);
long t_nr_sweep_if_u_can(struct MK3THREAD *thread);
long t_d_block_projectile(struct MK3THREAD *thread);
long t_d_flipk_over_proj(struct MK3THREAD *thread);
long t_avoid_agressive_bastards(struct MK3THREAD *thread);
long t_d_retreat_a11(struct MK3THREAD *thread);

/* t_jump_up_kick_scan -- armv7 0x000706e8 */
long t_jump_up_kick_scan(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x90) {
        reset_proc_stack(thread);
        h = (MK3THREADFUNC)t_do_jumpup_kick;
    } else {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        h = (MK3THREADFUNC)t_local_reaction_exit;
    }
    return mk3_install(thread, h);
}

/* c_duck_kickl -- armv7 0x000708bc */
long c_duck_kickl(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    q_will_he_reach_me(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        q_is_he_cornered(obj);
        if (obj->field5c != 0) {
            h = (MK3THREADFUNC)t_d_crossover_kick;
        } else {
            *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13699;
            h = (MK3THREADFUNC)t_react_jump_table_act;
        }
    }
    return mk3_install(thread, h);
}

/* t_d_get_open -- armv7 0x000712b0: two candidate jumps in field24/field38,
 * ordered by which edge is nearer; the opponent's side swaps them */
long t_d_get_open(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t h, a, b;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_my_dfe(obj);
    a = (uint32_t)(uintptr_t)t_d_bflip_jump;
    b = (uint32_t)(uintptr_t)t_d_open_jumpover;
    obj->field24 = a;
    obj->field38 = b;
    if ((int32_t)obj->field34 <= (int32_t)obj->field30) {
        obj->field24 = b;
        obj->field38 = a;
    }
    is_he_right(obj);
    if (obj->field5c != 0) {
        h = obj->field38;
    } else {
        uint32_t x = obj->field24, y = obj->field38;

        obj->field38 = x;
        obj->field24 = y;
        h = x;
    }
    return mk3_install(thread, (MK3THREADFUNC)(uintptr_t)h);
}

/* c_react_flipk -- armv7 0x0006cb6c: the handler comes out of tab_react_flipk
 * for characters up to 0x17 */
long c_react_flipk(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    should_i_promove(obj);
    if (obj->field5c == 0) {
        h = (uint32_t)(uintptr_t)t_return_to_beware;
    } else if (((MK3OBJ *)(uintptr_t)obj->field00->him)->field24 > 0x17) {
        h = (uint32_t)(uintptr_t)t_return_to_beware;
    } else {
        h = tab_react_flipk[obj->field08->field24];
        obj->field1c = h;
    }
    return mk3_install(thread, (MK3THREADFUNC)(uintptr_t)h);
}

/* The three `_pro` / hat deciders: state 0 pushes t_nr_sweep_if_u_can and
 * refuses, the resume token measures the distance. */
long c_bombhi_pro(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xe13;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_nr_sweep_if_u_can);
        return -3;
    }
    if (token != 0xe13)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 < 0x110)
        h = (MK3THREADFUNC)t_duck_under_proj;
    else
        h = (MK3THREADFUNC)t_run_in_close;
    return mk3_install(thread, h);
}

long c_bomblo_pro(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xe05;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_nr_sweep_if_u_can);
        return -3;
    }
    if (token != 0xe05)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xaf)
        h = (MK3THREADFUNC)t_d_fflip_kick_jump;
    else
        h = (MK3THREADFUNC)t_duck_under_proj;
    return mk3_install(thread, h);
}

long c_hat(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0xdad;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_nr_sweep_if_u_can);
        return -3;
    }
    if (token != 0xdad)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xbf)
        h = (MK3THREADFUNC)t_d_flipk_over_proj;
    else
        h = (MK3THREADFUNC)t_d_block_projectile;
    return mk3_install(thread, h);
}

/* c_elbow -- armv7 0x0006bcc4: push t_avoid_agressive_bastards and refuse;
 * on 0x137e set the slave word and become t_react_jump_table_act */
long c_elbow(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x137e;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_avoid_agressive_bastards);
        return -3;
    }
    if (token != 0x137e)
        return -3;

    *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13782;
    return mk3_install(thread, (MK3THREADFUNC)t_react_jump_table_act);
}

/* t_ct_kswipe -- armv7 0x0006d050: two install sites */
long t_ct_kswipe(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 <= 0x8f) {
        h = (MK3THREADFUNC)t_d_block;
    } else {
        should_i_promove(obj);
        if (obj->field5c == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_swait_nonattack_jump);
        h = (MK3THREADFUNC)t_d_zap;
    }
    return mk3_install(thread, h);
}

/* t_d_backoff_a_bit -- armv7 0x00067a30: state 0 sets a10/field48 (0x40,
 * 0x80), pushes t_d_retreat_a11 and refuses; 0x303 leaves */
long t_d_backoff_a_bit(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10     = 0x40;
        obj->field48 = 0x40 + 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0x303;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_d_retreat_a11);
        return -3;
    }
    if (token != 0x303)
        return -3;
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ======================================================================
 * The two-state deciders, generated from one template and each checked.
 *
 * State 0 does its setup, pushes a wait routine one level up with a resume
 * token, and refuses with -3 -- which abandons this frame; the pushed level
 * runs on the next. When the wait comes back at the token, the second state
 * installs the real handler.
 * ====================================================================== */

long t_d_run_till_yes(struct MK3THREAD *thread);
long t_stance_wait_yes(struct MK3THREAD *thread);
long t_close_airborn(struct MK3THREAD *thread);
long t_nr_attack_sd(struct MK3THREAD *thread);
long t_flipp_scan(struct MK3THREAD *thread);
long t_jump_up_kick_scan(struct MK3THREAD *thread);
long t_do_jump_up(struct MK3THREAD *thread);
long t_do_flip_kick(struct MK3THREAD *thread);
long t_d_flip_punch_jump(struct MK3THREAD *thread);
long t_d_propell_attack(struct MK3THREAD *thread);
long t_nr_uppercut_if_u_can(struct MK3THREAD *thread);
long t_d_hi_kick(struct MK3THREAD *thread);
long t_d_duck(struct MK3THREAD *thread);
long t_d_duck_then_uppercut(struct MK3THREAD *thread);
long t_d_sweep_kick(struct MK3THREAD *thread);
long funcs_8223(struct MK3THREAD *thread);
long funcs_8113(struct MK3THREAD *thread);
void q_backup_zap(MK3OBJ *obj);
void q_run_then_flipk(MK3OBJ *obj);
void q_run_then_duck(MK3OBJ *obj);
void q_run_under_fk(MK3OBJ *obj);
void is_propell_close(MK3OBJ *obj);
void frontflip_setup(MK3OBJ *obj);
void d_stance_setup(MK3OBJ *obj);
void next_anirate(MK3OBJ *obj);

long t_run_then_flipk(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10     = 0x30;
        obj->field48 = (uint32_t)(uintptr_t)q_run_then_flipk;
        *mk3_frame(thread, thread->frame + 1) = 0xeb7;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_d_run_till_yes);
        return -3;
    }
    if (token != 0xeb7)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_fflip_kick_jump);
}

long t_run_then_duck_under(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10     = 0x30;
        obj->field48 = (uint32_t)(uintptr_t)q_run_then_duck;
        *mk3_frame(thread, thread->frame + 1) = 0xecf;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_d_run_till_yes);
        return -3;
    }
    if (token != 0xecf)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_duck_under_proj);
}

long t_run_under_flykick(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10     = 0x30;
        obj->field48 = (uint32_t)(uintptr_t)q_run_under_fk;
        *mk3_frame(thread, thread->frame + 1) = 0x12ef;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_d_run_till_yes);
        return -3;
    }
    if (token != 0x12ef)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_flip_punch_jump);
}

long t_ct_propell(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field48 = (uint32_t)(uintptr_t)is_propell_close;
        obj->a10     = 0x30;
        *mk3_frame(thread, thread->frame + 1) = 0x1263;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_stance_wait_yes);
        return -3;
    }
    if (token != 0x1263)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_block);
}

long t_d_backup_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10     = 0x40;
        obj->field48 = (uint32_t)(uintptr_t)q_backup_zap;
        *mk3_frame(thread, thread->frame + 1) = 0xcfc;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_retreat_wait_yes);
        return -3;
    }
    if (token != 0xcfc)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_d_zap);
}

long t_attack_close_hard(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_8223;
        *(uint32_t *)((char *)obj + 0x64) = 5;
        *mk3_frame(thread, thread->frame + 1) = 0x403;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_random_do);
        return -3;
    }
    if (token != 0x403)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_close_airborn);
}

long t_attack_very_far_hard(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_8113;
        *(uint32_t *)((char *)obj + 0x64) = 3;
        *mk3_frame(thread, thread->frame + 1) = 0x3c0;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_random_do);
        return -3;
    }
    if (token != 0x3c0)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_very_far_airborn);
}

long c_sbike_sd(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1082;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_nr_attack_sd);
        return -3;
    }
    if (token != 0x1082)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xd0)
        h = (MK3THREADFUNC)t_d_zap;
    else
        h = (MK3THREADFUNC)t_d_fflip_kick_jump;
    return mk3_install(thread, h);
}

long t_counter_grounded_sd(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1130;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_nr_attack_sd);
        return -3;
    }
    if (token != 0x1130)
        return -3;

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0xb0)
        h = (MK3THREADFUNC)t_d_zap;
    else
        h = (MK3THREADFUNC)t_d_propell_attack;
    return mk3_install(thread, h);
}

long t_d_flip_punch_jump(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        frontflip_setup(obj);
        obj->field34 = (uint32_t)(uintptr_t)t_flipp_scan;
        *mk3_frame(thread, thread->frame + 1) = 0x4c3;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_d_fflip_scan_jsrp);
        return -3;
    }
    if (token != 0x4c3)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_d_jump_up_kick(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field48 = (uint32_t)(uintptr_t)t_jump_up_kick_scan;
        *mk3_frame(thread, thread->frame + 1) = 0x156;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_do_jump_up);
        return -3;
    }
    if (token != 0x156)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_scan_flip_kick(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        reset_proc_stack(thread);
        *mk3_frame(thread, thread->frame + 1) = 0x6a4;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_do_flip_kick);
        return -3;
    }
    if (token != 0x6a4)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_drone_babality -- armv7 0x00071e68: face him, set the stance, count 0x40
 * frames of next_anirate parked at 0x999, then t_do_babality */
long tl_do_babality(struct MK3THREAD *thread);

long t_drone_babality(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        face_opponent(obj);
        d_stance_setup(obj);
        obj->a10 = 0x40;
        goto park;
    }
    if (token != 0x999)
        return -3;
    obj->a10 = obj->a10 - 1;
    if ((int32_t)obj->a10 != 0)
        goto park;
    return mk3_install(thread, (MK3THREADFUNC)tl_do_babality);

park:
    next_anirate(obj);
    *mk3_frame(thread, thread->frame + 1) = 0x999;
    thread->fieldfc = 1;
    return 1;
}

/* c_ermac_slam -- armv7 0x0006ddc8 */
long c_ermac_slam(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)rpt_promoves;
    ask_mr_diff(obj);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_return_to_beware;
    } else {
        get_x_dist(obj);
        if ((int32_t)obj->field28 <= 0x6f)
            h = (MK3THREADFUNC)t_run_in_close;
        else if ((int32_t)obj->field28 > 0xf0)
            h = (MK3THREADFUNC)t_d_zap_now;
        else
            h = (MK3THREADFUNC)t_d_block;
    }
    return mk3_install(thread, h);
}

/* t_ct_kicks -- armv7 0x0006e940: ducking at 0x104 else a strike test picks
 * between the uppercut and the sweep */
long t_ct_kicks(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_his_action(obj);
    if (obj->field20 == 0x104) {
        h = (MK3THREADFUNC)t_d_duck;
    } else {
        obj->field1c = 8;
        strike_check_a0_test(obj);
        if (obj->field5c == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_d_sweep_kick);
        h = (MK3THREADFUNC)t_d_duck_then_uppercut;
    }
    return mk3_install(thread, h);
}

/* c_robo_tele_sd -- armv7 0x0006abe8: three states, each pushing the next
 * wait and returning 0 so it runs at once */
long c_robo_tele_sd(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x105e) {
        *mk3_frame(thread, thread->frame + 1) = 0x105f;
        thread->frame = thread->frame + 1;
        return mk3_install(thread, (MK3THREADFUNC)t_nr_uppercut_if_u_can);
    }
    if (token == 0x105f)
        return mk3_install(thread, (MK3THREADFUNC)t_d_hi_kick);
    if (token != 0)
        return -3;
    *mk3_frame(thread, thread->frame + 1) = 0x105e;
    thread->frame = thread->frame + 1;
    return mk3_install(thread, (MK3THREADFUNC)t_nr_attack_sd);
}

/* ======================================================================
 * Argument-stack deciders (ckik3, cpch3), waits and scans.
 * ====================================================================== */

long t_kick_will_miss(struct MK3THREAD *thread);
long t_react_jump_table(struct MK3THREAD *thread);
long funcs_14030(struct MK3THREAD *thread);
long funcs_13934(struct MK3THREAD *thread);
long t_d_stalk_a11_ntl(struct MK3THREAD *thread);
long t_stsw_zap(struct MK3THREAD *thread);
long t_stance_wait_no(struct MK3THREAD *thread);
long t_tusk_jup_scan(struct MK3THREAD *thread);
long t_return_to_beware_4get(struct MK3THREAD *thread);
long is_throwing_allowed(MK3OBJ *obj);
void is_he_attacking(MK3OBJ *obj);
long t_d_fflip_jsrp(struct MK3THREAD *thread);

/* ckik3 -- armv7 0x0006ea94: keep field20 on the argument stack across the
 * reach test, then react through the jump table with funcs.14030, or miss */
long ckik3(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = thread->fieldf8;
    *mk3_arg(thread, n) = obj->field20;
    thread->fieldf8 = n + 1;
    q_will_he_reach_me(obj);
    n = thread->fieldf8 - 1;
    thread->fieldf8 = n;
    obj->field20 = *mk3_arg(thread, n);
    if (obj->field5c == 0) {
        h = (MK3THREADFUNC)t_kick_will_miss;
    } else {
        *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_14030;
        h = (MK3THREADFUNC)t_react_jump_table;
    }
    return mk3_install(thread, h);
}

/* cpch3 -- armv7 0x0006d1dc: the same with the distance (over 0x60 forgets) */
long cpch3(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;
    uint32_t      n;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    n = thread->fieldf8;
    *mk3_arg(thread, n) = obj->field20;
    thread->fieldf8 = n + 1;
    get_x_dist(obj);
    n = thread->fieldf8 - 1;
    thread->fieldf8 = n;
    obj->field20 = *mk3_arg(thread, n);
    if ((int32_t)obj->field28 > 0x60) {
        h = (MK3THREADFUNC)t_return_to_beware_4get;
    } else {
        *(uint32_t *)((char *)obj + 0x68) = (uint32_t)(uintptr_t)funcs_13934;
        h = (MK3THREADFUNC)t_react_jump_table;
    }
    return mk3_install(thread, h);
}

/* t_d_get_close_2_u -- armv7 0x0006e69c: far (over 0xff) pushes the forward
 * flip and comes back at 0xa82; either way the close action is the same */
long t_d_get_close_2_u(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        get_x_dist(obj);
        if ((int32_t)obj->field28 > 0xff) {
            *mk3_frame(thread, thread->frame + 1) = 0xa82;
            thread->frame = thread->frame + 1;
            return mk3_install(thread, (MK3THREADFUNC)t_d_fflip_jsrp);
        }
    } else if (token != 0xa82) {
        return -3;
    }
    obj->field48 = 0x40;
    return mk3_install(thread, (MK3THREADFUNC)t_d_stalk_a11_ntl);
}

/* t_d_wait_nonattack -- armv7 0x0006c77c: park a frame at a time at 0x779
 * for a10 frames while he is attacking, then pop or leave */
long t_d_wait_nonattack(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0)
        goto park;
    if (token != 0x779)
        return -3;

    obj->a10 = obj->a10 - 1;
    if (obj->a10 != 0) {
        is_he_attacking(obj);
        if (obj->field5c != 0)
            goto park;
    }
    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

park:
    *mk3_frame(thread, thread->frame + 1) = 0x779;
    thread->fieldfc = 1;
    return 1;
}

/* t_tusk_jump_up_zap -- armv7 0x000699ac */
long t_tusk_jump_up_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field48 = (uint32_t)(uintptr_t)t_tusk_jup_scan;
        *mk3_frame(thread, thread->frame + 1) = 0xcd3;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_do_jump_up);
        return -3;
    }
    if (token != 0xcd3)
        return -3;
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_swait_nonattack_jump -- armv7 0x0006b308 */
long t_swait_nonattack_jump(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field48 = (uint32_t)(uintptr_t)is_he_attacking;
        obj->a10     = 0x40;
        *mk3_frame(thread, thread->frame + 1) = 0x11c8;
        thread->frame = thread->frame + 1;
        mk3_install(thread, (MK3THREADFUNC)t_stance_wait_no);
        return -3;
    }
    if (token != 0x11c8)
        return -3;
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* t_crossover_scan -- armv7 0x00068640: my x against his, ordered by the
 * sign of my part's field18; in order it scans the flip kick, out of order
 * it pops (or leaves at the bottom) */
long t_crossover_scan(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3OBJ       *part = obj->field08;
    MK3OBJ       *him  = (MK3OBJ *)(uintptr_t)obj->field00->him;
    MK3THREADFUNC h;
    int32_t       mine, his, v;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    mine = MK3_FIELD0E_S(part);
    obj->field20 = (uint32_t)mine;
    his = MK3_FIELD0E_S(him);
    obj->field24 = (uint32_t)his;
    v = (int32_t)part->field18;
    obj->field28 = (uint32_t)v;
    if (v <= 0) {
        obj->field20 = (uint32_t)his;
        obj->field24 = (uint32_t)mine;
    }
    if ((int32_t)obj->field20 >= (int32_t)obj->field24) {
        h = (MK3THREADFUNC)t_scan_flip_kick;
    } else {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        h = (MK3THREADFUNC)t_local_reaction_exit;
    }
    return mk3_install(thread, h);
}

/* t_ct_stick_sweep -- armv7 0x0006d57c */
long t_ct_stick_sweep(MK3THREAD *thread)
{
    MK3OBJ       *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    is_throwing_allowed(obj);
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_stsw_zap);

    get_x_dist(obj);
    if ((int32_t)obj->field28 > 0x7f)
        h = (MK3THREADFUNC)t_d_block;
    else
        h = (MK3THREADFUNC)t_d_crossover_kick;
    return mk3_install(thread, h);
}
