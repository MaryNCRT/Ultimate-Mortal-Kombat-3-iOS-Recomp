/*
 * mkzap.c -- gamecode/logic/mkzap.c, decompiled.
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

long t_doice3(struct MK3THREAD *thread);
long t_new_scorpion_spear_proc(struct MK3THREAD *thread);
long t_new_smoke_spear_proc(struct MK3THREAD *thread);
long t_new_spear_proc(struct MK3THREAD *thread);
long t_robo_bomb_full(struct MK3THREAD *thread);
long t_robo_bomb_mid(struct MK3THREAD *thread);
long t_roc3(struct MK3THREAD *thread);
long t_stz1(struct MK3THREAD *thread);
long tl_bomb3(struct MK3THREAD *thread);
long tl_jzap3(struct MK3THREAD *thread);
long tl_ssp2(struct MK3THREAD *thread);

/* t_new_smoke_spear_proc -- armv7 0x00074d3c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xffffffb8
 *      obj->field20 = 0x100000015
 *      frame[frame].handler = t_new_spear_proc
 *      frame[frame+1].w0 = 0
 */

long t_new_smoke_spear_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xffffffb8;
    obj->field20 = 0x100000015;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_new_spear_proc);
}

/* tl_do_smoke_spear -- armv7 0x00074db8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field38 = t_new_smoke_spear_proc
 *      frame[frame].handler = tl_ssp2
 *      frame[frame+1].w0 = 0
 */

long tl_do_smoke_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = (uint32_t)(uintptr_t)t_new_smoke_spear_proc;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_ssp2);
}

/* tl_do_scorpion_spear -- armv7 0x00074df8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field38 = t_new_scorpion_spear_proc
 *      frame[frame].handler = tl_ssp2
 *      frame[frame+1].w0 = 0
 */

long tl_do_scorpion_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = (uint32_t)(uintptr_t)t_new_scorpion_spear_proc;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_ssp2);
}

/* tl_do_jade_zap_ret -- armv7 0x00075030, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      frame[frame].handler = tl_jzap3
 *      frame[frame+1].w0 = 0
 */

long tl_do_jade_zap_ret(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_jzap3);
}

/* tl_do_jade_zap_lo -- armv7 0x0007506c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x5000
 *      frame[frame].handler = tl_jzap3
 *      frame[frame+1].w0 = 0
 */

long tl_do_jade_zap_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x5000;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_jzap3);
}

/* tl_do_st_zap1 -- armv7 0x000751d0, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x1
 *      obj->field20 = 0x10
 *      frame[frame].handler = t_stz1
 *      frame[frame+1].w0 = 0
 */

long tl_do_st_zap1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x1;
    obj->field20 = 0x10;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stz1);
}

/* tl_do_st_zap2 -- armv7 0x00075210, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x2
 *      obj->field20 = 0x11
 *      frame[frame].handler = t_stz1
 *      frame[frame+1].w0 = 0
 */

long tl_do_st_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x2;
    obj->field20 = 0x11;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stz1);
}

/* tl_do_st_zap3 -- armv7 0x00075250, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x3
 *      obj->field20 = 0x12
 *      frame[frame].handler = t_stz1
 *      frame[frame+1].w0 = 0
 */

long tl_do_st_zap3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x3;
    obj->field20 = 0x12;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stz1);
}

/* t_robo_open_chest -- armv7 0x00075290, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_roc3
 *      frame[frame+1].w0 = 0
 */

long t_robo_open_chest(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_roc3);
}

/* tl_do_bomb_mid -- armv7 0x000752cc, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = t_robo_bomb_mid
 *      frame[frame].handler = tl_bomb3
 *      frame[frame+1].w0 = 0
 */

long tl_do_bomb_mid(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = (uint32_t)(uintptr_t)t_robo_bomb_mid;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_bomb3);
}

/* tl_do_robo_bomb -- armv7 0x0007530c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = t_robo_bomb_full
 *      frame[frame].handler = tl_bomb3
 *      frame[frame+1].w0 = 0
 */

long tl_do_robo_bomb(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = (uint32_t)(uintptr_t)t_robo_bomb_full;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_bomb3);
}

/* tl_do_sky_ice_front -- armv7 0x000755b4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0xffffffa0
 *      frame[frame].handler = t_doice3
 *      frame[frame+1].w0 = 0
 */

long tl_do_sky_ice_front(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0xffffffa0;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_doice3);
}

/* tl_do_sky_ice_behind -- armv7 0x000755f0, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x60
 *      frame[frame].handler = t_doice3
 *      frame[frame+1].w0 = 0
 */

long tl_do_sky_ice_behind(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x60;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_doice3);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_doice5(struct MK3THREAD *thread);
long t_new_spear_proc(struct MK3THREAD *thread);
long tl_jzap3(struct MK3THREAD *thread);
long tl_projectile_flight_call(struct MK3THREAD *thread);

/* t_new_scorpion_spear_proc -- armv7 0x00074d7c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_new_spear_proc
 *      frame[frame+1].w0 = 0
 */

long t_new_scorpion_spear_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */
    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_new_spear_proc);
}

/* tl_do_jade_zap_med -- armv7 0x000750e8, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0   (the register the guard proved)
 *      frame[frame].handler = tl_jzap3
 *      frame[frame+1].w0 = 0
 */

long tl_do_jade_zap_med(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_jzap3);
}

/* tl_do_sky_ice_on -- armv7 0x0007557c, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0   (the register the guard proved)
 *      frame[frame].handler = t_doice5
 *      frame[frame+1].w0 = 0
 */

long tl_do_sky_ice_on(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_doice5);
}

/* tl_projectile_flight -- armv7 0x0007562c, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field34 = 0   (the register the guard proved)
 *      frame[frame].handler = tl_projectile_flight_call
 *      frame[frame+1].w0 = 0
 */

long tl_projectile_flight(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field34 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_projectile_flight_call);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */




