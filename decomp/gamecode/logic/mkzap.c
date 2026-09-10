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
void is_jade_protected(MK3OBJ *obj);
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


/* ============================================================ t_do_zap
 *
 * armv7 0x000758bc, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = projectile_jumps[obj->field1c]
 *      frame[frame].handler = obj->field1c
 *      frame[frame+1].w0 = 0
 *
 * **This is the projectile dispatcher for the whole game**, and it is sixty-eight
 * bytes: take the kind out of 0x1c, index a table of thread handlers, install
 * what comes back. Every zap, spear, bomb, orb and net in UMK3 starts here.
 *
 * `projectile_jumps` is at **0x00172694, forty-five words**, each a thread entry
 * point with the Thumb bit set. The whole table, because a port needs the
 * numbering and nothing else in the tree gives it:
 *
 *       0 tl_do_kano_zap          15 tl_do_robo_bomb        30 tl_do_smoke_spear
 *       1 tl_do_sonya_zap         16 tl_do_bomb_mid         31 tl_do_motaro_zap
 *       2 tl_do_jax_zap1          17 tl_do_tusk_zap         32 tl_do_kitana_zap
 *       3 tl_do_jax_zap2          18 tl_do_summon           33 tl_do_jade_zap_med
 *       4 tl_do_ind_zap           19 tl_do_st_zap1          34 tl_do_reptile_orb
 *       5 tl_do_sky_ice_on        20 tl_do_st_zap2          35 tl_do_spit
 *       6 tl_do_sky_ice_behind    21 tl_do_st_zap3          36 tl_do_scorpion_spear
 *       7 tl_do_sky_ice_front     22 tl_lk_zap_hi           37 tl_do_jade_zap_hi
 *       8 tl_do_sw_zap            23 tl_lk_zap_lo           38 tl_do_jade_zap_lo
 *       9 tl_do_robo_zap          24 tl_do_sg_zap           39 tl_do_jade_zap_ret
 *      10 tl_do_robo_zap2         25 tl_do_swat_bomb_hi     40 tl_do_reptile_orb_fast
 *      11 tl_do_robo_net          26 tl_do_swat_bomb_lo     41 tl_do_mileena_zap
 *      12 tl_do_sz_zap            27 tl_do_lia_forward_zap  42 tl_do_osz_zap
 *      13 tl_do_lia_anglez        28 tl_do_tusk_floor       43 tl_do_floor_ice
 *      14 tl_do_lao_zap           29 tl_do_sk_zap           44 tl_do_ermac_zap
 *
 * The word after entry 44 is 0x6168636f -- ASCII "ocha" -- so forty-five is the
 * whole table and not a guess about where it stops.
 *
 * **The index is unchecked.** Nothing here compares 0x1c against 45, so a bad
 * kind reads whatever follows the table and installs it as a handler. Whatever
 * fills 0x1c is responsible, and a port that keeps this shape inherits that.
 *
 * The looked-up value is written back into 0x1c on the way past -- one register,
 * two destinations, and 0x1c ends up holding a function pointer. That is a
 * reading of 0x1c the tree has seen before, in `t_crusher_orb` and the
 * `call_a0_for_him` sites.
 */
extern uint32_t projectile_jumps[];              /* 0x00172694, 45 entries */

long t_do_zap(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = projectile_jumps[obj->field1c];   /* unchecked */

    mk3_frame(thread, frame)[1] = obj->field1c;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* ================================== t_boomerang_trail and t_rr_nothing
 *
 * armv7 0x00074f64 and 0x00075538, 68 bytes each.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * **Two names for one function.** The bodies are instruction-for-instruction
 * identical -- same registers, same order, same pointer slot at 0x000f3708 --
 * and they are 1,492 bytes apart. Not a tail call, not a jump: the source had
 * two routines that both do nothing but give the level back, and the compiler
 * emitted both.
 *
 * That is worth saying because it says something about the original source: a
 * do-nothing thread handler was written once per caller and named for what the
 * caller wanted, rather than shared. Expect more of these in this file.
 *
 * The frame index is signed here -- `cmp #0` then `ble`, not `cbz` -- so a
 * negative index takes the install path, exactly as in `t_double_flame_ani`.
 */
long t_local_reaction_exit(MK3THREAD *thread); /* pointer slot 0x000f3708 */

long t_boomerang_trail(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    if ((long)frame > 0) {                  /* cmp #0 / ble: signed */
        thread->frame = frame - 1;          /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_rr_nothing(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    if ((long)frame > 0) {                  /* cmp #0 / ble: signed */
        thread->frame = frame - 1;          /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* tl_do_jade_zap_hi -- armv7 0x000750a8, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = -0xc000
 *      frame[frame].handler = tl_jzap3
 *      frame[frame+1].w0 = 0
 *
 * Entry 37 of `projectile_jumps`, and one of three -- `_hi`, `_lo` and `_med`
 * -- that differ only in the number they put in 0x1c before handing over to the
 * same routine. So the high, low and medium versions of Jade's zap are one
 * routine and three constants, which is the cheapest possible way to write three
 * moves.
 *
 * -0xc000 arrives as a literal pool word rather than a `mvn`, because it does
 * not fit the small-immediate encodings.
 */
long tl_do_jade_zap_hi(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = 0xffff4000u;             /* -0xc000 */

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)tl_jzap3;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* make_dragon_explode -- armv7 0x00076bfc, 60 bytes.  **Complete.**
 *
 *      obj->field1c = 1; ochar_sound(obj)
 *      rightmost_mpart_ob(obj, part)          -> obj->field28
 *      leftmost_mpart_ob(obj, part)           -> obj->field24
 *      obj->field28 = obj->field28 - obj->field24
 *      if (obj->field28 < 0) obj->field28 = -obj->field28
 *      obj->field48 = obj->field28 + 0x100000
 *      make_lineup_explode(obj)
 *
 * **It measures the body and pays for the explosion by the inch.** Both edge
 * helpers are called for their answers, the difference is the width, and the
 * width goes into 0x48 with 0x10 added in the high half -- so 0x48 is a packed
 * pair again, `(0x10 << 16) | width`, and `make_lineup_explode` gets a count and
 * a span rather than a fixed number of pieces.
 *
 * `get_frontmost_point` earlier in this file calls the same two helpers to pick
 * ONE of the two answers; this calls both and subtracts. Two routines, two uses
 * of the same pair, and between them they settle that `leftmost_mpart_ob` writes
 * 0x24 and `rightmost_mpart_ob` writes 0x28 -- which is what mkprop.c recorded
 * and neither routine alone would prove.
 *
 * The absolute value is the `itt lt` / `rsblt` pair, so a mirrored body gives
 * the same width.
 */
void make_lineup_explode(MK3OBJ *obj);

void make_dragon_explode(MK3OBJ *obj)
{
    obj->field1c = 1;
    ochar_sound(obj);

    rightmost_mpart_ob(obj, obj->field08);       /* answers in 0x28 */
    leftmost_mpart_ob(obj, obj->field08);        /* answers in 0x24 */

    obj->field28 = obj->field28 - obj->field24;
    if ((long)obj->field28 < 0)
        obj->field28 = (uint32_t)(-(long)obj->field28);

    obj->field48 = obj->field28 + 0x100000;      /* (0x10 << 16) | width */

    make_lineup_explode(obj);
}


/* ===================================================== is_jade_protected
 *
 * armv7 0x00075ecc, 80 bytes.  **Complete.**
 *
 *      if (him->field24 != 0x10) { q_no(obj); return }       ; not Jade
 *      for (th = TList; th != NULL; th = th->next)
 *          if (th->pid == 0x11f && th->proc->a10 == proc->field00) {
 *              q_yes(obj);
 *              return;
 *          }
 *      q_no(obj)
 *
 * **It searches the live thread list for Jade's flash, and mkstat.c is what
 * created it.** That file's `t_jade_flash` does:
 *
 *      p = NewThreadProcPid(obj, t_jade_flash_proc, 0x11f);
 *      *(uint32_t *)((char *)p + 0x44) = (uint32_t)(uintptr_t)obj;
 *
 * -- a thread with pid 0x11f whose proc's `a10` points back at the fighter that
 * started it. This walks `TList` looking for exactly that, and answers yes when
 * the owner is the fighter being asked about. **Two files, one protocol: the pid
 * is the handshake and 0x44 is the payload.** The mkstat.c note called that 0x44
 * store "the argument slot" without knowing who reads it; this is the reader.
 *
 * So a port must keep the pid. 0x11f is not decoration -- it is how one system
 * finds another system's thread, and it is the only pid in the tree with a
 * measured reader.
 *
 * **Jade is character 0x10**, named by number here as Motaro is 0x18 in
 * `is_he_motaro`. Both are named predicates, so both are the mild form of the
 * hazard in issue #29 rather than the dangerous one.
 *
 * The list link is at offset 0 of a thread, which is where `frame[0]` sits --
 * so a thread on the list has its first frame word standing in as the next
 * pointer, or the two overlap by design. Written as a cast rather than as a
 * struct field because the header does not name it.
 *
 * **It answers only through 0x5c.** It was declared `long` in mkprop.c on the
 * theory that `q_yes` and `q_no` forward a value; they are eight bytes each that
 * write 0x5c and return, so they do not. That declaration has been corrected --
 * the third `long`-from-a-call-site fix in this batch of work, after
 * `q_his_react_flag_set` and `get_bomb_vel`.
 *
 * **There are three `q_yes`/`q_no` pairs in the binary**, at 0x000501ac
 * (moves.c), 0x00067524 (mkdrone.c) and 0x000a85cc (mkboss.c), and this routine
 * calls mkdrone.c's. Whether they are per-file duplicates or one pair the STABS
 * attributes three ways is not settled here; what matters for a port is that one
 * shared `q_yes` reproduces all three, because the body is `field5c = 1`.
 */
void q_yes(MK3OBJ *obj);
void q_no(MK3OBJ *obj);
extern MK3THREAD *TList;                         /* 0x0038ed48 */

void is_jade_protected(MK3OBJ *obj)
{
    MK3THREAD *th;

    if (((MK3OBJ *)(void *)(uintptr_t)obj->field00->him)->field24 != 0x10) {
        q_no(obj);                               /* not Jade */
        return;
    }

    for (th = TList; th != NULL; th = *(MK3THREAD **)(void *)th) {
        if (th->pid != 0x11f)
            continue;

        if ((MK3OBJ *)(void *)(uintptr_t)((MK3OBJ *)th->proc)->a10
            == obj->field00->field00) {
            q_yes(obj);
            return;
        }
    }

    q_no(obj);
}


/* make_lineup_explode -- armv7 0x00076ac4, 72 bytes.  **Complete.**
 *
 *      w  = (int16_t)obj->field48                 ; the low half
 *      sx = part->x0e ; sy = part->x12            ; saved
 *      if (part->field28 & 0x10) w = -w
 *      part->x0e = sx + w                         ; DEAD -- see below
 *      part->x12 = part->x12 + ((int32_t)obj->field48 >> 16)
 *      obj->field1c = 0x10
 *      part->x0e = him->x0e
 *      create_fx(obj)
 *      part->x0e = sx ; part->x12 = sy            ; restored
 *
 * **The width it is given never reaches anything.** `make_dragon_explode` above
 * measures the body, packs `(0x10 << 16) | width` into 0x48 and calls this; the
 * low half is sign-flipped by the facing, added to the part's x, stored -- and
 * then **overwritten with the opponent's x eight instructions later, with no
 * call in between**. The effect is created at the opponent's x and the part's
 * shifted y, and the width is discarded.
 *
 * That is transcribed rather than tidied away, and it is the largest dead store
 * measured in the tree: a whole computation with a flip test in it, feeding a
 * field that is rewritten before anything reads it. Either the source meant
 * `strh` into a different object, or the lineup this routine is named for stopped
 * happening at some point and only the y offset survived.
 *
 * The high half of 0x48 does work: the effect is placed 0x10 above the part.
 *
 * **The part's x and y are borrowed and put back**, so `create_fx` -- which
 * reads the part's position -- can be aimed somewhere else for one call without
 * the caller noticing. Both saves are callee-saved registers across one call,
 * the rule `t_sg_pound` settled.
 */
void make_lineup_explode(MK3OBJ *obj)
{
    MK3OBJ  *part = obj->field08;
    uint16_t sx   = MK3_FIELD0E(part);
    uint16_t sy   = MK3_FIELD12(part);
    int32_t  w    = (int32_t)(int16_t)obj->field48;

    if ((part->field28 & 0x10u) != 0)
        w = -w;

    MK3_SET_FIELD0E(part, (uint32_t)((int32_t)sx + w));   /* dead: rewritten */

    MK3_SET_FIELD12(part,
                    (uint32_t)MK3_FIELD12(part)
                    + (uint32_t)((int32_t)obj->field48 >> 16));

    obj->field1c = 0x10;

    MK3_SET_FIELD0E(part,
                    MK3_FIELD0E((MK3OBJ *)(void *)(uintptr_t)obj->field00->him));

    create_fx(obj);

    MK3_SET_FIELD0E(part, sx);
    MK3_SET_FIELD12(part, sy);
}


/* t_robo_bomb_mid -- armv7 0x000753dc, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      get_bomb_vel(obj)
 *      obj->field1c = (int32_t)obj->field1c >> 1
 *      frame[frame].handler = t_rbomb4
 *      frame[frame+1].w0 = 0
 *
 * **The mid bomb is the full bomb thrown half as hard.** `t_robo_bomb_full`
 * earlier in this file calls the same `get_bomb_vel` and installs the same
 * `t_rbomb4` without the shift, so the two differ in one `asrs`.
 *
 * The shift is arithmetic, so a negative velocity halves the same way -- though
 * `get_bomb_vel` makes its answer positive, so the sign only matters if someone
 * calls this with 0x1c already set.
 */
long t_rbomb4(MK3THREAD *thread);

long t_robo_bomb_mid(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    get_bomb_vel(obj);
    obj->field1c = (uint32_t)((int32_t)obj->field1c >> 1);   /* half */

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_rbomb4;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* tl_projectile_flight_call -- armv7 0x00075918, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      proc->field28 = obj->field34
 *      obj->field1c  = obj->field48
 *      tell_world_stk(obj)
 *      frame[frame].handler = tl_pflt3
 *      frame[frame+1].w0 = 0
 *
 * **It publishes three things and hands over.** 0x34 -- the per-frame callback
 * slot `t_flight_call` reads in mkfatal.c -- is copied into the proc's 0x28, the
 * animation in 0x48 is moved into 0x1c where `tell_world_stk` will resolve it,
 * and the stick that comes back is published in `proc->field84`.
 *
 * So a projectile in flight announces both its callback and its stick before the
 * flight routine starts, and `tell_world_stk` -- which had no caller when it was
 * read four functions ago -- has one now.
 *
 * `proc->field28` is the field the header records as "who the shake is about".
 * Here it holds a function pointer, which is a second reading of that offset and
 * is left as an observation rather than reconciled.
 */
long tl_pflt3(MK3THREAD *thread);

long tl_projectile_flight_call(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field00->field28 = obj->field34;
    obj->field1c          = obj->field48;

    tell_world_stk(obj);

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)tl_pflt3;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* ======================================== t_bomb_call and t_mot_zap_call
 *
 * armv7 0x00075178 and 0x00075120, 88 bytes each.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = part->field1c + G
 *      part->field1c = obj->field1c
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *
 * where **G is 0x6000 for the bomb and 0x5000 for Motaro's zap**, and that
 * single constant is the whole difference between the two functions. Everything
 * else -- registers, order, the `push {r4}` with no `lr` because nothing is
 * called -- is identical.
 *
 * **These are per-frame callbacks, the shape `t_impale_call` has in mkfatal.c**:
 * do one thing and give the level straight back, so the flight routine that
 * calls them keeps control. `t_impale_call` is the elaborate version that seizes
 * the thread when a condition is met; these two never do anything but fall.
 *
 * 0x6000 and 0x5000 are the same two numbers the `t_flight` table carries in its
 * 0x24 column for `t_hit_by_bull` and `t_dino_bucked`. So the engine has one set
 * of fall rates and two ways of applying them -- inside `t_flight`, or by a
 * callback like this. Worth knowing before someone invents a third.
 *
 * The velocity is written to both 0x1c and the part, which is this file's habit:
 * the object's 0x1c is the scratch every helper reads, and the part is where it
 * has to end up.
 */
long t_bomb_call(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c          = obj->field08->field1c + 0x6000;
    obj->field08->field1c = obj->field1c;

    if ((long)thread->frame > 0) {          /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;  /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

long t_mot_zap_call(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c          = obj->field08->field1c + 0x5000;
    obj->field08->field1c = obj->field1c;

    if ((long)thread->frame > 0) {          /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;  /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_bomb_gravity2 -- armv7 0x00075384, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      part->field1c = obj->field1c                 ; the y velocity, as given
 *      obj->field1c  = (int32_t)part->field18 >> 1  ; half the x velocity
 *      part->field18 = obj->field1c
 *      obj->field48  = obj->field48 << 1            ; double the counter
 *      frame[frame].handler = t_bomb_gravity
 *
 * **A bounce.** The y velocity is replaced with whatever the caller left in
 * 0x1c, the x velocity is halved, and then the routine hands over to
 * `t_bomb_gravity` -- the plain version -- so the bomb carries on falling with
 * less forward speed than it had.
 *
 * **0x48 is doubled on the way past**, and `get_bomb_vel` earlier in this file
 * puts 0x20 there as the number of frames the throw is divided into. Doubling it
 * each bounce means each bounce takes twice as long as the last, which is the
 * arithmetic of a ball losing energy -- shorter hops, longer intervals.
 *
 * The x halving is arithmetic, so a bomb thrown left bounces left.
 *
 * The name says it is the second of a pair and it installs the first, so
 * `t_bomb_gravity` is the steady state and this is the one frame where the
 * bounce happens.
 */
long t_bomb_gravity(MK3THREAD *thread);

long t_bomb_gravity2(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field08->field1c = obj->field1c;

    obj->field1c          = (uint32_t)((int32_t)obj->field08->field18 >> 1);
    obj->field08->field18 = obj->field1c;

    obj->field48 = obj->field48 << 1;       /* twice as long next time */

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_bomb_gravity;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* t_lk_prezap_hit -- armv7 0x00077a40, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      saved = obj->field08
 *      obj->field08 = proc->slave           ; drive the slave's part instead
 *      make_dragon_explode(obj)
 *      obj->field08 = saved
 *      delete_slave(obj)
 *      frame[frame].handler = t_lkzap5
 *
 * **It borrows the slave's part for one call.** `make_dragon_explode` measures
 * whatever is in `obj->field08` and blows it up; pointing 0x08 at the slave for
 * the length of that call makes it explode the slave instead of the fighter,
 * and the field goes straight back afterwards.
 *
 * Same idea as `t_kissani`'s two-field swap in mkfatal.c and mkanimal.c's
 * `create_fx_for_him`, and the third spelling of it: **a callee-saved register
 * across one call**, because nothing here has to survive a descent.
 *
 * **It also confirms which slave word is which.** `get_proj_obj_m` puts the new
 * object in `proc->field64` and its PART in `proc->slave` (0x68); this reads 0x68
 * straight into `obj->field08`, which only holds parts. So 0x64 is the object,
 * 0x68 is its part, and the two are not interchangeable.
 *
 * Then `delete_slave` -- an eighth call site, and the first outside mkfatal.c.
 */
void delete_slave(MK3OBJ *obj);
long t_lkzap5(MK3THREAD *thread);

long t_lk_prezap_hit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    MK3OBJ  *saved;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    saved = obj->field08;
    obj->field08 = (MK3OBJ *)(void *)(uintptr_t)obj->field00->slave;

    make_dragon_explode(obj);

    obj->field08 = saved;

    delete_slave(obj);

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_lkzap5;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* t_rocket_explode_fx -- armv7 0x00076950, 96 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0xa; ochar_sound(obj)
 *      obj->a10     = (int16_t)part->x0e
 *      obj->field48 = (int16_t)part->x12
 *      obj->field1c = 5
 *      create_fx(obj)
 *      frame[frame].handler = tl_delete_proj_and_die
 *
 * **`create_fx` can be aimed two ways, and this is the other one.** Here the
 * position is copied into 0x44 and 0x48 as plain coordinates before the call;
 * `make_lineup_explode` earlier in this file instead rewrites the part's own x
 * and y, calls, and puts them back. Two mechanisms for the same helper, in one
 * file, forty functions apart.
 *
 * Which means `create_fx` reads 0x44 and 0x48 when they are set and falls back
 * to the part otherwise -- or reads them always and `make_lineup_explode` is
 * leaving them stale, which would explain why its width never mattered. **Not
 * settled here**; whoever decompiles `create_fx` at 0x00058d70 settles both.
 *
 * The coordinates are sign-extended halfwords widened into full words, so a
 * projectile off the left of the screen keeps a negative x rather than wrapping.
 */
long t_rocket_explode_fx(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = 0xa;
    ochar_sound(obj);

    obj->a10     = (uint32_t)(int32_t)(int16_t)MK3_FIELD0E(obj->field08);
    obj->field48 = (uint32_t)(int32_t)(int16_t)MK3_FIELD12(obj->field08);

    obj->field1c = 5;
    create_fx(obj);

    mk3_frame(thread, frame)[1] =
        (uint32_t)(uintptr_t)tl_delete_proj_and_die;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* ======================== tl_do_reptile_orb and tl_do_reptile_orb_fast
 *
 * armv7 0x0007ac58 and 0x0007acbc, 100 and 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = G + T ; update_tsl(obj)
 *      obj->field20 = A
 *      obj->a10     = 0
 *      zap_init_special_act(obj)
 *      obj->field48 = V
 *      frame[frame].handler = tl_orb3
 *
 *                          T        A       V
 *      slow            0x438     0x21   0x30000
 *      fast            0x43c     0x22   0x70000
 *
 * **Entries 34 and 40 of `projectile_jumps`, and three constants apart.** One
 * timer slot in the globals, one special-act number, one speed -- and the same
 * `tl_orb3` runs both. The fast orb is not a different move; it is the same move
 * with a different row of numbers, which is how this whole file is built.
 *
 * The four extra bytes in the fast one are the address arithmetic:
 * `add.w #0x430` then `adds #0xc` where the slow one fits `add.w #0x438` in a
 * single instruction. The shared-literal habit, applied to a pointer.
 *
 * `G + 0x438` and `G + 0x43c` are adjacent words, so the two orbs have one timer
 * slot each and cannot be in flight at the same time as themselves -- but can be
 * as each other. mkstat.c reaches `G + 0x410 + 0xc` the same way for Jade's
 * flash, so 0x410 onwards is a block of these.
 */
void update_tsl(MK3OBJ *obj);
long tl_orb3(MK3THREAD *thread);

long tl_do_reptile_orb(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x438);
    update_tsl(obj);

    obj->field20 = 0x21;
    obj->a10     = 0;
    zap_init_special_act(obj);

    obj->field48 = 0x30000;

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)tl_orb3;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}

long tl_do_reptile_orb_fast(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x430 + 0xc);
    update_tsl(obj);

    obj->field20 = 0x22;
    obj->a10     = 0;
    zap_init_special_act(obj);

    obj->field48 = 0x70000;

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)tl_orb3;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* ===================================================== the four callbacks
 *
 * Four more of the shape `t_bomb_call` has: do one thing, then pop a level or
 * install `t_local_reaction_exit` at the bottom. What differs is where each one
 * keeps its counter, and between them they show the engine has three places to
 * put one.
 * ======================================================================== */

/* t_orb_calla -- armv7 0x00076534, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      if (--obj->a10 == 0) {
 *          obj->a10     = 3
 *          obj->field1c = 3 + 0xf = 0x12
 *          ochar_sound(obj)
 *      }
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **A tick every third frame**, and the counter is on the OBJECT. Sound 0x12
 * and the reload value 3 come from one register -- `adds r3, #3` on the zero the
 * branch just proved, then `adds r3, #0xf` on that -- so the period and the
 * sound number are welded together by the shared-literal habit even though they
 * have nothing to do with each other.
 */
long t_orb_calla(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->a10 = obj->a10 - 1;
    if (obj->a10 == 0) {
        obj->a10     = 3;
        obj->field1c = 3 + 0xf;             /* the same register */
        ochar_sound(obj);
    }

    if ((long)thread->frame > 0) {          /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;  /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_lao_zap_call -- armv7 0x00075464, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = proc->field2c - 1
 *      if (obj->field1c == 0) obj->field1c = 2
 *      proc->field2c = obj->field1c
 *      obj->field1c  = part->field1c + 0x3000
 *      part->field1c = obj->field1c
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **The counter is on the PROC, and it never reaches zero twice.** 0x2c counts
 * 2, 1, 2, 1 for ever -- decrement, and if that made it zero put 2 back -- which
 * is a two-frame phase that nothing in this routine reads. It is kept for
 * whoever else looks at `proc->field2c`.
 *
 * That is the difference from `t_orb_calla` above: same shape, same tail, but
 * the counter lives on the proc so it outlives the object. The header now has a
 * field for it.
 *
 * The gravity is a plain 0x3000 a frame, a fourth fall rate after 0x2000, 0x5000
 * and 0x6000.
 */
long t_lao_zap_call(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = obj->field00->field2c - 1;
    if (obj->field1c == 0)
        obj->field1c = 2;
    obj->field00->field2c = obj->field1c;

    obj->field1c          = obj->field08->field1c + 0x3000;
    obj->field08->field1c = obj->field1c;

    if ((long)thread->frame > 0) {          /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;  /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_jax_proj_calla -- armv7 0x000768e4, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = proc->field38 - 1
 *      if (obj->field1c == 0) {
 *          obj->field1c = 0xf; create_fx(obj)
 *          obj->field1c = 3
 *      }
 *      proc->field38 = obj->field1c
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **Effect 0xf every third frame, counted on the proc at 0x38.** Same shape as
 * `t_lao_zap_call`, a different word of the same structure, and this one does
 * something when it fires.
 *
 * So the three counters in this batch sit in three different places -- `obj->a10`
 * for the orb, `proc->field2c` for Lao's zap, `proc->field38` for Jax's -- and
 * nothing about the shape says which to use. A port reproduces all three
 * separately; there is no shared slot to factor them into.
 *
 * 0xf is `adds r3, #0xf` on the zero the branch proved, and the reload 3 is a
 * fresh `movs`. So this one does NOT weld the two constants together the way
 * `t_orb_calla` does with 3 and 0x12 -- which is worth noticing, because it means
 * the welding there is the compiler's choice and not a pattern with meaning.
 */
long t_jax_proj_calla(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = obj->field00->field38 - 1;

    if (obj->field1c == 0) {
        obj->field1c = 0xf;
        create_fx(obj);

        obj->field1c = 3;
    }

    obj->field00->field38 = obj->field1c;

    if ((long)thread->frame > 0) {          /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;  /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_rr_up -- armv7 0x000754d0, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      v = part->field1c
 *      obj->field24 = v                              ; DEAD
 *      obj->field20 = rocket_routines[obj->field1c * 3 + 1]
 *      obj->field24 = v - obj->field20
 *      part->field1c = obj->field24
 *      frame[frame].handler = t_rr_nothing
 *
 * **`rocket_routines` is a four-entry script at 0x00172664, twelve bytes each**,
 * and it ends exactly where `projectile_jumps` begins:
 *
 *      [0]  t_rr_nothing    0x3333   0x0008
 *      [1]  t_rr_up         0xa000   0x0010
 *      [2]  t_rocket_hunt   0x3333   0x3333
 *      [3]  0               0        0          <- terminator
 *
 * So a rocket runs a phase list: each entry names the handler for that phase, an
 * amount and something that reads like a duration. This routine is entry 1's own
 * handler and reads entry `obj->field1c`'s **amount** -- 0xa000 when it is
 * running its own phase -- and subtracts it from the y velocity, which is what
 * makes the rocket climb.
 *
 * The stride is computed as `index << 4` minus `index << 2` rather than by a
 * multiply, which is the twelve-byte giveaway.
 *
 * **`obj->field24 = v` before the table read is dead** -- overwritten four
 * instructions later with `v - amount`, nothing in between. Transcribed; tenth
 * dead store recorded.
 *
 * It hands over to `t_rr_nothing`, which is entry 0's handler and does nothing
 * at all, so a phase that has done its work parks the rocket on the do-nothing
 * entry rather than advancing the index.
 */
extern uint32_t rocket_routines[];               /* 0x00172664, 4 x 12 bytes */

long t_rr_up(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t v;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    v = obj->field08->field1c;
    obj->field24 = v;                            /* dead: rewritten below */

    obj->field20 = rocket_routines[obj->field1c * 3 + 1];

    obj->field24          = v - obj->field20;
    obj->field08->field1c = obj->field24;

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_rr_nothing;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* t_target -- armv7 0x00078274, 108 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c = 0
 *                       -- falls into the step --
 *
 *      the step:        frame_a9(obj)
 *                       obj->field1c = 5
 *                       -- falls into the placement --
 *
 *      the placement:   part->x0e = (uint16_t)him->x0e - 0x10
 *                       part->x12 = (uint16_t)him->x12 + 0x20
 *                       token := 0xfd4, park 1
 *
 *      token == 0xfd4:  if (--obj->field1c != 0) -- the placement --
 *                       -- the step --
 *
 *      otherwise:       return -3
 *
 * **A reticle that follows the opponent every frame and animates every fifth.**
 * The placement runs on all of them -- sixteen units left of the victim and
 * thirty-two below -- and the counter in 0x1c only decides when `frame_a9`
 * advances the picture.
 *
 * **The offsets are unsigned halfword arithmetic**: `ldrh`, add or subtract,
 * `strh`. So a target 0x10 to the left of a victim standing at x = 8 wraps to
 * 0xfff8 rather than going negative, and whatever draws it has to read the
 * halfword the same way. `t_chop_off_his_height` in mkfatal.c reads the same
 * class of field unsigned and `lifts3` reads it signed; this is a third site and
 * it sides with the unsigned reading.
 *
 * The park is 1 in every state, so the routine costs a frame per frame and never
 * ends on its own.
 */
void frame_a9(MK3OBJ *obj);

long t_target(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    MK3OBJ  *him;
    int      step;

    if (token == 0) {
        obj->field1c = 0;
        step = 1;

    } else if (token == 0xfd4) {
        obj->field1c = obj->field1c - 1;
        step = (obj->field1c == 0);

    } else {
        return -3;
    }

    if (step) {
        frame_a9(obj);
        obj->field1c = 5;
    }

    him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;

    MK3_SET_FIELD0E(obj->field08, (uint32_t)MK3_FIELD0E(him) - 0x10);
    MK3_SET_FIELD12(obj->field08, (uint32_t)MK3_FIELD12(him) + 0x20);

    *mk3_frame(thread, frame + 1) = 0xfd4;
    thread->fieldfc = 1;
    return 1;
}


/* t_doice3 -- armv7 0x000778c4, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      is_he_right(obj)
 *      if (obj->field5c == 0) obj->field48 = -obj->field48
 *      frame[frame].handler = t_doice5
 *
 * **One conditional negation and a hand-over.** The whole routine exists to
 * point 0x48 the right way before `t_doice5` runs, which is the same job
 * `set_proj_vel` does for 0x1c -- except that one reads the part's flip bit and
 * this one asks `is_he_right`.
 *
 * **Two ways to answer the same question**, then: the flip bit says which way
 * the fighter is DRAWN and `is_he_right` says where the opponent actually is.
 * They agree most of the time and a port must not substitute one for the other.
 *
 * The compiler emitted the install twice, once per branch, rather than joining
 * them -- so the function is 112 bytes for what is four instructions of work.
 */
long is_he_right(MK3OBJ *obj);
long t_doice5(MK3THREAD *thread);

long t_doice3(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    is_he_right(obj);
    if (obj->field5c == 0)
        obj->field48 = (uint32_t)(-(long)obj->field48);

    mk3_frame(thread, frame)[1] = (uint32_t)(uintptr_t)t_doice5;
    *mk3_frame(thread, frame + 1) = 0;
    return 0;
}


/* t_sg_trail_spawn -- armv7 0x00076a54, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = proc->field2c - 1
 *      if (obj->field1c <= 0) {
 *          obj->field1c = 0x35; create_fx(obj)
 *          obj->field1c = 4
 *      }
 *      proc->field2c = obj->field1c
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **The third counter-on-the-proc callback**, after `t_lao_zap_call` and
 * `t_jax_proj_calla`. It shares 0x2c with the first of those, so two different
 * projectiles cannot be counting there at once -- which is fine, because a proc
 * belongs to one fighter and a fighter has one projectile in the air.
 *
 * The test is `ble` where `t_jax_proj_calla` uses `cbz`, so a counter that
 * somehow went negative fires here and hangs there. The difference costs nothing
 * and is transcribed as `<= 0` rather than normalised to `== 0`.
 *
 * Effect 0x35 every four frames leaves the trail the name promises.
 */
long t_sg_trail_spawn(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;

    if (*mk3_frame(thread, frame + 1) != 0)
        return -3;

    obj->field1c = obj->field00->field2c - 1;

    if ((long)obj->field1c <= 0) {              /* ble, not cbz */
        obj->field1c = 0x35;
        create_fx(obj);

        obj->field1c = 4;
    }

    obj->field00->field2c = obj->field1c;

    if ((long)thread->frame > 0) {              /* cmp #0 / ble: signed */
        thread->frame = thread->frame - 1;      /* back up a level */
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}
