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
 *      obj->field20 = 0x15            (0xffffffb8 + 0x5d, wrapped)
 *
 * The second constant is reached by adding 0x5d to the first rather than
 * loading it: 0xffffffb8 + 0x5d = 0x15, with the carry falling off the end
 * of a 32-bit register. One `adds` instead of a second `mvn`.
 *      frame[frame].handler = t_new_spear_proc
 *      frame[frame+1].w0 = 0
 */

long t_new_smoke_spear_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0xffffffb8;
    obj->field20 = 0x15;                /* 0xffffffb8 + 0x5d, wrapped */

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






/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_sai3(struct MK3THREAD *thread);

/* t_air_sai_proc -- armv7 0x00074cbc, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1a
 *      obj->field20 = 0x10
 *      frame[frame].handler = t_sai3
 *      frame[frame+1].w0 = 0
 */

long t_air_sai_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1a;
    obj->field20 = 0x10;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sai3);
}

/* t_sai_proc -- armv7 0x00074cfc, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x3a
 *      obj->field20 = 0x16
 *      frame[frame].handler = t_sai3
 *      frame[frame+1].w0 = 0
 */

long t_sai_proc(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x3a;
    obj->field20 = 0x16;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sai3);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_backwards_ani(struct MK3THREAD *thread);
long t_rbomb4(struct MK3THREAD *thread);
long t_rocket1_proc(struct MK3THREAD *thread);
long t_rocket2_proc(struct MK3THREAD *thread);
long t_rzap3(struct MK3THREAD *thread);
long tl_bomb33(struct MK3THREAD *thread);
void get_bomb_vel(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
void q_his_react_flag_set(MK3OBJ *obj);
void zap_init_special_act(MK3OBJ *obj);

/* t_robo_bomb_full -- armv7 0x00075424, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      get_bomb_vel(obj)
 *      frame[frame].handler = t_rbomb4
 *      frame[frame+1].w0 = 0
 */

long t_robo_bomb_full(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_bomb_vel(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rbomb4);
}

/* t_robo_open_chest_fast -- armv7 0x00075844, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      q_his_react_flag_set(obj)
 *      frame[frame].handler = t_robo_open_chest
 *      frame[frame+1].w0 = 0
 */

long t_robo_open_chest_fast(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    q_his_react_flag_set(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_robo_open_chest);
}

/* t_robo_close_chest -- armv7 0x00077eb4, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0   (the register the guard proved)
 *      get_char_ani2(obj)
 *      obj->field1c = 0x4
 *      frame[frame].handler = t_backwards_ani
 *      frame[frame+1].w0 = 0
 */

long t_robo_close_chest(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0;   /* the guard proved this register */
    get_char_ani2(obj);
    obj->field1c = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_backwards_ani);
}

/* tl_do_robo_zap -- armv7 0x00079bbc, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x9
 *      obj->a10 = 0   (the register the guard proved)
 *      zap_init_special_act(obj)
 *      obj->field38 = t_rocket1_proc
 *      frame[frame].handler = t_rzap3
 *      frame[frame+1].w0 = 0
 */

long tl_do_robo_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x9;
    obj->a10 = 0;   /* the guard proved this register */
    zap_init_special_act(obj);
    obj->field38 = (uint32_t)(uintptr_t)t_rocket1_proc;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rzap3);
}

/* tl_do_robo_zap2 -- armv7 0x00079c10, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x8
 *      obj->a10 = 0   (the register the guard proved)
 *      zap_init_special_act(obj)
 *      obj->field1c = 0xc
 *      ochar_sound(obj)
 *      obj->field38 = t_rocket2_proc
 *      frame[frame].handler = t_rzap3
 *      frame[frame+1].w0 = 0
 */

long tl_do_robo_zap2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x8;
    obj->a10 = 0;   /* the guard proved this register */
    zap_init_special_act(obj);
    obj->field1c = 0xc;
    ochar_sound(obj);
    obj->field38 = (uint32_t)(uintptr_t)t_rocket2_proc;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rzap3);
}

/* tl_do_swat_bomb_hi -- armv7 0x0007a704, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x18
 *      obj->a10 = 0   (the register the guard proved)
 *      zap_init_special_act(obj)
 *      obj->field48 = 0x1
 *      frame[frame].handler = tl_bomb33
 *      frame[frame+1].w0 = 0
 */

long tl_do_swat_bomb_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x18;
    obj->a10 = 0;   /* the guard proved this register */
    zap_init_special_act(obj);
    obj->field48 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_bomb33);
}

/* tl_do_swat_bomb_lo -- armv7 0x0007a750, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x19
 *      obj->a10 = 0   (the register the guard proved)
 *      zap_init_special_act(obj)
 *      obj->field48 = 0   (the register the guard proved)
 *      frame[frame].handler = tl_bomb33
 *      frame[frame+1].w0 = 0
 */

long tl_do_swat_bomb_lo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x19;
    obj->a10 = 0;   /* the guard proved this register */
    zap_init_special_act(obj);
    obj->field48 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)tl_bomb33);
}





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

void air_init_special(MK3OBJ *obj);
void init_special(MK3OBJ *obj);
void init_special_act(MK3OBJ *obj);
void leftmost_mpart_ob(MK3OBJ *out, MK3OBJ *src);
void zinit3(MK3OBJ *obj);

/* a3_leftmost_mpart_ob -- armv7 0x00075e98, 16 bytes.  **Complete.**
 *
 *      leftmost_mpart_ob(out, src)
 *      out->field28 = out->field24
 *
 * **It takes two arguments and forwards both.** Nothing in the body sets r1:
 * it arrives as this function's second argument and goes straight on to
 * `leftmost_mpart_ob`, which takes two.
 *
 * `tools/leaffn.py` wrote this with one, because it seeds only r0 with the
 * object and reads an untouched r1 as dead rather than as an argument passing
 * through. From a call site alone the two are indistinguishable; what settled
 * it was `tools/protos.py` putting this against the definition in other.c.
 */
void a3_leftmost_mpart_ob(MK3OBJ *out, MK3OBJ *src)
{
    leftmost_mpart_ob(out, src);
    out->field28 = out->field24;
}


/* zap_init_special -- armv7 0x000792fc, 20 bytes.  **Complete.**
 *
 *      init_special(obj)
 *      zinit3(obj)
 */
void zap_init_special(MK3OBJ *obj)
{
    init_special(obj);
    zinit3(obj);
}


/* zap_init_special_act -- armv7 0x00079590, 20 bytes.  **Complete.**
 *
 *      init_special_act(obj)
 *      zinit3(obj)
 */
void zap_init_special_act(MK3OBJ *obj)
{
    init_special_act(obj);
    zinit3(obj);
}


/* zap_air_init_special -- armv7 0x0007b2a4, 20 bytes.  **Complete.**
 *
 *      air_init_special(obj)
 *      zinit3(obj)
 */
void zap_air_init_special(MK3OBJ *obj)
{
    air_init_special(obj);
    zinit3(obj);
}

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

long t_sz_zap_hit(MK3THREAD *thread);
long tl_delete_proj_and_die(MK3THREAD *thread);
void create_fx(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void set_proj_vel(MK3OBJ *obj);

/* t_sz_zap_proc -- armv7 0x00075e08, 144 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x4
 *          init_anirate(obj)
 *          obj->field1c = 0xa0000
 *          set_proj_vel(obj)
 *          obj->field48 = 0x13
 *          token := 0x810, then descend into tl_projectile_flight
 *      token == 0x810:
 *          frame[frame].handler = t_sz_zap_hit
 *      otherwise:  return -3
 */
long t_sz_zap_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x4;
        init_anirate(obj);
        obj->field1c = 0xa0000;
        set_proj_vel(obj);
        obj->field48 = 0x13;
        *mk3_frame(thread, thread->frame + 1) = 0x810;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)tl_projectile_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x810)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_sz_zap_hit);
}

/* t_photon_proc -- armv7 0x000769b0, 164 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x3f
 *          get_char_ani(obj)
 *          obj->field1c = 0xa0000
 *          obj->field20 = 0x3
 *          set_proj_vel(obj)
 *          obj->field48 = 0x11
 *          token := 0xbaa, then descend into tl_projectile_flight
 *      token == 0xbaa:
 *          obj->field1c = 0x5
 *          create_fx(obj)
 *          frame[frame].handler = tl_delete_proj_and_die
 *      otherwise:  return -3
 */
long t_photon_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x3f;
        get_char_ani(obj);
        obj->field1c = 0xa0000;
        obj->field20 = 0x3;
        set_proj_vel(obj);
        obj->field48 = 0x11;
        *mk3_frame(thread, thread->frame + 1) = 0xbaa;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)tl_projectile_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xbaa)
        return -3;

    obj->field1c = 0x5;
    create_fx(obj);
    return mk3_install(thread, (MK3THREADFUNC)tl_delete_proj_and_die);
}


/* ========================================================================
 * Six leaves, read one at a time because neither `pushfn.py` nor
 * `microfn.py` matches any of their shapes.
 * ======================================================================== */

/* detach_proj -- armv7 0x0007568c, 12 bytes.  **Complete.**
 *
 *      proc->slave   = 0
 *      proc->field64 = 0
 *
 * **The other half of `delete_slave`.** That routine, in mkfatal.c, hands
 * `proc->field64` to `KillProc`; this one clears both slave slots and kills
 * nothing. So a slave can be let go as well as destroyed, and the two words at
 * 0x64 and 0x68 are written and cleared together.
 *
 * It still does not say who CREATES the slave -- that is issue #30, and seven
 * `delete_slave` sites plus this one have now failed to answer it.
 *
 * The proc pointer is loaded twice, once for each store, rather than kept in a
 * register. Transcribed as two stores through the same field because that is
 * what it computes.
 */
void detach_proj(MK3OBJ *obj)
{
    obj->field00->slave   = 0;
    obj->field00->field64 = 0;
}


/* i_am_a_sitting_duck -- armv7 0x000758b0, 12 bytes.  **Complete.**
 *
 *      obj->field1c     = 0x604
 *      proc->field18    = 0x604
 *
 * One literal into two fields, and 0x18 on the proc is the action
 * `get_his_action` reads and `init_special_act` writes. So the routine
 * announces an action to whoever asks and leaves the same number in 0x1c for
 * whoever called it -- the pattern `mk_random` and the other 0x1c-returning
 * helpers use.
 */
void i_am_a_sitting_duck(MK3OBJ *obj)
{
    obj->field1c          = 0x604;
    obj->field00->field18 = 0x604;
}


/* zinit3 -- armv7 0x00075f88, 16 bytes.  **Complete.**
 *
 *      if (obj->a10 != 0) flip_multi(obj)
 *
 * A conditional tail call and nothing else. `a10` is the argument slot, so the
 * caller decides by writing 0x44 before the call rather than by picking a
 * different function -- which is how most of this engine passes a boolean.
 */
void flip_multi(MK3OBJ *obj);

void zinit3(MK3OBJ *obj)
{
    if (obj->a10 != 0)
        flip_multi(obj);
}


/* is_he_motaro -- armv7 0x00075818, 20 bytes.  **Complete.**
 *
 *      obj->field5c = (him->field24 == 0x18)
 *
 * **Motaro is character 0x18, and this is the sixth place in the tree that
 * names a fighter by number** -- but the first that does so in a routine named
 * for the question. The other five (issue #29) are anonymous exceptions buried
 * inside larger routines: 0xb in `tl_kano_spider`, `t_ripped_skelton` twice and
 * `t_remaining_skel`, and {7, 8, 0xe} in `t_kitana_kiss`.
 *
 * A named predicate is a different thing from a hidden special case, and a port
 * that renumbers the roster fixes this one by editing a single constant in a
 * function whose name says what it is for. It is listed here so the count stays
 * honest, not because it is the same hazard.
 *
 * The answer goes in 0x5c, which is where every predicate in this engine puts
 * its result.
 */
void is_he_motaro(MK3OBJ *obj)
{
    MK3OBJ *him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;

    obj->field5c = (him->field24 == 0x18) ? 1 : 0;
}


/* q_his_react_flag_set -- armv7 0x0007582c, 24 bytes.  **Complete.**
 *
 *      obj->field2c = proc->field00->proc->field10
 *      obj->field5c = (obj->field54 >> 2) & 1
 *
 * **The value it fetches is not the value it answers with**, and that is worth
 * saying plainly rather than smoothing over. The four loads walk out to the
 * OTHER fighter's proc and bring back its 0x10 -- the word the header records
 * `isp2` as OR-ing bit 4 into -- and park it in 0x2c. The answer then comes from
 * `obj->field54`, a field this routine never writes.
 *
 * Two readings are possible and neither is settled here: the fetch is a side
 * effect the caller wants (0x2c as a place to leave the other guy's flags), or
 * 0x54 was filled by whatever ran before and the fetch is stale bookkeeping. The
 * instructions are transcribed as they stand.
 *
 * Bit 2 of 0x54 is isolated with `lsrs #2` then `and #1`, the same two-instruction
 * shape `am_i_joy` uses on 0x5c.
 *
 * **It was declared `long` earlier in this file and it is not.** That declaration
 * was written from the call site in `t_robo_bomb_full`, which discards the
 * result; the body never touches `r0`, so what a `long` caller would read back is
 * the object pointer it passed in, by accident. The answer is in 0x5c like every
 * other predicate here. The declaration has been removed rather than the
 * definition bent to match it -- the same correction `rip_ani` needed in
 * mkfatal.c, and the reason `tools/protos.py` exists.
 */
void q_his_react_flag_set(MK3OBJ *obj)
{
    obj->field2c = obj->field00->field00->field00->field10;
    obj->field5c = (obj->field54 >> 2) & 1u;
}


/* tell_world_stk -- armv7 0x00075900, 24 bytes.  **Complete.**
 *
 *      saved = obj->field1c
 *      get_char_stk(obj)
 *      proc->field84 = obj->field1c
 *      obj->field1c  = saved
 *
 * **A publish-and-restore.** `get_char_stk` answers in 0x1c like every other
 * helper here, the answer is copied into the proc's 0x84 where anything can
 * read it, and 0x1c is put back exactly as the caller left it -- so the routine
 * is invisible to whoever called it apart from the field it publishes.
 *
 * The save is a callee-saved register, not the argument stack, and the span is
 * inside one call: the rule `t_sg_pound` settled in mkfatal.c, seen again here
 * in twenty-four bytes.
 *
 * `proc->field84` had no field in the header before this; it has one now, and
 * **no reader for it has been measured anywhere in the tree**.
 */
void get_char_stk(MK3OBJ *obj);

void tell_world_stk(MK3OBJ *obj)
{
    uint32_t saved = obj->field1c;

    get_char_stk(obj);
    obj->field00->field84 = obj->field1c;

    obj->field1c = saved;
}


/* q_is_he_react_fk -- armv7 0x00074c9c, 32 bytes.  **Complete.**
 *
 *      obj->field20 = proc->field00->proc->field18
 *      obj->field5c = (obj->field20 == 0x507)
 *
 * **The twin of `q_his_react_flag_set`, and the contrast is what makes that one
 * suspicious.** Both walk the same four loads out to the OTHER fighter's proc.
 * This one parks what it found and answers about it; that one parks what it
 * found in 0x2c and then answers from `obj->field54`, which it never wrote.
 *
 * Written next to each other they are plainly meant to be the same shape, so
 * either 0x54 is filled by the caller in that case or the routine is not doing
 * what its name says. Recorded on both, decided on neither.
 *
 * 0x507 is an action number -- proc 0x18 is the field `get_his_action` reads.
 */
void q_is_he_react_fk(MK3OBJ *obj)
{
    obj->field20 = obj->field00->field00->field00->field18;
    obj->field5c = (obj->field20 == 0x507) ? 1 : 0;
}


/* get_frontmost_point -- armv7 0x00075ea8, 36 bytes.  **Complete.**
 *
 *      obj->field2c = part->field28
 *      if (part->field28 & 0x10) {
 *          leftmost_mpart_ob(obj, part)
 *          obj->field28 = obj->field24
 *      } else {
 *          rightmost_mpart_ob(obj, part)
 *      }
 *
 * **The answer always ends up in 0x28, and the copy is only on one branch
 * because the two helpers write different fields.** mkprop.c already recorded
 * that `leftmost_mpart_ob` answers in 0x24 and `rightmost_mpart_ob` in 0x28;
 * this routine normalises them, and the asymmetry in the code is exactly that
 * asymmetry in the helpers. A transcription that copied 0x24 to 0x28 on both
 * paths would clobber the right-hand answer with a stale left-hand one.
 *
 * "Frontmost" is decided by bit 4 of the part's 0x28 -- the flip bit -- so the
 * front of a fighter is their left edge when they face left and their right when
 * they face right, which is what the name means.
 */
void leftmost_mpart_ob(MK3OBJ *out, MK3OBJ *src);
void rightmost_mpart_ob(MK3OBJ *out, MK3OBJ *src);

void get_frontmost_point(MK3OBJ *obj)
{
    obj->field2c = obj->field08->field28;

    if ((obj->field2c & 0x10u) != 0) {
        leftmost_mpart_ob(obj, obj->field08);
        obj->field28 = obj->field24;            /* left answers in 0x24 */
    } else {
        rightmost_mpart_ob(obj, obj->field08);  /* right already answers in 0x28 */
    }
}


/* get_proj_obj_m -- armv7 0x0007822c, 36 bytes.  **Complete.**
 *
 *      p = NewThreadProc(obj, t_wait_forever)
 *      proc->field64 = p
 *      proc->slave   = p->field08
 *      obj->a10      = p->field08
 *
 * **This is what creates the slave, and it closes issue #30.** Eight sites
 * across mkfatal.c cleared or destroyed `proc->field64` and `proc->slave` --
 * seven `delete_slave` calls and `detach_proj` above -- and none of them made
 * one. This does: it starts a thread that does nothing at all, parks the new
 * object in 0x64 and its part in 0x68, and hands the part back in `a10`.
 *
 * So a "slave" is a second object with no behaviour of its own, driven entirely
 * by whoever owns it. `t_wait_forever` as the handler is the whole point --
 * everything the slave does is done to it.
 *
 * The three routines make a complete set: **create** here, **let go**
 * (`detach_proj`), **destroy** (`delete_slave`).
 */
long t_wait_forever(MK3THREAD *thread);
void *NewThreadProc(void *owner, MK3THREADFUNC func);

void get_proj_obj_m(MK3OBJ *obj)
{
    MK3OBJ *p = (MK3OBJ *)NewThreadProc(obj, (MK3THREADFUNC)t_wait_forever);

    obj->field00->field64 = (uint32_t)(uintptr_t)p;
    obj->field00->slave   = (uint32_t)(uintptr_t)p->field08;

    obj->a10 = (uint32_t)(uintptr_t)p->field08;
}


/* set_proj_vel -- armv7 0x00075d6c, 36 bytes.  **Complete.**
 *
 *      obj->field2c = part->field28
 *      if (part->field28 & 0x10) obj->field1c = -obj->field1c
 *      part->field18 = obj->field1c
 *      obj->field1c  = obj->field20
 *      init_anirate(obj)
 *
 * **Two arguments in two fields**: the speed in 0x1c and the animation rate in
 * 0x20. The speed is signed by the flip bit so a caller always passes a forward
 * speed and never has to know which way the fighter is facing -- which is why
 * every projectile launcher in this file writes a positive number.
 *
 * The negation is spelled as an `itett` block with the load duplicated in both
 * halves, so the flipped path also writes the negated value back into 0x1c
 * where the unflipped path leaves it alone. Both halves then share the store
 * into the part.
 *
 * 0x1c is spent and reloaded with 0x20 before `init_anirate`, which reads it --
 * the same one-field-two-callees squeeze the argument stack exists for, solved
 * here by ordering instead, because nothing needs the speed afterwards.
 */
void set_proj_vel(MK3OBJ *obj)
{
    obj->field2c = obj->field08->field28;

    if ((obj->field2c & 0x10u) != 0)
        obj->field1c = (uint32_t)(-(long)obj->field1c);

    obj->field08->field18 = obj->field1c;

    obj->field1c = obj->field20;
    init_anirate(obj);
}


/* setup_proj_obj -- armv7 0x00078250, 36 bytes.  **Complete.**
 *
 *      saved = obj->field40
 *      obj->field40 = 0x3f; get_char_ani(obj)
 *      obj->field48 = obj->field40
 *      get_proj_obj_m(obj)
 *      obj->field40 = saved
 *      obj->field1c = obj->a10
 *
 * Animation 0x3f resolved into 0x48, a slave made, the caller's 0x40 put back,
 * and the new part left in 0x1c for whoever called. **Every projectile in this
 * file starts from the same animation number**, which is what makes 0x3f worth
 * naming when someone gets to the animation tables.
 *
 * The save is a callee-saved register across two calls inside one function --
 * the rule `t_sg_pound` settled, and the third routine in this batch to use it.
 */
void get_char_ani(MK3OBJ *obj);

void setup_proj_obj(MK3OBJ *obj)
{
    uint32_t saved = obj->field40;

    obj->field40 = 0x3f;
    get_char_ani(obj);

    obj->field48 = obj->field40;

    get_proj_obj_m(obj);

    obj->field40 = saved;
    obj->field1c = obj->a10;
}


/* tl_delete_proj_and_die -- armv7 0x00075664, 40 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame+1].w0 = 0x13c6
 *      park 0x16462                     and never wakes
 *
 * **Eleventh 0x16462 site**, and the token 0x13c6 is not in any dispatch -- the
 * routine has no second state. The name says the rest: whatever called it has
 * already deleted the projectile, and this thread is finished.
 *
 * It is reached by `mk3_install` from the projectile drivers at the end of this
 * file, so the thread that flew the projectile is the one that parks.
 */
long tl_delete_proj_and_die(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x13c6;
    thread->fieldfc = 0x16462;              /* and never wakes */
    return 0x16462;
}


/* proj_onscreen_test -- armv7 0x00075714, 52 bytes.  **Complete.**
 * proj_onscreen_test_unsafe -- armv7 0x00075748, 48 bytes.  **Complete.**
 *
 *      x = (int16_t)part->x0e
 *      obj->field5c = (x > left - m && x < right + m)
 *      return obj->field5c
 *
 * where `m` is 0x64 for `proj_onscreen_test` and **0** for the one called
 * unsafe. `left` is `G + 0x468` and `right` is `G + 0x470`.
 *
 * **The names are the wrong way round from what they sound like.** The "unsafe"
 * one is the STRICTER test -- it fails the moment the projectile touches an
 * edge, where the other allows a hundred units of slack outside the view before
 * saying no. So "unsafe" means "will call it offscreen too eagerly", and a
 * caller that deletes a projectile on a false answer would cut it off while it
 * is still visible.
 *
 * Both **return the answer as well as leaving it in 0x5c** -- `ldr r0, [r0,
 * #0x5c]` on the way out, which almost no predicate in this engine bothers to
 * do. Declared `long` on that authority rather than by guessing.
 *
 * This is also the third and fourth routine to read `G + 0x468` and `G + 0x470`
 * as the left and right edges of the view, after `t_another_scorpion` and
 * `t_scorpion_hell` in mkfatal.c. Four sites, one reading, and the pair can now
 * be named without hedging.
 */
long proj_onscreen_test(MK3OBJ *obj)
{
    int32_t x = (int32_t)(int16_t)MK3_FIELD0E(obj->field08);

    obj->field5c =
        (x > (long)(*(uint32_t *)(G_BYTES + 0x468) - 0x64)
         && x < (long)(*(uint32_t *)(G_BYTES + 0x470) + 0x64)) ? 1 : 0;

    return (long)obj->field5c;
}

long proj_onscreen_test_unsafe(MK3OBJ *obj)
{
    int32_t x = (int32_t)(int16_t)MK3_FIELD0E(obj->field08);

    obj->field5c =
        (x > (long)*(uint32_t *)(G_BYTES + 0x468)
         && x < (long)*(uint32_t *)(G_BYTES + 0x470)) ? 1 : 0;

    return (long)obj->field5c;
}


/* proj_strike_check -- armv7 0x00075f5c, 44 bytes.  **Complete.**
 *
 *      if (him->field24 == 0x18) { obj->field5c = 0; return }
 *      saved = obj->field1c
 *      is_jade_protected(obj)
 *      obj->field1c = saved
 *      if (obj->field5c != 0) { obj->field5c = 0; return }
 *      strike_check_a0(obj)
 *
 * **Two fighters cannot be hit by a projectile: Motaro, and Jade while she is
 * protected.** The check is the same shape twice -- ask, then zero the answer
 * and leave -- and only if both say no does the real strike check run.
 *
 * **The Motaro test is inlined here as `cmp r3, #0x18`**, where
 * `local_strike_check_box` below calls `is_he_motaro` for exactly the same
 * question. So character 0x18 is named by number in two places in this file:
 * once in a routine that says so and once buried in a comparison. **That second
 * one belongs with the five in issue #29**, not with the named predicate.
 *
 * `is_jade_protected` clobbers 0x1c, so it is saved in a register across the
 * call -- inside one function, the rule `t_sg_pound` settled.
 */
long is_jade_protected(MK3OBJ *obj);
long strike_check_a0(MK3OBJ *obj);

void proj_strike_check(MK3OBJ *obj)
{
    MK3OBJ  *him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
    uint32_t saved;

    if (him->field24 == 0x18) {                  /* Motaro, inlined */
        obj->field5c = 0;
        return;
    }

    saved = obj->field1c;
    is_jade_protected(obj);
    obj->field1c = saved;

    if (obj->field5c != 0) {
        obj->field5c = 0;
        return;
    }

    strike_check_a0(obj);
}


/* local_strike_check_box -- armv7 0x00075f1c, 64 bytes.  **Complete.**
 *
 *      is_he_motaro(obj)
 *      if (obj->field5c != 0) { obj->field5c = 0; return }
 *      save 0x1c, 0x20 and 0x24
 *      is_jade_protected(obj)
 *      restore 0x1c, 0x20 and 0x24
 *      if (obj->field5c != 0) { obj->field5c = 0; return }
 *      strike_check_box(obj)
 *
 * **The box version of `proj_strike_check`, and the two differ in exactly two
 * places.** This one asks the question through `is_he_motaro` instead of
 * inlining the constant, and it saves **three** fields across
 * `is_jade_protected` where the other saves one -- which is why it pushes `r8`
 * and the other does not.
 *
 * Three fields is what a box needs: 0x1c, 0x20 and 0x24 are three of the four
 * coordinate slots `strike_check_box` reads, and the predicate in the middle
 * would otherwise trample them.
 *
 * Read side by side the pair says what `is_jade_protected` costs: it clobbers at
 * least 0x1c, 0x20 and 0x24, and every caller has to know that.
 */
void strike_check_box(MK3OBJ *obj);

void local_strike_check_box(MK3OBJ *obj)
{
    uint32_t s1c, s20, s24;

    is_he_motaro(obj);
    if (obj->field5c != 0) {
        obj->field5c = 0;
        return;
    }

    s1c = obj->field1c;
    s20 = obj->field20;
    s24 = obj->field24;

    is_jade_protected(obj);

    obj->field1c = s1c;
    obj->field20 = s20;
    obj->field24 = s24;

    if (obj->field5c != 0) {
        obj->field5c = 0;
        return;
    }

    strike_check_box(obj);
}


/* get_bomb_vel -- armv7 0x0007534c, 56 bytes.  **Complete.**
 *
 *      obj->field1c = (int16_t)him->x0e
 *      obj->field20 = (int16_t)part->x0e - obj->field1c
 *      if (obj->field20 < 0) obj->field20 = -obj->field20
 *      obj->field48 = 0x20
 *      obj->field20 = (obj->field20 << 16) / 0x20
 *      obj->field1c = obj->field20
 *
 * **A thirty-two step interpolation, the same idea `t_kiss_orb` uses with
 * sixteen.** The gap between the two fighters is taken in pixels, shifted into
 * 16.16 and divided by 0x20, so the bomb covers it in exactly thirty-two
 * frames whatever the distance. The divisor is published in 0x48 so the caller
 * can count the same thirty-two.
 *
 * The division is the round-toward-zero idiom again --
 * `add.w r2, r3, #0x1f` / `bics.w r3, r3, r3, asr #32` / `it hs` / `movhs` /
 * `asrs #5`, where the carry out of `asr #32` is the sign bit. Exactly C's
 * signed `/ 0x20`, and written as that.
 *
 * The distance is made absolute with the `itt lt` / `rsblt` pair, so the speed
 * comes out positive and `set_proj_vel` signs it by the flip bit afterwards.
 * The two routines are built to be used together and neither duplicates the
 * other's work.
 *
 * **It was declared `long` earlier in this file and it is not** -- the body
 * never touches `r0`, so a `long` caller reads back the object pointer it passed
 * in. Second such declaration corrected in this file, after
 * `q_his_react_flag_set`; both were written from call sites that discard the
 * result, which is the failure mode `tools/protos.py` exists to catch.
 */
void get_bomb_vel(MK3OBJ *obj)
{
    int32_t dx;

    obj->field1c = (uint32_t)(int32_t)(int16_t)
                   MK3_FIELD0E((MK3OBJ *)(void *)(uintptr_t)obj->field00->him);

    obj->field20 = (uint32_t)((int32_t)(int16_t)MK3_FIELD0E(obj->field08)
                              - (int32_t)obj->field1c);
    if ((long)obj->field20 < 0)
        obj->field20 = (uint32_t)(-(long)obj->field20);

    obj->field48 = 0x20;

    dx = (int32_t)(obj->field20 << 16);
    obj->field20 = (uint32_t)(dx / 0x20);        /* thirty-two frames */
    obj->field1c = obj->field20;
}
