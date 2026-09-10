/*
 * mkfatal.c -- gamecode/logic/mkfatal.c, decompiled.
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

/* 0x001664d4, and the symbol table puts it in __DATA,__data -- NOT a routine.
 * An earlier pass declared it `long a_sb_skeleton_burn(MK3THREAD *)` because the
 * only thing reaching it was `obj->field40 = <address>`, which is exactly what a
 * handler store looks like. It is a word list, the same shape as the twenty
 * `a_<animal>` lists in mkanimal.c, and `t_robo_skeleton_burn` below proves it by
 * entering it at +8 -- an offset that would be meaningless on a function. */
extern uint32_t a_sb_skeleton_burn[];

long t_skburn3(struct MK3THREAD *thread);

/* t_sb_skeleton_burn -- armv7 0x0003322c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = a_sb_skeleton_burn
 *      frame[frame].handler = t_skburn3
 *      frame[frame+1].w0 = 0
 */

long t_sb_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = (uint32_t)(uintptr_t)a_sb_skeleton_burn;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_skburn3);
}


/* The callees these reach, declared from what the call sites
 * pass. One written later with a different signature will
 * conflict here, which is what the check is for. */
long do_next_a9_frame(MK3OBJ *obj);

/* rip_ani -- armv7 0x00036e94, 12 bytes.  **Complete.**
 *
 * A tail call to `do_next_a9_frame` with the arguments untouched, so whatever the
 * caller put in r1 goes with them. */
long rip_ani(MK3OBJ *obj)
{
    return do_next_a9_frame(obj);
}




/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_victory_animation(struct MK3THREAD *thread);

/* t_null_fatality -- armv7 0x00032f40, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_victory_animation
 *      frame[frame+1].w0 = 0
 */

long t_null_fatality(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_victory_animation);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_wait_forever(struct MK3THREAD *thread);
void away_x_vel(MK3OBJ *obj);
void back_to_normal(MK3OBJ *obj);
void center_around_me(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
void death_scream(MK3OBJ *obj);
void get_char_ani2(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void set_inviso(MK3OBJ *obj);
long create_blood_proc(MK3OBJ *obj);
void face_opponent_px(MK3OBJ *obj, MK3OBJ *target);
void group_sound(MK3OBJ *obj);
void call_for_him(MK3OBJ *obj, void (*fn)(MK3OBJ *));
void takeover_him(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void ochar_sound(MK3OBJ *obj);
void match_me_with_him(MK3OBJ *obj);
void flip_multi(MK3OBJ *obj);
void multi_adjust_xy(MK3OBJ *obj);
void create_fx_xy(MK3OBJ *obj, uint32_t x, uint32_t y);
void send_code_a3(MK3OBJ *obj);
void ground_player(MK3OBJ *obj);
void init_special(MK3OBJ *obj);
void frame_a9(MK3OBJ *obj);
long t_local_reaction_exit(MK3THREAD *thread);
long t_animate_a0_frames(MK3THREAD *thread);
long t_shake_ob_up(MK3THREAD *thread);

/* t_scorp_skeleton_burn -- armv7 0x0003424c, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      center_around_me(obj)
 *      frame[frame].handler = t_sb_skeleton_burn
 *      frame[frame+1].w0 = 0
 */

long t_scorp_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    center_around_me(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_sb_skeleton_burn);
}

/* t_r_vomit -- armv7 0x0003511c, 88 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      set_inviso(obj)
 *      obj->a10 = 0x5
 *      obj->field1c = 0x14
 *      create_fx(obj)
 *      death_scream(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_r_vomit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    set_inviso(obj);
    obj->a10 = 0x5;
    obj->field1c = 0x14;
    create_fx(obj);
    death_scream(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_about_2b_ripped -- armv7 0x0003a9cc, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      face_opponent(obj)
 *      back_to_normal(obj)
 *      obj->field40 = 0x25
 *      pose_a9_manual(obj)
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_about_2b_ripped(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    face_opponent(obj);
    back_to_normal(obj);
    obj->field40 = 0x25;
    pose_a9_manual(obj);
    do_next_a9_frame(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */


/* ---------------------------------------------- the five smallest in the file
 *
 * Read one at a time from the disassembly. Each is complete: every
 * instruction is accounted for.
 */

/* death_scream -- armv7 0x00034fc4, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 9
 *      group_sound(obj)
 *
 * Sound 9 through the group router, which is how everything in this directory
 * asks for a noise: the id goes in 0x1c and the call takes it from there.
 * It ends `bl group_sound; pop {r7, pc}` -- a call and a return, so whatever
 * r0 holds afterwards belongs to the callee and this gives nothing back.
 */
void death_scream(MK3OBJ *obj)
{
    obj->field1c = 9;
    group_sound(obj);
}


/* his_death_scream -- armv7 0x00034cf0, 20 bytes.  **Complete.**
 *
 *      call_for_him(obj, death_scream)
 *
 * The same scream, run on the OTHER fighter. `call_for_him` is this
 * directory's way of doing something to the opponent without holding a
 * pointer to him: hand it a routine and it supplies the other object.
 *
 * `death_scream` arrives as a pc-relative literal with the Thumb bit set
 * (0x00034fc5 for a function at 0x00034fc4), which is how every function
 * pointer in this binary is spelled.
 */
void his_death_scream(MK3OBJ *obj)
{
    call_for_him(obj, death_scream);
}


/* make_him_invisible -- armv7 0x00034cdc, 20 bytes.  **Complete.**
 *
 *      call_for_him(obj, set_inviso)
 *
 * Same shape, different routine -- but the pointer is fetched DIFFERENTLY.
 * `his_death_scream` gets its target as a pc-relative address computed in
 * place; this one loads a pointer slot at 0x000f36c8 and dereferences it:
 *
 *      ldr r1, [pc, #8]
 *      add r1, pc          ; -> 0x000f36c8
 *      ldr r1, [r1]        ; -> 0x00054f71, _set_inviso
 *
 * The extra load is the difference between a function in this translation
 * unit and one in another. `set_inviso` lives in other.c.
 */
void make_him_invisible(MK3OBJ *obj)
{
    call_for_him(obj, set_inviso);
}


/* make_him_face_me -- armv7 0x000336d8, 16 bytes.  **Complete.**
 *
 *      face_opponent_px(obj, obj->field00->field00)
 *
 * Two loads to reach the other fighter -- through the PROC and out its first
 * field -- and the pair handed to the turn routine.
 *
 * The name is exact, and it takes reading `flip_multi_px` to see why:
 * that function does not read r0 at all. It flips `target->field08->field28`,
 * so the SECOND argument is the one that turns. `face_opponent(obj)` passes
 * obj twice and turns itself; this passes him, and turns him.
 */
void make_him_face_me(MK3OBJ *obj)
{
    face_opponent_px(obj, obj->field00->field00);
}


/* pounded_blood -- armv7 0x0003aa28, 16 bytes.  **Complete.**
 *
 *      obj->field1c = 1
 *      create_blood_proc(obj)
 *
 * `death_scream` with a different routine and a different constant: one goes
 * in 0x1c and the call reads it. Blood type 1.
 */
void pounded_blood(MK3OBJ *obj)
{
    obj->field1c = 1;
    create_blood_proc(obj);
}


/* sans_repell_for_good -- armv7 0x00033450, 24 bytes.  **Complete.**
 *
 *      obj->field1c = 0x500
 *      *(uint16_t *)(G + 0x456) = 0x500
 *
 * The `sans_repell` pair in other.c writes its constant to **0x38** and to
 * the same halfword in the global state. This one writes **0x1c**. Same
 * global, same halfword, different field on the object -- recorded rather
 * than smoothed over, because nothing here says which of the two slots the
 * repel test actually reads.
 *
 * 0x500 fits a halfword exactly, so nothing is lost on the narrow store.
 */
void sans_repell_for_good(MK3OBJ *obj)
{
    obj->field1c = 0x500;
    *(uint16_t *)(G_BYTES + 0x456) = 0x500;
}


/* wfe_him -- armv7 0x0003361c, 24 bytes.  **Complete.**
 *
 *      obj->field38 = t_wait_forever
 *      takeover_him(obj)
 *
 * "wfe" is wait-forever, and the name is literal: it parks the OTHER fighter.
 *
 * 0x38 is where `fastxfer_thread` reads a thread entry point from, so writing
 * a function there and calling `takeover_him` is how one object hands the
 * other a routine to run. During a fatality the victim has nothing left to
 * do, and this is what stops him doing it.
 *
 * The pointer comes through a slot at 0x000f3724 holding 0x00054e49 -- the
 * odd address is `t_wait_forever` at 0x00054e48 with the Thumb bit set.
 */
void wfe_him(MK3OBJ *obj)
{
    obj->field38 = (uint32_t)(uintptr_t)t_wait_forever;
    takeover_him(obj);
}


/* borrow_char_ani -- armv7 0x00035210, 28 bytes.  **Complete.**
 *
 *      proc = obj->field08
 *      obj->field20 = proc->field24        ; save
 *      proc->field24 = obj->field1c        ; lend
 *      get_char_ani(obj)
 *      obj->field08->field24 = obj->field20 ; give back
 *
 * The borrow-and-restore this directory does everywhere, and here the name
 * says so outright. `get_char_ani` reads the character out of +0x24; this puts
 * a different one there for the length of one call and puts the real one back,
 * so a fatality can look up somebody else's animation.
 *
 * The lending happens on **0x08, the other object**, not on the PROC -- the
 * same field `get_block_ani_offset` reads the character and the current
 * animation through. 0x20 is the scratch slot, and 0x08 is re-loaded after the
 * call rather than kept, because the compiler assumed the callee could have
 * moved it.
 */
void borrow_char_ani(MK3OBJ *obj)
{
    MK3OBJ *other = obj->field08;

    obj->field20 = other->field24;
    other->field24 = obj->field1c;

    get_char_ani(obj);

    obj->field08->field24 = obj->field20;
}


/* hele_sound -- armv7 0x00034044, 28 bytes.  **Complete.**
 *
 *      obj->field1c = 0x1d; ochar_sound(obj)
 *      obj->field1c = 0x1e; ochar_sound(obj)
 *
 * Two sounds, back to back, 0x1d then 0x1e. The object is kept in r4 across
 * the first call and put back in r0 for the second, which is the whole reason
 * this function pushes a register at all.
 *
 * **The pair is the house idiom for a noise, and this is the only one with a name.**
 * `t_nado_sounds` later in this file plays 6 and 7 the same way, and mkanimal.c plays
 * 0x24 and 0x25 through `tsound_func` in three separate routines. So a sound effect here
 * is routinely two samples fired with nothing between them; do not read the second call
 * as a different event.
 */
void hele_sound(MK3OBJ *obj)
{
    obj->field1c = 0x1d;
    ochar_sound(obj);

    obj->field1c = 0x1e;
    ochar_sound(obj);
}


/* scared_pose -- armv7 0x00035d84, 28 bytes.  **Complete.**
 *
 *      obj->field40 = 0x48
 *      pose_a9_manual(obj)
 *      face_opponent(obj)
 *      death_scream(obj)
 *
 * Animation 0x48, posed by hand, turned to face the winner, and a scream.
 * The three calls in that order are the whole reaction.
 */
void scared_pose(MK3OBJ *obj)
{
    obj->field40 = 0x48;
    pose_a9_manual(obj);
    face_opponent(obj);
    death_scream(obj);
}


/* fatal_offset -- armv7 0x00035650, 32 bytes.  **Complete.**
 *
 *      s1 = obj->field1c; s2 = obj->field20
 *      match_me_with_him(obj)
 *      flip_multi(obj)
 *      obj->field1c = s1; obj->field20 = s2
 *      multi_adjust_xy(obj)
 *
 * Borrow and restore again, this time around TWO calls. `match_me_with_him`
 * and `flip_multi` both use 0x1c and 0x20 as working space, so the caller's
 * values are put back before `multi_adjust_xy` reads them.
 *
 * Which is what the name is about: the offset survives the positioning.
 */
void fatal_offset(MK3OBJ *obj)
{
    uint32_t s1 = obj->field1c;
    uint32_t s2 = obj->field20;

    match_me_with_him(obj);
    flip_multi(obj);

    obj->field1c = s1;
    obj->field20 = s2;

    multi_adjust_xy(obj);
}


/* lifts3 -- armv7 0x00033138, 36 bytes.  **Complete.**
 *
 *      d = obj->field24
 *      a = (MK3OBJ *)obj->field1c
 *      obj->field20 = (int16_t)a[+0x0e] + d ; a[+0x0e] = that, narrowed
 *      b = obj->field00->him
 *      obj->field1c = b
 *      obj->field20 = (int16_t)b[+0x0e] + d ; b[+0x0e] = that, narrowed
 *
 * **It moves both fighters by the same delta.** One object arrives in 0x1c
 * and the other is the opponent through PROC+0x04, and each has the same
 * amount added to the halfword at +0x0e.
 *
 * +0x0e is the HIGH half of 0x0c, which this file's struct calls a horizontal
 * position -- so by the offsets this shifts them sideways, and by the name it
 * lifts them. Both readings are written down because nothing here settles it:
 * the store is `strh`, so only the integer part of a 16.16 coordinate moves,
 * whichever axis 0x0c turns out to be.
 *
 * The addition is done at full width and narrowed on the way out, so a delta
 * that overflows sixteen bits wraps in the object rather than saturating.
 *
 * **0x1c is an input AND a scratch slot: it leaves holding the opponent.** A caller that
 * calls this twice has to put its own body back into 0x1c in between, and `t_liftshake`
 * later in this file does exactly that. Without reading this routine that reload looks
 * redundant; dropping it would move the opponent twice and the part once.
 */
void lifts3(MK3OBJ *obj)
{
    long d = (long)obj->field24;
    MK3OBJ *a = (MK3OBJ *)(uintptr_t)obj->field1c;
    MK3OBJ *b;

    obj->field20 = (uint32_t)(*(int16_t *)((char *)a + 0x0e) + d);
    *(int16_t *)((char *)a + 0x0e) = (int16_t)obj->field20;

    b = (MK3OBJ *)(uintptr_t)obj->field00->him;
    obj->field1c = (uint32_t)(uintptr_t)b;

    obj->field20 = (uint32_t)(*(int16_t *)((char *)b + 0x0e) + d);
    *(int16_t *)((char *)b + 0x0e) = (int16_t)obj->field20;
}


/* skeleton_explode -- armv7 0x00035670, 36 bytes.  **Complete.**
 *
 *      set_inviso(obj)
 *      obj->field1c = 0x80
 *      obj->field20 = 0
 *      multi_adjust_xy(obj)
 *      obj->field1c = 0x18
 *      create_fx(obj)
 *
 * The body disappears, is nudged 0x80 along one axis and none along the
 * other, and effect 0x18 is spawned where it was.
 *
 * The zero is DERIVED, not loaded: `movs r3, #0x80` then `subs r3, #0x80`,
 * one instruction instead of a second constant. The same trick a few
 * functions away produces 0x15 from 0xffffffb8 by adding 0x5d, which wraps.
 */
void skeleton_explode(MK3OBJ *obj)
{
    set_inviso(obj);

    obj->field1c = 0x80;
    obj->field20 = 0;                   /* movs #0x80 then subs #0x80 */
    multi_adjust_xy(obj);

    obj->field1c = 0x18;
    create_fx(obj);
}


/* skinny_spawn -- armv7 0x00039768, 40 bytes.  **Complete.**
 *
 *      other = obj->field08
 *      p     = obj->field48
 *      x = (int16_t)other[+0x0e] + (int16_t)(p)          ; low half, signed
 *      y = (int16_t)other[+0x12] + (int32_t)p >> 16      ; high half, signed
 *      obj->field1c = 0x19
 *      create_fx_xy(obj, x, y)
 *
 * **0x48 is a packed pair of signed 16-bit offsets**, and this is what proves
 * it. The low half is sign-extended with `lsl #16` then `asr #16` -- the long
 * way round, because Thumb has no sign-extend-halfword-from-register here --
 * and the high half with a bare `asr #16`. One goes on each coordinate.
 *
 * That settles a value written elsewhere in this directory: `combo_setup`
 * stores 0x60006 into 0x48 and its note called it "six each way, packed".
 * Six each way is exactly what this reads.
 *
 * +0x0e and +0x12 are the high halves of 0x0c and 0x10, so the effect is
 * placed at the other object's integer position plus the offset.
 */
void skinny_spawn(MK3OBJ *obj)
{
    MK3OBJ *other = obj->field08;
    uint32_t p = obj->field48;
    long x = *(int16_t *)((char *)other + 0x0e) + (long)(int16_t)p;
    long y = *(int16_t *)((char *)other + 0x12) + ((long)(int32_t)p >> 16);

    obj->field1c = 0x19;
    create_fx_xy(obj, x, y);
}


/* death_blow_complete -- armv7 0x000336e8, 56 bytes.  **Complete.**
 *
 *      v = (int16_t)*(G + 0x450)
 *      obj->field20 = v
 *      obj->field1c = 0xffffffff
 *      *(int16_t *)(G + 0x450) = -1        ; consumed
 *      if (v == 4) return
 *      obj->field28 = 0x3b
 *      if (v != 3) obj->field28 = 0x37
 *      send_code_a3(obj)
 *
 * **A pending value in the global state, read once and cleared.** `G + 0x450`
 * holds which death blow is waiting; this takes it, writes -1 back so it
 * cannot be taken twice, and turns it into a code.
 *
 * Three outcomes from one halfword: 4 does nothing at all, 3 sends 0x3b, and
 * anything else sends 0x37. The store of 0x3b happens before the test for 3,
 * so it is written and then overwritten on the common path -- the compiler
 * hoisting a store rather than duplicating a branch.
 *
 * The slot is six bytes below `G + 0x456`, which the `sans_repell` family
 * writes. Two unrelated things in adjacent halfwords of the same structure.
 */
void death_blow_complete(MK3OBJ *obj)
{
    int16_t v = *(int16_t *)(G_BYTES + 0x450);

    obj->field20 = (uint32_t)(long)v;
    obj->field1c = 0xffffffffu;
    *(int16_t *)(G_BYTES + 0x450) = -1;         /* taken; not again */

    if (v == 4)
        return;

    obj->field28 = 0x3b;
    if (v != 3)
        obj->field28 = 0x37;

    send_code_a3(obj);
}


/* single_obj_thudd_1 -- armv7 0x0003ab30, 64 bytes.  **Complete.**
 *
 *      obj->field40 = 0x47
 *      get_char_ani(obj)                   ; 0x40 becomes a pointer
 *      a = *(uint32_t *)obj->field40       ; the animation's first word
 *      obj->field40 = a
 *      obj->field08->field2c = a & 0x3fff
 *      match_me_with_him(obj)
 *      ground_player(obj)
 *      obj->field20 = 0
 *      obj->field1c = 0xd
 *      multi_adjust_xy(obj)
 *      flip_multi(obj)
 *
 * **The animation number is fourteen bits.** The first word of an animation
 * is masked with 0x3fff before it becomes the other object's current
 * animation, so the top eighteen bits of that word are something else --
 * flags this file does not use. Worth knowing before anything compares a
 * raw first word against an animation id.
 *
 * 0x40 is a number on the way in and a pointer on the way out: `get_char_ani`
 * looks up 0x47 for this character and leaves the address there. The same
 * slot then takes the word it points at.
 */
void single_obj_thudd_1(MK3OBJ *obj)
{
    uint32_t a;

    obj->field40 = 0x47;
    get_char_ani(obj);                      /* 0x40: number in, pointer out */

    a = *(uint32_t *)(uintptr_t)obj->field40;
    obj->field40 = a;
    obj->field08->field2c = a & 0x3fff;     /* fourteen bits of animation */

    match_me_with_him(obj);
    ground_player(obj);

    obj->field20 = 0;
    obj->field1c = 0xd;
    multi_adjust_xy(obj);
    flip_multi(obj);
}


/* t_post_sliced_up -- armv7 0x000330f4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      other = ((MK3OBJ *)thread->proc)->field08
 *      other->field2c = other->field24 + 0x1ad6
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 *
 * **Animation by character number.** 0x24 is the character and 0x2c is the
 * animation, and this adds a base to one to get the other -- so the
 * post-slice animations sit consecutively from 0x1ad6, one per character,
 * and the id doubles as the index.
 *
 * The constant arrives in two instructions, `add.w #0x1ac0` then `adds #0x16`,
 * because 0x1ad6 is not one Thumb immediate.
 *
 * Then the thread parks forever. Being sliced up is not a state anything
 * recovers from, so the handler that runs next is the one that never
 * finishes -- reached here through the pointer slot at 0x000f3724, the same
 * one `wfe_him` uses.
 */
long t_post_sliced_up(MK3THREAD *thread)
{
    MK3OBJ *other;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    other = ((MK3OBJ *)thread->proc)->field08;
    other->field2c = other->field24 + 0x1ad6;   /* one per character */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ============================================ t_do_fatality_1, t_do_fatality_2
 *
 * armv7 0x000334b4 and 0x00033468, 76 bytes each.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj = thread->proc
 *      init_special(obj)
 *      h = ochar_fatalitiesN[obj->field08->field24]
 *      obj->field1c = h
 *      frame[frame].handler = h
 *      frame[frame+1].w0 = 0
 *
 * One function written twice, differing only in which table it indexes:
 * `_ochar_fatalities1` at 0x00166e68 and `_ochar_fatalities2` at 0x00166ed0.
 *
 * **The tables are 26 entries of four bytes.** 0x00166ed0 - 0x00166e68 is
 * 0x68, which is 104, which is 26 pointers -- so the second table begins
 * exactly where the first ends, and the roster is 26 characters. The index is
 * 0x24 on the other object, the same field `get_block_ani_offset` tests
 * against 0xb and `t_post_sliced_up` turns into an animation number.
 *
 * See docs/FATALITY-TABLES.md for both tables read out. They are the clearest
 * character-id list in the binary, because every entry is a named symbol.
 *
 * The chosen handler is written to 0x1c as well as installed. Nothing here
 * reads it back, but the fatality routines run with it there.
 */
extern MK3THREADFUNC ochar_fatalities1[26];    /* 0x00166e68 */
extern MK3THREADFUNC ochar_fatalities2[26];    /* 0x00166ed0 */

long t_do_fatality_1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    h = ochar_fatalities1[obj->field08->field24];
    obj->field1c = (uint32_t)(uintptr_t)h;

    return mk3_push_handler(thread, h);
}

long t_do_fatality_2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3THREADFUNC h;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    init_special(obj);

    h = ochar_fatalities2[obj->field08->field24];
    obj->field1c = (uint32_t)(uintptr_t)h;

    return mk3_push_handler(thread, h);
}


/* t_pumped -- armv7 0x00033018, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj   = thread->proc
 *      other = obj->field08
 *      other->field2c = ((uint32_t *)obj->field48)[other->field24]
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 *
 * The animation comes out of a **table the caller left in 0x48**, indexed by
 * the character -- so whoever installed this handler chose which table, and
 * this only does the lookup.
 *
 * **0x48 is a pointer here and a packed pair of offsets in `skinny_spawn`.**
 * Both readings are certain from their own instructions -- one indexes with
 * `lsl #2`, the other sign-extends two halves -- so the slot is scratch space
 * whose meaning belongs to whoever wrote it, like 0x38 already turned out to
 * be. Nothing on the object says which is in there.
 */
long t_pumped(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    MK3OBJ *other;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    other = obj->field08;
    other->field2c = ((const uint32_t *)(uintptr_t)obj->field48)[other->field24];

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* t_double_flame_ani -- armv7 0x0003b748, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame_a9(obj)
 *      if (thread->frame > 0) { thread->frame -= 1; return 0 }
 *      frame[frame].handler = t_local_reaction_exit
 *      frame[frame+1].w0 = 0
 *
 * **The opposite of the push shape.** Everything else in this directory
 * INCREMENTS the frame index to call down a level; this one DECREMENTS it to
 * return up. One animation frame is advanced, and then the thread goes back
 * to whoever called it.
 *
 * The install is what happens when there is nowhere to go back to. `frame` is
 * signed here -- the test is `cmp #0` then `ble`, not `cbz` -- so a negative
 * index takes the same path as zero.
 */
long t_double_flame_ani(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    frame_a9((MK3OBJ *)thread->proc);

    if ((long)thread->frame > 0) {      /* cmp #0 / ble: signed */
        thread->frame -= 1;             /* back up a level */
        return 0;
    }

    return mk3_push_handler(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* t_normal_spin_intro -- armv7 0x00034958, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 2
 *      get_char_ani2(obj)
 *      obj->field1c = 0x10020
 *      frame[frame].handler = t_animate_a0_frames
 *      frame[frame+1].w0 = 0
 *
 * 0x10020 is `ldr r3, [pc, #0x24]` with **no `add r3, pc` after it** -- so it
 * is the literal itself and not an address. Every other pc-relative load in
 * this file is followed by that add, which is what turns an offset into an
 * address; missing the difference makes a constant into a pointer.
 *
 * The value reads as two packed halves, 1 and 0x20, which is a shape 0x1c
 * takes elsewhere in this directory. Nothing here says which half is which.
 */
long t_normal_spin_intro(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 2;
    get_char_ani2(obj);
    obj->field1c = 0x10020;             /* a literal, not an address */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_animate_a0_frames);
}


/* t_initial_skeleton_shake -- armv7 0x0003891c, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x8000
 *      away_x_vel(obj)
 *      obj->field1c = 3
 *      obj->field20 = 3
 *      obj->field24 = 6
 *      frame[frame].handler = t_shake_ob_up
 *      frame[frame+1].w0 = 0
 *
 * A push away, then three numbers for the shake: 3, 3 and 6. The 6 is
 * `adds r3, r3, r3` on the 3 already in the register -- doubled rather than
 * loaded, the one-instruction saving this file makes everywhere.
 *
 * 0x8000 in 0x1c is the distance `away_x_vel` reads as its argument; the
 * three that follow belong to `t_shake_ob_up`.
 */
long t_initial_skeleton_shake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x8000;
    away_x_vel(obj);

    obj->field1c = 3;
    obj->field20 = 3;
    obj->field24 = 6;                   /* adds r3, r3, r3 */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_shake_ob_up);
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

long t_mframew(MK3THREAD *thread);
long t_r_jax_stomp(MK3THREAD *thread);
void tsound_func(MK3OBJ *obj, uint32_t arg);

/* t_light_animator -- armv7 0x0003315c, 116 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x6
 *          token := 0x154a, then descend into t_mframew
 *      token == 0x154a:
 *          park(token 0x154b, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_light_animator(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x6;
        *mk3_frame(thread, thread->frame + 1) = 0x154a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x154a)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x154b;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_crush_blood -- armv7 0x000331d0, 92 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x1
 *          park(token 0x15a1, duration 0x4)
 *      token == 0x15a1:
 *          obj->field1c = 0x1
 *          park(token 0x15a4, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_crush_blood(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x1;
        *mk3_frame(thread, thread->frame + 1) = 0x15a1;
        thread->fieldfc = 0x4;
        return 0x4;
    }

    if (token != 0x15a1)
        return -3;

    obj->field1c = 0x1;
    *mk3_frame(thread, thread->frame + 1) = 0x15a4;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_make_db_tone -- armv7 0x00033c30, 88 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x1c04, duration 0x2)
 *      token == 0x1c04:
 *          obj->field28 = 0x36
 *          send_code_a3(obj)
 *          park(token 0x1c08, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_make_db_tone(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1c04;
        thread->fieldfc = 0x2;
        return 0x2;
    }

    if (token != 0x1c04)
        return -3;

    obj->field28 = 0x36;
    send_code_a3(obj);
    *mk3_frame(thread, thread->frame + 1) = 0x1c08;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* t_r_mk_game_crush -- armv7 0x000350b8, 100 bytes.  **Complete.**
 *
 *      token == 0:
 *          center_around_me(obj)
 *          park(token 0xa1f, duration 0x14)
 *      token == 0xa1f:
 *          death_scream(obj)
 *          frame[frame].handler = t_r_jax_stomp
 *      otherwise:  return -3
 */
long t_r_mk_game_crush(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        center_around_me(obj);
        *mk3_frame(thread, thread->frame + 1) = 0xa1f;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token != 0xa1f)
        return -3;

    death_scream(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_r_jax_stomp);
}

/* t_flesh_rip_sound -- armv7 0x00036368, 96 bytes.  **Complete.**
 *
 *      token == 0:
 *          tsound_func(obj, 0x70)
 *          park(token 0x12d1, duration 0x40)
 *      token == 0x12d1:
 *          tsound_func(obj, 0x70)
 *          park(token 0x12d3, duration 0x16462)   and never wakes
 *      otherwise:  return -3
 */
long t_flesh_rip_sound(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        tsound_func(obj, 0x70);
        *mk3_frame(thread, thread->frame + 1) = 0x12d1;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0x12d1)
        return -3;

    tsound_func(obj, 0x70);
    *mk3_frame(thread, thread->frame + 1) = 0x12d3;
    thread->fieldfc = 0x16462;          /* and never wakes */
    return 0x16462;
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_collapse_on_ground(MK3THREAD *thread);
void clear_inviso(MK3OBJ *obj);
void find_ani_part2(MK3OBJ *obj);
void find_part2(MK3OBJ *obj);

/* t_death_shake -- armv7 0x0003326c, 136 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x3
 *          obj->field20 = 0x3
 *          obj->field24 = 0x4
 *          token := 0x1769, then descend into t_shake_ob_up
 *      token == 0x1769:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_death_shake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x3;
        obj->field20 = 0x3;
        obj->field24 = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0x1769;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1769)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_jax_stomp -- armv7 0x00035174, 156 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field40 = 0x4
 *          get_char_ani(obj)
 *          obj->field1c = 0x3
 *          token := 0x10ab, then descend into t_mframew
 *      token == 0x10ab:
 *          set_inviso(obj)
 *          obj->field1c = 0x21
 *          create_fx(obj)
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_r_jax_stomp(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field40 = 0x4;
        get_char_ani(obj);
        obj->field1c = 0x3;
        *mk3_frame(thread, thread->frame + 1) = 0x10ab;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x10ab)
        return -3;

    set_inviso(obj);
    obj->field1c = 0x21;
    create_fx(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_crush_stuggle -- armv7 0x00035bac, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          face_opponent(obj)
 *          death_scream(obj)
 *          obj->field40 = 0x20
 *          find_ani_part2(obj)
 *          obj->field1c = 0x4
 *          token := 0x159a, then descend into t_mframew
 *      token == 0x159a:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_crush_stuggle(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        face_opponent(obj);
        death_scream(obj);
        obj->field40 = 0x20;
        find_ani_part2(obj);
        obj->field1c = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0x159a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x159a)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_scared_of_scorp -- armv7 0x00035da0, 140 bytes.  **Complete.**
 *
 *      token == 0:
 *          scared_pose(obj)
 *          obj->field1c = 0x40000
 *          obj->field20 = 0x3
 *          obj->field24 = 0xc
 *          token := 0x407, then descend into t_shake_ob_up
 *      token == 0x407:
 *          frame[frame].handler = t_wait_forever
 *      otherwise:  return -3
 */
long t_r_scared_of_scorp(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        scared_pose(obj);
        obj->field1c = 0x40000;
        obj->field20 = 0x3;
        obj->field24 = 0xc;
        *mk3_frame(thread, thread->frame + 1) = 0x407;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x407)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* t_r_scared_of_skunk -- armv7 0x00035e2c, 140 bytes.  **Complete.**
 *
 *      token == 0:
 *          scared_pose(obj)
 *          obj->field1c = 0x40000
 *          obj->field20 = 0x3
 *          obj->field24 = 0xc
 *          token := 0x3fe, then descend into t_shake_ob_up
 *      token == 0x3fe:
 *          frame[frame].handler = t_collapse_on_ground
 *      otherwise:  return -3
 */
long t_r_scared_of_skunk(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        scared_pose(obj);
        obj->field1c = 0x40000;
        obj->field20 = 0x3;
        obj->field24 = 0xc;
        *mk3_frame(thread, thread->frame + 1) = 0x3fe;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x3fe)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_collapse_on_ground);
}

/* t_frozen_half_ani -- armv7 0x0003791c, 164 bytes.  **Complete.**
 *
 *      token == 0:
 *          flip_multi(obj)
 *          find_part2(obj)
 *          find_part2(obj)
 *          obj->field1c = 0x2
 *          token := 0x1462, then descend into t_mframew
 *      token == 0x1462:
 *          token := 0x1463, then descend into t_wait_forever
 *      otherwise:  return -3
 */
long t_frozen_half_ani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        flip_multi(obj);
        find_part2(obj);
        find_part2(obj);
        obj->field1c = 0x2;
        *mk3_frame(thread, thread->frame + 1) = 0x1462;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1462)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0x1463;
    thread->frame = thread->frame + 1;      /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_wait_forever;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* t_kang_reform -- armv7 0x0003a7dc, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          clear_inviso(obj)
 *          obj->field40 = 0x6
 *          get_char_ani2(obj)
 *          obj->field1c = 0x4
 *          token := 0xa7a, then descend into t_mframew
 *      token == 0xa7a:
 *          death_blow_complete(obj)
 *          frame[frame].handler = t_null_fatality
 *      otherwise:  return -3
 */
long t_kang_reform(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        clear_inviso(obj);
        obj->field40 = 0x6;
        get_char_ani2(obj);
        obj->field1c = 0x4;
        *mk3_frame(thread, thread->frame + 1) = 0xa7a;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xa7a)
        return -3;

    death_blow_complete(obj);
    return mk3_install(thread, (MK3THREADFUNC)t_null_fatality);
}


/* ------------------------------------------------------------------ t_robo_skeleton_burn
 *
 * armv7 0x00035b58, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      face_opponent(obj)
 *      center_around_me(obj)
 *      obj->field40 = &a_sb_skeleton_burn[2]
 *      frame[frame].handler = t_skburn3
 *
 * **The same three lines as `t_sb_skeleton_burn` at the top of this file, entering the list
 * two words in.** `add r3, #8` after the pc-relative load, and then the address goes into
 * 0x40 -- so the robot's burn plays the same sequence as Sub-Zero's from the third frame
 * rather than the first.
 *
 * **That +8 is what proves `a_sb_skeleton_burn` is data.** An offset into a function address
 * would be meaningless; an offset into a word list the cursor walks is the obvious way to
 * skip its first two entries. The declaration at the top of this file has been corrected
 * accordingly.
 *
 * `face_opponent` and `center_around_me` before the install are the two calls
 * `t_sb_skeleton_burn` does without, so the robot is also turned and centred first.
 */
void face_opponent(MK3OBJ *obj);

long t_robo_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    face_opponent(obj);
    center_around_me(obj);

    obj->field40 = (uint32_t)(uintptr_t)&a_sb_skeleton_burn[2];

    return mk3_push_handler(thread, (MK3THREADFUNC)t_skburn3);
}

/* ----------------------------------------------------------------------- t_crush_sleep_5
 *
 * armv7 0x000333f4, 92 bytes.  **Complete.**
 *
 *      token == 0:       token := 0x19ea, park 4
 *      token == 0x19ea:  pop a level, or t_local_reaction_exit at the bottom
 *      otherwise:        return -3
 *
 * **A four-frame wait and nothing else.** It never touches `thread->proc` -- there is no
 * `ldr [r0, #0x108]` in the body -- so it is a pure delay inserted into a chain, and the
 * name says which chain.
 *
 * It is also the leanest routine in the file: no prologue, no frame pointer, `bx lr` from
 * every path, because it makes no calls. Worth recognising the shape -- a park-and-pop with
 * no object access compiles to about ninety bytes and is always this.
 */
long t_crush_sleep_5(MK3THREAD *thread)
{
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0x19ea;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x19ea)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_lk_skeleton_burn
 *
 * armv7 0x0003428c, 92 bytes.  **Complete.**
 *
 *      token == 0:      center_around_me(obj)
 *                       token := 0xa51, park 0xa
 *
 *      token == 0xa51:  frame[frame].handler = t_sb_skeleton_burn
 *
 *      otherwise:       return -3
 *
 * **Liu Kang's burn is Sub-Zero's, ten frames later.** Centre the fighter, wait, then install
 * `t_sb_skeleton_burn` -- which sets 0x40 to the start of the list and descends into
 * `t_skburn3`. So three routines in this file share one burn sequence and differ only in
 * their approach:
 *
 *      t_sb_skeleton_burn      the list from word 0, no preamble
 *      t_robo_skeleton_burn    the list from word 2, turned and centred
 *      t_lk_skeleton_burn      centred, ten frames, then t_sb_skeleton_burn
 *
 * The third one reaching the first through an install rather than repeating its two lines is
 * the clearest evidence that this is deliberate sharing and not three copies.
 */
long t_sb_skeleton_burn(MK3THREAD *thread);

long t_lk_skeleton_burn(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        center_around_me(obj);

        *mk3_frame(thread, frame + 1) = 0xa51;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token != 0xa51)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_sb_skeleton_burn);
}


/* ------------------------------------------------------------------------- t_grow_victum
 *
 * armv7 0x0003504c, 108 bytes.  **Complete.**
 *
 *      token == 0:       part->field2c = part->field24 + 0x1b00 + 0x12
 *                        token := 0x100c, park 0x46
 *
 *      token == 0x100c:  death_scream(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **The animation is a base plus the character number**, 0x1b12 + `part->field24`, and the two
 * halves arrive as two instructions -- `add.w r3, r3, #0x1b00` then `adds r3, #0x12` -- because
 * 0x1b12 will not fit in one Thumb immediate. Written as the sum for that reason.
 *
 * That is the same interface as mkanimal.c's `cutup_body_init(obj, delta)`, which adds its
 * argument to the same field to pick a body-pieces set. So **"base plus character number" is
 * how this engine indexes per-character animation blocks**, and the base is the only thing a
 * caller supplies. Third site for it after `cutup_body_init`'s two callers.
 *
 * Seventy frames of growing, then the scream, then the thread parks forever -- so nothing here
 * shrinks the victim back. Whatever ends the fatality does it from outside.
 *
 * `r0` holds the object on entry and is overwritten with the part inside the first state only,
 * which is why the second state can call `death_scream` with no reload.
 */
long t_wait_forever(MK3THREAD *thread);

long t_grow_victum(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field08->field2c =
            obj->field08->field24 + 0x1b00 + 0x12;

        *mk3_frame(thread, frame + 1) = 0x100c;
        thread->fieldfc = 0x46;
        return 0x46;
    }

    if (token != 0x100c)
        return -3;

    death_scream(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ------------------------------------------------------------------------- t_nado_sounds
 *
 * armv7 0x00034060, 108 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c = 6; ochar_sound(obj)
 *                       obj->field1c = 7; ochar_sound(obj)
 *                       token := 0xeb8, park 0x40
 *
 *      token == 0xeb8:  frame[frame].handler = t_nado_sounds
 *
 *      otherwise:       return -3
 *
 * **The reinstall-self loop, and this one never stops.** The second state installs THIS routine
 * over itself, which zeroes the token and therefore restarts at state 0 -- so sounds 6 and 7
 * play together, sixty-four frames pass, and they play again, for as long as the thread lives.
 *
 * Fourth site for that idiom, after mkstat.c's `t_shake_suspended` and `t_noogy_suspended` and
 * mkanimal.c's `t_animate_till_a11`. **The warning is the same every time: this is not "resume
 * at 0xeb8".** An install writes the handler and clears the token slot above it, so the next
 * tick enters at state 0. Reading it as a resume gives a routine that plays nothing.
 *
 * The two sounds are a pair with nothing between them, the same shape as `tsound_func(0x24)`
 * and `tsound_func(0x25)` in mkanimal.c -- one noise made of two samples. This is the
 * `ochar_sound` version, which takes its index in 0x1c rather than in a register.
 */
long t_nado_sounds(MK3THREAD *thread);

long t_nado_sounds(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = 6;
        ochar_sound(obj);

        obj->field1c = 7;
        ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0xeb8;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token != 0xeb8)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_nado_sounds);
}


/* ------------------------------------------------------------------------- t_orb_sleep_1
 *
 * armv7 0x00037174, 108 bytes.  **Complete.**
 *
 *      token == 0:       next_anirate(obj)
 *                        token := 0x163c, park 1
 *
 *      token == 0x163c:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **One animation step and unwind.** The whole routine is a single call and the standard pop,
 * so it exists to give a parent one frame of animation at a known point rather than to do
 * anything of its own.
 *
 * Compare `t_crush_sleep_5` earlier in this batch, which is the same shape without the call and
 * with a four-frame park. The two together are the minimum useful thread handler in this engine:
 * do one thing, park, pop.
 */
long next_anirate(MK3OBJ *obj);

long t_orb_sleep_1(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        next_anirate(obj);

        *mk3_frame(thread, frame + 1) = 0x163c;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x163c)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------- t_appearing_spikes
 *
 * armv7 0x00035ae8, 112 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x00030003; shake_a11(obj)
 *      obj->field1c = 7; ochar_sound(obj)
 *      part->field2c = 0x1b30
 *      obj->field1c = ~0x9f              (-0xa0)
 *      obj->field20 = -0xa0 + 0xf0 = 0x50
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **One state, five effects, then park forever.** The spikes shake the screen, make a noise, set
 * an animation and move themselves, and then the thread has nothing left to do.
 *
 * **The animation is a bare constant, 0x1b30, where `t_grow_victum` computes 0x1b12 plus the
 * character number.** Both are in the same 0x1b00 block, so that block holds both per-character
 * runs and shared props -- and which it is depends on the routine, not the range. Do not assume
 * an animation number in this block needs indexing.
 *
 * The two `multi_adjust_xy` offsets come from one literal, `mvn r3, #0x9f` then `adds r3, #0xf0`,
 * giving -0xa0 and 0x50. Written as the arithmetic because the shared literal is the thing worth
 * seeing; the values alone would hide it. Same idiom as every `t_shake_ob_up` caller in
 * mkanimal.c.
 *
 * The shake pair is 0x00030003, doubled -- so the spikes shake evenly and softly, three against
 * the 0xa/0xa the large animals use.
 */
void shake_a11(MK3OBJ *obj);

long t_appearing_spikes(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x00030003;
    shake_a11(obj);

    obj->field1c = 7;
    ochar_sound(obj);

    obj->field08->field2c = 0x1b30;

    obj->field1c = (uint32_t)~0x9fu;
    obj->field20 = (uint32_t)(~0x9fu + 0xf0u);
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ---------------------------------------------------------------------- t_down_the_staff
 *
 * armv7 0x00032ed0, 112 bytes.  **Complete.**
 *
 *      token == 0:      obj->field1c  = (int32_t)part->field1c >> 1
 *                       part->field1c = obj->field1c
 *                       token := 0x75d, park 1
 *
 *      token == 0x75d:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It halves a velocity and writes the result to both the object and the part.** One frame,
 * then unwind -- so a parent that wants the slide down the staff to decay calls this repeatedly
 * rather than looping here.
 *
 * **The shift is `asrs`, arithmetic, so the value is SIGNED.** Transcribed as
 * `(int32_t)... >> 1` for that reason: an unsigned `>> 1` differs for every negative velocity,
 * which is exactly the case that matters when something is sliding the other way. A `lsrs`
 * would have been the unsigned halving and the binary does not use one.
 *
 * The same number lands in two places, `obj->field1c` and `part->field1c`, the way
 * `tl_kitana_bunny` and `tl_sektor_bat` in mkanimal.c write one velocity to an object and its
 * part together. So the object holds the working copy and the part holds the one the renderer
 * reads.
 */
long t_down_the_staff(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = (uint32_t)((int32_t)obj->field08->field1c >> 1);
        obj->field08->field1c = obj->field1c;

        *mk3_frame(thread, frame + 1) = 0x75d;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x75d)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_kludge_flame_ani
 *
 * armv7 0x0003b798, 116 bytes.  **Complete.**
 *
 *      token == 0:      obj->field20 = obj->field1c
 *                       multi_adjust_xy(obj)
 *                       frame_a9(obj)
 *                       token := 0x4b8, park 4
 *
 *      token == 0x4b8:  pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It copies 0x1c into 0x20 so that `multi_adjust_xy` gets the same number on both axes**, and
 * the caller therefore supplies one offset instead of two. That is what the name is about: every
 * other caller of `multi_adjust_xy` in the tree sets the two fields independently, usually from
 * one literal with an `adds` or a `subs`, and this one deliberately does not.
 *
 * Which also means the caller cannot move the flame horizontally without moving it vertically by
 * the same amount. A diagonal-only helper is a strange interface, and the routine is named for
 * being one.
 *
 * After the shift it advances a frame and gives the level back, so like `t_orb_sleep_1` it is a
 * one-shot a parent drives rather than a loop.
 */
long t_kludge_flame_ani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field20 = obj->field1c;
        multi_adjust_xy(obj);
        frame_a9(obj);

        *mk3_frame(thread, frame + 1) = 0x4b8;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x4b8)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ----------------------------------------------------------------- t_nails_blood_spawner
 *
 * armv7 0x0003aabc, 116 bytes.  **Complete.**
 *
 *      token == 0:      obj->a10 = 0xa
 *                       -- falls into the 0x40e tail --
 *
 *      token == 0x40e:  obj->field1c = 5; create_blood_proc(obj)
 *                       obj->field1c = 5; create_blood_proc(obj)
 *                       if (--obj->a10 == 0) { token := 0x416, park 0x16462 }
 *                       -- falls into the 0x40e tail --
 *
 *      the 0x40e tail:  token := 0x40e, park 2
 *
 *      otherwise:       return -3
 *
 * **Two blood effects a frame apart, ten times over, then the thread parks forever.** Twenty
 * spawns in twenty frames and no way back -- whatever cleans the fatality up does it from
 * outside.
 *
 * **Token 0x416 is not in the dispatch and the park is 0x16462.** Fourth site for that
 * terminator, after mkstat.c's `t_jade_flash_proc` and mkanimal.c's `t_crunch_sounds` and
 * `t_egg_proc`. The pattern is settled: a state that has nothing left to do parks for a
 * duration that never elapses, under a token the dispatch would refuse. Reaching it would
 * return -3 and it cannot be reached.
 *
 * **5 is stored into 0x1c twice, once before each call, out of the same register.** That is
 * `create_blood_proc` clobbering 0x1c -- the same reload mkanimal.c's `t_r_rabbit` needs around
 * its single call. Neither store is dead.
 */
long t_nails_blood_spawner(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->a10 = 0xa;

    } else if (token == 0x40e) {
        obj->field1c = 5;
        create_blood_proc(obj);
        obj->field1c = 5;
        create_blood_proc(obj);

        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x416;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x40e;
    thread->fieldfc = 2;
    return 2;
}

/* ------------------------------------------------------------------------------ t_skburn3
 *
 * armv7 0x00034fd4, 120 bytes.  **Complete.**
 *
 *      token == 0:       death_scream(obj)
 *                        NewThread(obj, t_skel_fire_proc)
 *                        token := 0x1711, park 0x12
 *
 *      token == 0x1711:  set_inviso(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **The end of the three burns, and the fire is a separate thread.** All three burn entry points
 * in this file -- `t_sb_skeleton_burn`, `t_robo_skeleton_burn` and `t_lk_skeleton_burn` -- reach
 * this routine, and it screams, starts `t_skel_fire_proc` on its own thread, waits eighteen
 * frames and makes the fighter invisible.
 *
 * So the visible fire outlives the routine that lit it: `set_inviso` removes the body while the
 * spawned thread keeps burning. Same division of labour as mkanimal.c's `t_r_rabbit` starting
 * `t_crunch_sounds`, and mkanimal.c's `tl_mileena_skunk` starting `t_odor_proc` -- **when an
 * effect has to outlast the state that caused it, this engine spawns a thread rather than
 * lengthening the state.**
 *
 * `obj->field40` is never read here, which is what makes the +8 in `t_robo_skeleton_burn`
 * interesting: the cursor that routine sets up must be consumed by `t_skel_fire_proc` or by the
 * animation machinery, not by this. Worth checking when `t_skel_fire_proc` is written.
 */
MK3THREAD *NewThread(void *owner, MK3THREADFUNC func);
long t_skel_fire_proc(MK3THREAD *thread);        /* 0x00036094 */

long t_skburn3(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        death_scream(obj);

        NewThread(obj, (MK3THREADFUNC)t_skel_fire_proc);

        *mk3_frame(thread, frame + 1) = 0x1711;
        thread->fieldfc = 0x12;
        return 0x12;
    }

    if (token != 0x1711)
        return -3;

    set_inviso(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}



/* -------------------------------------------------------------------------- t_hele_sleep
 *
 * armv7 0x000371e0, 128 bytes.  **Complete.**
 *
 *      token == 0:      token := 0xefa, park 1
 *
 *      token == 0xefa:  if (--obj->a10 == 0) {
 *                           obj->a10 = 0x20
 *                           hele_sound(obj)
 *                       }
 *                       next_anirate(obj)
 *                       pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:       return -3
 *
 * **It pops every time, so the counter is what carries across calls.** The routine animates one
 * frame and gives the level straight back; `obj->a10` is not reset on entry, so a parent that
 * descends into this each frame gets the helicopter sound once every thirty-two frames and an
 * animation step on all of them.
 *
 * That is a different shape from the loops elsewhere in the tree: instead of holding the level
 * and re-arming its own token, this hands control back and relies on the OBJECT to remember. The
 * state machine is in the field, not in the frame.
 *
 * `obj->a10 = 0x20` is compiled as `adds r3, #0x20` on a register the branch has just proved to
 * be zero -- the same trick mkanimal.c's `tl_reptile_monkey` uses. Transcribed as the value,
 * because the arithmetic carries nothing the value does not.
 */
long t_hele_sleep(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0xefa;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0xefa)
        return -3;

    obj->a10 = obj->a10 - 1;
    if (obj->a10 == 0) {
        obj->a10 = 0x20;
        hele_sound(obj);
    }

    next_anirate(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* -------------------------------------------------------------------- t_slide_behind_hair
 *
 * armv7 0x00038c04, 128 bytes.  **Complete.**
 *
 *      token == 0:       set_noedge(obj)
 *                        obj->field1c = 0x40000; away_x_vel(obj)
 *                        token := 0x124d, park 1
 *
 *      token == 0x124d:  get_x_dist(obj)
 *                        if (obj->field28 <= 0x97) { token := 0x124d, park 1 }
 *                        stop_me_player(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **A DEPARTURE test, where every distance loop measured so far has been an arrival.**
 * mkanimal.c has five ways of asking "have I arrived?"; this asks the opposite, re-arming while
 * the gap is 0x97 or less and stopping once it is larger. Same instruction shape --
 * `get_x_dist` then a branch on 0x28 -- and the comparison the other way round.
 *
 * So the loop is: remove the edge limit, push away at 0x40000, and keep going until the fighter
 * is more than 0x97 clear. The `set_noedge` in state 0 is what makes that possible; without it
 * the arena would stop the slide before the test could pass.
 *
 * Then `stop_me_player` and park forever -- no unwind, so whatever follows the fatality replaces
 * this handler from outside.
 */
void set_noedge(MK3OBJ *obj);
long get_x_dist(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);

long t_slide_behind_hair(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        set_noedge(obj);

        obj->field1c = 0x40000;
        away_x_vel(obj);

        *mk3_frame(thread, frame + 1) = 0x124d;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x124d)
        return -3;

    get_x_dist(obj);

    if ((long)obj->field28 <= 0x97) {
        *mk3_frame(thread, thread->frame + 1) = 0x124d;
        thread->fieldfc = 1;
        return 1;
    }

    stop_me_player(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ------------------------------------------------------------------------- t_r_jade_stab
 *
 * armv7 0x0003aa38, 132 bytes.  **Complete.**
 *
 *      token == 0:      rsnd_func(obj, 3)
 *                       death_scream(obj)
 *                       obj->a10 = 6
 *                       -- falls into the 0x7d7 tail --
 *
 *      token == 0x7d7:  if (--obj->a10 <= 0) frame[frame].handler = t_wait_forever
 *                       -- falls into the 0x7d7 tail --
 *
 *      the 0x7d7 tail:  obj->field1c = 5; create_blood_proc(obj)
 *                       token := 0x7d7, park 4
 *
 *      otherwise:       return -3
 *
 * **Sound, scream, then six blood spawns four frames apart, then park forever.** The victim's
 * side of a Jade stab, and the shape is the same counted spawn loop as
 * `t_nails_blood_spawner` earlier in this batch -- ten pairs two frames apart there, six singles
 * four frames apart here.
 *
 * The two differ in how they finish: `t_nails_blood_spawner` parks on 0x16462 under a token the
 * dispatch would refuse, and this installs `t_wait_forever`. **Both mean "this thread is done",
 * and the file uses them interchangeably** -- so neither is the canonical way to stop, and a
 * reader should not draw a distinction between them.
 *
 * The counter is set once in state 0 and the loop entry is shared, so 0x7d7 is written from two
 * places and 4 is the park in both.
 */
void rsnd_func(MK3OBJ *unused, uint32_t which);

long t_r_jade_stab(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        rsnd_func(obj, 3);
        death_scream(obj);

        obj->a10 = 6;

    } else if (token == 0x7d7) {
        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else {
        return -3;
    }

    obj->field1c = 5;
    create_blood_proc(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x7d7;
    thread->fieldfc = 4;
    return 4;
}

/* ------------------------------------------------------------------------- t_animate_a11
 *
 * armv7 0x00033064, 144 bytes.  **Complete.**
 *
 *      token == 0:       obj->field40 = obj->field48
 *                        token := 0xfc4, descend into t_mframew
 *
 *      token == 0xfc4:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **The close cousin of mkanimal.c's `t_kitty_spin`, and the difference is the whole point.**
 * Both move the cursor from 0x48 to 0x40, which is where the animation routines read it:
 *
 *      t_kitty_spin     also sets obj->field1c = 3, then INSTALLS t_mframew
 *      t_animate_a11    leaves 0x1c alone, then DESCENDS into t_mframew and pops
 *
 * So `t_kitty_spin` replaces itself and fixes the frame count at three, while this one keeps its
 * level, takes whatever count the caller left in 0x1c, and hands control back when the animation
 * finishes. A parent that needs to do something afterwards has to use this one.
 *
 * Reading the two together is what settles that **0x48 is where a caller parks an animation
 * cursor for a helper to pick up** -- two files, two routines, one convention. In mkanimal.c 0x48
 * is also a shake magnitude pair and a function pointer; the state decides, and here the state is
 * "about to animate".
 *
 * The routine makes no calls -- no prologue, `bx lr` from every path -- which is why it can keep
 * the object in `ip` throughout.
 */
long t_animate_a11(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field40 = obj->field48;

        *mk3_frame(thread, frame + 1) = 0xfc4;
        thread->frame = thread->frame + 1;          /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xfc4)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------------- t_st_spiked
 *
 * armv7 0x0003ab70, 144 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x28; create_fx(obj)
 *      obj->field48 = 0x00060006; shake_a11(obj)
 *      death_scream(obj)
 *      rsnd_func(obj, 3)
 *      ground_player(obj)
 *      obj->field40 = 0x1e; find_ani_part2(obj)
 *      find_last_frame(obj)
 *      do_next_a9_frame(obj)
 *      obj->field1c = 0
 *      obj->field20 = ~9                 (-0xa)
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **Nine calls in one state, then park forever.** The victim lands on the spikes: effect 0x28,
 * a doubled 6/6 shake, the scream, sound 3, and then the body is grounded, posed at animation
 * 0x1e, wound to that animation's LAST frame, advanced one more, and nudged up by 0xa.
 *
 * **`find_last_frame` is the interesting call.** `find_ani_part2` sets the animation up and this
 * winds it to the end, so the corpse is drawn in its final pose rather than playing through --
 * which is why a routine that never animates again still calls `do_next_a9_frame` once.
 *
 * `obj->field1c = 0` comes out of the token register, which the dispatch has already proved to be
 * zero, so the store looks like `str r6, [r4, #0x1c]` rather than a `movs` and a store. Written as
 * 0 because that is what it is.
 *
 * The shift is vertical only -- 0 across and -0xa up -- one of the few `multi_adjust_xy` calls in
 * the tree that does not build both offsets from one literal.
 */
void find_last_frame(MK3OBJ *obj);

long t_st_spiked(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x28;
    create_fx(obj);

    obj->field48 = 0x00060006;
    shake_a11(obj);

    death_scream(obj);
    rsnd_func(obj, 3);
    ground_player(obj);

    obj->field40 = 0x1e;
    find_ani_part2(obj);
    find_last_frame(obj);
    do_next_a9_frame(obj);

    obj->field1c = 0;
    obj->field20 = (uint32_t)~9u;
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ---------------------------------------------------------------------- t_init_death_blow
 *
 * armv7 0x00033c88, 152 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      kind = (uint16_t)obj->field20
 *      *(short *)(G + 0x450) = kind
 *      *(short *)(G + 0x458) = kind
 *      init_special(obj)
 *      NewThread(obj, t_make_db_tone)
 *      obj->field1c = (int16_t)*(short *)(G + 0x450)
 *      if (obj->field1c != 2) MKEvent_Add(3, 0xe, 0, 0)
 *      pop a level, or t_local_reaction_exit at the bottom
 *
 * **This is the routine every finisher goes through, and it is where the kind number ends up.**
 * mkanimal.c's `t_animality_start_pause` writes 3 into `obj->field20` and descends here;
 * mkstat.c's `t_baby_start_pause` writes 5 and descends here. Both were transcribed with the note
 * that 0x20 must be a kind selector. It is, and this is the proof: the halfword is copied
 * straight out of 0x20 into **two** global slots, `G + 0x450` and `G + 0x458`, and everything
 * downstream reads the globals.
 *
 * Two slots for one value, written back to back with no branch between them, so they are not
 * per-player -- or if they are, this routine sets both players the same and something else
 * separates them later. Recorded as observed.
 *
 * **`kind == 2` is special and gets no event.** The routine reads the global back with `ldrsh` --
 * signed -- compares against 2, and skips `MKEvent_Add(3, 0xe, 0, 0)` when it matches. So one
 * finisher kind is silent to whatever consumes event 3/0xe, and 3 (animality) and 5 (babality)
 * both fire it. What kind 2 is has not been established; the two known values bracket it.
 *
 * The tone is a separate thread, `t_make_db_tone` -- the fourth site in the tree for spawning a
 * thread so an effect can outlast the state that started it, after `t_skburn3`'s fire and
 * mkanimal.c's crunches and odour.
 *
 * Note it POPS rather than parking: the death blow is set up in one tick and the caller resumes
 * immediately, which is why `t_animality_start_pause` has its own thirty-frame wait afterwards.
 */
void MKEvent_Add(long a, long b, long c, long d);
long t_make_db_tone(MK3THREAD *thread);          /* 0x00033c30 */

long t_init_death_blow(MK3THREAD *thread)
{
    MK3OBJ   *obj = (MK3OBJ *)thread->proc;
    uint16_t  kind;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    kind = (uint16_t)obj->field20;
    *(uint16_t *)(G_BYTES + 0x450) = kind;
    *(uint16_t *)(G_BYTES + 0x458) = kind;

    init_special(obj);

    NewThread(obj, (MK3THREADFUNC)t_make_db_tone);

    obj->field1c = (uint32_t)(int32_t)*(int16_t *)(G_BYTES + 0x450);
    if (obj->field1c != 2)
        MKEvent_Add(3, 0xe, 0, 0);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------------------- t_bone_vomit_proc
 *
 * armv7 0x0003a050, 152 bytes.  **Complete.**
 *
 *      token == 0:       obj->a10 = 8
 *                        -- falls into the 0x3bd tail --
 *
 *      token == 0x3bd:   rsnd_func(obj, 3)
 *                        token := 0x3bf, park 3
 *
 *      token == 0x3bf:   rsnd_func(obj, 3)
 *                        if (--obj->a10 <= 0) { token := 0x3c4, park 0x16462 }
 *                        -- falls into the 0x3bd tail --
 *
 *      the 0x3bd tail:   obj->field1c = 0x31; create_fx(obj)
 *                        token := 0x3bd, park 3
 *
 *      otherwise:        return -3
 *
 * **A three-state ring: effect, sound, sound, round again -- eight times.** Each leg is three
 * frames, so the whole thing runs seventy-two frames and spawns effect 0x31 eight times with
 * sound 3 twice per spawn.
 *
 * Sound 3 fires from two different states with nothing else between them, which is the same
 * two-samples-per-noise habit `hele_sound` wraps in a routine -- except here it is the SAME sample
 * twice, three frames apart, rather than two different ones together. So the pair idiom is about
 * rhythm and not only about layering.
 *
 * **Token 0x3c4 is not in the dispatch and the park is 0x16462.** Fifth site for that terminator
 * in the tree, and the third in this file after `t_nails_blood_spawner` and `t_egg_proc` over in
 * mkanimal.c. It is settled beyond doubt now.
 */
long t_bone_vomit_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3bd) {
        rsnd_func(obj, 3);

        *mk3_frame(thread, frame + 1) = 0x3bf;
        thread->fieldfc = 3;
        return 3;
    }

    if (token == 0) {
        obj->a10 = 8;

    } else if (token == 0x3bf) {
        rsnd_func(obj, 3);

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x3c4;
            thread->fieldfc = 0x16462;
            return 0x16462;
        }

    } else {
        return -3;
    }

    obj->field1c = 0x31;
    create_fx(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x3bd;
    thread->fieldfc = 3;
    return 3;
}

/* --------------------------------------------------------------------- t_jade_shake_loop
 *
 * armv7 0x0003b43c, 152 bytes.  **Complete.**
 *
 *      token == 0:       me_in_front(obj)
 *                        proc->field1c = obj->field20
 *                        -- falls into the tail --
 *
 *      token == 0x7e6:   obj->field1c = proc->field20 - 1
 *                        if (obj->field1c <= 0)
 *                            pop a level, or t_local_reaction_exit at the bottom
 *                        -- falls into the tail --
 *
 *      the tail:         proc->field20 = obj->field1c
 *                        double_next_a9(obj)
 *                        obj->field1c = proc->field1c
 *                        token := 0x7e6, park obj->field1c
 *
 *      otherwise:        return -3
 *
 * **The park length is decided by the animation, not by the routine.** After `double_next_a9` the
 * tail reads `proc->field1c` -- the animation rate -- into 0x1c and parks for exactly that many
 * frames. So each pass of the shake waits as long as the current frame is meant to last, and the
 * loop stays in step with the animation instead of guessing at a constant.
 *
 * That is the first data-driven park measured in the tree. Every other loop so far parks for a
 * literal (1, 3, 4, 0x10, 0x20 ...) or for `obj->field1c` set from a literal a line earlier; this
 * one takes the number from the engine.
 *
 * **The counter lives in `proc->field20` and the working value in `obj->field1c`**, and the two
 * are shuffled between each pass: read the proc's count, decrement into the object, write it back.
 * State 0 seeds the proc's 0x1c from `obj->field20` and leaves `obj->field1c` as the caller set
 * it, so the caller supplies both the rate and the first count.
 *
 * `me_in_front` runs once, at entry, which is the only thing state 0 does beyond the seeding.
 */
void me_in_front(MK3OBJ *obj);
long double_next_a9(MK3OBJ *obj);

long t_jade_shake_loop(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        me_in_front(obj);

        obj->field00->field1c = obj->field20;

    } else if (token == 0x7e6) {
        obj->field1c = obj->field00->field20 - 1;

        if ((long)obj->field1c <= 0) {
            if ((long)frame > 0) {
                thread->frame = frame - 1;
                return 0;
            }
            return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
        }

    } else {
        return -3;
    }

    obj->field00->field20 = obj->field1c;
    double_next_a9(obj);
    obj->field1c = obj->field00->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0x7e6;
    thread->fieldfc = obj->field1c;
    return (long)obj->field1c;
}


/* --------------------------------------------------------------------------- t_open_wide
 *
 * armv7 0x00035cec, 152 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      player_normpal(obj)
 *      face_opponent(obj)
 *      obj->field1c   = ochar_reached[part->field24]
 *      part->field2c  = part->field24 + 0x1bc0 + 0x24
 *      death_scream(obj)
 *      match_me_with_him(obj)
 *      flip_multi(obj)
 *      obj->field20 = 0
 *      obj->field1c = -ochar_wide_adjusts[part->field24]
 *      multi_adjust_xy(obj)
 *      frame[frame].handler = t_wait_forever
 *
 * **Two per-character tables, both named, and both new to the tree.** `ochar_reached` at
 * 0x001667c0 and `ochar_wide_adjusts` at 0x00166b54, each indexed by `part->field24` with
 * `ldr.w r3, [rN, r1, lsl #2]` -- so both are arrays of words, one entry per fighter.
 *
 * **`ochar_reached` holds POINTERS, and `t_flesh_ripped_off` later in this file is what
 * proves it**: that routine takes the same entry, adds 0xc, and puts the result in 0x40 --
 * the animation cursor. An offset into a scalar would be meaningless. So the value this
 * routine drops into 0x1c is the address of a word list, and whichever of the three calls
 * below consumes it consumes a list.
 *
 * `ochar_wide_adjusts` is **negated before use** (`rsb r3, r3, #0`), and the result goes into 0x1c
 * with 0 in 0x20, so the table holds a positive horizontal distance and the fighter is shifted
 * backwards by it. That is the "wide" in the name: how far apart the two have to stand.
 *
 * **0x1c is written twice and the first value is consumed by one of the three calls between
 * them.** `ochar_reached[char]` goes in, then `death_scream`, `match_me_with_him` and `flip_multi`
 * run, then 0x1c is overwritten with the negated adjust. So the first store is NOT dead -- one of
 * those three reads it -- but which one is not settled by this routine. Recorded rather than
 * guessed.
 *
 * The animation is base plus character again, 0x1be4 + `part->field24`, arriving as
 * `add.w #0x1bc0` then `adds #0x24` because the constant will not fit one Thumb immediate. Fourth
 * site for that idiom after `t_grow_victum` here and `cutup_body_init`'s callers in mkanimal.c.
 */
extern uint32_t ochar_reached[];                 /* 0x001667c0 */
extern uint32_t ochar_wide_adjusts[];            /* 0x00166b54 */
void player_normpal(MK3OBJ *obj);

long t_open_wide(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    player_normpal(obj);
    face_opponent(obj);

    obj->field1c = ochar_reached[obj->field08->field24];
    obj->field08->field2c = obj->field08->field24 + 0x1bc0 + 0x24;

    death_scream(obj);
    match_me_with_him(obj);
    flip_multi(obj);

    obj->field20 = 0;
    obj->field1c =
        (uint32_t)(-(int32_t)ochar_wide_adjusts[obj->field08->field24]);
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* --------------------------------------------------------------------- t_nail_spawn_proc
 *
 * armv7 0x00039fb4, 156 bytes.  **Complete.**
 *
 *      token == 0:       part->field2c = 0x1dd
 *                        obj->field1c = 0x2a
 *                        obj->field20 = 0x2a - 0x30 = -6
 *                        multi_adjust_xy(obj)
 *                        obj->a10 = 0x28
 *                        -- falls into the 0x448 tail --
 *
 *      token == 0x448:   token := 0x44a, park 1
 *
 *      token == 0x44a:   rsnd_func(obj, 6)
 *                        if (--obj->a10 == 0)
 *                            frame[frame].handler = t_wait_forever
 *                        -- falls into the 0x448 tail --
 *
 *      the 0x448 tail:   token := 0x448, park 1
 *
 *      otherwise:        return -3
 *
 * **Forty nails, two frames apart, then park forever.** The two states exist only to make the
 * period two frames rather than one: 0x448 waits and does nothing, 0x44a makes the noise and
 * counts. A single state with a park of 2 would have done the same thing, and the routine does not
 * do that.
 *
 * The animation is a bare constant, 0x1dd, with no character index -- the same distinction
 * `t_appearing_spikes` draws against `t_grow_victum`. So props get constants and fighters get
 * base-plus-character, and the block an animation lives in does not tell you which.
 *
 * One literal feeds both offsets again: `movs r3, #0x2a` then `subs r3, #0x30`, giving 0x2a across
 * and -6 up.
 */
long t_nail_spawn_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x448) {
        *mk3_frame(thread, frame + 1) = 0x44a;
        thread->fieldfc = 1;
        return 1;
    }

    if (token == 0) {
        obj->field08->field2c = 0x1dd;

        obj->field1c = 0x2a;
        obj->field20 = (uint32_t)(0x2a - 0x30);
        multi_adjust_xy(obj);

        obj->a10 = 0x28;

    } else if (token == 0x44a) {
        rsnd_func(obj, 6);

        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x448;
    thread->fieldfc = 1;
    return 1;
}


/* -------------------------------------------------------------------------- t_green_shit
 *
 * armv7 0x00032f74, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c = 5
 *                        token := 0xaa3, descend into t_mframew
 *
 *      token == 0xaa3:   obj->field1c   = 0xffffd000
 *                        part->field1c  = 0xffffd000
 *                        token := 0xaa7, park 0x40
 *
 *      token == 0xaa7:   token := 0xaa9, park 0x16462
 *
 *      otherwise:        return -3
 *
 * **Five frames of animation, an upward velocity, sixty-four frames, done.** 0xffffd000 is
 * -0x3000 -- negative, so up -- and it goes into the object and the part together, the same
 * two-places-one-value pattern `t_down_the_staff` uses for its halved velocity.
 *
 * **Token 0xaa9 is not in the dispatch and the park is 0x16462.** Sixth site for that terminator.
 *
 * The routine keeps the object in `ip` and the first token in `lr` for its whole length, and
 * pushes only `lr` -- so it makes no calls of its own beyond the descent. `t_mframew` does all the
 * work of the first state.
 */
long t_green_shit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xaa3) {
        obj->field1c          = 0xffffd000u;
        obj->field08->field1c = 0xffffd000u;

        *mk3_frame(thread, frame + 1) = 0xaa7;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0xaa7) {
        *mk3_frame(thread, frame + 1) = 0xaa9;
        thread->fieldfc = 0x16462;
        return 0x16462;
    }

    if (token != 0)
        return -3;

    obj->field1c = 5;

    *mk3_frame(thread, thread->frame + 1) = 0xaa3;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ---------------------------------------------------------------------- t_smoke_dropping
 *
 * armv7 0x00033634, 164 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c  = 0x20000
 *                        part->field1c = 0x20000
 *                        token := 0x8f3, park 1
 *
 *      token == 0x8f3:   obj->field1c  = part->field1c + 0x2000
 *                        part->field1c = obj->field1c
 *                        obj->field1c = *(long *)(G + 0xac)
 *                        obj->field20 = (int16_t)part->y12 - obj->field1c
 *                        if (obj->field20 < 0) obj->field20 = -obj->field20
 *                        if (obj->field20 > 0x80) { token := 0x8f3, park 1 }
 *                        obj->field38 = t_eat_this_shit
 *                        takeover_him(obj)
 *                        token := 0x901, park 0x16462
 *
 *      otherwise:        return -3
 *
 * **Gravity written out by hand: the velocity grows by 0x2000 every frame and the loop ends when
 * the part is within 0x80 of the floor.** The starting velocity is 0x20000, each pass reads the
 * part's 0x1c, adds 0x2000, and writes it back to both the object and the part -- so the object
 * carries the working copy and the part is what the renderer moves by.
 *
 * **The distance test is the absolute value done in two instructions**, `itt lt` with `rsblt`, the
 * same shape mkanimal.c's `tl_scorpion_pengo` uses to measure the gap to the opponent. Second site
 * for that idiom, and the first that measures against the FLOOR rather than another fighter --
 * `G + 0xac` again, read as a word here.
 *
 * That makes six routines in the tree reading `G + 0xac`. The five in mkanimal.c place a body ON
 * the floor; this one asks how far above it something still is. Same global, different question.
 *
 * When it lands, the victim gets `t_eat_this_shit` through 0x38 and `takeover_him`, and this thread
 * parks on 0x16462 under token 0x901 -- not in the dispatch. Seventh site for that terminator, and
 * the same reason as `t_egg_proc` in mkanimal.c: after the handover there is nothing left to do.
 */
long t_eat_this_shit(MK3THREAD *thread);         /* 0x00039d0c */

long t_smoke_dropping(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c          = 0x20000;
        obj->field08->field1c = 0x20000;

        *mk3_frame(thread, frame + 1) = 0x8f3;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x8f3)
        return -3;

    obj->field1c          = obj->field08->field1c + 0x2000;
    obj->field08->field1c = obj->field1c;

    obj->field1c = *(uint32_t *)(G_BYTES + 0xac);
    obj->field20 = (uint32_t)((int32_t)(int16_t)MK3_FIELD12(obj->field08)
                              - (int32_t)obj->field1c);
    if ((long)obj->field20 < 0)
        obj->field20 = (uint32_t)(-(long)obj->field20);

    if ((long)obj->field20 > 0x80) {
        *mk3_frame(thread, thread->frame + 1) = 0x8f3;
        thread->fieldfc = 1;
        return 1;
    }

    obj->field38 = (uint32_t)(uintptr_t)t_eat_this_shit;
    takeover_him(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x901;
    thread->fieldfc = 0x16462;
    return 0x16462;
}


/* ---------------------------------------------------------------------- t_tornado_sucked
 *
 * armv7 0x0003a870, 168 bytes.  **Complete.**
 *
 *      token == 0:       player_normpal(obj)
 *                        me_in_back(obj)
 *                        obj->a10 = 0x4000
 *                        -- falls into the tail --
 *
 *      token == 0xec3:   obj->a10 += 0x2000
 *                        obj->field1c = obj->a10
 *                        towards_x_vel(obj)
 *                        get_x_dist(obj)
 *                        if (obj->field28 > 8) -- the tail --
 *                        set_inviso(obj)
 *                        stop_me_player(obj)
 *                        face_opponent(obj)
 *                        obj->field1c = 0x24; create_fx(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      the tail:         token := 0xec3, park 1
 *
 *      otherwise:        return -3
 *
 * **An accelerating pull, and the accumulator is 0x44.** The velocity starts at 0x4000 and grows
 * by 0x2000 every frame; each pass copies it into 0x1c and hands it to `towards_x_vel`, so the
 * victim is dragged in faster and faster until the gap closes to 8.
 *
 * **The same acceleration shape as `t_smoke_dropping` two functions up, with three differences**:
 * that one adds to the PART's 0x1c and this adds to the object's 0x44, that one falls and this
 * pulls sideways, and that one measures against `G + 0xac` while this uses `get_x_dist`. So the
 * engine has no shared integrator -- each routine keeps its own accumulator wherever it likes.
 *
 * When the victim arrives it is made invisible, stopped, turned, and replaced by effect 0x24. That
 * is the same disappear-and-leave-an-effect ending as mkanimal.c's `t_stung_by_scorpion`, which
 * uses `set_inviso` and effect 0x15 -- so vanishing is a two-call idiom and the effect number is
 * the only thing that varies.
 */
void me_in_back(MK3OBJ *obj);
void towards_x_vel(MK3OBJ *obj);

long t_tornado_sucked(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        player_normpal(obj);
        me_in_back(obj);

        obj->a10 = 0x4000;

    } else if (token == 0xec3) {
        obj->a10 = obj->a10 + 0x2000;
        obj->field1c = obj->a10;
        towards_x_vel(obj);

        get_x_dist(obj);
        if ((long)obj->field28 <= 8) {
            set_inviso(obj);
            stop_me_player(obj);
            face_opponent(obj);

            obj->field1c = 0x24;
            create_fx(obj);

            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
        }

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0xec3;
    thread->fieldfc = 1;
    return 1;
}

/* ----------------------------------------------------------------- t_fatality_start_pause
 *
 * armv7 0x00033d20, 172 bytes.  **Complete.**
 *
 *      token == 0:        obj->field20 = 1
 *                         token := 0x1bf3, descend into t_init_death_blow
 *
 *      token == 0x1bf3:   obj->field40 = 0
 *                         pose_a9_manual(obj)
 *                         token := 0x1bf7, park 0x14
 *
 *      token == 0x1bf7:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **The third member of the family, and it completes the kind table.** Three routines in three
 * files write a small constant into `obj->field20` and descend into `t_init_death_blow`:
 *
 *      1   t_fatality_start_pause    (here)
 *      3   t_animality_start_pause   (mkanimal.c)
 *      5   t_baby_start_pause        (mkstat.c)
 *
 * `t_init_death_blow`, written earlier in this file, copies that halfword into `G + 0x450` and
 * `G + 0x458` and fires `MKEvent_Add(3, 0xe, 0, 0)` for every value except 2. So **1, 3 and 5 are
 * fatality, animality and babality**, and the value the death blow treats specially -- 2 -- is
 * none of the three. It is bracketed on both sides now and still unaccounted for; whatever writes
 * it is not in the eight logic files closed so far.
 *
 * **This routine and `t_baby_start_pause` are the same three states with one number changed.**
 * Both zero 0x40, pose animation zero by hand, and wait: 0x14 here against 0x20 there. The
 * animality version poses nothing and only waits 0x1e. So the shared part is the death blow and
 * the pause, and each finisher kind supplies its own idle pose and its own delay.
 *
 * `ip` carries 0x1bf3 from before the dispatch into state 0's store, which is why that store reads
 * `str.w ip, ...` with no visible constant.
 */
long t_fatality_start_pause(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1bf3) {
        obj->field40 = 0;
        pose_a9_manual(obj);

        *mk3_frame(thread, frame + 1) = 0x1bf7;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token == 0x1bf7) {
        if ((long)frame > 0) {
            thread->frame = frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    obj->field20 = 1;

    *mk3_frame(thread, thread->frame + 1) = 0x1bf3;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_init_death_blow;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}




/* ----------------------------------------------------------------- t_chop_off_his_height
 *
 * armv7 0x00035a3c, 172 bytes.  **Complete.**
 *
 *      token == 0:       him = proc->him
 *                        him->y12 = (uint16_t)him->y12 + obj->field34
 *                        obj->field1c = him
 *                        obj->field48 = 0x00060008; shake_a11(obj)
 *                        obj->field1c = 5; ochar_sound(obj)
 *                        obj->field1c = 2; his_group_sound(obj)
 *                        call_for_him(obj, pounded_blood)
 *                        token := 0xb9d, park 0x10
 *
 *      token == 0xb9d:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **The name is literal: it adds `obj->field34` to the opponent's y and leaves them shorter.** The
 * read is `ldrh` and the write `strh`, both unsigned, so the height is a plain halfword here --
 * unlike `lifts3` above, which sign-extends the same class of field. Two routines, two readings, in
 * one file.
 *
 * `obj->field34` is the amount, supplied by the caller. In mkanimal.c that offset is the left edge
 * of the bounding box `mk3_getbbox` fills in; here it is a per-chop distance. The header records
 * 0x34..0x40 as a bounding box on the authority of the four `*_mpart_ob` routines, and this is a
 * use that does not fit -- worth flagging rather than reconciling.
 *
 * **The blood goes on the opponent through `call_for_him(obj, pounded_blood)`** -- the
 * register-passing member of the three handover mechanisms, where mkanimal.c's `tl_sonya_eagle`
 * uses the 0x1c one for `death_scream`. So a two-line helper exists so that this can be passed
 * rather than inlined.
 *
 * Two sounds from two different routines: `ochar_sound` with 5 for the chopper and
 * `his_group_sound` with 2 for the chopped. Both take their index in 0x1c.
 *
 * The shake pair is 0x00060008, asymmetric, and the same value mkanimal.c's `t_r_bat_bite` uses.
 */
void his_group_sound(MK3OBJ *obj);

long t_chop_off_his_height(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    MK3OBJ  *him;

    if (token == 0) {
        him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
        MK3_SET_FIELD12(him, (uint32_t)MK3_FIELD12(him) + obj->field34);

        obj->field1c = (uint32_t)(uintptr_t)
            (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;

        obj->field48 = 0x00060008;
        shake_a11(obj);

        obj->field1c = 5;
        ochar_sound(obj);

        obj->field1c = 2;
        his_group_sound(obj);

        call_for_him(obj, pounded_blood);

        *mk3_frame(thread, frame + 1) = 0xb9d;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token != 0xb9d)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ---------------------------------------------------------------------------- t_liftshake
 *
 * armv7 0x00036de8, 172 bytes.  **Complete.**
 *
 *      token == 0:        do_next_a9_frame(obj)
 *                         obj->field24 = 3
 *                         obj->field1c = obj->field08
 *                         lifts3(obj)
 *                         token := 0x143b, park 3
 *
 *      token == 0x143b:   obj->field24 = ~2            (-3)
 *                         obj->field1c = obj->field08
 *                         lifts3(obj)
 *                         token := 0x143f, park 3
 *
 *      token == 0x143f:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **Three across, then three back: one shake, done by moving both fighters twice.** `lifts3` shifts
 * the part in 0x1c and the opponent together, so +3 then -3 leaves both where they started and the
 * pair visibly jolts.
 *
 * **0x1c is reloaded before the second call**, because `lifts3` overwrites it with the opponent on
 * the way out. Reading the helper is what makes that store necessary rather than redundant -- a
 * transcription that dropped it would move the opponent twice and the part once.
 *
 * The second amount is written `mvn r3, #2`, giving -3 from the same immediate class as the 3 in
 * state 0 rather than from a literal pool. Transcribed as `~2` so the encoding stays visible.
 */
long t_liftshake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        do_next_a9_frame(obj);

        obj->field24 = 3;
        obj->field1c = (uint32_t)(uintptr_t)obj->field08;
        lifts3(obj);

        *mk3_frame(thread, frame + 1) = 0x143b;
        thread->fieldfc = 3;
        return 3;
    }

    if (token == 0x143b) {
        obj->field24 = (uint32_t)~2u;
        obj->field1c = (uint32_t)(uintptr_t)obj->field08;
        lifts3(obj);

        *mk3_frame(thread, frame + 1) = 0x143f;
        thread->fieldfc = 3;
        return 3;
    }

    if (token != 0x143f)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------------- t_flesh_ripped_off
 *
 * armv7 0x00035c40, 172 bytes.  **Complete.**
 *
 *      token == 0:       death_scream(obj)
 *                        face_opponent(obj)
 *                        NewThread(obj, t_ripped_skelton)
 *                        obj->field40 = ochar_reached[part->field24] + 0xc
 *                        obj->field1c = 3
 *                        token := 0xc4f, descend into t_mframew
 *
 *      token == 0xc4f:   frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **This is what settles what `ochar_reached` contains.** The entry is loaded, 0xc is added, and
 * the sum goes into 0x40 -- the cursor the animation routines walk. An offset into a scalar would
 * mean nothing, so **the table holds addresses of word lists**, one per fighter, and this routine
 * starts three words in.
 *
 * That is the same enter-part-way trick `t_robo_skeleton_burn` uses at the top of this file with
 * `&a_sb_skeleton_burn[2]`. Two sites, and in both the offset is what proves the type.
 *
 * `t_open_wide` earlier in this file reads the same table into 0x1c and lets one of three calls
 * consume it; its comment has been corrected to say the value is a pointer.
 *
 * The skeleton is a separate thread, `t_ripped_skelton` -- fifth site in the tree for spawning a
 * thread so an effect outlasts the state that started it, after `t_skburn3`'s fire,
 * `t_init_death_blow`'s tone and mkanimal.c's crunches and odour.
 */
long t_ripped_skelton(MK3THREAD *thread);        /* 0x00039a34 */

long t_flesh_ripped_off(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        death_scream(obj);
        face_opponent(obj);

        NewThread(obj, (MK3THREADFUNC)t_ripped_skelton);

        obj->field40 = ochar_reached[obj->field08->field24] + 0xc;
        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0xc4f;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc4f)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ------------------------------------------------------------------ t_gravity_ani_ysize
 *
 * armv7 0x0003a918, 180 bytes.  **Complete.**
 *
 *      token == 0:       part->field1c = obj->field20
 *                        -- falls into the tail --
 *
 *      token == 0xe99:   obj->field1c  = obj->a10 + part->field1c
 *                        part->field1c = obj->field1c
 *                        if (obj->field1c < 0) -- the tail --
 *                        obj->field1c = GetFrameHeight(part->field2c)
 *                        obj->field20 = (int16_t)part->y12
 *                        obj->field1c = GetFrameHeight(...) + obj->field20
 *                        obj->field24 = *(long *)(G + 0xac)
 *                        if (obj->field24 > obj->field1c) -- the tail --
 *                        stop_a8(part)
 *                        pop a level, or t_local_reaction_exit at the bottom
 *
 *      the tail:         token := 0xe99, park 1
 *
 *      otherwise:        return -3
 *
 * **Gravity again, and this time the landing test measures the body's BOTTOM rather than a fixed
 * margin.** The velocity accumulates in the part's 0x1c by `obj->a10` per frame, and the loop has
 * two ways to keep going:
 *
 *      still rising      obj->field1c < 0     -- a negative velocity means up, so do not test yet
 *      not down yet      floor > y + height   -- the bottom of the body is still above the floor
 *
 * So it falls until the animation's own height puts its base on the floor. That is a third
 * spelling of the fall, after `t_smoke_dropping`'s fixed 0x80 margin and `t_tornado_sucked`'s
 * horizontal pull -- and the only one that consults `GetFrameHeight`, which is why the name says
 * `ysize`.
 *
 * **`stop_a8` takes the PART, not the object.** It is eight bytes in other.c that zero 0x18 and
 * 0x1c on whatever it is handed, and other.c's own caller passes `obj->field08` too. So the
 * landing zeroes the part's two velocity words directly rather than going through the object.
 *
 * `obj->field1c` is written three times in the second state -- the velocity, then the height, then
 * height plus y -- and only the last is read. The first two are the arithmetic passing through a
 * field instead of a register, which is how this codebase does temporaries.
 *
 * The starting velocity comes from `obj->field20` and the acceleration from `obj->a10`, both left
 * by the caller, so nothing here fixes the rate.
 */
int GetFrameHeight(uint32_t ani);
void stop_a8(MK3OBJ *part);

long t_gravity_ani_ysize(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field08->field1c = obj->field20;

    } else if (token == 0xe99) {
        obj->field1c          = obj->a10 + obj->field08->field1c;
        obj->field08->field1c = obj->field1c;

        if ((long)obj->field1c >= 0) {
            obj->field1c = (uint32_t)GetFrameHeight(obj->field08->field2c);
            obj->field20 = (uint32_t)(int32_t)(int16_t)
                               MK3_FIELD12(obj->field08);
            obj->field1c = obj->field1c + obj->field20;

            obj->field24 = *(uint32_t *)(G_BYTES + 0xac);

            if ((long)obj->field24 <= (long)obj->field1c) {
                stop_a8(obj->field08);

                if ((long)frame > 0) {
                    thread->frame = frame - 1;
                    return 0;
                }
                return mk3_install(thread,
                                   (MK3THREADFUNC)t_local_reaction_exit);
            }
        }

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0xe99;
    thread->fieldfc = 1;
    return 1;
}


/* ------------------------------------------------------------------------ t_grow_n_shake
 *
 * armv7 0x00036ea0, 180 bytes.  **Complete.**
 *
 *      token == 0:       tsound_func(obj, 0x24)
 *                        tsound_func(obj, 0x25)
 *                        death_scream(obj)
 *                        do_next_a9_frame(obj)
 *                        obj->field1c = 0x00030003
 *                        obj->field20 = 0x00030003 - 0x30000 = 3
 *                        obj->field24 = 3 + 5 = 8
 *                        token := 0x85a, descend into t_shake_ob_up
 *
 *      token == 0x85a:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:        return -3
 *
 * **Three fields out of one literal, and this is the furthest the idiom goes in the tree.**
 * 0x00030003 is loaded once; `sub.w r3, r3, #0x30000` turns it into 3 for 0x20, and `adds r3, #5`
 * turns that into 8 for 0x24. Written as the arithmetic, because the values alone -- 0x00030003, 3,
 * 8 -- give no hint that they are one number walked twice.
 *
 * **It passes a packed halfword pair to `t_shake_ob_up` where mkanimal.c passes a plain 3.**
 * `t_stung_by_scorpion` and `t_r_scared_of_monkey` both set 0x1c to 3 flat, with 0x20 = 3 and
 * 0x24 = 0x14 or 8. This sets 0x1c to 0x00030003, whose LOW half is the same 3 -- so if the callee
 * reads only the low halfword the three callers agree, and if it reads the word they do not.
 * Nothing in these three routines settles which, and `t_shake_ob_up` itself is not written yet.
 * Flagged for whoever writes it.
 *
 * Sounds 0x24 and 0x25 as a pair again -- fifth site in the tree, after `t_crunch_sounds`'s six
 * repeats, `t_lion_mauled`'s split across two states, `tl_swat_dino`'s single pair and
 * `tl_sonya_eagle`'s two pairs. Here it is one pair at the very start of the reaction.
 *
 * The whole routine is one state of setup and a pop, so the shake is `t_shake_ob_up`'s work and the
 * grow is whatever `do_next_a9_frame` steps into.
 */
long t_grow_n_shake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        tsound_func(obj, 0x24);
        tsound_func(obj, 0x25);
        death_scream(obj);
        do_next_a9_frame(obj);

        obj->field1c = 0x00030003;
        obj->field20 = 0x00030003u - 0x30000u;
        obj->field24 = (0x00030003u - 0x30000u) + 5u;

        *mk3_frame(thread, thread->frame + 1) = 0x85a;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x85a)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------------------------------- t_jax_grow
 *
 * armv7 0x00033720, 180 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x102f, descend into t_fatality_start_pause
 *
 *      token == 0x102f:   sans_repell_for_good(obj)
 *                         obj->field38 = t_grow_victum
 *                         takeover_him(obj)
 *                         part->field2c = 0x177d
 *                         token := 0x10a1, park 0x10
 *
 *      token == 0x10a1:   death_blow_complete(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The attacker's half of the grow fatality, and both halves are now in this file.** It descends
 * into `t_fatality_start_pause` -- which writes kind 1 into 0x20 and runs the death blow -- then
 * hands `t_grow_victum` to the other fighter through 0x38 and `takeover_him`.
 *
 * So the full path is: `t_jax_grow` starts the finisher, `t_fatality_start_pause` sets kind 1 and
 * goes through `t_init_death_blow`, and the victim's own thread runs `t_grow_victum`, which reads
 * `part->field24 + 0x1b12` for its animation and screams. Four routines, all written from their own
 * disassembly, and they fit together with nothing left over.
 *
 * The attacker's own animation is a bare constant, 0x177d, in the same style as
 * `t_appearing_spikes` and `t_nail_spawn_proc` -- the grower gets a fixed pose while the victim
 * gets base-plus-character.
 *
 * `r1` carries 0x102f from before the dispatch into state 0's store, so that store shows no
 * constant of its own.
 */
long t_jax_grow(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x102f) {
        sans_repell_for_good(obj);

        obj->field38 = (uint32_t)(uintptr_t)t_grow_victum;
        takeover_him(obj);

        obj->field08->field2c = 0x177d;

        *mk3_frame(thread, frame + 1) = 0x10a1;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x10a1) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x102f;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}

/* ---------------------------------------------------------------------- t_crush_him_more
 *
 * armv7 0x00034760, 188 bytes.  **Complete.**
 *
 *      token == 0:        obj->field1c = 0
 *                         adjust_him_xy(obj)
 *                         if (obj->field40 != 0) {
 *                             obj->field1c = player_normpal; call_a0_for_him(obj)
 *                             obj->field1c = pose_a9_manual; call_a0_for_him(obj)
 *                         }
 *                         token := 0x1a05, descend into t_crush_sleep_5
 *
 *      token == 0x1a05:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **Two routines run on the opponent back to back through the 0x1c mechanism**, and both come out
 * of pointer slots: `player_normpal` (0x000f36f4) and `pose_a9_manual` (0x000f3718). So when 0x40
 * is set, the victim's palette is restored and they are posed by hand -- and when it is clear,
 * neither happens and the routine only nudges them.
 *
 * That makes 0x40 a plain FLAG here, tested against zero and never dereferenced. In this file and
 * in mkanimal.c the same offset is an animation cursor, a small index and a packed halfword pair;
 * this is a fourth reading, and the cheapest one.
 *
 * **`call_a0_for_him` twice in a row is the clearest sample of that mechanism in the tree.** The
 * two calls differ in nothing but the pointer written into 0x1c beforehand, which is exactly how
 * mkstat.c's note describes it -- and both callees are ordinary helpers rather than thread
 * handlers, like `tl_sonya_eagle`'s `death_scream` and unlike the 0x38 handovers.
 *
 * It then descends into `t_crush_sleep_5`, the four-frame wait written at the top of this batch of
 * work, which had no known caller until now.
 */
void adjust_him_xy(MK3OBJ *obj);
void call_a0_for_him(MK3OBJ *obj);
long t_crush_sleep_5(MK3THREAD *thread);

long t_crush_him_more(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = 0;
        adjust_him_xy(obj);

        if (obj->field40 != 0) {
            obj->field1c = (uint32_t)(uintptr_t)player_normpal;
            call_a0_for_him(obj);

            obj->field1c = (uint32_t)(uintptr_t)pose_a9_manual;
            call_a0_for_him(obj);
        }

        *mk3_frame(thread, thread->frame + 1) = 0x1a05;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_crush_sleep_5;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1a05)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------------ t_freeze_into_boomer
 *
 * armv7 0x00038180, 184 bytes.  **Complete.**
 *
 *      token == 0:        obj->field40 = 6
 *                         get_his_char_ani2(obj)
 *                         obj->field40 = obj->field40 + 4
 *                         do_next_a9_frame(obj)
 *                         part->y12 = *(long *)(G + 0xac) - 0x90
 *                         obj->field1c = 6
 *                         token := 0x1459, descend into t_mframew
 *
 *      token == 0x1459:   frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **`get_his_char_ani2` turns a small index into a pointer, and the +4 proves it.** That routine
 * (other.c, 28 bytes) indexes `character_anitabs2` by the OPPONENT's character number and then by
 * whatever is in 0x40, so 6 goes in and an address comes out. Adding 4 to the result enters the
 * list one word in -- meaningless on a scalar.
 *
 * Third site in the tree for entering a word list part-way, after `t_robo_skeleton_burn`'s
 * `&a_sb_skeleton_burn[2]` and `t_flesh_ripped_off`'s `ochar_reached[char] + 0xc`. In all three the
 * offset is what settles the type.
 *
 * **The placement is floor minus a CONSTANT, not floor minus a measured height.** `G + 0xac` minus
 * 0x90 goes straight into the part's 0x12. That is a sixth spelling of putting a body somewhere
 * vertical -- the five in mkanimal.c and `tl_jade_kitty` all measure the sprite, and this one does
 * not measure anything. So a routine that knows exactly which animation is playing can hard-code
 * the offset, and this one does.
 *
 * `r8` holds 6 for the whole routine and is stored twice, into 0x40 as the index and into 0x1c as
 * the frame count. One register, two unrelated uses, and the constant happens to suit both.
 */
void get_his_char_ani2(MK3OBJ *obj);

long t_freeze_into_boomer(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field40 = 6;
        get_his_char_ani2(obj);
        obj->field40 = obj->field40 + 4;

        do_next_a9_frame(obj);

        MK3_SET_FIELD12(obj->field08,
                        *(uint32_t *)(G_BYTES + 0xac) - 0x90);

        obj->field1c = 6;

        *mk3_frame(thread, thread->frame + 1) = 0x1459;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1459)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* --------------------------------------------------------------------- t_r_ind_lightning
 *
 * armv7 0x000361ec, 188 bytes.  **Complete.**
 *
 *      token == 0:        obj->field1c = ~0xb7            (-0xb8)
 *                         obj->field20 = 0
 *                         fatal_offset(obj)
 *                         tsound_func(obj, 0)
 *                         tsound_func(obj, 1)
 *                         obj->field48 = 0x000a000d; shake_a11(obj)
 *                         death_scream(obj)
 *                         obj->field48 = 4
 *                         token := 0x1525, descend into t_shocker_shaker
 *
 *      token == 0x1525:   part->y12 = *(short *)((char *)proc + 0x3c)
 *                         frame[frame].handler = t_collapse_on_ground
 *
 *      otherwise:         return -3
 *
 * **0x48 is written twice for two different callees, four instructions apart.** First
 * 0x000a000d, which `shake_a11` reads as a pair of halfwords, then 4, which `t_shocker_shaker`
 * takes as a count. The clearest single-function example of that field's overloading in the tree:
 * neither store is dead and neither reading is wrong.
 *
 * The shake pair is asymmetric, 0xa and 0xd -- fifth asymmetric site, after mkstat.c's 0x00030008
 * and 0x0009000e, mkanimal.c's `t_r_bat_bite` 0x00060008 and `tl_sonya_eagle` 0x0008000c.
 *
 * **`fatal_offset` is the save-around-clobber idiom in 32 bytes**: it keeps 0x1c and 0x20 in
 * registers, calls `match_me_with_him` and `flip_multi`, puts both fields back, and only then calls
 * `multi_adjust_xy`. So a caller can set the offset first and trust it survives the repositioning
 * -- which is why this routine writes -0xb8/0 before the call rather than after.
 *
 * **The final y comes out of the PROC at 0x3c**, read as a halfword. That offset is inside the
 * header's `_pad2c`, so it has no name yet; reached here through the byte-offset idiom. First use
 * of proc 0x3c in the tree, and it holds a vertical position.
 *
 * Sounds 0 and 1 as a pair, which is the same two-samples habit as 0x24/0x25 and 0x1d/0x1e -- and
 * the first pair in the tree whose first index is zero, arriving as `mov r1, r6` off the token
 * register rather than as a `movs`.
 */
void fatal_offset(MK3OBJ *obj);
long t_shocker_shaker(MK3THREAD *thread);        /* 0x00033dcc */

long t_r_ind_lightning(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field1c = (uint32_t)~0xb7u;
        obj->field20 = 0;
        fatal_offset(obj);

        tsound_func(obj, 0);
        tsound_func(obj, 1);

        obj->field48 = 0x000a000d;
        shake_a11(obj);

        death_scream(obj);

        obj->field48 = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x1525;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shocker_shaker;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1525)
        return -3;

    MK3_SET_FIELD12(obj->field08,
                    *(uint16_t *)((char *)obj->field00 + 0x3c));

    return mk3_install(thread, (MK3THREADFUNC)t_collapse_on_ground);
}


/* -------------------------------------------------------------------------- t_r_prevomit
 *
 * armv7 0x00038860, 188 bytes.  **Complete.**
 *
 *      token == 0:       obj->field1c = (int16_t)part->y12
 *                        -- PUSH: *mk3_arg(thread, argc++) = that y --
 *                        match_me_with_him(obj)
 *                        obj->field20 = 0
 *                        obj->field1c = 0x5c
 *                        multi_adjust_xy(obj)
 *                        face_opponent(obj)
 *                        -- POP: part->y12 = (uint16_t)*mk3_arg(thread, --argc) --
 *                        obj->field1c = 0x13; his_ochar_sound(obj)
 *                        token := 0x594, park 0xd
 *
 *      token == 0x594:   obj->field1c = 0x10; his_ochar_sound(obj)
 *                        frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **This is the first routine in the tree to use the thread's ARGUMENT STACK.** The header records
 * `args[0x50]` at 0xa8 with the cursor in `fieldf8`, and nothing had been seen touching it until
 * now. Here it is a save stack: the part's y is pushed, the body is moved to the opponent and
 * shifted 0x5c across, and then the y is popped back -- so the repositioning changes x and leaves
 * the height exactly where it was.
 *
 * That is the same job `fatal_offset` does two functions up, and the two solve it differently:
 * `fatal_offset` keeps the fields in REGISTERS across the calls, and this keeps one in the thread's
 * own stack. Both are save-around-clobber; only this one survives a call that could re-enter.
 *
 * **The push and the pop are not the same width.** `str.w` writes a full word and `ldrh` reads
 * back only the low halfword, which is safe because the value came from an `ldrsh` of a halfword
 * field -- but a caller that pushed anything wider would lose the top half. Transcribed at the
 * widths the binary uses rather than normalised.
 *
 * Two sounds through `his_ochar_sound`, 0x13 then 0x10 thirteen frames apart -- the pair habit
 * again, this time spread across two states and played on the OPPONENT.
 */
void his_ochar_sound(MK3OBJ *obj);

long t_r_prevomit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc;

    if (token == 0) {
        obj->field1c = (uint32_t)(int32_t)(int16_t)MK3_FIELD12(obj->field08);

        argc = thread->fieldf8;
        *mk3_arg(thread, argc) = obj->field1c;
        thread->fieldf8 = argc + 1;

        match_me_with_him(obj);

        obj->field20 = 0;
        obj->field1c = 0x5c;
        multi_adjust_xy(obj);

        face_opponent(obj);

        argc = thread->fieldf8 - 1;
        thread->fieldf8 = argc;
        MK3_SET_FIELD12(obj->field08, (uint16_t)*mk3_arg(thread, argc));

        obj->field1c = 0x13;
        his_ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0x594;
        thread->fieldfc = 0xd;
        return 0xd;
    }

    if (token != 0x594)
        return -3;

    obj->field1c = 0x10;
    his_ochar_sound(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* ---------------------------------------------------------------------- t_r_impale_upcut
 *
 * armv7 0x0003b4d4, 192 bytes.  **Complete.**
 *
 *      token == 0:       me_in_front(obj)
 *                        obj->field1c = 1; create_blood_proc(obj)
 *                        obj->field48 = 0x00060006; shake_a11(obj)
 *                        rsnd_func(obj, 0xa)
 *                        death_scream(obj)
 *                        obj->field1c = 0x20000
 *                        obj->field20 = 0x20000 - 0x120000 = -0x100000
 *                        obj->field28 = 5
 *                        obj->field24 = 0
 *                        obj->field34 = t_impale_call
 *                        token := 0x7a6, descend into t_flight_call
 *
 *      token == 0x7a6:   frame[frame].handler = t_reaction_land
 *
 *      otherwise:        return -3
 *
 * **The first `t_flight_call` caller measured, and it confirms what 0x34 is for.** The four flight
 * fields go in as usual -- 0x1c across, 0x20 up, 0x24 the fall rate, 0x28 the bounce kind -- and
 * then 0x34 gets the address of `t_impale_call`, which the flight routine calls once per frame.
 * The plain `t_flight` used by mkanimal.c's `t_dino_bucked` and `t_hit_by_bull` reads no such
 * field.
 *
 * So a caller that needs something to happen DURING the arc uses this variant and supplies the
 * callback; one that only needs the arc uses `t_flight`. Same four numbers either way.
 *
 * **0x24 is zero here where every mkanimal.c flight sets it to 0x5000, 0x6000 or 0x8000.** With no
 * fall rate the body rises at -0x100000 and does not come down on its own, which is consistent
 * with an impaling: the arc ends on the spike, not on the floor. The landing is `t_reaction_land`
 * off pointer slot 0x000f36ec.
 *
 * One literal feeds two fields again -- `mov.w r3, #0x20000` then `sub.w r3, r3, #0x120000` -- and
 * this time the subtraction does NOT wrap: 0x20000 - 0x120000 is -0x100000, a perfectly ordinary
 * negative. Not every one of these is an overflow, and each has to be worked out.
 */
long t_impale_call(MK3THREAD *thread);           /* 0x0003b594 */
long t_flight_call(MK3THREAD *thread);           /* pointer slot 0x000f37f4 */
long t_reaction_land(MK3THREAD *thread);         /* pointer slot 0x000f36ec */

long t_r_impale_upcut(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        me_in_front(obj);

        obj->field1c = 1;
        create_blood_proc(obj);

        obj->field48 = 0x00060006;
        shake_a11(obj);

        rsnd_func(obj, 0xa);
        death_scream(obj);

        obj->field1c = 0x20000;
        obj->field20 = 0x20000u - 0x120000u;
        obj->field28 = 5;
        obj->field24 = 0;
        obj->field34 = (uint32_t)(uintptr_t)t_impale_call;

        *mk3_frame(thread, frame + 1) = 0x7a6;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight_call;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x7a6)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_reaction_land);
}


/* --------------------------------------------------------------------------- t_r_tasered
 *
 * armv7 0x000362a8, 192 bytes.  **Complete.**
 *
 *      token == 0:        obj->field20 = 0
 *                         obj->field1c = (int16_t)taser_lineups[part->field24]
 *                         fatal_offset(obj)
 *                         obj->field48 = 0x000a0010; shake_a11(obj)
 *                         tsound_func(obj, 0x1e)
 *                         death_scream(obj)
 *                         obj->field48 = 9
 *                         token := 0x13fc, descend into t_shocker_shaker
 *
 *      token == 0x13fc:   part->y12 = *(short *)((char *)proc + 0x3c)
 *                         frame[frame].handler = t_collapse_on_ground
 *
 *      otherwise:         return -3
 *
 * **The twin of `t_r_ind_lightning` two functions up, and the pair separates what is shared from
 * what the fatality supplies.** Both call `fatal_offset` with 0x20 zero, shake, scream, put a count
 * in 0x48, descend into `t_shocker_shaker`, and end by reading the proc's 0x3c into the part's y
 * and installing `t_collapse_on_ground`. Everything else differs:
 *
 *      routine              x offset                    sound     0x48 count
 *      t_r_ind_lightning    -0xb8, a constant           0 and 1   4
 *      t_r_tasered          taser_lineups[char]         0x1e      9
 *
 * **`taser_lineups` is a new per-character table and the first HALFWORD one in the tree.** It is
 * indexed with `ldrsh.w r3, [r2, r3, lsl #1]` -- shift by one, sign-extended -- where
 * `ochar_reached` and `ochar_wide_adjusts` are word tables read with `lsl #2`. So this holds signed
 * 16-bit offsets, one per fighter: how far the taser has to stand from each of them.
 *
 * Third per-character table found in this file, after the two in `t_open_wide`, and none of the
 * three was referenced anywhere in the tree before.
 *
 * The shake pair is 0x000a0010, asymmetric -- sixth asymmetric site.
 */
extern int16_t taser_lineups[];                  /* 0x00166c44 */

long t_r_tasered(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field20 = 0;
        obj->field1c = (uint32_t)(int32_t)
                           taser_lineups[obj->field08->field24];
        fatal_offset(obj);

        obj->field48 = 0x000a0010;
        shake_a11(obj);

        tsound_func(obj, 0x1e);
        death_scream(obj);

        obj->field48 = 9;

        *mk3_frame(thread, frame + 1) = 0x13fc;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shocker_shaker;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13fc)
        return -3;

    MK3_SET_FIELD12(obj->field08,
                    *(uint16_t *)((char *)obj->field00 + 0x3c));

    return mk3_install(thread, (MK3THREADFUNC)t_collapse_on_ground);
}

/* ------------------------------------------------------------------------ t_get_sliced_up
 *
 * armv7 0x0003a0e8, 200 bytes.  **Complete.**
 *
 *      token == 0:        death_scream(obj)
 *                         set_ignore_y(obj)
 *                         obj->field48 = 0x0004000e; shake_a11(obj)
 *                         obj->field48 = 1
 *                         obj->a10 = 1
 *                         obj->field40 = 1 + 0x1f = 0x20
 *                         find_ani_part2(obj)
 *                         obj->field1c = 3; init_anirate(obj)
 *                         -- falls into the rise --
 *
 *      token == 0x10de:   if (--obj->field48 <= 0) {
 *                             obj->field48 = 0x1e
 *                             obj->field1c = 0x1e + 2 = 0x20
 *                             create_fx(obj)
 *                         }
 *                         if (--obj->a10 <= 0) {
 *                             rsnd_func(obj, 3)
 *                             obj->a10 = 9
 *                         }
 *                         next_anirate(obj)
 *                         distance_off_ground(obj)
 *                         obj->field1c = (obj->field1c <= 0x3f) ? 0xfffe0000 : 0
 *                         -- falls into the tail --
 *
 *      the tail:          part->field1c = obj->field1c
 *                         token := 0x10de, park 1
 *
 *      otherwise:         return -3
 *
 * **Two counters on two different periods, and the routine never ends.** 0x48 fires effect 0x20
 * every thirty frames and 0x44 makes sound 3 every nine, and every path falls through to the same
 * token store -- so the slicing goes on until something outside replaces the handler. Fourth
 * endless routine in the tree, after `t_lion_mauled`, `t_stung_a_bunch` and `tl_reptile_monkey`.
 *
 * **The velocity is a two-way choice, not an accumulator.** `distance_off_ground` answers in 0x1c,
 * and the body is pushed UP at -0x20000 while it is 0x3f or less off the ground and given exactly
 * zero once it is higher. So it is held at a height rather than thrown -- which is what
 * `set_ignore_y` in state 0 is for: the engine's own gravity is switched off first.
 *
 * That is a fourth spelling of vertical motion in this file, after `t_smoke_dropping`'s
 * accumulating fall, `t_gravity_ani_ysize`'s height-aware landing and `t_r_impale_upcut`'s
 * fall-rate-of-zero arc.
 *
 * **0x48 is written three times in state 0**: the shake pair 0x0004000e, then 1 as a counter. Both
 * readings in four instructions, the same overlap `t_r_ind_lightning` shows.
 *
 * `obj->field40 = 0x20` is compiled as `adds r3, #0x1f` on the 1 already in the register, one more
 * instance of the shared-literal habit -- here sharing between a counter and an animation number,
 * which have nothing to do with each other.
 */
void set_ignore_y(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void distance_off_ground(MK3OBJ *obj);

long t_get_sliced_up(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        death_scream(obj);
        set_ignore_y(obj);

        obj->field48 = 0x0004000e;
        shake_a11(obj);

        obj->field48 = 1;
        obj->a10     = 1;
        obj->field40 = 1 + 0x1f;
        find_ani_part2(obj);

        obj->field1c = 3;
        init_anirate(obj);

        obj->field1c = 0xfffe0000u;

    } else if (token == 0x10de) {
        obj->field48 = obj->field48 - 1;
        if ((long)obj->field48 <= 0) {
            obj->field48 = 0x1e;
            obj->field1c = 0x1e + 2;
            create_fx(obj);
        }

        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            rsnd_func(obj, 3);
            obj->a10 = 9;
        }

        next_anirate(obj);
        distance_off_ground(obj);

        obj->field1c = ((long)obj->field1c <= 0x3f) ? 0xfffe0000u : 0u;

    } else {
        return -3;
    }

    obj->field08->field1c = obj->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0x10de;
    thread->fieldfc = 1;
    return 1;
}


/* ----------------------------------------------------------------------------- t_kissani
 *
 * armv7 0x00036d18, 208 bytes.  **Complete.**
 *
 *      token == 0:        do_next_a9_frame(obj)
 *                         PUSH obj->field08
 *                         PUSH obj->field40
 *                         obj->field40 = obj->field48
 *                         obj->field08 = (MK3OBJ *)obj->a10
 *                         if (*(long *)obj->field40 != 0)
 *                             obj->field08->field2c = *(long *)obj->field40
 *                         obj->field40 += 4
 *                         obj->field48  = obj->field40
 *                         POP  obj->field40
 *                         POP  obj->field08
 *                         token := 0x16a3, park 4
 *
 *      token == 0x16a3:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **The second user of the argument stack, and it pushes TWO values -- which is what proves the
 * thing is a stack and not a single save slot.** `t_r_prevomit` pushes one word around a
 * repositioning; this pushes the part and the cursor, works on a completely different pair, and
 * pops both back in the reverse order. The cursor at `fieldf8` moves by one each time in both
 * directions.
 *
 * **What it does between the pushes is the two-field swap.** `obj->field08` and `obj->field40` are
 * replaced by `obj->a10` and `obj->field48`, one word of the substituted list is read and copied
 * into the substituted part's animation, the substituted cursor is advanced by four, and then the
 * originals come back. So the object drives a SECOND body for one frame without disturbing its own.
 *
 * mkanimal.c's `create_fx_for_him` does the same two-field swap in registers, for one call. This
 * does it across a longer body and so needs somewhere to put the saved values -- and the argument
 * stack is where.
 *
 * The advanced cursor is written to BOTH 0x40 and 0x48 before the pop, so 0x48 keeps the progress
 * and 0x40 is thrown away by the restore. That is why the routine can be called repeatedly and
 * walk the list one word per call.
 *
 * `if (*(long *)obj->field40 != 0)` guards the animation store, so a zero entry leaves the part
 * as it was -- a terminator that means "no change" rather than "stop".
 */
long t_kissani(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc;
    uint32_t entry;

    if (token == 0) {
        do_next_a9_frame(obj);

        argc = thread->fieldf8;
        *mk3_arg(thread, argc) = (uint32_t)(uintptr_t)obj->field08;
        argc = argc + 1;
        thread->fieldf8 = argc;

        *mk3_arg(thread, argc) = obj->field40;
        argc = argc + 1;
        thread->fieldf8 = argc;

        obj->field40 = obj->field48;
        obj->field08 = (MK3OBJ *)(void *)(uintptr_t)obj->a10;

        entry = *(uint32_t *)(uintptr_t)obj->field40;
        if (entry != 0)
            obj->field08->field2c = entry;

        obj->field40 = obj->field40 + 4;
        obj->field48 = obj->field40;

        argc = thread->fieldf8 - 1;
        thread->fieldf8 = argc;
        obj->field40 = *mk3_arg(thread, argc);

        argc = thread->fieldf8 - 1;
        thread->fieldf8 = argc;
        obj->field08 = (MK3OBJ *)(void *)(uintptr_t)*mk3_arg(thread, argc);

        *mk3_frame(thread, frame + 1) = 0x16a3;
        thread->fieldfc = 4;
        return 4;
    }

    if (token != 0x16a3)
        return -3;

    if ((long)frame > 0) {
        thread->frame = frame - 1;
        return 0;
    }

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* ------------------------------------------------------------------ t_scorpion_remove_mask
 *
 * armv7 0x00034c0c, 208 bytes.  **Complete.**
 *
 *      token == 0:        obj->field40 = 0xd
 *                         get_char_ani2(obj)
 *                         obj->field1c = 0x00050002
 *                         token := 0x529, descend into t_animate_a0_frames
 *
 *      token == 0x529:    obj->field1c = 0x00050004
 *                         token := 0x547, descend into t_animate_a0_frames
 *
 *      token == 0x547:    pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **Two runs of the same animator with two packed pairs.** `t_animate_a0_frames` takes its pair in
 * 0x1c -- the reading `tl_jax_lion` and `tl_sz_polar` established in mkanimal.c -- and here the
 * halves are 5/2 then 5/4. The high half is 5 in both, so whatever it selects does not change
 * between the two runs and only the low half does.
 *
 * Across the four sites measured when this was written (0x00050020, 0x00050010, 0x00050002,
 * 0x00050004) the high half was 5 every time, and I recorded that as a constraint. **It is not
 * one**: `t_skin_fall` later in this file passes 0x00080002, whose high half is 8. Five sites,
 * high halves 5, 5, 5, 5, 8 -- so 5 is merely common, and both halves vary. The note stands only
 * as a frequency observation.
 *
 * `get_char_ani2` resolves 0xd into 0x40 before the first run, so both runs walk the same resolved
 * list and the second continues where the first left off.
 */
void get_char_ani2(MK3OBJ *obj);

long t_scorpion_remove_mask(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x529) {
        obj->field1c = 0x00050004;

        *mk3_frame(thread, frame + 1) = 0x547;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a0_frames;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x547) {
        if ((long)frame > 0) {
            thread->frame = frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    obj->field40 = 0xd;
    get_char_ani2(obj);

    obj->field1c = 0x00050002;

    *mk3_frame(thread, thread->frame + 1) = 0x529;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_animate_a0_frames;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------------- t_r_head_rip
 *
 * armv7 0x00035fbc, 216 bytes.  **Complete.**
 *
 *      token == 0:       match_me_with_him(obj)
 *                        obj->field40 = 0x25; get_char_ani(obj)
 *                        p = &ochar_headrip_lineups[part->field24 * 2]
 *                        obj->field1c =  (int16_t)p[0]
 *                        obj->field20 = -(int16_t)p[1]
 *                        multi_adjust_xy(obj)
 *                        face_opponent(obj)
 *                        obj->field40 = 0x48; pose_a9_manual(obj)
 *                        obj->field1c = 2; group_sound(obj)
 *                        obj->field1c = 0x00020002
 *                        obj->field20 = 3
 *                        obj->field24 = 3 + 5 = 8
 *                        token := 0x365, descend into t_shake_ob_up
 *
 *      token == 0x365:   frame[frame].handler = t_wait_forever
 *
 *      otherwise:        return -3
 *
 * **`ochar_headrip_lineups` holds a PAIR per fighter, and it is the first table in the tree that
 * does.** The index is `char * 4` -- `lsls r2, r3, #2` -- and then TWO signed halfwords are read
 * from it, at +0 and +2, with `ldrsh` both times. So each fighter gets an (x, y) offset rather than
 * a single number, where `ochar_reached` and `ochar_wide_adjusts` give one word each and
 * `taser_lineups` one halfword.
 *
 * Fourth per-character table found in this file. The y half is negated on the way in, exactly as
 * `ochar_wide_adjusts` is in `t_open_wide` -- so these tables store positive distances and the
 * caller decides the sign.
 *
 * **Animation 0x48 posed by hand, fourth site.** mkanimal.c's `t_stung_by_scorpion` and
 * `t_r_scared_of_monkey` pose it on themselves and `tl_kano_spider` poses it on the opponent; this
 * is the first in mkfatal.c. One pose, four routines, three files.
 *
 * **The `t_shake_ob_up` values vary in their low half.** The four callers measured here pass 3
 * (twice, plain), 0x00030003 and 0x00020002 -- low halves 3, 3, 3, 2. That looked like the
 * parameter, but `t_eat_this_shit` later in this file passes 0x20000, whose low half is ZERO, and
 * the reading does not survive it. See that routine; the question is open.
 */
extern int16_t ochar_headrip_lineups[];          /* 0x00166a94 */

long t_r_head_rip(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    int16_t *p;

    if (token == 0) {
        match_me_with_him(obj);

        obj->field40 = 0x25;
        get_char_ani(obj);

        p = &ochar_headrip_lineups[obj->field08->field24 * 2];
        obj->field1c = (uint32_t)(int32_t)p[0];
        obj->field20 = (uint32_t)(-(int32_t)p[1]);
        multi_adjust_xy(obj);

        face_opponent(obj);

        obj->field40 = 0x48;
        pose_a9_manual(obj);

        obj->field1c = 2;
        group_sound(obj);

        obj->field1c = 0x00020002;
        obj->field20 = 3;
        obj->field24 = 3 + 5;

        *mk3_frame(thread, frame + 1) = 0x365;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x365)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}

/* --------------------------------------------------------------------------- t_crush_duck
 *
 * armv7 0x0003809c, 228 bytes.  **Complete.**
 *
 *      token == 0:        NewThread(obj, t_crush_blood)
 *                         obj->field1c = 0x2c; create_fx(obj)
 *                         obj->field48 = 0x000c000c; shake_a11(obj)
 *                         tsound_func(obj, 0x23)
 *                         obj->field40 = 0x00040004
 *                         token := 0x15b2, descend into t_animate_a9
 *
 *      token == 0x15b2:   obj->field40 = 5; get_his_char_ani2(obj)
 *                         do_next_a9_frame(obj)
 *                         part->y12 = (uint16_t)*(short *)(G + 0xac)
 *                         obj->field1c = 0
 *                         obj->field20 = ~0x8f          (-0x90)
 *                         multi_adjust_xy(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The same landing spot as `t_freeze_into_boomer`, reached the other way round.** That routine
 * computes `floor - 0x90` and stores the result; this stores the floor and then shifts by -0x90
 * through `multi_adjust_xy`. Two spellings of one position in one file -- and they are not
 * interchangeable, because the second goes through the mover and so obeys whatever else
 * `multi_adjust_xy` does.
 *
 * That makes seven spellings of vertical placement in the tree. Nothing shares a helper.
 *
 * The blood is a separate thread, `t_crush_blood` -- sixth site in the tree for spawning one so an
 * effect outlasts the state that caused it.
 *
 * **0x40 carries a packed pair, 0x00040004, for `t_animate_a9`.** Eighth site for that reading, and
 * the first in mkfatal.c; the seven before it are in mkanimal.c and mkcanned.c. Both halves are 4
 * here, so this caller says nothing about which half means what.
 *
 * The shake pair is 0x000c000c, doubled and the largest in the tree so far -- 0xc against the 0xa
 * the large animals use and the 3 the spikes use.
 */
long t_animate_a9(MK3THREAD *thread);            /* pointer slot 0x000f36d0 */
long t_crush_blood(MK3THREAD *thread);           /* 0x000331d0 */

long t_crush_duck(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        NewThread(obj, (MK3THREADFUNC)t_crush_blood);

        obj->field1c = 0x2c;
        create_fx(obj);

        obj->field48 = 0x000c000c;
        shake_a11(obj);

        tsound_func(obj, 0x23);

        obj->field40 = 0x00040004;

        *mk3_frame(thread, frame + 1) = 0x15b2;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x15b2)
        return -3;

    obj->field40 = 5;
    get_his_char_ani2(obj);

    do_next_a9_frame(obj);

    MK3_SET_FIELD12(obj->field08, *(uint16_t *)(G_BYTES + 0xac));

    obj->field1c = 0;
    obj->field20 = (uint32_t)~0x8fu;
    multi_adjust_xy(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ----------------------------------------------------------------------- t_shocker_shaker
 *
 * armv7 0x00033dcc, 244 bytes.  **Complete.**
 *
 *      token == 0:        obj->field1c = ochar_shocked_ani[part->field24]
 *                         obj->field40 = same
 *                         player_swpal(obj, 5)
 *                         obj->a10 = obj->field40
 *                         -- falls into the loop head --
 *
 *      the loop head:     obj->field40 = obj->a10
 *                         PUSH obj->a10
 *                         obj->a10     = 3
 *                         obj->field1c = 3 + 0x11 = 0x14
 *                         create_fx(obj)
 *                         POP  obj->a10
 *                         obj->field1c = 4
 *                         token := 0x1b9c, descend into t_mframew
 *
 *      token == 0x1b9c:   if (--obj->field48 > 0) -- the loop head --
 *                         pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **This is what consumes the 0x48 count the two shock reactions leave behind.**
 * `t_r_ind_lightning` sets it to 4 and `t_r_tasered` to 9, and both descend here; the loop runs
 * that many times, four frames apart, spawning effect 0x14 each pass. Three routines, one counter,
 * and none of them makes sense without the others.
 *
 * **Third user of the argument stack, and the first to use it inside a LOOP.** `t_r_prevomit`
 * pushes one word around a repositioning and `t_kissani` pushes two around a swap; this pushes one
 * on every pass, because `obj->a10` has to hold 3 for `create_fx` and hold the animation cursor for
 * everything else.
 *
 * That closes a question left open in mkanimal.c. `t_cute_animality_start` sets `obj->a10` from
 * 0x3c immediately before calling `create_fx`, which showed 0x44 is an INPUT to that routine. This
 * shows the other half: a caller that already had something in 0x44 must save it, because the call
 * needs the slot. The argument stack is what makes both uses possible in one routine.
 *
 * **`ochar_shocked_ani` is the fifth per-character table found in this file** -- words, `lsl #2`,
 * one entry per fighter, at 0x00166e08. It goes into 0x1c and 0x40 together, and 0x40 is the
 * animation cursor, so the entries are animations or lists of them.
 *
 * `player_swpal(obj, 5)` is the shocked palette, where mkanimal.c's `t_stung_by_scorpion` uses 3
 * for poison. Two of the palette numbers are now known.
 *
 * The 0x14 in 0x1c is built as `movs r3, #3` then `adds r3, #0x11` off the same register that just
 * supplied 3 to 0x44 -- one literal feeding a counter and an effect number, which have nothing to
 * do with each other. The habit again.
 */
extern uint32_t ochar_shocked_ani[];             /* 0x00166e08 */
void player_swpal(MK3OBJ *obj, uint32_t which);

long t_shocker_shaker(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc;

    if (token == 0) {
        obj->field1c = ochar_shocked_ani[obj->field08->field24];
        obj->field40 = obj->field1c;

        player_swpal(obj, 5);

        obj->a10 = obj->field40;

    } else if (token == 0x1b9c) {
        obj->field48 = obj->field48 - 1;
        if ((long)obj->field48 <= 0) {
            if ((long)frame > 0) {
                thread->frame = frame - 1;
                return 0;
            }
            return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
        }

    } else {
        return -3;
    }

    obj->field40 = obj->a10;

    argc = thread->fieldf8;
    *mk3_arg(thread, argc) = obj->a10;
    thread->fieldf8 = argc + 1;

    obj->a10     = 3;
    obj->field1c = 3 + 0x11;
    create_fx(obj);

    argc = thread->fieldf8 - 1;
    thread->fieldf8 = argc;
    obj->a10 = *mk3_arg(thread, argc);

    obj->field1c = 4;

    *mk3_frame(thread, thread->frame + 1) = 0x1b9c;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ----------------------------------------------------------------------- t_eat_this_shit
 *
 * armv7 0x00039d0c, 232 bytes.  **Complete.**
 *
 *      token == 0:        rsnd_func(obj, 5)
 *                         obj->field1c = 0x20000
 *                         obj->field20 = 2
 *                         obj->field24 = 2 + 2 = 4
 *                         token := 0x8e4, descend into t_shake_ob_up
 *
 *      token == 0x8e4:    token := 0x8e6, park 0x20
 *
 *      token == 0x8e6:    set_inviso(obj)
 *                         obj->field1c = 0x18; create_fx(obj)
 *                         token := 0x8eb, descend into t_white_flash
 *
 *      token == 0x8eb:    frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The victim's half of `t_smoke_dropping`**, handed across through 0x38 when that routine's fall
 * ends within 0x80 of the floor. Shake, wait, vanish, flash, park -- and the two routines together
 * are the whole of that fatality's landing.
 *
 * **This caller complicates what I claimed about `t_shake_ob_up`'s 0x1c, and the earlier note is
 * too confident.** After `t_r_head_rip` the four callers read 3, 3, 0x00030003 and 0x00020002, and
 * I recorded that the low half is the parameter that varies. This one passes **0x20000**, whose low
 * half is zero and whose high half is 2. Five callers now:
 *
 *      3            (mkanimal.c, twice)
 *      0x00030003   (t_grow_n_shake)
 *      0x00020002   (t_r_head_rip)
 *      0x20000      (here)
 *
 * A zero low half does not fit the reading, so **0x1c to `t_shake_ob_up` is not settled** and the
 * packed-pair interpretation may have been the wrong frame for it entirely. `t_shake_ob_up` is
 * still unwritten; whoever writes it settles this, and should not take the earlier note as fact.
 *
 * `obj->field24 = 4` is compiled as `adds r3, r3, r3` -- a DOUBLING of the 2 already in the
 * register, rather than the add-a-constant form every other shared-literal site uses. Same habit,
 * a third spelling of it.
 *
 * The ending is `set_inviso` plus an effect, the disappear idiom shared with mkanimal.c's
 * `t_stung_by_scorpion` (effect 0x15) and `t_tornado_sucked` (effect 0x24); here it is 0x18, and
 * a white flash follows.
 */
long t_white_flash(MK3THREAD *thread);           /* pointer slot 0x000f36f0 */

long t_eat_this_shit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x8e4) {
        *mk3_frame(thread, frame + 1) = 0x8e6;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0x8e6) {
        set_inviso(obj);

        obj->field1c = 0x18;
        create_fx(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x8eb;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_white_flash;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x8eb)
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    if (token != 0)
        return -3;

    rsnd_func(obj, 5);

    obj->field1c = 0x20000;
    obj->field20 = 2;
    obj->field24 = 2 + 2;

    *mk3_frame(thread, thread->frame + 1) = 0x8e4;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------- t_sacred_2_death
 *
 * armv7 0x00038c84, 228 bytes.  **Complete.**
 *
 *      token == 0:        center_around_me(obj)
 *                         obj->field40 = 0x48; pose_a9_manual(obj)
 *                         NewThread(obj, t_my_ghost)
 *                         face_opponent(obj)
 *                         death_scream(obj)
 *                         obj->field1c = 0x10000; away_x_vel(obj)
 *                         obj->field1c = 0x40000
 *                         obj->field20 = 3
 *                         obj->field24 = 3 + 9 = 0xc
 *                         token := 0xcd5, descend into t_shake_ob_up
 *
 *      token == 0xcd5:    stop_me_player(obj)
 *                         token := 0xcd7, park 0xa
 *
 *      token == 0xcd7:    frame[frame].handler = t_collapse_on_ground
 *
 *      otherwise:         return -3
 *
 * **A second caller passing `t_shake_ob_up` a large value with a zero low half**, and it settles
 * that the packed-pair reading I recorded earlier was wrong. Six callers are now measured and they
 * fall into two groups that share nothing:
 *
 *      3, 3, 0x00030003, 0x00020002    small, low half 2 or 3
 *      0x20000, 0x40000                large, low half 0, high half 2 and 4
 *
 * The large pair look like 16.16 quantities and the small ones do not. **`t_shake_ob_up` is still
 * unwritten and this is the question to answer first when it is** -- whether 0x1c is read as a
 * word, a pair, or a fixed-point magnitude, because the callers do not agree and no amount of
 * reading them further will decide it.
 *
 * `obj->field20 = 3` and `obj->field24 = 0xc` are the one-literal habit again (`adds r3, #9`), and
 * those two DO agree with the other callers, which all pass small numbers there. So whatever is
 * unsettled is confined to 0x1c.
 *
 * **Animation 0x48 posed by hand, fifth site.** Three files, five routines, one pose -- and this is
 * the second in mkfatal.c after `t_r_head_rip`.
 *
 * The ghost is a separate thread, `t_my_ghost` -- seventh site in the tree for spawning one so an
 * effect outlasts the state that started it. That idiom is now the most common structural pattern
 * found outside the thread machinery itself.
 *
 * `away_x_vel` at 0x10000 pushes the fighter back before the shake, and `stop_me_player` in the
 * next state halts them -- so the recoil lasts exactly as long as the shake does.
 */
long t_my_ghost(MK3THREAD *thread);              /* 0x00037658 */

long t_sacred_2_death(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xcd5) {
        stop_me_player(obj);

        *mk3_frame(thread, frame + 1) = 0xcd7;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token == 0xcd7)
        return mk3_install(thread, (MK3THREADFUNC)t_collapse_on_ground);

    if (token != 0)
        return -3;

    center_around_me(obj);

    obj->field40 = 0x48;
    pose_a9_manual(obj);

    NewThread(obj, (MK3THREADFUNC)t_my_ghost);

    face_opponent(obj);
    death_scream(obj);

    obj->field1c = 0x10000;
    away_x_vel(obj);

    obj->field1c = 0x40000;
    obj->field20 = 3;
    obj->field24 = 3 + 9;

    *mk3_frame(thread, thread->frame + 1) = 0xcd5;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_mk_game_cabinet
 *
 * armv7 0x0003ae20, 228 bytes.  **Complete.**
 *
 *      token == 0:        part->field2c = 0x1b37
 *                         part->y12 = *(long *)(G + 0xac) - 0x1b0
 *                         obj->field1c = (int16_t)((MK3OBJ *)proc->him)->x0e
 *                         center_about_x(obj)
 *                         obj->field38 = t_r_mk_game_crush
 *                         takeover_him(obj)
 *                         obj->field20 = 0x20000
 *                         obj->a10     = 0x20000 - 0x1a000 = 0x6000
 *                         token := 0xa3e, descend into t_gravity_ani_ysize
 *
 *      token == 0xa3e:    part->field24 = 0xd
 *                         obj->field1c = 0xd - 5 = 8; ochar_sound(obj)
 *                         obj->field48 = 0x000a000a; shake_a11(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **This is `t_gravity_ani_ysize`'s caller, and it supplies exactly the two fields that routine
 * reads.** That one accumulates the part's 0x1c by `obj->a10` each frame and falls until the
 * animation's own height puts its base on the floor; here 0x20 is the starting velocity, 0x20000,
 * and 0x44 is the acceleration, 0x6000. Two routines written from their own disassembly in separate
 * batches, and the interface matches with nothing left over.
 *
 * **`part->field24 = 0xd` WRITES the character-number field.** Everywhere else in the tree that
 * offset is read as an index into a per-character table -- `ochar_reached`, `taser_lineups`,
 * `ochar_shocked_ani`, `ochar_headrip_lineups` and the base-plus-character animations all use it
 * that way. This is the first site that assigns it, so a prop can be given a character number and
 * then indexed like a fighter. Worth knowing before assuming 0x24 is immutable.
 *
 * The cabinet starts 0x1b0 above the floor -- an eighth spelling of vertical placement, and the
 * second that subtracts a bare constant after `t_freeze_into_boomer`'s 0x90.
 *
 * `center_about_x` is given the OPPONENT's x out of `proc->him`, so the cabinet is dropped over
 * wherever the victim happens to be standing rather than over a fixed point.
 *
 * One literal feeds 0x20 and 0x44 (`sub.w r3, r3, #0x1a000`), and the sound index comes out of the
 * same register as the character number (`subs r3, #5`). Two separate instances of the habit in one
 * function.
 */
long t_r_mk_game_crush(MK3THREAD *thread);       /* 0x000350b8 */
void center_about_x(MK3OBJ *obj);
long t_gravity_ani_ysize(MK3THREAD *thread);

long t_mk_game_cabinet(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0) {
        obj->field08->field2c = 0x1b37;

        MK3_SET_FIELD12(obj->field08,
                        *(uint32_t *)(G_BYTES + 0xac) - 0x1b0);

        obj->field1c = (uint32_t)(int32_t)(int16_t)MK3_FIELD0E(
            (MK3OBJ *)(void *)(uintptr_t)obj->field00->him);
        center_about_x(obj);

        obj->field38 = (uint32_t)(uintptr_t)t_r_mk_game_crush;
        takeover_him(obj);

        obj->field20 = 0x20000;
        obj->a10     = 0x20000u - 0x1a000u;

        *mk3_frame(thread, frame + 1) = 0xa3e;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_gravity_ani_ysize;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xa3e)
        return -3;

    obj->field08->field24 = 0xd;

    obj->field1c = 0xd - 5;
    ochar_sound(obj);

    obj->field48 = 0x000a000a;
    shake_a11(obj);

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ----------------------------------------------------------------------- t_reptile_vomit
 *
 * armv7 0x000338dc, 248 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x5ab, descend into t_fatality_start_pause
 *
 *      token == 0x5ab:    part->field2c = 0x13d4
 *                         obj->field38 = t_r_prevomit
 *                         takeover_him(obj)
 *                         token := 0x5b0, park 0x60
 *
 *      token == 0x5b0:    obj->field38 = t_r_vomit
 *                         takeover_him(obj)
 *                         token := 0x5b3, park 0x34
 *
 *      token == 0x5b3:    token := 0x5b4, park 0x30
 *
 *      token == 0x5b4:    death_blow_complete(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **Two handovers in sequence, and that is a shape not seen before.** Every other `takeover_him`
 * measured in the tree hands the victim one routine and lets it run to the end. This gives them
 * `t_r_prevomit` for ninety-six frames, then REPLACES it with `t_r_vomit` for fifty-two more --
 * so the attacker drives the victim through two phases from the outside rather than letting the
 * first routine chain to the second itself.
 *
 * That explains something about `t_r_prevomit`, written earlier in this file: it ends by installing
 * `t_wait_forever`, which looked like the end of the reaction. It is not -- it is a park that this
 * routine overwrites on schedule. **A victim reaction ending in `t_wait_forever` may be waiting to
 * be replaced rather than finished**, and the attacker's routine is where to look.
 *
 * The whole thing is the standard fatality opening -- `t_fatality_start_pause`, which writes kind 1
 * into 0x20 and runs the death blow -- followed by two handovers and a close. Third complete
 * fatality traced end to end in this file, after the grow and the crush.
 *
 * `part->field2c = 0x13d4` is a bare constant, so the attacker's own pose is fixed while the
 * victim's routines pick their own.
 */
long t_r_prevomit(MK3THREAD *thread);
long t_r_vomit(MK3THREAD *thread);               /* 0x0003511c */

long t_reptile_vomit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x5ab) {
        obj->field08->field2c = 0x13d4;

        obj->field38 = (uint32_t)(uintptr_t)t_r_prevomit;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x5b0;
        thread->fieldfc = 0x60;
        return 0x60;
    }

    if (token == 0x5b0) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_vomit;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x5b3;
        thread->fieldfc = 0x34;
        return 0x34;
    }

    if (token == 0x5b3) {
        *mk3_frame(thread, frame + 1) = 0x5b4;
        thread->fieldfc = 0x30;
        return 0x30;
    }

    if (token == 0x5b4) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x5ab;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------------- t_skin_fall
 *
 * armv7 0x000332f4, 256 bytes.  **Complete.**
 *
 *      token == 0:        obj->field40 = obj->field48
 *                         obj->field1c = 0x00080002
 *                         token := 0x1770, descend into t_animate_a0_frames
 *
 *      token == 0x1770:   obj->field1c = 3
 *                         obj->field20 = 3
 *                         obj->field24 = 3 + 7 = 0xa
 *                         token := 0x1775, descend into t_shake_ob_up
 *
 *      token == 0x1775:   obj->field1c = 8
 *                         token := 0x177a, descend into t_mframew
 *
 *      token == 0x177a:   frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **Four states, three different helpers, and nothing of its own.** Animate, shake, wait, park --
 * the routine is a schedule and every line of work is somewhere else.
 *
 * **Its 0x00080002 corrects a claim I made two batches ago.** After `t_scorpion_remove_mask` I
 * recorded that `t_animate_a0_frames`'s pair always has 5 in the high half, on four sites. This is
 * the fifth and it has 8. Both halves vary; 5 is only the common case. That note has been softened.
 *
 * That is the second reading in this file that did not survive its next counter-example, after the
 * `t_shake_ob_up` one. **Four or five agreeing sites are not enough to call a field's shape settled
 * in this codebase** -- the routines are hand-written and the exceptions are not rare.
 *
 * `obj->field40 = obj->field48` is the cursor move `t_kitty_spin` and `t_animate_a11` also do --
 * third site, and the first where it is inlined into a larger routine rather than being the whole
 * of one.
 *
 * The `t_shake_ob_up` call is in the small group: 3 into 0x1c, 3 into 0x20, 0xa into 0x24 from the
 * same literal with an `adds`. Seventh caller measured.
 */
long t_skin_fall(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1770) {
        obj->field1c = 3;
        obj->field20 = 3;
        obj->field24 = 3 + 7;

        *mk3_frame(thread, thread->frame + 1) = 0x1775;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1775) {
        obj->field1c = 8;

        *mk3_frame(thread, thread->frame + 1) = 0x177a;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x177a)
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    if (token != 0)
        return -3;

    obj->field40 = obj->field48;
    obj->field1c = 0x00080002;

    *mk3_frame(thread, thread->frame + 1) = 0x1770;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_animate_a0_frames;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------------- t_r_kiss_suck
 *
 * armv7 0x00035eb8, 260 bytes.  **Complete.**
 *
 *      token == 0:        sans_repell_for_good(obj)
 *                         face_opponent(obj)
 *                         obj->field1c = 0x00020002
 *                         obj->field20 = 3
 *                         obj->field24 = 3 + 5 = 8
 *                         token := 0x3e6, descend into t_shake_ob_up
 *
 *      token == 0x3e6:    flip_multi(obj)
 *                         obj->field1c = ~0x35            (-0x36)
 *                         obj->field20 = 0
 *                         multi_adjust_xy(obj)
 *                         obj->field40 = 0x17
 *                         obj->field40 = *(long *)(&fn_ani_data[0x20a4]
 *                                                  + part->field24 * 4)
 *                         obj->field1c = 5
 *                         token := 0x3f1, descend into t_mframew
 *
 *      token == 0x3f1:    set_inviso(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **`obj->field40 = 0x17` is a dead store.** The very next instructions compute a table entry and
 * write it to the same field, and nothing reads 0x40 in between -- no call, no branch. Transcribed
 * as it stands rather than dropped, because the binary contains it and a reader comparing the two
 * should see the same instructions. Fourth dead store recorded in the tree.
 *
 * **The table is an unnamed sub-table inside `fn_ani_data`**, at offset 0x20a4, indexed by the
 * character number with `ldr.w r3, [r3, r2, lsl #2]`. `fn_ani_data` starts at 0x00172884 and the
 * next symbol, `_fatality_animations`, is at 0x00174b5c, so the computed 0x00174928 is inside it
 * and has no symbol of its own.
 *
 * That is the same shape as mkanimal.c's `lao_ani_data + 0x142c`, which `t_bit_in_half` reaches.
 * **Two big named animation blocks, each holding per-character sub-tables at fixed offsets** --
 * so a symbol in this data names where a block starts, not what any particular table in it is.
 *
 * The base is reached through pointer slot 0x000f36b4 rather than as a pc-relative address, which
 * is how every runtime-relocated data symbol in this binary is loaded.
 *
 * The `t_shake_ob_up` call is a small-group one, 0x00020002 -- the same value `t_r_head_rip` uses,
 * and the eighth caller measured.
 */
extern uint8_t fn_ani_data[];                    /* 0x00172884, pointer slot 0x000f36b4 */

long t_r_kiss_suck(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3e6) {
        flip_multi(obj);

        obj->field1c = (uint32_t)~0x35u;
        obj->field20 = 0;
        multi_adjust_xy(obj);

        obj->field40 = 0x17;                     /* dead: overwritten below */
        obj->field40 = *(uint32_t *)(&fn_ani_data[0x2080 + 0x24]
                                     + obj->field08->field24 * 4);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x3f1;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x3f1) {
        set_inviso(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    sans_repell_for_good(obj);
    face_opponent(obj);

    obj->field1c = 0x00020002;
    obj->field20 = 3;
    obj->field24 = 3 + 5;

    *mk3_frame(thread, thread->frame + 1) = 0x3e6;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------ t_kang_mk_game
 *
 * armv7 0x00034558, 240 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xa84, descend into t_fatality_start_pause
 *
 *      token == 0xa84:    obj->field1c = 6; ochar_sound(obj)
 *                         obj->field40 = 6
 *                         obj->field1c = 4
 *                         token := 0xa8a, descend into t_backwards_ani2
 *
 *      token == 0xa8a:    NewThread(obj, t_mk_game_cabinet)
 *                         set_inviso(obj)
 *                         token := 0xa8d, park 0x60
 *
 *      token == 0xa8d:    frame[frame].handler = t_kang_reform
 *
 *      otherwise:         return -3
 *
 * **The head of a four-routine chain, and every link was written in a separate batch from its own
 * disassembly.** This starts the finisher through `t_fatality_start_pause` (kind 1), plays a sound,
 * runs an animation backwards, and then spawns `t_mk_game_cabinet` as its own thread before making
 * the attacker invisible. That cabinet routine drops through `t_gravity_ani_ysize` -- supplying
 * exactly the two fields it reads -- and hands the victim `t_r_mk_game_crush`.
 *
 * So the whole fatality is: attacker vanishes, a cabinet is spawned above the victim's x, it falls
 * under gravity until its own height puts it on the floor, and the victim is crushed. Four
 * routines, four batches, and the interfaces match with nothing left over.
 *
 * **`set_inviso` here is not an ending.** In `t_stung_by_scorpion`, `t_tornado_sucked` and
 * `t_eat_this_shit` it is the last thing that happens to a body; here the attacker is hidden so the
 * prop can take their place, and `t_kang_reform` brings them back sixty frames later. Same call,
 * opposite purpose -- worth knowing before reading it as a death.
 *
 * `t_backwards_ani2` comes out of pointer slot 0x000f3704, a different slot from the
 * `t_backwards_ani` at 0x000f37c4 that the mkanimal.c drivers use for their unmorph. Two similar
 * names, two slots, and nothing here says how the two differ.
 *
 * 6 goes into 0x1c as a sound index and then into 0x40 as an animation number, out of the same
 * register -- the shared-literal habit across two unrelated meanings again.
 */
long t_backwards_ani2(MK3THREAD *thread);        /* pointer slot 0x000f3704 */
long t_kang_reform(MK3THREAD *thread);           /* 0x0003a7dc */
long t_mk_game_cabinet(MK3THREAD *thread);

long t_kang_mk_game(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xa84) {
        obj->field1c = 6;
        ochar_sound(obj);

        obj->field40 = 6;
        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xa8a;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_backwards_ani2;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xa8a) {
        NewThread(obj, (MK3THREADFUNC)t_mk_game_cabinet);
        set_inviso(obj);

        *mk3_frame(thread, frame + 1) = 0xa8d;
        thread->fieldfc = 0x60;
        return 0x60;
    }

    if (token == 0xa8d)
        return mk3_install(thread, (MK3THREADFUNC)t_kang_reform);

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xa84;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------- t_reptile_tongue
 *
 * armv7 0x000337d4, 264 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x60f, descend into t_fatality_start_pause
 *
 *      token == 0x60f:    obj->field1c = 0xe0
 *                         token := 0x615, descend into t_fatality_align
 *
 *      token == 0x615:    part->field2c = 0x18f5
 *                         him = proc->him
 *                         him->field2c = him->field24 + 0x1b40 + 0xe
 *                         wfe_him(obj)
 *                         obj->a10 = 0x168
 *                         -- falls into the tail --
 *
 *      token == 0x643:    if (--obj->a10 <= 0) {
 *                             death_blow_complete(obj)
 *                             frame[frame].handler = t_wait_forever
 *                         }
 *                         -- falls into the tail --
 *
 *      the tail:          token := 0x643, park 1
 *
 *      otherwise:         return -3
 *
 * **The base-plus-character animation, indexed by the OPPONENT's number for the first time.**
 * `him->field2c = him->field24 + 0x1b4e` reads the victim's character number out of the victim's own
 * part and writes the victim's own animation. Every other site of this idiom -- `t_grow_victum`,
 * `t_open_wide`, `cutup_body_init`'s callers in mkanimal.c -- indexes by `obj->field08->field24`,
 * the routine's own part.
 *
 * So the idiom is "base plus whoever's number you have", not "base plus my number", and a reader
 * who assumes the latter will pick the wrong fighter here. The attacker's own animation, 0x18f5, is
 * a bare constant in the same state.
 *
 * **`wfe_him` parks the victim rather than animating them**, and then this routine counts 0x168
 * frames -- three hundred and sixty, six seconds at sixty frames -- before completing the death
 * blow. So the tongue holds the victim still for the whole swallow and the length is this routine's
 * to choose.
 *
 * `t_fatality_align` off pointer slot 0x000f36e8 is new; 0xe0 goes into 0x1c before the descent, so
 * the alignment takes a distance.
 *
 * The base arrives as `add.w #0x1b40` then `adds #0xe` because 0x1b4e will not fit one Thumb
 * immediate -- the same two-instruction split `t_grow_victum` and `t_open_wide` show.
 */
long t_fatality_align(MK3THREAD *thread);        /* pointer slot 0x000f36e8 */

long t_reptile_tongue(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    MK3OBJ  *him;

    if (token == 0x60f) {
        obj->field1c = 0xe0;

        *mk3_frame(thread, thread->frame + 1) = 0x615;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_fatality_align;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x615) {
        obj->field08->field2c = 0x18f5;

        him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
        him->field2c = him->field24 + 0x1b40 + 0xe;

        wfe_him(obj);

        obj->a10 = 0x168;

    } else if (token == 0x643) {
        obj->a10 = obj->a10 - 1;
        if ((long)obj->a10 <= 0) {
            death_blow_complete(obj);

            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
        }

    } else if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0x60f;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_fatality_start_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x643;
    thread->fieldfc = 1;
    return 1;
}


/* ------------------------------------------------------------------ t_smoke_blowup_earth
 *
 * armv7 0x00034d04, 268 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x959, descend into t_fatality_start_pause
 *
 *      token == 0x959:    token := 0x95a, descend into t_robo_open_chest
 *
 *      token == 0x95a:    part->field2c = 0x758
 *                         token := 0x95d, park 0x12c
 *
 *      token == 0x95d:    part->field2c = 0x75b
 *                         call_for_him(obj, set_inviso)
 *                         token := 0x960, park 0xb4
 *
 *      token == 0x960:    death_blow_complete(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **Two descents in a row before any work happens.** State 0 goes into
 * `t_fatality_start_pause` and state 0x959 immediately goes into `t_robo_open_chest` -- so the
 * opening is two shared routines stacked, where every other fatality in this file descends once and
 * then does something. The chest has to be open before the rest can run.
 *
 * `call_for_him(obj, set_inviso)` makes the OPPONENT invisible, and it is the **second site of that
 * exact pairing** -- mkanimal.c's `tl_sindel_wasp` does the same call with the same callee. So
 * hiding the other fighter is a two-word idiom rather than a routine of its own.
 *
 * The two animations, 0x758 then 0x75b, are bare constants three apart, and 0x12c frames pass
 * between them -- five seconds. The second is where the victim disappears, so the numbers are a
 * charge and a detonation.
 *
 * The routine writes only `part->field2c` and never touches a velocity, a position or a shake: the
 * whole visible event is in `t_robo_open_chest` and in whatever the animations do. That makes it
 * the thinnest complete fatality measured -- five states, four of them pure scheduling.
 */
long t_robo_open_chest(MK3THREAD *thread);       /* pointer slot 0x000f36c4 */

long t_smoke_blowup_earth(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x959) {
        *mk3_frame(thread, frame + 1) = 0x95a;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_robo_open_chest;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x95a) {
        obj->field08->field2c = 0x758;

        *mk3_frame(thread, frame + 1) = 0x95d;
        thread->fieldfc = 0x12c;
        return 0x12c;
    }

    if (token == 0x95d) {
        obj->field08->field2c = 0x75b;

        call_for_him(obj, set_inviso);

        *mk3_frame(thread, frame + 1) = 0x960;
        thread->fieldfc = 0xb4;
        return 0xb4;
    }

    if (token == 0x960) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x959;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------------- t_skel_blood
 *
 * armv7 0x00039790, 260 bytes.  **Complete.**
 *
 *      token == 0:        obj->field48 = 0x0010fff0; skinny_spawn(obj)
 *                         obj->field48 = 0x0020fffc; skinny_spawn(obj)
 *                         obj->field48 = 0x0030fff8; skinny_spawn(obj)
 *                         token := 0x1344, park 0x10
 *
 *      token == 0x1344:   obj->field48 = 0x00300002; skinny_spawn(obj)
 *                         obj->field48 = 0x0040fff0; skinny_spawn(obj)
 *                         token := 0x1349, park 0x10
 *
 *      token == 0x1349:   obj->field48 = 0x0038fff8; skinny_spawn(obj)
 *                         obj->field48 = 0x0020fff8; skinny_spawn(obj)
 *                         token := 0x134e, park 0x10
 *
 *      token == 0x134e:   pop a level, or t_local_reaction_exit at the bottom
 *
 *      otherwise:         return -3
 *
 * **Seven blood spawns at seven hand-placed offsets, three waves sixteen frames apart.** Every one
 * goes through `skinny_spawn`, which reads 0x48 as a packed pair of signed 16-bit offsets -- x in
 * the low half, y in the high -- and adds them to the other object's integer position. Written out
 * as (x, y):
 *
 *      wave 1    (-0x10, 0x10)   (-4, 0x20)   (-8, 0x30)
 *      wave 2    (2, 0x30)       (-0x10, 0x40)
 *      wave 3    (-8, 0x38)      (-8, 0x20)
 *
 * The y offsets climb from 0x10 to 0x40 and the x offsets stay within a few pixels of zero, six of
 * the seven negative -- so the spray runs up the body and slightly to one side. Nothing is
 * computed; all seven are literals in the pool.
 *
 * **This is the largest single use of the 0x48 packed pair in the tree.** Elsewhere it carries one
 * shake magnitude or one animation pair; here it is reloaded seven times as a coordinate, which is
 * what `skinny_spawn`'s own note predicted the field would look like in a caller.
 *
 * The three states differ only in which offsets they use and are otherwise the same two or three
 * lines, so the shape is a script rather than a loop -- and a loop would have needed the offsets in
 * a table, which they are not.
 */
void skinny_spawn(MK3OBJ *obj);

long t_skel_blood(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1344) {
        obj->field48 = 0x00300002;
        skinny_spawn(obj);
        obj->field48 = 0x0040fff0;
        skinny_spawn(obj);

        *mk3_frame(thread, frame + 1) = 0x1349;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x1349) {
        obj->field48 = 0x0038fff8;
        skinny_spawn(obj);
        obj->field48 = 0x0020fff8;
        skinny_spawn(obj);

        *mk3_frame(thread, frame + 1) = 0x134e;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x134e) {
        if ((long)frame > 0) {
            thread->frame = frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token != 0)
        return -3;

    obj->field48 = 0x0010fff0;
    skinny_spawn(obj);
    obj->field48 = 0x0020fffc;
    skinny_spawn(obj);
    obj->field48 = 0x0030fff8;
    skinny_spawn(obj);

    *mk3_frame(thread, frame + 1) = 0x1344;
    thread->fieldfc = 0x10;
    return 0x10;
}


/* ---------------------------------------------------------------------------- t_r_stretch
 *
 * armv7 0x00034648, 280 bytes.  **Complete.**
 *
 *      token == 0:        e = ((long *)obj->field48)[part->field24]
 *                         obj->field1c = e
 *                         obj->field40 = e
 *                         token := 0x864, descend into t_grow_n_shake
 *
 *      token == 0x864:    token := 0x865, descend into t_grow_n_shake
 *
 *      token == 0x865:    token := 0x866, descend into t_grow_n_shake
 *
 *      token == 0x866:    set_inviso(obj)
 *                         obj->field1c = 0x18; create_fx(obj)
 *                         token := 0x86a, descend into t_white_flash
 *
 *      token == 0x86a:    frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **`obj->field48` is a TABLE BASE here, and that is a sixth reading of the field.** The caller
 * leaves a pointer in it and this indexes it by the character number with `ldr.w r3, [r2, r3,
 * lsl #2]`. Elsewhere in the tree 0x48 has been a shake magnitude pair, a plain counter, a function
 * pointer for `t_animate_till_a11`, a packed coordinate pair for `skinny_spawn`, and an animation
 * cursor. Six meanings, one word, and only the calling state tells them apart.
 *
 * **It descends into `t_grow_n_shake` three times in a row.** That routine -- written earlier in
 * this file -- plays the crunch pair, screams, advances a frame and shakes, all in one state before
 * popping. So the stretch is three of those cycles back to back, and the only thing that changes
 * between them is that the first sets up 0x1c and 0x40 from the table.
 *
 * Three separate states each pushing the same handler, rather than one state re-arming itself,
 * because the frame has to be popped and re-pushed between cycles for `t_grow_n_shake` to restart
 * at its own state 0.
 *
 * **The ending is exactly `t_eat_this_shit`'s**: `set_inviso`, effect 0x18, then `t_white_flash`.
 * Second site for that three-step disappearance, and the two agree on the effect number as well --
 * so 0x18 is the vanishing effect specifically, where 0x15 and 0x24 are used by the other two
 * `set_inviso` endings in the tree.
 */
long t_grow_n_shake(MK3THREAD *thread);

long t_r_stretch(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t next;

    if (token == 0x866) {
        set_inviso(obj);

        obj->field1c = 0x18;
        create_fx(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x86a;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_white_flash;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x86a)
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    if (token == 0) {
        obj->field1c =
            ((uint32_t *)(uintptr_t)obj->field48)[obj->field08->field24];
        obj->field40 = obj->field1c;
        next = 0x864;

    } else if (token == 0x864) {
        next = 0x865;

    } else if (token == 0x865) {
        next = 0x866;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = next;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_grow_n_shake;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------ t_my_ghost
 *
 * armv7 0x00037658, 288 bytes.  **Complete.**
 *
 *      token == 0:        player_swpal(obj, 6)
 *                         obj->field40 = 0x48; pose_a9_manual(obj)
 *                         obj->field20 = 3
 *                         obj->field1c = 0xfffe0000; set_proj_vel(obj)
 *                         obj->field20 = 3
 *                         obj->field1c = 0x40000
 *                         obj->field24 = 0xc
 *                         token := 0xcb6, descend into t_shake_ob_up
 *
 *      token == 0xcb6:    stop_a8(obj->field08)
 *                         token := 0xcb8, park 0xa
 *
 *      token == 0xcb8:    obj->field1c = 0xa0000; set_proj_vel(obj)
 *                         obj->field40 = 0x46; get_char_ani(obj)
 *                         obj->field1c = 3
 *                         token := 0xcbf, descend into t_mframew
 *
 *      token == 0xcbf:    frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **This is the thread `t_sacred_2_death` spawns, and the two use the SAME shake parameters.**
 * Both pass `t_shake_ob_up` 0x40000 in 0x1c, 3 in 0x20 and 0xc in 0x24. The spawner and the spawned
 * thread shaking identically at the same moment is presumably how one visible jolt is produced from
 * two objects -- but nothing here proves that, and it is recorded as the coincidence it is measured
 * to be.
 *
 * **`player_swpal(obj, 6)` is a third palette number.** With `t_stung_by_scorpion`'s 3 for poison
 * and `t_shocker_shaker`'s 5 for shocked, 6 is the ghost. Three of the palette indices are now
 * attached to what they look like.
 *
 * Animation 0x48 posed by hand, sixth site in the tree and third in this file.
 *
 * The ghost rises at -0x20000, is stopped by `stop_a8` on the part, then moves at 0xa0000 -- so
 * `set_proj_vel` is called twice with opposite intents and the stop between them is what separates
 * the two phases.
 *
 * `obj->field20 = 3` is written twice with the same value, once before `set_proj_vel` and once
 * after, because that routine reads 0x20 and this needs it again for `t_shake_ob_up`. Not a dead
 * store -- the same save-and-restore reasoning as `create_blood_proc` clobbering 0x1c elsewhere in
 * this file.
 *
 * The frame index is shifted with `lsl.w r3, r2, r8` -- by the REGISTER holding 3 rather than by an
 * immediate -- because the compiler already had 3 in `r8` for the two 0x20 stores. Same `<< 3` as
 * every other frame computation in the tree, spelled differently.
 */
void set_proj_vel(MK3OBJ *obj);

long t_my_ghost(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xcb6) {
        stop_a8(obj->field08);

        *mk3_frame(thread, frame + 1) = 0xcb8;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token == 0xcb8) {
        obj->field1c = 0xa0000;
        set_proj_vel(obj);

        obj->field40 = 0x46;
        get_char_ani(obj);

        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0xcbf;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xcbf)
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    if (token != 0)
        return -3;

    player_swpal(obj, 6);

    obj->field40 = 0x48;
    pose_a9_manual(obj);

    obj->field20 = 3;
    obj->field1c = 0xfffe0000u;
    set_proj_vel(obj);

    obj->field20 = 3;
    obj->field1c = 0x40000;
    obj->field24 = 0xc;

    *mk3_frame(thread, thread->frame + 1) = 0xcb6;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_do_pit_fatality
 *
 * armv7 0x00033500, 284 bytes.  **Complete.**
 *
 *      token == 0:        init_special(obj)
 *                         NewThread(obj, t_make_db_tone)
 *                         *(short *)(G + 0x450) = 2
 *                         obj->field20 = 0x000edb00
 *                         proc->field00->a10 = 0x000edb00
 *                         token := 0x1c80, descend into t_do_duck
 *
 *      token == 0x1c80:   token := 0x1c81, park 8
 *
 *      token == 0x1c81:   token := 0x1c82, descend into t_stat_do_uppercut
 *
 *      token == 0x1c82:   obj->field40 = 0xb; find_ani_part2(obj)
 *                         obj->field1c = 5
 *                         token := 0x1c87, descend into t_mframew
 *
 *      token == 0x1c87:   frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **This answers the kind-2 question I left open twice.** `t_init_death_blow` copies a small
 * number out of `obj->field20` into `G + 0x450` and `G + 0x458` and fires `MKEvent_Add(3, 0xe, 0, 0)`
 * for every value except 2; the three `*_start_pause` routines supply 1, 3 and 5 for fatality,
 * animality and babality, and I recorded that 2 was bracketed but unaccounted for.
 *
 * **2 is the pit fatality**, and this routine writes it into `G + 0x450` DIRECTLY rather than going
 * through `t_init_death_blow` at all. It does the rest of that routine's work itself -- `init_special`
 * and the `t_make_db_tone` thread -- and skips the second global and the event.
 *
 * So the exemption is not a special case inside the death blow; it is that the pit fatality never
 * runs the death blow. Whether anything ever reaches `t_init_death_blow` with 2 in 0x20 is still not
 * shown by any routine measured, and that check may be unreachable. Recorded as measured.
 *
 * **The fatality itself is a duck and an uppercut.** `t_do_duck` off slot 0x000f3884, then
 * `t_stat_do_uppercut` off 0x000f3848 -- an ordinary move from mkstat.c, not a bespoke routine --
 * and then animation 0xb and the victory pose. That is the whole of it: the pit kills by dropping
 * the opponent, so the attacker only has to hit them upward and the stage does the rest.
 *
 * 0x000edb00 goes into the object's 0x20 and into the OTHER object's 0x44, through
 * `proc->field00`, so both fighters are given the same number before the duck. Nothing here reads it
 * back.
 */
long t_do_duck(MK3THREAD *thread);               /* pointer slot 0x000f3884 */
long t_stat_do_uppercut(MK3THREAD *thread);      /* pointer slot 0x000f3848 */
long t_victory_animation(MK3THREAD *thread);     /* pointer slot 0x000f36e4 */

long t_do_pit_fatality(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1c80) {
        *mk3_frame(thread, frame + 1) = 0x1c81;
        thread->fieldfc = 8;
        return 8;
    }

    if (token == 0x1c81) {
        *mk3_frame(thread, frame + 1) = 0x1c82;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stat_do_uppercut;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1c82) {
        obj->field40 = 0xb;
        find_ani_part2(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x1c87;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1c87)
        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);

    if (token != 0)
        return -3;

    init_special(obj);

    NewThread(obj, (MK3THREADFUNC)t_make_db_tone);

    *(uint16_t *)(G_BYTES + 0x450) = 2;

    obj->field20 = 0x000edb00;
    obj->field00->field00->a10 = 0x000edb00;

    *mk3_frame(thread, frame + 1) = 0x1c80;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_do_duck;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------------- t_kitana_decap
 *
 * armv7 0x0003a2f4, 288 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x8a7, descend into t_fatality_start_pause
 *
 *      token == 0x8a7:    obj->field40 = 5; pose2_a9_manual(obj)
 *                         sans_repell_for_good(obj)
 *                         token := 0x8ac, park 0x10
 *
 *      token == 0x8ac:    obj->field1c = 0x00050004
 *                         token := 0x8af, descend into t_animate_a0_frames
 *
 *      token == 0x8af:    obj->field38 = t_r_kitana_decap
 *                         takeover_him(obj)
 *                         do_next_a9_frame(obj)
 *                         token := 0x8b5, park 0x10
 *
 *      token == 0x8b5:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **The victim's reaction lives in another file.** `t_r_kitana_decap` off pointer slot 0x000f36a0
 * is at 0x000a0c84, inside mkanimal.c, and was written when that file was closed. So a fatality's
 * two halves are not necessarily in the same translation unit -- the attacker is here and the
 * reaction is filed with the animality module.
 *
 * That is worth knowing for the four files still open: a `t_r_*` routine missing from the file you
 * are reading may already exist somewhere else, and the pointer slot is what finds it.
 *
 * `pose2_a9_manual` rather than `pose_a9_manual` -- a second poser, taking the same small index in
 * 0x40. Nothing here says how the two differ; both are called with a constant and neither returns
 * anything.
 *
 * The `t_animate_a0_frames` pair is 0x00050004, the sixth site and the same value
 * `t_scorpion_remove_mask` uses in its second run. High half 5 again, which is the common case
 * rather than the rule -- `t_skin_fall`'s 8 settled that.
 *
 * The ending is `death_blow_complete` then `t_victory_animation`, the same close as
 * `t_do_pit_fatality`. Two fatalities now end by installing the victory pose directly rather than
 * parking on `t_wait_forever`.
 */
void pose2_a9_manual(MK3OBJ *obj);
long t_r_kitana_decap(MK3THREAD *thread);        /* pointer slot 0x000f36a0, in mkanimal.c */

long t_kitana_decap(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x8a7) {
        obj->field40 = 5;
        pose2_a9_manual(obj);

        sans_repell_for_good(obj);

        *mk3_frame(thread, frame + 1) = 0x8ac;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x8ac) {
        obj->field1c = 0x00050004;

        *mk3_frame(thread, thread->frame + 1) = 0x8af;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a0_frames;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x8af) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_kitana_decap;
        takeover_him(obj);

        do_next_a9_frame(obj);

        *mk3_frame(thread, frame + 1) = 0x8b5;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0x8b5) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x8a7;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------- t_ermac_decap_attack
 *
 * armv7 0x00033b08, 296 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x392, descend into t_fatality_start_pause
 *
 *      token == 0x392:    token := 0x393, descend into t_do_duck
 *
 *      token == 0x393:    token := 0x394, park 8
 *
 *      token == 0x394:    obj->field40 = 0x0002000b
 *                         token := 0x396, descend into t_animate_a9
 *
 *      token == 0x396:    obj->field38 = t_r_ermac_upcut
 *                         takeover_him(obj)
 *                         token := 0x39a, park 0x40
 *
 *      token == 0x39a:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **The second fatality whose victim reaction lives in mkanimal.c.** `t_r_ermac_upcut` off pointer
 * slot 0x000f36ac is at 0x000a2a68, and it was written when that file was closed -- the routine that
 * shakes at 0x00080008, cuts the body up with delta 0x1af4 and sends the head off through
 * `t_head_pop_off`.
 *
 * With `t_kitana_decap` that makes two, so the split is not a one-off. **The decapitation reactions
 * in particular are filed with the animality module**, presumably because the body-pieces machinery
 * they use lives there.
 *
 * **It opens with `t_do_duck`, exactly as `t_do_pit_fatality` does.** Both descend into the shared
 * duck before their own move, so ducking is a normal preparation for a finisher and not something
 * the pit needs specially.
 *
 * The `t_animate_a9` pair is 0x0002000b -- ninth site for that reading, and the second in this file
 * after `t_crush_duck`'s 0x00040004.
 *
 * The dispatch tests 0x393 before the `ble`, so the four higher tokens are compared in an order the
 * source would not have written: 0x396, 0x39a, then 0x394 last. `r1` carries 0x393 into state
 * 0x392's store and 0x396 into state 0x394's -- two values, one register, and each store traced back
 * to its own load.
 */
long t_r_ermac_upcut(MK3THREAD *thread);         /* pointer slot 0x000f36ac, in mkanimal.c */

long t_ermac_decap_attack(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x392) {
        *mk3_frame(thread, frame + 1) = 0x393;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_do_duck;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x393) {
        *mk3_frame(thread, frame + 1) = 0x394;
        thread->fieldfc = 8;
        return 8;
    }

    if (token == 0x394) {
        obj->field40 = 0x0002000b;

        *mk3_frame(thread, frame + 1) = 0x396;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x396) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_ermac_upcut;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x39a;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0x39a) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x392;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------- t_r_scream_ripped
 *
 * armv7 0x00038adc, 296 bytes.  **Complete.**
 *
 *      token == 0:        NewThread(obj, t_flesh_rip_sound)
 *                         PUSH obj->field48
 *                         obj->field48 = 0x00060030; shake_a11(obj)
 *                         POP  obj->field48
 *                         face_opponent(obj)
 *                         NewThread(obj, t_remaining_skel)
 *                         obj->field1c = obj->field48
 *                         e = ((long *)obj->field48)[part->field24]
 *                         obj->field1c = e
 *                         obj->field40 = e
 *                         rip_ani(obj)
 *                         token := 0x1301, descend into t_initial_skeleton_shake
 *
 *      token == 0x1301:   obj->field1c = 0xa000; away_x_vel(obj)
 *                         token := 0x1306, park 0x14
 *
 *      token == 0x1306:   stop_me_player(obj)
 *                         set_inviso(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The first routine in the tree to spawn TWO threads**, and they are spawned four instructions
 * apart around the shake: `t_flesh_rip_sound` first and `t_remaining_skel` after. Eighth and ninth
 * spawn sites, and the pattern is now unmistakable -- anything that has to outlast a state gets its
 * own thread.
 *
 * **Fourth user of the argument stack, and it saves 0x48 across `shake_a11`.** The field arrives
 * holding a table base -- the caller's per-character pointer, as in `t_r_stretch` -- and
 * `shake_a11` needs it for a magnitude pair. So the routine pushes the base, writes 0x00060030,
 * shakes, pops the base back, and only then indexes the table.
 *
 * That is the same conflict `t_shocker_shaker` resolves the same way, where `obj->a10` had to hold
 * 3 for `create_fx` and an animation cursor for everything else. **The argument stack exists
 * because one object field routinely serves two callees with incompatible meanings**, and these
 * two routines are the clearest evidence of it.
 *
 * `obj->field1c = obj->field48` is written and then immediately overwritten by the table lookup --
 * a fifth dead store, and the same shape as `t_r_kiss_suck`'s `obj->field40 = 0x17`.
 *
 * The shake pair 0x00060030 is asymmetric with the widest spread measured -- 6 against 0x30, where
 * the previous extreme was `t_r_ind_lightning`'s 0xa/0xd. Seventh asymmetric site.
 */
long t_flesh_rip_sound(MK3THREAD *thread);       /* 0x00036368 */
long t_remaining_skel(MK3THREAD *thread);        /* 0x000379c0 */
long t_initial_skeleton_shake(MK3THREAD *thread);/* 0x0003891c */

long t_r_scream_ripped(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc;

    if (token == 0x1301) {
        obj->field1c = 0xa000;
        away_x_vel(obj);

        *mk3_frame(thread, frame + 1) = 0x1306;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token == 0x1306) {
        stop_me_player(obj);
        set_inviso(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    NewThread(obj, (MK3THREADFUNC)t_flesh_rip_sound);

    argc = thread->fieldf8;
    *mk3_arg(thread, argc) = obj->field48;
    thread->fieldf8 = argc + 1;

    obj->field48 = 0x00060030;
    shake_a11(obj);

    argc = thread->fieldf8 - 1;
    thread->fieldf8 = argc;
    obj->field48 = *mk3_arg(thread, argc);

    face_opponent(obj);

    NewThread(obj, (MK3THREADFUNC)t_remaining_skel);

    obj->field1c = obj->field48;             /* dead: overwritten below */
    obj->field1c =
        ((uint32_t *)(uintptr_t)obj->field48)[obj->field08->field24];
    obj->field40 = obj->field1c;

    rip_ani(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x1301;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_initial_skeleton_shake;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------ t_st_suck
 *
 * armv7 0x0003539c, 296 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xae7, descend into t_fatality_start_pause
 *
 *      token == 0xae7:    flip_multi(obj)
 *                         obj->field40 = 0x1b; get_char_ani2(obj)
 *                         obj->field1c = 4
 *                         token := 0xaed, descend into t_mframew
 *
 *      token == 0xaed:    obj->field38 = t_soul_float
 *                         takeover_him(obj)
 *                         token := 0xaf1, park 0x90
 *
 *      token == 0xaf1:    obj->field40 = 0x1b
 *                         obj->field1c = 0x1b - 0x17 = 4
 *                         token := 0xaf5, descend into t_backwards_ani2
 *
 *      token == 0xaf5:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **The same animation played forward and then backward.** State 0xae7 resolves index 0x1b through
 * `get_char_ani2` and runs it through `t_mframew`; state 0xaf1 sets the same 0x1b and the same
 * four-frame count and runs `t_backwards_ani2`. Between them the victim is handed `t_soul_float` and
 * a hundred and forty-four frames pass.
 *
 * So the attacker's pose opens, holds while the soul comes out, and closes by rewinding -- which is
 * why this file has both a forward and a backward animator reachable through different pointer
 * slots. `t_backwards_ani2` is at 0x000f3704, the slot `t_kang_mk_game` also uses.
 *
 * **The second state does NOT re-resolve the index.** 0xae7 calls `get_char_ani2` and 0xaf1 writes
 * 0x1b into 0x40 raw, so the backward run walks whatever the forward run left rather than a fresh
 * lookup. Whether that is deliberate is not settled here; it is transcribed as written.
 *
 * `obj->field1c = 4` is a `movs` in the first state and `subs r3, #0x17` off the 0x1b in the second
 * -- one value, two spellings, and the second is the shared-literal habit reaching across two
 * unrelated fields again.
 */
long t_soul_float(MK3THREAD *thread);            /* 0x00038d68 */

long t_st_suck(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xae7) {
        flip_multi(obj);

        obj->field40 = 0x1b;
        get_char_ani2(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xaed;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xaed) {
        obj->field38 = (uint32_t)(uintptr_t)t_soul_float;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0xaf1;
        thread->fieldfc = 0x90;
        return 0x90;
    }

    if (token == 0xaf1) {
        obj->field40 = 0x1b;
        obj->field1c = 0x1b - 0x17;

        *mk3_frame(thread, thread->frame + 1) = 0xaf5;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_backwards_ani2;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xaf5) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xae7;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------- t_sz_blow
 *
 * armv7 0x00037394, 308 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x14fe, descend into t_fatality_start_pause
 *
 *      token == 0x14fe:   obj->field40 = 3; get_char_ani2(obj)
 *                         obj->field1c = 7; ochar_sound(obj)
 *                         obj->field1c = 5
 *                         token := 0x1507, descend into t_mframew
 *
 *      token == 0x1507:   obj->field38 = t_r_ice_blow
 *                         takeover_him(obj)
 *                         center_around_him(obj)
 *                         obj->field1c = 5
 *                         token := 0x150d, descend into t_mframew
 *
 *      token == 0x150d:   delete_slave(obj)
 *                         token := 0x150f, park 0x40
 *
 *      token == 0x150f:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **First use of `delete_slave` in this file.** The header records `proc->field64` as the slave's
 * object and names that routine as what removes it. So this fatality has a slave object alive
 * during the blow and tears it down afterwards -- and nothing in this routine creates it, so the
 * slave must already exist when the fatality starts.
 *
 * That is a thread of its own worth pulling: whatever makes the slave is not in the hundred
 * functions of this file written so far, and `proc->field64` has not been read anywhere else in the
 * tree.
 *
 * **`center_around_him` immediately after the handover** puts the attacker on the victim's position
 * once the victim's own routine has been installed -- so the ordering matters, and a transcription
 * that swapped the two calls would centre on a fighter that had not yet been given its reaction.
 *
 * The two `t_mframew` waits are both five frames and both set 0x1c the same way, so the routine's
 * whole rhythm is: animate five, hit, animate five, clean up, wait 0x40.
 *
 * Sound 7 through `ochar_sound` and animation index 3 through `get_char_ani2` are the only two
 * numbers the fatality supplies of its own.
 */
long t_r_ice_blow(MK3THREAD *thread);            /* 0x00038970 */
void delete_slave(MK3OBJ *obj);
void center_around_him(MK3OBJ *obj);

long t_sz_blow(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x14fe) {
        obj->field40 = 3;
        get_char_ani2(obj);

        obj->field1c = 7;
        ochar_sound(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x1507;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1507) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_ice_blow;
        takeover_him(obj);

        center_around_him(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x150d;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x150d) {
        delete_slave(obj);

        *mk3_frame(thread, frame + 1) = 0x150f;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0x150f) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x14fe;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------- t_sonya_kiss_crusher
 *
 * armv7 0x00037260, 308 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x1609, descend into t_fatality_start_pause
 *
 *      token == 0x1609:   obj->field40 = 2; get_char_ani2(obj)
 *                         obj->field1c = 3
 *                         token := 0x160e, descend into t_mframew
 *
 *      token == 0x160e:   obj->field40 = 4; get_char_ani2(obj)
 *                         obj->field48 = obj->field40
 *                         gmo_proc_insobja8(obj)
 *                         obj->field1c = ~0x1f              (-0x20)
 *                         obj->a10     = obj->field3c
 *                         obj->field30 = obj->field3c
 *                         obj->field20 = -0x20 + 0x10 = -0x10
 *                         adjust_xy_a5(obj)
 *                         obj->field1c = 6; ochar_sound(obj)
 *                         StartGrObjAt((char *)obj->a10, t_crusher_orb)
 *                         obj->field1c = 7; ochar_sound(obj)
 *                         center_around_him(obj)
 *                         token := 0x162f, park 0x90
 *
 *      token == 0x162f:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **First `StartGrObjAt` call measured in the tree.** other.c defines it as
 * `void StartGrObjAt(char *grobj, MK3THREADFUNC func)`, and here the object comes from
 * `obj->a10` -- copied from 0x3c a few lines earlier -- and the routine it is started with is
 * `t_crusher_orb`. So a graphics object is created and given its own handler in one call, which is
 * a fourth way this engine gets code running beside the current thread, after `NewThread`,
 * `NewThreadProc` and the three handover mechanisms.
 *
 * `gmo_proc_insobja8` returns `void *` per other.c and its result is discarded here; what it leaves
 * behind is in `obj->field3c`, which the next three lines read. So the call is used for its side
 * effect and 0x3c is where the new object arrives.
 *
 * **`obj->field3c` is copied into TWO fields, 0x44 and 0x30**, and only 0x44 is read back (by
 * `StartGrObjAt`). `adjust_xy_a5` reads 0x30 along with 0x1c and 0x20 -- it is a three-argument
 * wrapper round `multi_adjust_xy_ob` -- so both stores are live and they feed different callees.
 *
 * Two sounds through `ochar_sound`, 6 and 7, one on each side of the orb being started. Same pair
 * `t_nado_sounds` plays together; here they bracket the event instead.
 *
 * The offsets -0x20 and -0x10 come from one literal with an `adds r3, #0x10`, the habit again.
 */
long t_crusher_orb(MK3THREAD *thread);           /* 0x00037778 */
void *gmo_proc_insobja8(MK3OBJ *obj);
void adjust_xy_a5(MK3OBJ *obj);
void StartGrObjAt(char *grobj, MK3THREADFUNC func);

long t_sonya_kiss_crusher(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1609) {
        obj->field40 = 2;
        get_char_ani2(obj);

        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x160e;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x160e) {
        obj->field40 = 4;
        get_char_ani2(obj);
        obj->field48 = obj->field40;

        gmo_proc_insobja8(obj);

        obj->field1c = (uint32_t)~0x1fu;
        obj->a10     = obj->field3c;
        obj->field30 = obj->field3c;
        obj->field20 = (uint32_t)(~0x1fu + 0x10u);
        adjust_xy_a5(obj);

        obj->field1c = 6;
        ochar_sound(obj);

        StartGrObjAt((char *)(uintptr_t)obj->a10,
                     (MK3THREADFUNC)t_crusher_orb);

        obj->field1c = 7;
        ochar_sound(obj);

        center_around_him(obj);

        *mk3_frame(thread, frame + 1) = 0x162f;
        thread->fieldfc = 0x90;
        return 0x90;
    }

    if (token == 0x162f) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x1609;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------- t_ermac_super_slam
 *
 * armv7 0x000339d4, 308 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x3a2, descend into t_fatality_start_pause
 *
 *      token == 0x3a2:    obj->field40 = 0x0002000c
 *                         token := 0x3a5, descend into t_animate2_a9
 *
 *      token == 0x3a5:    obj->field38 = t_r_ermac_fatal_slam
 *                         takeover_him(obj)
 *                         token := 0x3a9, park 0xa0
 *
 *      token == 0x3a9:    obj->field1c = 2
 *                         obj->field40 = 2 + 0xa = 0xc
 *                         token := 0x3ad, descend into t_backwards_ani
 *
 *      token == 0x3ad:    token := 0x3af, park 0xa
 *
 *      token == 0x3af:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **First `t_animate2_a9` caller measured in this file.** The routine sits at pointer slot
 * 0x000f36c0, one slot below `t_animate_a9` at 0x000f36d0, and takes the same packed halfword pair
 * in 0x40 -- 0x0002000c here. Nine sites for `t_animate_a9` and this is the first for the "2"
 * variant, so the two are interchangeable from the caller's side and whatever differs is inside.
 *
 * **The forward run uses a packed pair and the backward run uses a plain number.** 0x3a2 puts
 * 0x0002000c in 0x40 for `t_animate2_a9`; 0x3a9 puts 0xc in 0x40 and 2 in 0x1c for
 * `t_backwards_ani`. Same two numbers, one packed and one split across two fields -- which is the
 * clearest evidence yet that the pair IS a rate and an index travelling together, and that the two
 * animators simply take them differently.
 *
 * That is worth more than any of the individual pair sites: `t_animate2_a9` gets (2, 0xc) packed and
 * `t_backwards_ani` gets rate 2 in 0x1c and index 0xc in 0x40. The low half is the index.
 *
 * `obj->field40 = 0xc` is built as `adds r3, #0xa` off the 2 just written to 0x1c, so even here the
 * two numbers come from one literal.
 *
 * `r1` carries 0x3a5 into state 0x3a2's store and 0x3ad into state 0x3a9's -- the two-tokens-one-
 * register hazard again, and each store traced back to its own load.
 */
long t_animate2_a9(MK3THREAD *thread);           /* pointer slot 0x000f36c0 */
long t_r_ermac_fatal_slam(MK3THREAD *thread);    /* pointer slot 0x000f3714 */
long t_backwards_ani(MK3THREAD *thread);         /* pointer slot 0x000f37c4 */

long t_ermac_super_slam(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3a2) {
        obj->field40 = 0x0002000c;

        *mk3_frame(thread, frame + 1) = 0x3a5;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate2_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x3a5) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_ermac_fatal_slam;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x3a9;
        thread->fieldfc = 0xa0;
        return 0xa0;
    }

    if (token == 0x3a9) {
        obj->field1c = 2;
        obj->field40 = 2 + 0xa;

        *mk3_frame(thread, frame + 1) = 0x3ad;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_backwards_ani;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x3ad) {
        *mk3_frame(thread, frame + 1) = 0x3af;
        thread->fieldfc = 0xa;
        return 0xa;
    }

    if (token == 0x3af) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x3a2;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------- t_lia_hair_spin
 *
 * armv7 0x0003481c, 316 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x127e, descend into t_fatality_start_pause
 *
 *      token == 0x127e:   obj->field40 = 0xa; get_char_ani2(obj)
 *                         obj->field38 = t_slide_behind_hair
 *                         takeover_him(obj)
 *                         obj->field1c = 4
 *                         token := 0x1287, descend into t_mframew
 *
 *      token == 0x1287:   token := 0x1288, park 0x30
 *
 *      token == 0x1288:   obj->field38 = t_hair_spun
 *                         takeover_him(obj)
 *                         obj->field1c = 3
 *                         token := 0x128e, descend into t_mframew
 *
 *      token == 0x128e:   token := 0x128f, park 0x40
 *
 *      token == 0x128f:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **This confirms a prediction made when `t_slide_behind_hair` was written.** That routine ends by
 * installing `t_wait_forever`, and its note said the park had to be replaced from outside because
 * nothing in it unwinds. Here is the outside: this fatality hands the victim
 * `t_slide_behind_hair`, waits, and then hands them `t_hair_spun` instead, forty-eight frames
 * later.
 *
 * Second routine in this file to use two handovers in sequence, after `t_reptile_vomit`. The two
 * together make the pattern general: **a victim reaction ending in `t_wait_forever` is often
 * waiting to be replaced, and the attacker's schedule is what replaces it.**
 *
 * **`t_hair_spun` is shared with mkanimal.c.** `tl_kano_spider` hands the victim the same routine
 * through pointer slot 0x000f346c. So the reaction pool crosses files in both directions -- two
 * fatalities here borrow reactions from the animality module, and this animality borrows one from
 * the fatality module.
 *
 * `r6` carries 0x1287 into state 0x127e's store and 0x128e into state 0x1288's, the two-tokens-one-
 * register hazard again.
 *
 * The two `t_mframew` waits are four and three frames and the two parks are 0x30 and 0x40, so the
 * whole schedule is: resolve the animation, slide the victim, wait, spin them, wait, finish.
 */
long t_slide_behind_hair(MK3THREAD *thread);
long t_hair_spun(MK3THREAD *thread);             /* 0x0003871c */

long t_lia_hair_spin(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x127e) {
        obj->field40 = 0xa;
        get_char_ani2(obj);

        obj->field38 = (uint32_t)(uintptr_t)t_slide_behind_hair;
        takeover_him(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x1287;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1287) {
        *mk3_frame(thread, frame + 1) = 0x1288;
        thread->fieldfc = 0x30;
        return 0x30;
    }

    if (token == 0x1288) {
        obj->field38 = (uint32_t)(uintptr_t)t_hair_spun;
        takeover_him(obj);

        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x128e;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x128e) {
        *mk3_frame(thread, frame + 1) = 0x128f;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0x128f) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x127e;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------ t_hair_spun
 *
 * armv7 0x0003871c, 324 bytes.  **Complete.**
 *
 *      token == 0:        death_scream(obj)
 *                         center_around_me(obj)
 *                         obj->field1c = 7; his_ochar_sound(obj)
 *                         obj->field1c = 8; his_ochar_sound(obj)
 *                         obj->field48 = 0x00050020; shake_a11(obj)
 *                         obj->field1c = 0x25; create_fx(obj)
 *                         obj->field1c = part->field24
 *                         PUSH part->field24
 *                         obj->field1c = 6
 *                         part->field24 = 6
 *                         obj->field40 = 8; get_char_ani2(obj)
 *                         POP  part->field24     (also into obj->field1c)
 *                         do_next_a9_frame(obj)
 *                         obj->field48 = obj->field40
 *                         obj->a10 = 0x30
 *                         -- falls into the tail --
 *
 *      token == 0x126f:   do_next_a9_frame(obj)
 *                         if (--obj->a10 == 0) {
 *                             obj->field40 = obj->field48
 *                             find_part2(obj)
 *                             obj->field1c = 4
 *                             token := 0x1277, descend into t_mframew
 *                         }
 *                         -- falls into the tail --
 *
 *      the tail:          token := 0x126f, park 2
 *
 *      token == 0x1277:   set_inviso(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The argument stack is used to save the CHARACTER NUMBER while the routine lies about it.**
 * `part->field24` is pushed, overwritten with 6, `get_char_ani2` is called -- which indexes
 * `character_anitabs2` by exactly that field -- and then the real number is popped back. So the
 * fighter is temporarily made to look like character 6 so that its animation is resolved out of
 * character 6's table.
 *
 * That is the fifth use of the argument stack and by far the most pointed. The other four save a
 * position, a cursor, a counter and a table base across a call that needs the same slot; **this one
 * borrows another character's animation set by falsifying an identity field and putting it back.**
 * Nothing else in the tree does that, and it means `part->field24` cannot be assumed stable across
 * a call even within one routine.
 *
 * It is the second site to WRITE that field, after `t_mk_game_cabinet` set it to 0xd for a prop --
 * but that one never restored it, and this one does, four instructions later.
 *
 * The resolved pointer is then stashed in 0x48 and restored to 0x40 forty-eight frames later for
 * `find_part2`, so 0x48 is a cursor save here -- a seventh reading of that field.
 *
 * **Both callers of this routine are already written and they are in different files**:
 * `t_lia_hair_spin` in this file hands it to the victim as the second of two handovers, and
 * mkanimal.c's `tl_kano_spider` hands it through pointer slot 0x000f346c. One reaction, two
 * finishers, two modules.
 *
 * Sounds 7 and 8 through `his_ochar_sound` -- the pair habit, played on the OTHER fighter, as in
 * `t_r_prevomit`.
 */
long t_hair_spun(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc;

    if (token == 0x1277) {
        set_inviso(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token == 0) {
        death_scream(obj);
        center_around_me(obj);

        obj->field1c = 7;
        his_ochar_sound(obj);
        obj->field1c = 8;
        his_ochar_sound(obj);

        obj->field48 = 0x00050020;
        shake_a11(obj);

        obj->field1c = 0x25;
        create_fx(obj);

        obj->field1c = obj->field08->field24;

        argc = thread->fieldf8;
        *mk3_arg(thread, argc) = obj->field08->field24;
        thread->fieldf8 = argc + 1;

        obj->field1c = 6;
        obj->field08->field24 = 6;

        obj->field40 = 8;
        get_char_ani2(obj);

        argc = thread->fieldf8 - 1;
        thread->fieldf8 = argc;
        obj->field1c = *mk3_arg(thread, argc);
        obj->field08->field24 = obj->field1c;

        do_next_a9_frame(obj);

        obj->field48 = obj->field40;
        obj->a10     = 0x30;

    } else if (token == 0x126f) {
        do_next_a9_frame(obj);

        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            obj->field40 = obj->field48;
            find_part2(obj);

            obj->field1c = 4;

            *mk3_frame(thread, thread->frame + 1) = 0x1277;
            thread->frame = thread->frame + 1;       /* push a level */
            mk3_frame(thread, thread->frame)[1] =
                (uint32_t)(uintptr_t)t_mframew;
            *mk3_frame(thread, thread->frame + 1) = 0;
            return 0;
        }

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = 0x126f;
    thread->fieldfc = 2;
    return 2;
}


/* --------------------------------------------------------------------- t_skel_fire_proc
 *
 * armv7 0x00036094, 344 bytes.  **Complete.**
 *
 *      token == 0:        tsound_func(obj, 0x20)
 *                         obj->field1c = 5
 *                         token := 0x16f0, descend into t_mframew
 *
 *      token == 0x16f0:   obj->a10 = obj->field40
 *                         obj->field48 = 3
 *                         -- falls into the loop head --
 *
 *      the loop head:     obj->field40 = obj->a10
 *                         obj->field1c = 5
 *                         token := 0x16f7, descend into t_mframew
 *
 *      token == 0x16f7:   if (--obj->field48 > 0) -- the loop head --
 *                         obj->field1c = 5
 *                         token := 0x16fd, descend into t_mframew
 *
 *      token == 0x16fd:   token := 0x16fe, park 6
 *
 *      token == 0x16fe:   tsound_func(obj, 0x21)
 *                         obj->field1c = 6
 *                         token := 0x1702, descend into t_mframew
 *
 *      token == 0x1702:   frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **This answers the question left open when `t_skburn3` was written.** That routine spawns this
 * thread and never reads `obj->field40` itself, which made the `+8` in `t_robo_skeleton_burn`
 * puzzling -- something had to consume the cursor those three burn routines set up. It is consumed
 * here: state 0x16f0 copies 0x40 into 0x44 and the loop head restores it before every descent into
 * `t_mframew`.
 *
 * So the chain is complete. `t_sb_skeleton_burn` (from word 0), `t_robo_skeleton_burn` (from word 2)
 * and `t_lk_skeleton_burn` all reach `t_skburn3`; that screams, spawns this, and hides the body;
 * and this walks the word list three times over, four routines and a thread apart from where the
 * list was chosen.
 *
 * **Same save-and-restore shape as `t_kissani` and `t_shocker_shaker`**, but without the argument
 * stack: 0x44 is free here, so the cursor is parked in a field rather than pushed. Which of the two
 * a routine uses depends only on whether 0x44 is needed for something else.
 *
 * Sounds 0x20 and 0x21 bracket the whole thing, one at the start and one near the end -- the pair
 * habit again, spread across the routine's full length rather than played together.
 *
 * `r0` carries the thread into state 0x16f7's stores and 0x16fe into state 0x16fd's, because the
 * dispatch reloads it on the way past. One register, a pointer and a token, and each store traced
 * back to its own load.
 */
long t_skel_fire_proc(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t next;

    if (token == 0) {
        tsound_func(obj, 0x20);

        obj->field1c = 5;
        next = 0x16f0;

    } else if (token == 0x16fd) {
        *mk3_frame(thread, frame + 1) = 0x16fe;
        thread->fieldfc = 6;
        return 6;

    } else if (token == 0x16fe) {
        tsound_func(obj, 0x21);

        obj->field1c = 6;
        next = 0x1702;

    } else if (token == 0x1702) {
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    } else if (token == 0x16f0 || token == 0x16f7) {
        if (token == 0x16f0) {
            obj->a10     = obj->field40;
            obj->field48 = 3;

        } else {
            obj->field48 = obj->field48 - 1;
            if ((long)obj->field48 <= 0) {
                obj->field1c = 5;

                *mk3_frame(thread, thread->frame + 1) = 0x16fd;
                thread->frame = thread->frame + 1;   /* push a level */
                mk3_frame(thread, thread->frame)[1] =
                    (uint32_t)(uintptr_t)t_mframew;
                *mk3_frame(thread, thread->frame + 1) = 0;
                return 0;
            }
        }

        obj->field40 = obj->a10;
        obj->field1c = 5;
        next = 0x16f7;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = next;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------------- t_lao_slicer
 *
 * armv7 0x0003a1b0, 324 bytes.  **Complete.**
 *
 *      token == 0:        center_around_him(obj)
 *                         token := 0xdfa, descend into t_fatality_start_pause
 *
 *      token == 0xdfa:    obj->field40 = 4; pose2_a9_manual(obj)
 *                         token := 0xdfe, park 0x10
 *
 *      token == 0xdfe:    obj->field1c = 1; ochar_sound(obj)
 *                         obj->field1c = 4
 *                         token := 0xe03, descend into t_mframew
 *
 *      token == 0xe03:    wfe_him(obj)
 *                         him = proc->him
 *                         him->field2c = him->field24 + 0x1b80 + 0xa
 *                         token := 0xe08, park 0xc0
 *
 *      token == 0xe08:    token := 0xe09, park 0x18
 *
 *      token == 0xe09:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **Second site to index base-plus-character by the OPPONENT's number**, after
 * `t_reptile_tongue`. Both read `him->field24` out of the victim's own part and write the victim's
 * own 0x2c; the bases differ, 0x1b8a here against 0x1b4e there. So the two victims of these two
 * fatalities get per-character animations chosen from two different blocks, and neither routine
 * touches its own part's number.
 *
 * Both also park the victim with `wfe_him` in the same state, so the pattern is: stop them, then
 * pick what they look like while stopped.
 *
 * **`center_around_him` runs BEFORE the death blow**, in state 0, where `t_sz_blow` calls it after
 * its handover and `t_sonya_kiss_crusher` calls it last of all. Three callers, three positions in
 * the schedule -- so the call has no fixed place and each routine puts it where its own geometry
 * needs it.
 *
 * `pose2_a9_manual` with index 4, the second caller of that poser after `t_kitana_decap`'s 5. Still
 * nothing distinguishing it from `pose_a9_manual`.
 *
 * `r8` carries 0xdfe into state 0xdfa's store and 0xe08 into state 0xe03's -- the two-tokens-one-
 * register hazard, and each store traced back to its own load.
 */
long t_lao_slicer(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    MK3OBJ  *him;

    if (token == 0xdfa) {
        obj->field40 = 4;
        pose2_a9_manual(obj);

        *mk3_frame(thread, frame + 1) = 0xdfe;
        thread->fieldfc = 0x10;
        return 0x10;
    }

    if (token == 0xdfe) {
        obj->field1c = 1;
        ochar_sound(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xe03;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xe03) {
        wfe_him(obj);

        him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
        him->field2c = him->field24 + 0x1b80 + 0xa;

        *mk3_frame(thread, frame + 1) = 0xe08;
        thread->fieldfc = 0xc0;
        return 0xc0;
    }

    if (token == 0xe08) {
        *mk3_frame(thread, frame + 1) = 0xe09;
        thread->fieldfc = 0x18;
        return 0x18;
    }

    if (token == 0xe09) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    center_around_him(obj);

    *mk3_frame(thread, frame + 1) = 0xdfa;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------------- t_scorpion_fire
 *
 * armv7 0x00039bc8, 324 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x54f, descend into t_fatality_start_pause
 *
 *      token == 0x54f:    obj->field1c = 0xa; ochar_sound(obj)
 *                         token := 0x554, descend into t_scorpion_remove_mask
 *
 *      token == 0x554:    obj->field38 = t_r_scared_of_scorp
 *                         takeover_him(obj)
 *                         token := 0x558, park 0x30
 *
 *      token == 0x558:    obj->field40 = 0xe; get_char_ani2(obj)
 *                         find_last_frame(obj)
 *                         do_next_a9_frame(obj)
 *                         NewThread(obj, t_scorpion_flame)
 *                         token := 0x569, park 0x18
 *
 *      token == 0x569:    obj->field38 = t_scorp_skeleton_burn
 *                         takeover_him(obj)
 *                         token := 0x56d, park 0x60
 *
 *      token == 0x56d:    death_blow_complete(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **`t_scorp_skeleton_burn` is a FOURTH entry into the burn chain.** The three written at the top of
 * this file -- `t_sb_skeleton_burn`, `t_robo_skeleton_burn` and `t_lk_skeleton_burn` -- all reach
 * `t_skburn3`, which spawns `t_skel_fire_proc`. This one is handed to the VICTIM rather than run by
 * the attacker, which none of the other three are.
 *
 * So the burn is not a self-inflicted animation: it is a reaction, and the three earlier entries
 * are the cases where a fighter burns itself. Worth knowing before assuming what a `*_skeleton_burn`
 * routine is for.
 *
 * **Third routine in this file to use two handovers in sequence**, after `t_reptile_vomit` and
 * `t_lia_hair_spin`: the victim gets `t_r_scared_of_scorp` for seventy-two frames and then
 * `t_scorp_skeleton_burn`. The pattern is now firmly general.
 *
 * It descends into `t_scorpion_remove_mask`, written earlier in this file -- the routine that runs
 * `t_animate_a0_frames` twice with 0x00050002 and 0x00050004. So the mask comes off as a shared
 * sub-routine of the fatality rather than as part of it.
 *
 * `find_last_frame` after `get_char_ani2` winds the attacker to the animation's END before
 * `do_next_a9_frame` steps once -- the same pair `t_st_spiked` uses to leave a corpse in its final
 * pose, here used on a living fighter to hold the last frame of the unmasking.
 *
 * `r6` carries 0x554 into state 0x54f's store and 0x569 into state 0x558's, the two-tokens-one-
 * register hazard again.
 */
long t_scorpion_remove_mask(MK3THREAD *thread);
long t_r_scared_of_scorp(MK3THREAD *thread);     /* 0x00035da0 */
long t_scorp_skeleton_burn(MK3THREAD *thread);   /* 0x0003424c */
long t_scorpion_flame(MK3THREAD *thread);        /* 0x0003654c */

long t_scorpion_fire(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x54f) {
        obj->field1c = 0xa;
        ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0x554;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_scorpion_remove_mask;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x554) {
        obj->field38 = (uint32_t)(uintptr_t)t_r_scared_of_scorp;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x558;
        thread->fieldfc = 0x30;
        return 0x30;
    }

    if (token == 0x558) {
        obj->field40 = 0xe;
        get_char_ani2(obj);
        find_last_frame(obj);
        do_next_a9_frame(obj);

        NewThread(obj, (MK3THREADFUNC)t_scorpion_flame);

        *mk3_frame(thread, frame + 1) = 0x569;
        thread->fieldfc = 0x18;
        return 0x18;
    }

    if (token == 0x569) {
        obj->field38 = (uint32_t)(uintptr_t)t_scorp_skeleton_burn;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x56d;
        thread->fieldfc = 0x60;
        return 0x60;
    }

    if (token == 0x56d) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x54f;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------------- t_ind_zap_kill
 *
 * armv7 0x000385cc, 336 bytes.  **Complete.**
 *
 *      token == 0:        him = proc->him
 *                         *(long *)((char *)proc->field00->field00 + 0x3c)
 *                             = (int16_t)him->y12
 *                         token := 0x152d, descend into t_fatality_start_pause
 *
 *      token == 0x152d:   get_x_dist(obj)
 *                         obj->field40 = 7; get_char_ani2(obj)
 *                         obj->field1c = 5
 *                         token := 0x1534, descend into t_mframew
 *
 *      token == 0x1534:   token := 0x1535, park 6
 *
 *      token == 0x1535:   obj->field1c = 3
 *                         token := 0x1538, descend into t_mframew
 *
 *      token == 0x1538:   delete_slave(obj)
 *                         obj->field38 = t_r_ind_lightning
 *                         takeover_him(obj)
 *                         token := 0x153d, park 0x28
 *
 *      token == 0x153d:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **This is what writes `proc->field3c`, and it closes a question raised two batches ago.** When
 * `t_r_ind_lightning` was written I recorded that it reads a halfword at proc + 0x3c to place the
 * victim's final y, and that the offset was inside the header's `_pad2c` with no name and no other
 * user in the tree. Here is the other end: state 0 saves the victim's y there before the fatality
 * begins.
 *
 * So the pair is a hand-off through the proc: **the attacker records where the victim was standing,
 * the fatality runs, and the victim's reaction puts them back at that height.** `t_r_tasered` reads
 * the same field for the same purpose, so one write serves two reactions.
 *
 * The write goes through `proc->field00->field00` -- the opponent's object and then its proc -- the
 * same two-hop route mkanimal.c's `create_fx_for_him` uses to reach the other fighter's proc. It is
 * the OTHER proc's 0x3c that is written, not this one's.
 *
 * **`get_x_dist(obj)` in state 0x152d has its result discarded.** It answers in 0x28 and nothing in
 * this routine reads 0x28 afterwards. Sixth dead operation recorded in the tree; transcribed
 * because the binary contains it.
 *
 * `delete_slave` is the second site in this file after `t_sz_blow`, and again nothing here creates
 * the slave -- so whatever makes it is still unaccounted for.
 *
 * `r2` carries 0x1538 into state 0x1535's store, having been loaded by the dispatch on the way
 * past; the two-tokens-one-register hazard again.
 */
long t_r_ind_lightning(MK3THREAD *thread);

long t_ind_zap_kill(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    MK3OBJ  *him;

    if (token == 0x152d) {
        get_x_dist(obj);                     /* result discarded */

        obj->field40 = 7;
        get_char_ani2(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x1534;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1534) {
        *mk3_frame(thread, frame + 1) = 0x1535;
        thread->fieldfc = 6;
        return 6;
    }

    if (token == 0x1535) {
        obj->field1c = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x1538;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1538) {
        delete_slave(obj);

        obj->field38 = (uint32_t)(uintptr_t)t_r_ind_lightning;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x153d;
        thread->fieldfc = 0x28;
        return 0x28;
    }

    if (token == 0x153d) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    him = (MK3OBJ *)(void *)(uintptr_t)obj->field00->him;
    *(uint32_t *)((char *)obj->field00->field00->field00 + 0x3c) =
        (uint32_t)(int32_t)(int16_t)MK3_FIELD12(him);

    *mk3_frame(thread, frame + 1) = 0x152d;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------------- t_lao_tornado
 *
 * armv7 0x000358dc, 352 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xed3, descend into t_fatality_start_pause
 *
 *      token == 0xed3:    sans_repell_for_good(obj)
 *                         obj->field1c = 6; ochar_sound(obj)
 *                         token := 0xed8, descend into t_normal_spin_intro
 *
 *      token == 0xed8:    obj->field48 = 0x00040020; shake_a11(obj)
 *                         obj->field38 = t_tornado_sucked
 *                         takeover_him(obj)
 *                         NewThread(obj, t_nado_sounds)
 *                         obj->field40 = 3; get_char_ani2(obj)
 *                         obj->field1c = 0x00030030
 *                         token := 0xee4, descend into t_animate_a0_frames
 *
 *      token == 0xee4:    player_normpal(obj)
 *                         token := 0xee6, descend into t_normal_spin_intro
 *
 *      token == 0xee6:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **Three routines written earlier in this file all meet here.** `t_tornado_sucked` is handed to
 * the victim -- the accelerating pull that drags them in at 0x4000 growing by 0x2000 a frame until
 * the gap closes to 8, then vanishes them with effect 0x24. `t_nado_sounds` is spawned as its own
 * thread -- the reinstall-self loop that plays sounds 6 and 7 together every sixty-four frames
 * forever. And `t_fatality_start_pause` opens the whole thing.
 *
 * That explains why `t_nado_sounds` never stops: the tornado's noise has to last as long as the
 * tornado, and the fatality ending is what tears the thread down rather than the loop deciding for
 * itself.
 *
 * **`t_normal_spin_intro` is descended into TWICE**, once before the tornado and once after
 * `player_normpal` restores the palette. So the spin is a shared sub-routine bracketing the
 * fatality, not part of it -- and the same routine serves as both the wind-up and the recovery.
 *
 * The `t_animate_a0_frames` pair is 0x00030030, seventh site: rate 3, index 0x30. High half 3 this
 * time, which after `t_skin_fall`'s 8 and the four 5s confirms the high half is genuinely free.
 *
 * The shake pair 0x00040020 is asymmetric, eighth such site.
 */
long t_normal_spin_intro(MK3THREAD *thread);     /* 0x00034958 */
long t_tornado_sucked(MK3THREAD *thread);
long t_nado_sounds(MK3THREAD *thread);

long t_lao_tornado(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xed3) {
        sans_repell_for_good(obj);

        obj->field1c = 6;
        ochar_sound(obj);

        *mk3_frame(thread, thread->frame + 1) = 0xed8;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_normal_spin_intro;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xed8) {
        obj->field48 = 0x00040020;
        shake_a11(obj);

        obj->field38 = (uint32_t)(uintptr_t)t_tornado_sucked;
        takeover_him(obj);

        NewThread(obj, (MK3THREADFUNC)t_nado_sounds);

        obj->field40 = 3;
        get_char_ani2(obj);

        obj->field1c = 0x00030030;

        *mk3_frame(thread, thread->frame + 1) = 0xee4;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a0_frames;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xee4) {
        player_normpal(obj);

        *mk3_frame(thread, thread->frame + 1) = 0xee6;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_normal_spin_intro;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xee6) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xed3;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------ t_robo_flame_throw
 *
 * armv7 0x00036a44, 352 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x1232, descend into t_fatality_start_pause
 *
 *      token == 0x1232:   obj->field40 = 0x0005000a
 *                         token := 0x1235, descend into t_animate2_a9
 *
 *      token == 0x1235:   obj->field38 = t_robo_skeleton_burn
 *                         takeover_him(obj)
 *                         token := 0x1239, park 1
 *
 *      token == 0x1239:   delete_slave(obj)
 *                         token := 0x123b, park 0x20
 *
 *      token == 0x123b:   obj->field40 = 0xa; find_ani2_part2(obj)
 *                         obj->field1c = 5
 *                         token := 0x1240, descend into t_mframew
 *
 *      token == 0x1240:   token := 0x1241, park 0x80
 *
 *      token == 0x1241:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **This explains the `+8` that opened this file.** `t_robo_skeleton_burn` -- the second routine
 * written here -- enters `a_sb_skeleton_burn` two words in, and the offset was what proved that
 * symbol is data rather than a handler. It is handed to the VICTIM here, so the robot's flame throw
 * starts the burn sequence part-way because the first two frames are the ignition the thrower has
 * already performed.
 *
 * With `t_scorpion_fire`'s `t_scorp_skeleton_burn` that makes two of the four burn entries reached
 * as reactions and two run on the fighter's own thread. The burn is a shared sequence with four
 * doors into it, and which door depends on what lit the fire.
 *
 * **Third `delete_slave` site in this file**, after `t_sz_blow` and `t_ind_zap_kill`, and all three
 * are fatalities that project something at the opponent. Still nothing measured creates the slave;
 * the three consumers agree that one exists by the time the blow lands.
 *
 * `find_ani2_part2` rather than `find_ani_part2` -- a second finder taking the same small index in
 * 0x40, exactly as `pose2_a9_manual` shadows `pose_a9_manual`. The "2" suffix appears on four
 * routines in this tree now and nothing measured distinguishes any of the pairs.
 *
 * The `t_animate2_a9` pair is 0x0005000a, second site for that variant after
 * `t_ermac_super_slam`'s 0x0002000c.
 */
long t_robo_skeleton_burn(MK3THREAD *thread);
void find_ani2_part2(MK3OBJ *obj);

long t_robo_flame_throw(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x1232) {
        obj->field40 = 0x0005000a;

        *mk3_frame(thread, thread->frame + 1) = 0x1235;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate2_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1235) {
        obj->field38 = (uint32_t)(uintptr_t)t_robo_skeleton_burn;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0x1239;
        thread->fieldfc = 1;
        return 1;
    }

    if (token == 0x1239) {
        delete_slave(obj);

        *mk3_frame(thread, frame + 1) = 0x123b;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0x123b) {
        obj->field40 = 0xa;
        find_ani2_part2(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x1240;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1240) {
        *mk3_frame(thread, frame + 1) = 0x1241;
        thread->fieldfc = 0x80;
        return 0x80;
    }

    if (token == 0x1241) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x1232;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------ t_r_ice_blow
 *
 * armv7 0x00038970, 364 bytes.  **Complete.**
 *
 *      token == 0:        obj->field1c = 8; his_ochar_sound(obj)
 *                         face_opponent(obj)
 *                         death_scream(obj)
 *                         player_froze_pal(obj)
 *                         obj->field40 = 0x47; pose_a9_manual(obj)
 *                         obj->field1c = 4
 *                         obj->field20 = 4 - 1 = 3
 *                         obj->field24 = 3 + 7 = 0xa
 *                         token := 0x14e3, descend into t_shake_ob_up
 *
 *      token == 0x14e3:   obj->field1c = 4
 *                         token := 0x14e6, descend into t_mframew
 *
 *      token == 0x14e6:   obj->field48 = 0x000a0010; shake_a11(obj)
 *                         tsound_func(obj, 0)
 *                         tsound_func(obj, 1)
 *                         obj->field40 = 4; get_his_char_ani2(obj)
 *                         do_next_a9_frame(obj)
 *                         ground_multi(obj)
 *                         obj->field1c = 0x18000; away_x_vel(obj)
 *                         obj->field1c = 5
 *                         token := 0x14f6, descend into t_mframew
 *
 *      token == 0x14f6:   stop_me_player(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **The victim's half of `t_sz_blow`**, handed across in that routine's state 0x1507. The fatality
 * freezes the opponent and shatters them: `player_froze_pal` sets the ice palette, animation 0x47 is
 * posed by hand, the body shakes twice -- once through `t_shake_ob_up` with 4/3/0xa and once
 * through `shake_a11` with 0x000a0010 -- and then it is grounded and pushed away at 0x18000.
 *
 * **`player_froze_pal` is a fourth palette routine**, alongside `player_swpal`'s numbered palettes
 * (3 poison, 5 shocked, 6 ghost) and `player_normpal`'s restore. This one takes no index, so the ice
 * colour is fixed rather than selected.
 *
 * Sounds 0 and 1 as a pair, the same two `t_r_ind_lightning` plays -- and both routines are victim
 * reactions to an elemental blow. So that pair is the "hit by something cold or electric" noise.
 *
 * **The shake pair 0x000a0010 is the same value `t_r_tasered` uses.** Two victim reactions, two
 * fatalities, one magnitude -- so the pairs are drawn from a small set rather than tuned per
 * routine.
 *
 * `get_his_char_ani2` resolves the animation against the OPPONENT's character number, which is the
 * attacker from this routine's point of view -- so the shattering animation is chosen by who threw
 * the ice, not by who is frozen.
 *
 * 4, 3 and 0xa come from one literal with a `subs` and an `adds`; the habit again.
 */
void player_froze_pal(MK3OBJ *obj);
void ground_multi(MK3OBJ *obj);

long t_r_ice_blow(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x14e3) {
        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0x14e6;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x14e6) {
        obj->field48 = 0x000a0010;
        shake_a11(obj);

        tsound_func(obj, 0);
        tsound_func(obj, 1);

        obj->field40 = 4;
        get_his_char_ani2(obj);
        do_next_a9_frame(obj);
        ground_multi(obj);

        obj->field1c = 0x18000;
        away_x_vel(obj);

        obj->field1c = 5;

        *mk3_frame(thread, thread->frame + 1) = 0x14f6;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x14f6) {
        stop_me_player(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    obj->field1c = 8;
    his_ochar_sound(obj);

    face_opponent(obj);
    death_scream(obj);
    player_froze_pal(obj);

    obj->field40 = 0x47;
    pose_a9_manual(obj);

    obj->field1c = 4;
    obj->field20 = 4 - 1;
    obj->field24 = (4 - 1) + 7;

    *mk3_frame(thread, thread->frame + 1) = 0x14e3;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ----------------------------------------------------------------------- t_mileena_suck_kiss
 *
 * armv7 0x0003674c, 348 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x3ca, descend into t_fatality_start_pause
 *
 *      token == 0x3ca:    sans_repell_for_good(obj)
 *                         obj->field40 = 0x00060006
 *                         token := 0x3cd, descend into t_animate2_a9
 *
 *      token == 0x3cd:    tsound_func(obj, 0x60)
 *                         obj->field38 = t_r_kiss_suck
 *                         takeover_him(obj)
 *                         tsound_func(obj, 0x87)
 *                         token := 0x3d4, park 0x70
 *
 *      token == 0x3d4:    obj->field40 = 0x00040018
 *                         token := 0x3d7, descend into t_animate2_a9
 *
 *      token == 0x3d7:    NewThread(obj, t_bone_vomit_proc)
 *                         token := 0x3d9, park 0x70
 *
 *      token == 0x3d9:    death_blow_complete(obj)
 *                         token := 0x3dc, DESCEND into t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **The only fatality measured that DESCENDS into `t_victory_animation` instead of installing it.**
 * Every other one -- `t_do_pit_fatality`, `t_kitana_decap`, `t_ermac_super_slam`, `t_sz_blow`,
 * `t_lao_slicer`, `t_lao_tornado`, `t_robo_flame_throw` and the rest -- replaces its own handler.
 * This one keeps its frame and pushes a level, leaving token 0x3dc behind.
 *
 * **0x3dc is not in this routine's dispatch.** If the victory animation ever popped back, the next
 * tick would enter here with 0x3dc and return -3. So either that routine never unwinds, or the
 * descent is a mistake that happens to be harmless because it never returns. Recorded as measured;
 * nothing here settles which, and `t_victory_animation` is in another file and still unwritten.
 *
 * **It ties together two routines already written in this file.** `t_r_kiss_suck` is handed to the
 * victim -- the one with the dead `obj->field40 = 0x17` and the unnamed sub-table inside
 * `fn_ani_data` -- and `t_bone_vomit_proc` is spawned as its own thread, the three-state ring that
 * ends on the 0x16462 terminator. So the vomiting outlives this routine, which is why that ring
 * needed a never-wake state rather than a way out.
 *
 * Two `t_animate2_a9` runs with 0x00060006 and 0x00040018 -- third and fourth sites for that
 * variant. The first pair is doubled and the second is not, so both halves move independently here
 * too.
 *
 * Sounds 0x60 and 0x87 bracket the handover, one on each side of `takeover_him`.
 */
long t_r_kiss_suck(MK3THREAD *thread);
long t_bone_vomit_proc(MK3THREAD *thread);

long t_mileena_suck_kiss(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0x3ca) {
        sans_repell_for_good(obj);

        obj->field40 = 0x00060006;

        *mk3_frame(thread, thread->frame + 1) = 0x3cd;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate2_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x3cd) {
        tsound_func(obj, 0x60);

        obj->field38 = (uint32_t)(uintptr_t)t_r_kiss_suck;
        takeover_him(obj);

        tsound_func(obj, 0x87);

        *mk3_frame(thread, frame + 1) = 0x3d4;
        thread->fieldfc = 0x70;
        return 0x70;
    }

    if (token == 0x3d4) {
        obj->field40 = 0x00040018;

        *mk3_frame(thread, thread->frame + 1) = 0x3d7;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate2_a9;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x3d7) {
        NewThread(obj, (MK3THREADFUNC)t_bone_vomit_proc);

        *mk3_frame(thread, frame + 1) = 0x3d9;
        thread->fieldfc = 0x70;
        return 0x70;
    }

    if (token == 0x3d9) {
        death_blow_complete(obj);

        *mk3_frame(thread, thread->frame + 1) = 0x3dc;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_victory_animation;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0x3ca;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------------------ t_kang_fire
 *
 * armv7 0x0003522c, 368 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xa57, descend into t_fatality_start_pause
 *
 *      token == 0xa57:    proc->field34 = (int16_t)part->x0e
 *                         sans_repell_for_good(obj)
 *                         wfe_him(obj)
 *                         obj->field1c = 7; ochar_sound(obj)
 *                         obj->field1c = 6; ochar_sound(obj)
 *                         obj->field40 = 6
 *                         obj->field1c = 4
 *                         token := 0xa62, descend into t_backwards_ani2
 *
 *      token == 0xa62:    obj->field38 = t_lk_skeleton_burn
 *                         takeover_him(obj)
 *                         match_me_with_him(obj)
 *                         obj->field40 = 5; get_char_ani2(obj)
 *                         obj->field1c = 4
 *                         token := 0xa6b, descend into t_mframew
 *
 *      token == 0xa6b:    set_inviso(obj)
 *                         token := 0xa6e, park 0x60
 *
 *      token == 0xa6e:    obj->field1c = 6; ochar_sound(obj)
 *                         part->x0e = (uint16_t)proc->field34
 *                         frame[frame].handler = t_kang_reform
 *
 *      otherwise:         return -3
 *
 * **`proc->field34` saves the attacker's own x across the whole fatality**, which is the same trick
 * `t_ind_zap_kill` plays with `proc->field3c` and the victim's y. Two proc fields, two coordinates,
 * two fatalities -- so the proc is where a routine parks a position it will need after
 * `match_me_with_him` has moved it.
 *
 * The save reads with `ldrsh` and the restore writes back what `ldrh` produced, so the value goes
 * out signed and comes back unsigned. Transcribed at the widths the binary uses; for any position
 * that fits sixteen bits the round trip is exact either way.
 *
 * **`t_lk_skeleton_burn` is handed to the VICTIM here**, which is the third of the four burn entries
 * to be reached as a reaction. Only `t_sb_skeleton_burn` -- the one that sets 0x40 to the start of
 * the list and descends straight into `t_skburn3` -- has no caller yet, and this routine's target is
 * the one that centres the body and waits ten frames before reaching it.
 *
 * **`t_kang_reform` is shared with `t_kang_mk_game`.** Both of Liu Kang's fatalities end by
 * installing it, so the reform is written once and reached from two schedules.
 *
 * `set_inviso` here is the hide-so-a-prop-can-take-over kind, as in `t_kang_mk_game`, not the
 * disappear-and-die kind -- the reform brings the fighter back ninety-six frames later.
 *
 * Sound 6 is played three times across the routine, twice in state 0xa57 alongside 7 and once at the
 * end. `r6` holds 6 for the first two and it is reloaded for the third.
 */
long t_lk_skeleton_burn(MK3THREAD *thread);
long t_kang_reform(MK3THREAD *thread);

long t_kang_fire(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xa57) {
        *(uint32_t *)((char *)obj->field00 + 0x34) =
            (uint32_t)(int32_t)(int16_t)MK3_FIELD0E(obj->field08);

        sans_repell_for_good(obj);
        wfe_him(obj);

        obj->field1c = 7;
        ochar_sound(obj);
        obj->field1c = 6;
        ochar_sound(obj);

        obj->field40 = 6;
        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xa62;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_backwards_ani2;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xa62) {
        obj->field38 = (uint32_t)(uintptr_t)t_lk_skeleton_burn;
        takeover_him(obj);

        match_me_with_him(obj);

        obj->field40 = 5;
        get_char_ani2(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xa6b;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xa6b) {
        set_inviso(obj);

        *mk3_frame(thread, frame + 1) = 0xa6e;
        thread->fieldfc = 0x60;
        return 0x60;
    }

    if (token == 0xa6e) {
        obj->field1c = 6;
        ochar_sound(obj);

        MK3_SET_FIELD0E(obj->field08,
                        *(uint16_t *)((char *)obj->field00 + 0x34));

        return mk3_install(thread, (MK3THREADFUNC)t_kang_reform);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xa57;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------- tl_r_scared_of_mileena
 *
 * armv7 0x0003b80c, 344 bytes.  **Complete.**
 *
 *      token == 0:        scared_pose(obj)
 *                         part->field2c = 0x1c4b
 *                         obj->field1c = 0x00070007
 *                         obj->field20 = 3
 *                         obj->field24 = 3 + 5 = 8
 *                         token := 0x422, descend into t_shake_ob_up
 *
 *      token == 0x422:    NewThread(obj, t_nails_blood_spawner)
 *                         obj->field48 = 0x00060010; shake_a11(obj)
 *                         obj->field1c = 0x40000
 *                         obj->field20 = 3
 *                         obj->field24 = 3
 *                         token := 0x42d, descend into t_shake_ob_up
 *
 *      token == 0x42d:    obj->field1c = 0x40000; away_x_vel(obj)
 *                         set_noedge(obj)
 *                         kill_and_stop_scrolling(obj)
 *                         obj->field1c = 0x40000
 *                         obj->field20 = 3
 *                         obj->field24 = 3 + 0x11 = 0x14
 *                         token := 0x437, descend into t_shake_ob_up
 *
 *      token == 0x437:    stop_me_player(obj)
 *                         frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **One routine descends into `t_shake_ob_up` three times and passes values from BOTH groups.**
 * The long-running question about that callee's 0x1c -- small packed pairs against large
 * 16.16-looking magnitudes -- was measured across six separate callers. This one spans the divide by
 * itself: 0x00070007 in the first descent, then 0x40000 twice.
 *
 * That kills the last version of the packed-pair reading. **A single caller would not switch
 * encodings between three consecutive calls to the same routine**, so 0x1c must be one thing that
 * accepts both, and 0x00070007 is simply a large number that happens to look like a doubled pair.
 * Nine callers measured now and the field is a plain magnitude.
 *
 * 0x20 is 3 in all three descents and 0x24 is 8, 3 and 0x14 -- so those two are stable and it was
 * only ever 0x1c that varied. The earlier notes on `t_grow_n_shake`, `t_r_head_rip` and
 * `t_eat_this_shit` are corrected by this one.
 *
 * **`t_nails_blood_spawner` is spawned here**, the ten-pairs blood loop written earlier in this
 * file that ends on the 0x16462 never-wake terminator. Another case of a spawned thread needing no
 * exit because the thread that started it does not wait for it.
 *
 * `scared_pose` and animation 0x1c4b open the reaction; `set_noedge` and
 * `kill_and_stop_scrolling` in the third state let the victim slide out of the arena while the
 * camera stays put.
 */
void scared_pose(MK3OBJ *obj);
void kill_and_stop_scrolling(MK3OBJ *obj);
long t_nails_blood_spawner(MK3THREAD *thread);

long tl_r_scared_of_mileena(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t next;

    if (token == 0x437) {
        stop_me_player(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token == 0) {
        scared_pose(obj);

        obj->field08->field2c = 0x1c4b;

        obj->field1c = 0x00070007;
        obj->field20 = 3;
        obj->field24 = 3 + 5;

        next = 0x422;

    } else if (token == 0x422) {
        NewThread(obj, (MK3THREADFUNC)t_nails_blood_spawner);

        obj->field48 = 0x00060010;
        shake_a11(obj);

        obj->field1c = 0x40000;
        obj->field20 = 3;
        obj->field24 = 3;

        next = 0x42d;

    } else if (token == 0x42d) {
        obj->field1c = 0x40000;
        away_x_vel(obj);

        set_noedge(obj);
        kill_and_stop_scrolling(obj);

        obj->field1c = 0x40000;
        obj->field20 = 3;
        obj->field24 = 3 + 0x11;

        next = 0x437;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = next;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_shake_ob_up;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ----------------------------------------------------------------------------- t_sonya_kiss
 *
 * armv7 0x00036ba4, 372 bytes.  **Complete.**
 *
 *      token == 0:        token := 0x16ac, descend into t_fatality_start_pause
 *
 *      token == 0x16ac:   obj->field40 = 2; find_ani2_part2(obj)
 *                         obj->field48 = obj->field40
 *                         obj->field30 = *(long *)obj->field40
 *                         gso_dmawnz_insobja8(obj)
 *                         obj->field40 = 2
 *                         obj->a10     = obj->field3c
 *                         get_char_ani2(obj)
 *                         token := 0x16bb, descend into t_kissani
 *
 *      token == 0x16bb:   token := 0x16bc, descend into t_kissani
 *
 *      token == 0x16bc:   token := 0x16c8, descend into t_kissani
 *
 *      token == 0x16c8:   obj->field1c = *(long *)obj->field40
 *                         if (obj->field1c != 0)
 *                             token := 0x16c8, descend into t_kissani
 *                         obj->field1c = 6; ochar_sound(obj)
 *                         StartGrObjAt((char *)obj->a10, t_kiss_orb)
 *                         token := 0x16d9, park 0x90
 *
 *      token == 0x16d9:   death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **This is `t_kissani`'s driver, and it is what that routine was written to be called from.** The
 * note there said the advanced cursor is kept in 0x48 so "the routine can be called repeatedly and
 * walk the list one word per call". Here is the caller doing exactly that -- three fixed descents
 * and then a state that keeps descending while a word reads non-zero.
 *
 * **But the termination test reads 0x40, not 0x48, and 0x40 does not advance.** `t_kissani` pushes
 * 0x40, works on 0x48, and pops 0x40 back unchanged; this routine's 0x40 was set by
 * `get_char_ani2` in state 0x16ac and nothing between the states writes it. So on the reading of
 * both functions as transcribed, state 0x16c8 either exits on its first test or never exits.
 *
 * That is a real discrepancy and it is recorded rather than smoothed over. Either one of the two
 * transcriptions has the wrong field somewhere, or something outside both routines advances 0x40.
 * Both were read from their own disassembly and both compile; whoever resolves it should re-read
 * `t_kissani` at 0x00036d18 and this state at 0x00036cca side by side.
 *
 * **Second `StartGrObjAt` site**, and it matches `t_sonya_kiss_crusher`'s exactly: an object is
 * produced by a `gso_*`/`gmo_*` insert routine, lands in `obj->field3c`, is copied to `obj->a10`,
 * and is started with a handler of its own -- `t_kiss_orb` here, `t_crusher_orb` there. Both are
 * Sonya's kiss fatalities and both build their projectile the same way.
 *
 * `find_ani2_part2` and `get_char_ani2` are both called, filling 0x48 and 0x40 with two different
 * lists -- which is what lets `t_kissani` drive a substituted part from one while the caller holds
 * the other.
 */
void gso_dmawnz_insobja8(MK3OBJ *obj);
long t_kissani(MK3THREAD *thread);
long t_kiss_orb(MK3THREAD *thread);              /* 0x00036f54 */

long t_sonya_kiss(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t next;

    if (token == 0x16d9) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token == 0) {
        *mk3_frame(thread, frame + 1) = 0x16ac;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_fatality_start_pause;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x16ac) {
        obj->field40 = 2;
        find_ani2_part2(obj);

        obj->field48 = obj->field40;
        obj->field30 = *(uint32_t *)(uintptr_t)obj->field40;

        gso_dmawnz_insobja8(obj);

        obj->field40 = 2;
        obj->a10     = obj->field3c;
        get_char_ani2(obj);

        next = 0x16bb;

    } else if (token == 0x16bb) {
        next = 0x16bc;

    } else if (token == 0x16bc) {
        next = 0x16c8;

    } else if (token == 0x16c8) {
        obj->field1c = *(uint32_t *)(uintptr_t)obj->field40;

        if (obj->field1c == 0) {
            obj->field1c = 6;
            ochar_sound(obj);

            StartGrObjAt((char *)(uintptr_t)obj->a10,
                         (MK3THREADFUNC)t_kiss_orb);

            *mk3_frame(thread, frame + 1) = 0x16d9;
            thread->fieldfc = 0x90;
            return 0x90;
        }

        next = 0x16c8;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = next;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_kissani;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ---------------------------------------------------------------------------- t_kabal_scare
 *
 * armv7 0x000340cc, 384 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xce7, descend into t_fatality_start_pause
 *
 *      token == 0xce7:    part->field2c = 0x136f
 *                         token := 0xcea, park 0x14
 *
 *      token == 0xcea:    token := 0xceb, park 0xc
 *
 *      token == 0xceb:    obj->field1c = 9; ochar_sound(obj)
 *                         token := 0xcee, park 0x28
 *
 *      token == 0xcee:    token := 0xcef, park 0x2d
 *
 *      token == 0xcef:    token := 0xcf0, park 6
 *
 *      token == 0xcf0:    obj->field1c = 9; ochar_sound(obj)
 *                         token := 0xcf5, park 0xc
 *
 *      token == 0xcf5:    obj->field38 = t_sacred_2_death
 *                         takeover_him(obj)
 *                         token := 0xcf8, park 0x7d
 *
 *      token == 0xcf8:    token := 0xcf9, park 0xc
 *
 *      token == 0xcf9:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **Nine states and six of them do nothing but wait.** One animation, two sounds, one handover and
 * a close -- the rest is 0x14, 0xc, 0x28, 0x2d, 6, 0xc, 0x7d and 0xc frames of pure timing. This is
 * the longest schedule in the file and the least busy: the whole effect is in the animation the
 * part is given in state 0xce7 and in the victim's reaction.
 *
 * **The victim gets `t_sacred_2_death`**, written earlier in this file -- which poses animation
 * 0x48, spawns `t_my_ghost` as its own thread, screams, recoils at 0x10000 and shakes. So the
 * ghost that appears is two routines removed from this schedule, and the timing here has to leave
 * room for both.
 *
 * That is a third fatality reaching `t_sacred_2_death`-shaped machinery, and the second whose
 * visible content lives entirely in routines it hands off to.
 *
 * The dispatch is three levels deep -- `ble` inside `ble`, with a `bgt` branch as well -- and `r5`
 * carries 0xcee into state 0xceb's store and 0xcf5 into state 0xcf0's, while `r1` carries 0xce7
 * into state 0's. Three tokens across two registers, each store traced back to its own load.
 *
 * Sound 9 is played twice through `ochar_sound`, sixty-one frames apart. Not a pair in the
 * back-to-back sense the rest of this file uses; two separate beats of the same noise.
 */
long t_sacred_2_death(MK3THREAD *thread);

long t_kabal_scare(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xce7) {
        obj->field08->field2c = 0x136f;

        *mk3_frame(thread, frame + 1) = 0xcea;
        thread->fieldfc = 0x14;
        return 0x14;
    }

    if (token == 0xcea) {
        *mk3_frame(thread, frame + 1) = 0xceb;
        thread->fieldfc = 0xc;
        return 0xc;
    }

    if (token == 0xceb) {
        obj->field1c = 9;
        ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0xcee;
        thread->fieldfc = 0x28;
        return 0x28;
    }

    if (token == 0xcee) {
        *mk3_frame(thread, frame + 1) = 0xcef;
        thread->fieldfc = 0x2d;
        return 0x2d;
    }

    if (token == 0xcef) {
        *mk3_frame(thread, frame + 1) = 0xcf0;
        thread->fieldfc = 6;
        return 6;
    }

    if (token == 0xcf0) {
        obj->field1c = 9;
        ochar_sound(obj);

        *mk3_frame(thread, frame + 1) = 0xcf5;
        thread->fieldfc = 0xc;
        return 0xc;
    }

    if (token == 0xcf5) {
        obj->field38 = (uint32_t)(uintptr_t)t_sacred_2_death;
        takeover_him(obj);

        *mk3_frame(thread, frame + 1) = 0xcf8;
        thread->fieldfc = 0x7d;
        return 0x7d;
    }

    if (token == 0xcf8) {
        *mk3_frame(thread, frame + 1) = 0xcf9;
        thread->fieldfc = 0xc;
        return 0xc;
    }

    if (token == 0xcf9) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xce7;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------------------------- t_sg_flesh_rip
 *
 * armv7 0x000363c8, 388 bytes.  **Complete.**
 *
 *      token == 0:        token := 0xc56, descend into t_fatality_start_pause
 *
 *      token == 0xc56:    obj->field38 = t_about_2b_ripped
 *                         takeover_him(obj)
 *                         sans_repell_for_good(obj)
 *                         obj->field40 = 3; get_char_ani2(obj)
 *                         obj->field1c = 4
 *                         token := 0xc5f, descend into t_mframew
 *
 *      token == 0xc5f:    obj->field1c = (int16_t)ochar_flesh_lineups[part->field24]
 *                         obj->field20 = 0
 *                         adjust_him_xy(obj)
 *                         make_him_face_me(obj)
 *                         token := 0xc66, park 0x20
 *
 *      token == 0xc66:    obj->field38 = t_flesh_ripped_off
 *                         takeover_him(obj)
 *                         tsound_func(obj, 0x70)
 *                         obj->field48 = 0x00050007; shake_a11(obj)
 *                         obj->field1c = 4
 *                         token := 0xc6f, descend into t_mframew
 *
 *      token == 0xc6f:    token := 0xc70, park 0x40
 *
 *      token == 0xc70:    death_blow_complete(obj)
 *                         frame[frame].handler = t_victory_animation
 *
 *      otherwise:         return -3
 *
 * **`ochar_flesh_lineups` is a fifth per-character table**, at 0x00166bb4, read with
 * `ldrsh.w [r2, r3, lsl #1]` -- signed halfwords, one per fighter, the same shape as
 * `taser_lineups`. It goes into 0x1c with 0 in 0x20 and is handed to `adjust_him_xy`, so it is how
 * far the victim has to be moved before the rip.
 *
 * Five tables found in this file now -- `ochar_reached` and `ochar_wide_adjusts` (words),
 * `taser_lineups` and this one (halfwords), and `ochar_headrip_lineups` (halfword pairs) -- and
 * none of the five was referenced anywhere in the tree before.
 *
 * **Fourth routine to use two handovers in sequence**, after `t_reptile_vomit`,
 * `t_lia_hair_spin` and `t_scorpion_fire`: the victim gets `t_about_2b_ripped` while the attacker
 * lines them up, then `t_flesh_ripped_off` -- written earlier in this file -- once the shake lands.
 *
 * That second one starts `t_ripped_skelton` on its own thread and points 0x40 at
 * `ochar_reached[char] + 0xc`, so the skeleton that appears is three routines removed from this
 * schedule.
 *
 * `adjust_him_xy` moves the OTHER fighter, where `multi_adjust_xy` and `adjust_xy_a5` move this
 * one; the "him" in the name is the whole difference and this is the second site for it after
 * `t_crush_him_more`.
 *
 * `r6` carries 0xc5f into state 0xc56's store and 0xc6f into state 0xc66's, the two-tokens-one-
 * register hazard again.
 */
extern int16_t ochar_flesh_lineups[];            /* 0x00166bb4 */
long t_about_2b_ripped(MK3THREAD *thread);       /* 0x0003a9cc */
long t_flesh_ripped_off(MK3THREAD *thread);
void make_him_face_me(MK3OBJ *obj);

long t_sg_flesh_rip(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);

    if (token == 0xc56) {
        obj->field38 = (uint32_t)(uintptr_t)t_about_2b_ripped;
        takeover_him(obj);

        sans_repell_for_good(obj);

        obj->field40 = 3;
        get_char_ani2(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xc5f;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xc5f) {
        obj->field1c = (uint32_t)(int32_t)
                           ochar_flesh_lineups[obj->field08->field24];
        obj->field20 = 0;
        adjust_him_xy(obj);

        make_him_face_me(obj);

        *mk3_frame(thread, frame + 1) = 0xc66;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0xc66) {
        obj->field38 = (uint32_t)(uintptr_t)t_flesh_ripped_off;
        takeover_him(obj);

        tsound_func(obj, 0x70);

        obj->field48 = 0x00050007;
        shake_a11(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xc6f;
        thread->frame = thread->frame + 1;           /* push a level */
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xc6f) {
        *mk3_frame(thread, frame + 1) = 0xc70;
        thread->fieldfc = 0x40;
        return 0x40;
    }

    if (token == 0xc70) {
        death_blow_complete(obj);

        return mk3_install(thread, (MK3THREADFUNC)t_victory_animation);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, frame + 1) = 0xc56;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_fatality_start_pause;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------------- t_ripped_skelton
 *
 * armv7 0x00039a34, 404 bytes.  **Complete.**
 *
 *      token == 0:        obj->field48 = &lia_ani_data[0x1540 + 0x14]
 *                         adj = ochar_skeleton_adj[part->field24]
 *                         obj->field1c = adj
 *                         PUSH adj
 *                         obj->field40 = obj->field48
 *                         find_part2(obj)
 *                         obj->field1c = part->field24
 *                         if (part->field24 == 0xb) obj->field40 += 4
 *                         obj->field40 = *(long *)obj->field40
 *                         POP  adj
 *                         obj->field1c = (int16_t)adj            ; low half, signed
 *                         obj->field20 = (int32_t)adj >> 16      ; high half, signed
 *                         multi_adjust_xy(obj)
 *                         find_last_frame(obj)
 *                         do_next_a9_frame(obj)
 *                         obj->field1c = part->field24
 *                         if (part->field24 == 0xb)
 *                             frame[frame].handler = t_wait_forever
 *                         token := 0xc3d, descend into t_skel_blood
 *
 *      token == 0xc3d:    token := 0xc3e, descend into t_skel_blood
 *      token == 0xc3e:    token := 0xc3f, descend into t_skel_blood
 *      token == 0xc3f:    token := 0xc40, descend into t_skel_blood
 *
 *      token == 0xc40:    frame[frame].handler = t_wait_forever
 *
 *      otherwise:         return -3
 *
 * **Character 0xb is special TWICE in this one routine**, and it is the second place in the tree to
 * single that fighter out. mkanimal.c's `tl_kano_spider` shifts by 0x20/0 only when the opponent's
 * number is 0xb; here 0xb makes the cursor skip one word AND makes the whole blood sequence be
 * skipped in favour of parking immediately.
 *
 * Two files, two routines, one character number treated as an exception -- so 0xb is a fighter
 * whose body does not fit the shared machinery, and any port that renumbers the roster has to carry
 * that. Worth flagging loudly; nothing else in the tree names a character by number.
 *
 * **`ochar_skeleton_adj` is a sixth per-character table** at 0x00166be4, words indexed by
 * `lsl #2`, and each entry is a PACKED PAIR of signed halfwords -- low half into 0x1c and high half
 * into 0x20 with `lsls #16; asrs #16` and `asrs #16`. That is exactly the encoding `skinny_spawn`
 * reads out of 0x48, so the same packing appears in a table and in a field.
 *
 * **Sixth use of the argument stack**, saving that packed adjustment across `find_part2` -- which
 * clobbers 0x1c. Same conflict as every other arg-stack site: one field, two callees.
 *
 * The cursor base is another unnamed sub-table, `lia_ani_data + 0x1554`, reached through pointer
 * slot 0x000f36fc. Third such site after `lao_ani_data + 0x142c` and `fn_ani_data + 0x20a4`.
 *
 * **Four consecutive descents into `t_skel_blood`**, written earlier in this file, which spawns
 * seven blood effects in three waves. Twenty-eight spawns in all, and the four states exist only to
 * repeat it -- a loop would have needed a counter, and this file prefers unrolled schedules.
 */
extern uint8_t lia_ani_data[];                   /* 0x001567a0, pointer slot 0x000f36fc */
extern uint32_t ochar_skeleton_adj[];            /* 0x00166be4 */
long t_skel_blood(MK3THREAD *thread);

long t_ripped_skelton(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t frame = thread->frame;
    uint32_t token = *mk3_frame(thread, frame + 1);
    uint32_t argc, adj, next;

    if (token == 0xc40)
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

    if (token == 0) {
        obj->field48 = (uint32_t)(uintptr_t)&lia_ani_data[0x1540 + 0x14];

        adj = ochar_skeleton_adj[obj->field08->field24];
        obj->field1c = adj;

        argc = thread->fieldf8;
        *mk3_arg(thread, argc) = adj;
        thread->fieldf8 = argc + 1;

        obj->field40 = obj->field48;
        find_part2(obj);

        obj->field1c = obj->field08->field24;
        if (obj->field08->field24 == 0xb)
            obj->field40 = obj->field40 + 4;

        obj->field40 = *(uint32_t *)(uintptr_t)obj->field40;

        argc = thread->fieldf8 - 1;
        thread->fieldf8 = argc;
        adj = *mk3_arg(thread, argc);

        obj->field1c = (uint32_t)(int32_t)(int16_t)adj;
        obj->field20 = (uint32_t)((int32_t)adj >> 16);
        multi_adjust_xy(obj);

        find_last_frame(obj);
        do_next_a9_frame(obj);

        obj->field1c = obj->field08->field24;
        if (obj->field08->field24 == 0xb)
            return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

        next = 0xc3d;

    } else if (token == 0xc3d) {
        next = 0xc3e;

    } else if (token == 0xc3e) {
        next = 0xc3f;

    } else if (token == 0xc3f) {
        next = 0xc40;

    } else {
        return -3;
    }

    *mk3_frame(thread, thread->frame + 1) = next;
    thread->frame = thread->frame + 1;               /* push a level */
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_skel_blood;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}
