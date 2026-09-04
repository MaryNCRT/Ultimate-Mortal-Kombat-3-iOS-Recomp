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
long get_bomb_vel(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
long q_his_react_flag_set(MK3OBJ *obj);
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

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sz_zap_hit);
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
    return mk3_push_handler(thread, (MK3THREADFUNC)tl_delete_proj_and_die);
}
