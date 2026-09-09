/*
 * mkstat.c -- gamecode/logic/mkstat.c, decompiled.
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

long t_retract_strike_act(struct MK3THREAD *thread);

/* t_retract_strike -- armv7 0x0004cb48, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_retract_strike_act
 *      frame[frame+1].w0 = 0
 */

long t_retract_strike(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_retract_strike_act);
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

long create_blood_proc(MK3OBJ *obj);

/* upcut_blood_me -- armv7 0x0004f05c, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 0x1
 *      create_blood_proc(obj)
 */
void upcut_blood_me(MK3OBJ *obj)
{
    obj->field1c = 0x1;
    create_blood_proc(obj);
}


/* jade_normpal -- armv7 0x0004fd00, 12 bytes.  **Complete.**
 *
 *      player_normpal(obj)
 */
void jade_normpal(MK3OBJ *obj)
{
    player_normpal(obj);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

void set_half_damage(struct MK3THREAD *thread);
long t_act_mframew(struct MK3THREAD *thread);
long t_axeup3(struct MK3THREAD *thread);
long t_local_reaction_exit(struct MK3THREAD *thread);
long t_victory_animation(struct MK3THREAD *thread);
void call_a0_for_him(MK3OBJ *obj);
void clear_inviso(MK3OBJ *obj);
void death_blow_complete(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

/* t_do_block_hi -- armv7 0x0004cea0, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      stop_me_player(obj)
 *      obj->field40 = 0xc
 *      get_char_ani(obj)
 *      obj->field1c = 0x3
 *      obj->field20 = 0x700
 *      frame[frame].handler = t_act_mframew
 *      frame[frame+1].w0 = 0
 */

long t_do_block_hi(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stop_me_player(obj);
    obj->field40 = 0xc;
    get_char_ani(obj);
    obj->field1c = 0x3;
    obj->field20 = 0x700;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_act_mframew);
}

/* tl_stat_do_fast_axe_up -- armv7 0x0004d078, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = set_half_damage
 *      call_a0_for_him(obj)
 *      obj->field40 = 0x20002
 *      obj->field48 = 0x4
 *      frame[frame].handler = t_axeup3
 *      frame[frame+1].w0 = 0
 */

long tl_stat_do_fast_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = (uint32_t)(uintptr_t)set_half_damage;
    call_a0_for_him(obj);
    obj->field40 = 0x20002;
    obj->field48 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_axeup3);
}

/* t_do_un_inviso -- armv7 0x0004f684, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      clear_inviso(obj)
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 */

long t_do_un_inviso(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    clear_inviso(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* tl_babality_complete -- armv7 0x0004fcb4, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      death_blow_complete(obj)
 *      player_normpal(obj)
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long tl_babality_complete(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    death_blow_complete(obj);
    player_normpal(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_jump_up_land_jsrp(MK3THREAD *thread);
long t_ret9(MK3THREAD *thread);

/* t_retract_strike_act -- armv7 0x0004cadc, 108 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x737, then descend into t_act_mframew
 *      token == 0x737:
 *          frame[frame].handler = t_ret9
 *      otherwise:  return -3
 */
long t_retract_strike_act(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x737;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_act_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x737)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_ret9);
}

/* t_jump_up_land_jump -- armv7 0x0004cd30, 112 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x9ad, then descend into t_jump_up_land_jsrp
 *      token == 0x9ad:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_jump_up_land_jump(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x9ad;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_jump_up_land_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x9ad)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_mframew(MK3THREAD *thread);
long tl_delete_proj_and_die(MK3THREAD *thread);
void get_char_ani2(MK3OBJ *obj);

/* t_scream_wave -- armv7 0x0004d8c0, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x1
 *          get_char_ani2(obj)
 *          obj->field1c = 0x5
 *          token := 0x643, then descend into t_mframew
 *      token == 0x643:
 *          frame[frame].handler = tl_delete_proj_and_die
 *      otherwise:  return -3
 */
long t_scream_wave(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x1;
        get_char_ani2(obj);
        obj->field1c = 0x5;
        *mk3_frame(thread, thread->frame + 1) = 0x643;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x643)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)tl_delete_proj_and_die);
}


/* --------------------------------------------------------------- update_block_fk
 *
 * armv7 0x0004d3d0, 28 bytes.  **Complete.**
 *
 *      obj->field1c = (uint32_t)(G + 0x420 + 4)
 *      update_tsl(obj)
 *
 * 0x1c carries an ADDRESS into update_tsl, not a number -- `G + 0x424`, built as
 * 0x420 then plus 4 because the compiler had 0x420 in hand. The same field-as-
 * argument convention `call_a0_for_him` uses, here with a data pointer instead of
 * a routine.
 */
void update_tsl(MK3OBJ *obj);

void update_block_fk(MK3OBJ *obj)
{
    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x420 + 4);
    update_tsl(obj);
}

/* ------------------------------------------------------------- update_l_block_fk
 *
 * armv7 0x0004d060, 24 bytes.  **Complete.**
 *
 *      if (obj->field18 != 0) {
 *          obj->field1c = (uint32_t)update_block_fk
 *          call_a0_for_him(obj)
 *      }
 *
 * **The A0 mechanism at its smallest**: the whole routine is "if this fighter is
 * doing something, run update_block_fk on the OTHER one". The routine handed
 * across is the one directly above, so the pair is a local and a remote spelling
 * of the same update.
 */
void update_block_fk(MK3OBJ *obj);

void update_l_block_fk(MK3OBJ *obj)
{
    if (obj->field18 != 0) {
        obj->field1c = (uint32_t)(uintptr_t)update_block_fk;
        call_a0_for_him(obj);
    }
}

/* -------------------------------------------------------------- next_lao_anirate
 *
 * armv7 0x0004d89c, 36 bytes.  **Complete.**
 *
 *      next_anirate(obj)
 *      if (--obj->a10 == 0) {
 *          obj->field1c = 6
 *          ochar_sound(obj)
 *          obj->a10 = 0x1e
 *      }
 *
 * **A sound every thirty frames, on top of the ordinary rate step.** 0x44 counts
 * down and is reloaded with 0x1e when it runs out, so sound 6 plays once per
 * thirty calls -- the spin's repeating whoosh. The 6 is built as `adds r3, #6` on
 * a register the branch has just proved to be zero, which is why nothing loads it.
 */
long next_anirate(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);

void next_lao_anirate(MK3OBJ *obj)
{
    next_anirate(obj);

    obj->a10 = obj->a10 - 1;
    if (obj->a10 == 0) {
        obj->field1c = 6;
        ochar_sound(obj);
        obj->a10 = 0x1e;
    }
}

/* --------------------------------------------------------------- air_combo_setup
 *
 * armv7 0x0004d0d0, 68 bytes.  **Complete.**
 *
 *      obj->field1c = obj->field00->field28
 *      if (that == 0) {
 *          obj->field1c = (uint32_t)set_no_block
 *          call_a0_for_him(obj)
 *      }
 *      ground_player(obj); match_me_with_him(obj); flip_multi(obj)
 *      obj->field1c = ~0x3f = -0x40
 *      obj->field20 = -0x40 + 0x40 = 0
 *      multi_adjust_xy(obj)
 *
 * **Blocking is taken off the other fighter only when the proc's 0x28 is
 * clear**, through the A0 mechanism again -- `set_no_block` off pointer slot
 * 0x000f3184. A non-zero 0x28 means somebody already did it and the call is
 * skipped.
 *
 * The adjust pair is -0x40 and 0, built from one `mvn` and one `adds`, so the
 * fighter is moved sixty-four units along the first axis and none along the
 * second.
 */
void set_no_block(MK3OBJ *obj);                  /* pointer slot 0x000f3184 */
void match_me_with_him(MK3OBJ *obj);
void flip_multi(MK3OBJ *obj);
void ground_player(MK3OBJ *obj);
void multi_adjust_xy(MK3OBJ *obj);

void air_combo_setup(MK3OBJ *obj)
{
    obj->field1c = obj->field00->field28;
    if (obj->field1c == 0) {
        obj->field1c = (uint32_t)(uintptr_t)set_no_block;
        call_a0_for_him(obj);
    }

    ground_player(obj);
    match_me_with_him(obj);
    flip_multi(obj);

    obj->field1c = (uint32_t)~0x3fu;
    obj->field20 = (uint32_t)(~0x3fu + 0x40u);
    multi_adjust_xy(obj);
}


/* ------------------------------------------------------------- tl_stat_do_axe_up
 *
 * armv7 0x0004ca98, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0xa
 *      obj->field40 = 0x00030002
 *      frame[frame].handler = t_axeup3
 *      frame[frame+1].w0 = 0
 *
 * Two constants and an install. **0x40 arrives packed again** -- 0x00030002,
 * a fifth site for that shape after 0x0005000d, 0x00040021, 0x00040047 and
 * 0x00030021, and the first to feed a routine other than t_animate_a9. The high
 * half is 3 and the low half 2, both small, which fits the two-independent-halves
 * reading and still does not name either.
 */
long t_axeup3(MK3THREAD *thread);

long tl_stat_do_axe_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0xa;
    obj->field40 = 0x00030002;

    return mk3_install(thread, (MK3THREADFUNC)t_axeup3);
}

/* -------------------------------------------------------------- noogy_early_check
 *
 * armv7 0x0004e320, 72 bytes.  **Complete.**
 *
 *      if ((int16)obj->field00->field7c != 0)
 *          obj->field1c = (uint32_t)(G + 0x3a8)
 *      else
 *          obj->field1c = (uint32_t)(G + 0x3ac)
 *      get_tsl_px(obj, obj)
 *      if (obj->field20 > 7) {
 *          obj->field1c = 1
 *          obj->field00->field28 = 1
 *      }
 *
 * **Which of two per-player halfword sets is consulted depends on the
 * four-button gate.** proc+0x7c is that gate, read signed with `ldrsh` as it is
 * everywhere else; non-zero picks the set at G + 0x3a8 and zero the one at
 * G + 0x3ac. `read_lp_tick_state` reads the second of the two directly, and
 * `t_jax_slam_sleep` hands the first to the same `get_tsl_px`, so the four bytes
 * between them separate two button histories rather than two players.
 *
 * More than seven raises a flag in the proc's 0x28 -- the same field
 * air_combo_setup tests before taking blocking away -- so a long enough press is
 * what this routine is checking for and 0x28 is where it says so.
 */
void get_tsl_px(MK3OBJ *obj, MK3OBJ *ref);

void noogy_early_check(MK3OBJ *obj)
{
    if ((int16_t)obj->field00->field7c != 0)
        obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x3a8);
    else
        obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x3ac);

    get_tsl_px(obj, obj);

    if ((long)obj->field20 > 7) {
        obj->field1c = 1;
        obj->field00->field28 = 1;
    }
}

/* ------------------------------------------------------------------------ t_ret9
 *
 * armv7 0x0004d84c, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      back_to_normal(obj)
 *      if (thread->frame > 0) thread->frame -= 1
 *      else frame[frame].handler = t_local_reaction_exit
 *
 * One call and a pop -- the plain "put the fighter back and hand this level
 * back" routine, with the same empty-stack fallback the whole logic module uses.
 */
void back_to_normal(MK3OBJ *obj);

long t_ret9(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    back_to_normal(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------- t_do_stationary
 *
 * armv7 0x0004cda0, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      h = stat_jumps[obj->field1c]
 *      obj->field1c = h
 *      frame[frame].handler = h ? h : t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * **A jump table indexed by 0x1c, not by the character.** `t_do_body_slam` and
 * `t_do_air_slam` index their tables by `obj->field08->field24`; this one uses
 * whatever the caller left in 0x1c, so it is a dispatch on the requested move
 * rather than on who is performing it. A zero entry falls back to
 * t_local_reaction_exit, which is how the table encodes "no such move" without a
 * bound check.
 *
 * The fallback path writes the loaded zero into the token slot, so the same
 * register serves as both the missing handler and the zero the install needs.
 */
extern uint32_t stat_jumps[];                    /* 0x00167434 */

long t_do_stationary(MK3THREAD *thread)
{
    MK3OBJ  *obj = (MK3OBJ *)thread->proc;
    uint32_t h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    h = stat_jumps[obj->field1c];
    obj->field1c = h;

    if (h != 0) {
        mk3_frame(thread, thread->frame)[1] = h;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ------------------------------------------------------------- t_stat_do_hi_kick
 *
 * armv7 0x0004e660, 108 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      init_special(obj)
 *      obj->field1c = 0
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 0
 *      rsnd_func(obj, 0xf)
 *      obj->field1c = 0; group_sound(obj)
 *      obj->field1c = 1
 *      obj->field48 = 0
 *      obj->field20 = 1 + 0x102 = 0x103
 *      obj->field40 = 0x103 - 0xf2 = 0x11
 *      frame[frame].handler = t_kick2
 *
 * **This and t_stat_do_lo_kick are the same routine with one added to three
 * numbers.** High kick: action 0x103, animation 0x11, proc+0x58 and 0x48 both
 * zero. Low kick: action 0x104, animation 0x12, both of those one. So the pair
 * encodes height as a single increment in three places at once, and 0x48 and the
 * proc's 0x58 carry it as a flag while 0x20 and 0x40 carry it as an index.
 *
 * proc+0x58 is inside a pad in this header, so it is written by offset.
 *
 * The 0xf handed to rsnd_func is the same in both, and 0x1c is zeroed twice --
 * once for the proc store and once for group_sound.
 */
void init_special(MK3OBJ *obj);
void group_sound(MK3OBJ *obj);
long t_kick2(MK3THREAD *thread);

long t_stat_do_hi_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    obj->field1c = 0;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 0;
    rsnd_func(obj, 0xf);

    obj->field1c = 0;
    group_sound(obj);

    obj->field1c = 1;
    obj->field48 = 0;
    obj->field20 = 1 + 0x102;
    obj->field40 = (1 + 0x102) - 0xf2;

    return mk3_install(thread, (MK3THREADFUNC)t_kick2);
}

/* ------------------------------------------------------------- t_stat_do_lo_kick
 *
 * armv7 0x0004e6cc, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      init_special(obj)
 *      rsnd_func(obj, 0xf)
 *      obj->field1c = 0; group_sound(obj)
 *      obj->field40 = 0x12
 *      *(uint32_t *)((char *)obj->field00 + 0x58) = 0x12 - 0x11 = 1
 *      obj->field1c = 1
 *      obj->field48 = 1
 *      obj->field20 = 0x104
 *      frame[frame].handler = t_kick2
 *
 * t_stat_do_hi_kick with 1 where that has 0 and the next number where it has the
 * previous one. The order of the stores differs -- this one sets 0x40 first and
 * derives the flag from it, the other sets the flag first and derives 0x40 from
 * the action -- but the values that land are the pair described above.
 */
long t_stat_do_lo_kick(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);
    rsnd_func(obj, 0xf);

    obj->field1c = 0;
    group_sound(obj);

    obj->field40 = 0x12;
    *(uint32_t *)((char *)obj->field00 + 0x58) = 0x12 - 0x11;
    obj->field1c = 1;
    obj->field48 = 1;
    obj->field20 = 0x104;

    return mk3_install(thread, (MK3THREADFUNC)t_kick2);
}
