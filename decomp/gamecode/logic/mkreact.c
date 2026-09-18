/*
 * mkreact.c — src/gamecode/logic/mkreact.c (reaction sequences)
 *
 * Reactions are the things that happen TO a fighter: being knocked down,
 * getting up, staggering. They are written as coroutines on the switch-stack
 * machinery that `other.c` describes — each one runs a little, records where to
 * resume, and returns to the scheduler.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against the
 * oracle: tests/test_gup2_diff.c.
 */

#include "mk3logic.h"

#define MK3_CHAR_SHAO_KAHN  0x19

void group_sound(MK3OBJ *obj);
long am_i_short(MK3OBJ *obj);
void shake_a11(MK3OBJ *obj);
void pose_a9_manual(MK3OBJ *obj);
void *FindThreadProc(uint32_t pid);
void away_x_vel(MK3OBJ *obj);
void match_ani_points_ob_ob(uint32_t a, uint32_t b);

/* gup2 was read before other.c existed, and it worked the thread struct out
 * on its own: a frame array at the head, the index at 0xa4, a word at 0xfc
 * that mirrors the return, and the object at 0x108. That is MK3THREAD field
 * for field, arrived at twice from two functions in two files without either
 * reading knowing about the other. Its local `PROC` and `SWITCHFRAME` are
 * dropped here in favour of the shared ones; the agreement is the point and
 * is recorded rather than quietly tidied away.
 *
 * Its local MK3OBJ named 0x1c, 0x40, 0x44, 0x48 and 0x5c, and the shared one
 * names all five. Only the spelling changes -- 0x44 is `a10` there. */

/* The reaction threads gup2 suspends into. Three of these are reached through
 * pointer slots in __DATA rather than directly — see the note on gup2. */
/* Declared as an array so the NAME is the address, without claiming anything
 * about what is stored there. `extern void *x` would say this is a variable
 * holding a pointer; it is code, defined for real in joy.c -- this file only
 * ever takes its address. */
extern char t_check_winner_status[];
long t_check_stay_down(struct MK3THREAD *thread);
long t_mframew(struct MK3THREAD *thread);
long t_local_reaction_exit(MK3THREAD *thread);
extern char t_d_getup[];
long t_getup_stay_ducked(MK3THREAD *thread);
long t_joy_getup_abort(MK3THREAD *thread);

/* A data table, not a resume target. */
extern char getup_speeds[];

/* Decompiled elsewhere; this file owns the sequencing, not the steps. */
void back_to_normal(MK3OBJ *obj);
long  am_i_joy(MK3OBJ *obj);
long is_stick_down(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
long next_anirate(MK3OBJ *obj);
long joystick_in_a0(MK3OBJ *obj);

long gup2(MK3THREAD *thread);


/* ------------------------------------------------------------------ gup2
 *
 * armv7 0x00044254, 368 bytes.  `_gup2` -- src/gamecode/logic/mkreact.c
 *
 * **A coroutine, not a function.** This is the get-up sequence, and it is
 * resumable: it runs a little, records where to continue, and returns. The
 * switch stack at the head of PROC is how it remembers.
 *
 *      ldr.w r2, [r0, #0xa4]        ; the stack pointer
 *      ldr.w r5, [r0, #0x108]       ; the object
 *      adds  r3, r2, #1
 *      ldr.w r0, [r0, r3, lsl #3]   ; stack[sp + 1].code
 *
 * Entries are EIGHT bytes at `proc + index * 8` -- a code and a resume
 * address -- and the stack pointer lives at `+0xa4`, which is index 20.5. So
 * the array is twenty frames at the head of PROC with the pointer just past
 * it. The same machinery `other.c` describes.
 *
 * ## The five entry codes
 *
 * `stack[sp + 1].code` selects where to resume. Anything else returns -3:
 *
 *      0        first entry
 *      0x14d9   after t_check_stay_down
 *      0x14da   after t_check_winner_status
 *      0x14fc   after the animation step
 *      0x14ff   after t_local_reaction_exit
 *
 * ## Every resume target resolves to a named thread function
 *
 * They are reached two different ways and both had to be followed:
 *
 *      ldr r2, [pc, #N] ; add r2, pc            -> the function, Thumb bit set
 *      ldr r3, [pc, #N] ; add r3, pc ; ldr r1, [r3]   -> a POINTER SLOT
 *
 * The second kind is why three of them first looked like offsets into a UTF-16
 * string blob: the PC-relative arithmetic lands on a slot in __DATA and the
 * function address is what the slot HOLDS.
 *
 *      0x000f37a8 -> _t_check_winner_status
 *      0x000f3708 -> _t_local_reaction_exit
 *      0x000f37a4 -> _t_d_getup
 *      direct     -> _t_check_stay_down, _t_getup_stay_ducked, _t_joy_getup_abort
 *
 * `_getup_speeds` is not a resume target -- it is a data table assigned to the
 * object at `+0x48` on first entry.
 *
 * ## The shared epilogue
 *
 * Three paths jump into 0x442a2 and two into 0x442e0, which are the same two
 * lines: write a resume address into one frame, then zero the code of the frame
 * above it. That zero is what makes the NEXT call take the first-entry branch,
 * so it is the sequence terminating itself rather than housekeeping.
 *
 * ## Return values
 *
 *      -3   the code in the frame is none of the five
 *       0   suspended, resume address recorded
 *       1   the animation wants another frame        (also stored at proc+0xfc)
 *       2   the sequence is finished                 (also stored at proc+0xfc)
 *
 * ## What is NOT established
 *
 * The object offsets. `+0x40` is a pointer that is dereferenced for a word,
 * `+0x44` receives a copy of it and is later compared against 0x17, `+0x1c`
 * takes an animation rate, `+0x5c` is what `is_stick_down` sets, `+0x48` takes
 * the speed table. Every one of those is a single sighting in a single
 * function, which is a hypothesis and not a field. They are named by offset.
 *
 * Verified by tests/test_gup2_diff.c: the call sequence, the frames written,
 * the stack pointer, and the return value, over every entry code and both
 * branches of each gate. The six thread functions and the seven callees are
 * stubbed identically on both sides -- their addresses are compared by
 * identity, since a host build cannot hold the binary's own code pointers.
 */
long gup2(MK3THREAD *thread)
{
    uint32_t sp   = thread->frame;              /* +0xa4 */
    MK3OBJ  *obj  = (MK3OBJ *)thread->proc;     /* +0x108 */
    uint32_t code = *mk3_frame(thread, sp + 1);
    uint32_t next;

    switch (code) {
    default:
        return -3;                              /* mvn r0, #2 */

    /* ---------------------------------------------------- first entry */
    case 0:
        obj->field48 = (uint32_t)(uintptr_t)getup_speeds;
        obj->a10 = obj->field40;

        *mk3_frame(thread, sp + 1) = 0x14d9u;
        thread->frame = sp + 1;
        mk3_frame(thread, sp + 1)[1] = (uint32_t)(uintptr_t)t_check_stay_down;
        *mk3_frame(thread, sp + 2) = 0u;
        return 0;

    /* ------------------------------------- resumed after check_stay_down */
    case 0x14d9u:
        *mk3_frame(thread, sp + 1) = 0x14dau;
        thread->frame = sp + 1;
        mk3_frame(thread, sp + 1)[1] = (uint32_t)(uintptr_t)t_check_winner_status;
        *mk3_frame(thread, sp + 2) = 0u;
        return 0;

    /* ---------------------------------- resumed after local_reaction_exit
     *
     * Joins the epilogue above at 0x442a2, but with r2 still holding the
     * stack pointer from ENTRY rather than the incremented one -- so this
     * path writes into frame `sp` and does not advance. Reading the shared
     * tail without tracking which value of r2 reached it would put the resume
     * address one frame too high. */
    case 0x14ffu:
        mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_local_reaction_exit;
        *mk3_frame(thread, sp + 1) = 0u;
        return 0;

    /* ------------------------------------ resumed after check_winner_status */
    case 0x14dau:
        back_to_normal(obj);
        if (am_i_joy(obj) == 0) {
            mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_d_getup;
            *mk3_frame(thread, sp + 1) = 0u;
            return 0;
        }
        goto joystick_path;

    /* ------------------------------------------ resumed mid-animation */
    case 0x14fcu:
        next_anirate(obj);
        goto after_anirate;
    }

joystick_path:
    is_stick_down(obj);
    if (obj->field5c != 0) {
        mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_getup_stay_ducked;
        *mk3_frame(thread, sp + 1) = 0u;
        return 0;
    }

    get_char_ani(obj);
    obj->field1c = 4;
    init_anirate(obj);
    next_anirate(obj);

after_anirate:
    /* 0x40 holds the animation cursor; the shared struct types it as a
     * word, so the dereference is spelled out. */
    next = *(const uint32_t *)(uintptr_t)obj->field40;
    obj->field1c = next;

    if (next == 0u) {
        /* the animation is done */
        *mk3_frame(thread, sp + 1) = 0x14ffu;
        thread->fieldfc            = 2;
        return 2;
    }

    if ((uintptr_t)obj->a10 != 0x17u) {
        is_stick_down(obj);
        if (obj->field5c != 0) {
            mk3_frame(thread, sp)[1] = (uint32_t)(uintptr_t)t_joy_getup_abort;
            *mk3_frame(thread, sp + 1) = 0u;
            return 0;
        }
        joystick_in_a0(obj);
    }

    *mk3_frame(thread, sp + 1) = 0x14fcu;
    thread->fieldfc            = 1;
    return 1;
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_avoid_corner_trap(struct MK3THREAD *thread);
long t_avoid_corner_trap_b(struct MK3THREAD *thread);
long t_b_hard(struct MK3THREAD *thread);
long t_block2(struct MK3THREAD *thread);
long t_block_shake_n_exit(struct MK3THREAD *thread);
long t_r_boss_hit1(struct MK3THREAD *thread);
long t_r_kano_swipe(struct MK3THREAD *thread);
long t_r_last_noogy(struct MK3THREAD *thread);
long t_r_lia_zap(struct MK3THREAD *thread);
long t_r_rocket(struct MK3THREAD *thread);
long t_r_sw_zap(struct MK3THREAD *thread);
long t_spear0(struct MK3THREAD *thread);
long t_stumble_back_vel(struct MK3THREAD *thread);
long t_zap_stumble(struct MK3THREAD *thread);

/* t_r_smoke_spear -- armv7 0x000411c4, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1f
 *      frame[frame].handler = t_spear0
 *      frame[frame+1].w0 = 0
 */

long t_r_smoke_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1f;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_spear0);
}

/* t_r_scorpion_spear -- armv7 0x00041200, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x11
 *      frame[frame].handler = t_spear0
 *      frame[frame+1].w0 = 0
 */

long t_r_scorpion_spear(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x11;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_spear0);
}

/* t_r_sk_punch -- armv7 0x000413dc, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_boss_hit1
 *      frame[frame+1].w0 = 0
 */

long t_r_sk_punch(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_boss_hit1);
}

/* t_r_angle_kick -- armv7 0x0004154c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_last_noogy
 *      frame[frame+1].w0 = 0
 */

long t_r_angle_kick(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_last_noogy);
}

/* t_r_axe_horz -- armv7 0x00041590, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_kano_swipe
 *      frame[frame+1].w0 = 0
 */

long t_r_axe_horz(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_kano_swipe);
}

/* t_cc_block_avoid_corner -- armv7 0x00041644, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x1
 *      frame[frame].handler = t_avoid_corner_trap_b
 *      frame[frame+1].w0 = 0
 */

long t_cc_block_avoid_corner(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap_b);
}

/* t_cc_ken_masters -- armv7 0x00041680, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0x1
 *      frame[frame].handler = t_avoid_corner_trap
 *      frame[frame+1].w0 = 0
 */

long t_cc_ken_masters(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0x1;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap);
}

/* t_cc_block_upcut -- armv7 0x000416bc, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field20 = 0   (the register the guard proved)
 *      frame[frame].handler = t_avoid_corner_trap
 *      frame[frame+1].w0 = 0
 */

long t_cc_block_upcut(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field20 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_avoid_corner_trap);
}

/* t_r_skull -- armv7 0x00041800, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_skull(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_ermac_zap -- armv7 0x00041834, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_ermac_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_swat_bomb -- armv7 0x00041868, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_rocket
 *      frame[frame+1].w0 = 0
 */

long t_r_swat_bomb(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_rocket);
}

/* t_r_ind_zap -- armv7 0x0004189c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_lia_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_ind_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_lia_zap);
}

/* t_r_lia_zap -- armv7 0x000418d0, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_r_sw_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_lia_zap(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_sw_zap);
}

/* t_stumble_back -- armv7 0x00041a78, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x30000
 *      frame[frame].handler = t_stumble_back_vel
 *      frame[frame+1].w0 = 0
 */

long t_stumble_back(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x30000;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stumble_back_vel);
}

/* t_b_scream -- armv7 0x00041b0c, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_b_hard
 *      frame[frame+1].w0 = 0
 */

long t_b_scream(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_hard);
}

/* t_b_hard_silent -- armv7 0x00041b40, 56 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field38 = 0   (the register the guard proved)
 *      frame[frame].handler = t_block2
 *      frame[frame+1].w0 = 0
 */

long t_b_hard_silent(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = 0;   /* the guard proved this register */

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block2);
}

/* t_weak3 -- armv7 0x00041dc4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x2
 *      obj->a10 = 0x3
 *      frame[frame].handler = t_block_shake_n_exit
 *      frame[frame+1].w0 = 0
 */

long t_weak3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x2;
    obj->a10 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}

/* t_getup_reaction_exit -- armv7 0x00041f8c, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0x21
 *      frame[frame].handler = gup2
 *      frame[frame+1].w0 = 0
 */

long t_getup_reaction_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0x21;

    return mk3_push_handler(thread, (MK3THREADFUNC)gup2);
}

/* t_sweepup_local_reaction_exit -- armv7 0x00041fc8, 60 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field40 = 0x22
 *      frame[frame].handler = gup2
 *      frame[frame+1].w0 = 0
 */

long t_sweepup_local_reaction_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field40 = 0x22;

    return mk3_push_handler(thread, (MK3THREADFUNC)gup2);
}


/* ---------------------------------------------------------------- inc_p_hit
 *
 * armv7 0x00041ab4, twelve bytes.  **Complete.**
 *
 *      n = obj->field00->p_hit + 1
 *      obj->field1c = n
 *      obj->field00->p_hit = n
 *
 * The hit counter `back_to_normal_px` reads to decide whether a combo
 * happened, and `t_gravity_ani` clears on landing. Both stores come from one
 * register, so the caller sees the new value in 0x1c without a second load.
 */
void inc_p_hit(MK3OBJ *obj)
{
    MK3OBJPROC *proc = obj->field00;
    uint32_t n = proc->p_hit + 1;

    obj->field1c = n;
    proc->p_hit = n;
}


/* -------------------------------------------------------------- inc_p_block
 *
 * armv7 0x00041580, sixteen bytes.  **Complete.**
 *
 *      obj->field00->field4c += 1
 *      obj->field1c = obj->field00->field4c
 *
 * `inc_p_hit`'s twin for blocks, at 0x4c of the PROC -- one of the six words
 * `back_to_normal_px` clears when a fighter goes back to normal. So a block
 * count and a hit count sit side by side and are reset together.
 *
 * Unlike its twin this one RE-READS the field for the copy rather than reusing
 * the register, which is four bytes more and the same answer.
 */
void inc_p_block(MK3OBJ *obj)
{
    uint32_t *n = (uint32_t *)((char *)obj->field00 + 0x4c);

    *n = *n + 1;
    obj->field1c = *(const uint32_t *)((char *)obj->field00 + 0x4c);
}


/* -------------------------------------------------------- if_shao_then_pass
 *
 * armv7 0x00041354, sixteen bytes.  **Complete**, and it names a character.
 *
 *      c = obj->field08->field24
 *      obj->field1c = c
 *      if (c == 0x19) obj->field34 = 0
 *
 * **Character 0x19 is Shao Kahn.** The function's name says so and its body
 * tests that one number -- the same way `t_back_to_shang_form` established
 * 0xc for Shang Tsung. Read off the symbol table rather than guessed from the
 * roster, which is the only way this project will name a character.
 *
 * 0x19 is also one of the three ids `is_finish_him_allowed` refuses, so the
 * two readings agree: the character with no finisher is the boss.
 *
 * The zero is formed as `c - 0x19`, which is zero exactly because the branch
 * that reaches it tested for equality. One register, no constant.
 */
void if_shao_then_pass(MK3OBJ *obj)
{
    uint32_t c = obj->field08->field24;

    obj->field1c = c;
    if (c == MK3_CHAR_SHAO_KAHN)
        obj->field34 = 0;               /* formed as c - 0x19 */
}


/* -------------------------------------------------------- rsnd_react_voice
 *
 * armv7 0x000420e4, sixteen bytes.  **Complete.**
 *
 *      obj->field1c = 6
 *      group_sound(obj)
 *
 * Group six is the reaction voice. `t_do_jump_up` uses group 1 the same way,
 * so 0x1c is which group and `group_sound` picks from it.
 */
void rsnd_react_voice(MK3OBJ *obj)
{
    obj->field1c = 6;
    group_sound(obj);
}


/* -------------------------------------------------------- tall_or_short_ani
 *
 * armv7 0x00044820, twenty bytes.  **Complete.**
 *
 *      am_i_short(obj)
 *      if (obj->field5c != 0) obj->field40 = obj->field30
 *
 * Two animations for one reaction, chosen by height: a short character takes
 * the one parked in 0x30 and everybody else keeps whatever 0x40 already held.
 * So the caller sets both and this picks, which is why the tall case has no
 * store at all.
 */
void tall_or_short_ani(MK3OBJ *obj)
{
    am_i_short(obj);
    if (obj->field5c != 0)
        obj->field40 = obj->field30;
}


/* --------------------------------------------------- at_least_ground_level
 *
 * armv7 0x000410e0, twenty-four bytes.  **Complete.**
 *
 *      y = (int16_t)obj->field08->field12
 *      obj->field1c = y
 *      g = obj->field00->field40
 *      obj->field20 = g
 *      if (g < y) obj->field08->field12 = g
 *
 * The clamp `t_flight_call` ends on, on its own: if the ground is above y the
 * fighter has sunk through the floor and is put back on it. `strh` under `lt`,
 * so it only ever moves upward and never off the floor.
 *
 * Both numbers are left behind, in 0x1c and 0x20, whether or not the clamp
 * fired -- so a caller can see how far under he was.
 */
void at_least_ground_level(MK3OBJ *obj)
{
    int32_t y = (int32_t)(int16_t)MK3_FIELD12(obj->field08);
    int32_t g = (int32_t)obj->field00->field40;

    obj->field1c = (uint32_t)y;
    obj->field20 = (uint32_t)g;

    if (g < y)
        MK3_SET_FIELD12(obj->field08, (uint32_t)g);
}


/* ------------------------------------------------------------ is_he_flipped
 *
 * armv7 0x000410f8, twenty-four bytes.  **Complete.**
 *
 *      f = him->field28
 *      obj->field2c = f
 *      obj->field5c = ((f >> 4) ^ 1) & 1
 *
 * Bit 4 of 0x28 is the facing `am_i_facing_him_px` gave a direction to: set
 * means facing left. So "flipped" is its complement, and this answers 1 when
 * he faces right.
 *
 * The whole flag word is left in 0x2c on the way past, which is how a caller
 * gets at the other bits without a second load.
 */
void is_he_flipped(MK3OBJ *obj)
{
    uint32_t f = ((MK3OBJ *)(uintptr_t)obj->field00->him)->field28;

    obj->field2c = f;
    obj->field5c = ((f >> 4) ^ 1u) & 1u;
}


/* ----------------------------------------------------------- move_slave_too
 *
 * armv7 0x0004761c, twenty-four bytes.  **Complete.**
 *
 *      s = obj->field00->slave
 *      obj->field1c = s
 *      if (s != 0) match_ani_points_ob_ob(obj->field08, s)
 *
 * Whatever just moved the fighter, the slave follows. The PROC's 0x68 is the
 * slave object `slave_ani` drives and the opcode-11 arm of the animation
 * interpreter creates; a zero there means there is none and the call is
 * skipped.
 */
void move_slave_too(MK3OBJ *obj)
{
    uint32_t s = obj->field00->slave;

    obj->field1c = s;
    if (s != 0)
        match_ani_points_ob_ob((uint32_t)(uintptr_t)obj->field08, s);
}


/* --------------------------------------------------------------- combo_setup
 *
 * armv7 0x000424e0, twenty-eight bytes.  **Complete.**
 *
 *      obj->field1c = 2
 *      group_sound(obj)
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *
 * **The shake's two amplitudes are one word.** 0x60006 is 6 in each half, and
 * `t_shake2` splits exactly that slot -- the low half into the animation at
 * 0x40 and the high half into the A10 -- which `t_shake3` then uses as the
 * horizontal and vertical displacement. One `mov.w` and the screen shakes six
 * each way.
 *
 * Sound group 2 first, so the noise starts on the same tick as the shake.
 */
void combo_setup(MK3OBJ *obj)
{
    obj->field1c = 2;
    group_sound(obj);

    obj->field48 = 0x60006;             /* six each way, packed */
    shake_a11(obj);
}


/* -------------------------------------------------- pose_stumble_frame_1
 *
 * armv7 0x00047ad8, twenty-eight bytes.  **Complete.**
 *
 *      obj->field40 = 0x20
 *      pose_a9_manual(obj)
 *      obj->field1c = 2
 *      group_sound(obj)
 *
 * Animation 0x20 posed by hand rather than run, then the same sound group 2
 * `combo_setup` uses. The pose comes first, so the frame is on screen before
 * the noise.
 */
void pose_stumble_frame_1(MK3OBJ *obj)
{
    obj->field40 = 0x20;
    pose_a9_manual(obj);

    obj->field1c = 2;
    group_sound(obj);
}


/* -------------------------------------------------------------- shake_n_sound
 *
 * armv7 0x000424fc, twenty-eight bytes.  **Complete.**
 *
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *      rsnd_func(obj, 0xd)
 *
 * `combo_setup` without the group sound and with a single effect instead: the
 * same 0x60006 -- six each way, packed as two halves of one word -- and then
 * sound 0xd directly rather than through a group.
 */
void shake_n_sound(MK3OBJ *obj)
{
    obj->field48 = 0x60006;             /* six each way, packed */
    shake_a11(obj);
    rsnd_func(obj, 0xd);
}


/* ---------------------------------------------------------- get_his_floor_ice
 *
 * armv7 0x000495cc, thirty-two bytes.  **Complete.**
 *
 *      i = obj->field00->field00->field00->field08
 *      obj->field1c = i + 0x707
 *      obj->field1c = FindThreadProc(i + 0x707)
 *
 * **A pid is a base plus the fighter's index.** `FindThreadProc` walks the
 * thread list comparing 0x104, and what it is given here is 0x707 plus the
 * opponent's index -- so a thread of this kind is registered under a
 * predictable number and found by arithmetic rather than by being remembered.
 *
 * The pid is left in 0x1c and then overwritten by the answer, so a caller sees
 * the proc and not the number it was found by.
 */
void get_his_floor_ice(MK3OBJ *obj)
{
    uint32_t pid = obj->field00->field00->field00->field08 + 0x707;

    obj->field1c = pid;
    obj->field1c = (uint32_t)(uintptr_t)FindThreadProc(pid);
}


/* ------------------------------------------------------------- get_my_hitq
 *
 * armv7 0x00041ac0, thirty-two bytes.  **Complete.**
 *
 *      obj->field1c = G + 0x390 + obj->field00->field08 * 12
 *
 * A per-fighter array in G with a stride of TWELVE -- a sixth layout in that
 * struct, after the 0x158 blocks, the four-byte bar pairs, the three clock
 * halfwords, the four queues at 0xc0 and the four tables at 0x3a8.
 *
 * `uhq_entry` says what twelve bytes are for: six halfwords. The stride is the
 * size, so each fighter's queue is its own array rather than a window on a
 * longer one.
 *
 * The multiply is `i*16 - i*4`, which is the compiler's way of reaching twelve
 * without a multiply instruction.
 */
void get_my_hitq(MK3OBJ *obj)
{
    uint32_t i = obj->field00->field08;

    obj->field1c = (uint32_t)(uintptr_t)(G_BYTES + 0x390 + i * 12);
}


/* --------------------------------------------------------------- uhq_entry
 *
 * armv7 0x00041ae0, forty-four bytes.  **Complete.**
 *
 *      obj->field38 = obj->field00->field48
 *      get_my_hitq(obj)
 *      q = (uint16_t *)obj->field1c
 *      q[5] = q[4];  q[4] = q[3];  q[3] = q[2]
 *      q[2] = q[1];  q[1] = q[0]
 *      q[0] = (uint16_t)obj->field38
 *
 * The hit queue's push, written out: five moves down and one write at the
 * front, unrolled rather than looped. Six halfwords, oldest at the end, and
 * the sixth falls off.
 *
 * What goes in is the PROC's 0x48. `back_to_normal_px` clears that slot along
 * with the hit and block counters, so it is part of the same bookkeeping -- a
 * record of what has been landing, one entry per hit.
 *
 * The moves run high to low, which is the only order that does not overwrite
 * an entry before it has been copied.
 */
void uhq_entry(MK3OBJ *obj)
{
    uint16_t *q;

    obj->field38 = *(const uint32_t *)((char *)obj->field00 + 0x48);

    get_my_hitq(obj);
    q = (uint16_t *)(uintptr_t)obj->field1c;

    q[5] = q[4];                        /* high to low, or it eats itself */
    q[4] = q[3];
    q[3] = q[2];
    q[2] = q[1];
    q[1] = q[0];
    q[0] = (uint16_t)obj->field38;
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_wait_forever(struct MK3THREAD *thread);

/* t_r_dummy -- armv7 0x00041110, 52 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      frame[frame].handler = t_wait_forever
 *      frame[frame+1].w0 = 0
 */

long t_r_dummy(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_wait_forever);
}


/* ------------------------------------------------------ get_block_ani_offset
 *
 * armv7 0x00044834, forty-eight bytes.  **Complete.**
 *
 *      obj->field40 = 0xc
 *      obj->field30 = 6
 *      c = obj->field08->field24
 *      obj->field1c = c
 *      if (c == 0xb) {
 *          a = obj->field08->field2c
 *          obj->field1c = a
 *          if ((uint32_t)(a - 0x1e3) <= 2) obj->field40 = 6
 *      }
 *      tall_or_short_ani(obj)
 *
 * Which animation a block uses. Everyone gets 0xc, with 6 parked in 0x30 as
 * the short-character alternative -- `tall_or_short_ani` is what chooses
 * between them, and it runs on every path.
 *
 * **One character is different.** When the character is 0xb and its current
 * animation is one of three consecutive numbers -- 0x1e3, 0x1e4, 0x1e5 --
 * the tall animation becomes 6 as well, so both branches of the height test
 * lead to the same frame.
 *
 * The range is tested as `(a - 0x1e3) <= 2` UNSIGNED, which rejects anything
 * below 0x1e3 by wrapping. One comparison for three values, and a signed test
 * would have needed two.
 *
 * The two constants are loaded once and 6 stays in its register across the
 * whole function, which is why the second store to 0x40 has no `movs` in
 * front of it.
 */
void get_block_ani_offset(MK3OBJ *obj)
{
    uint32_t c;

    obj->field40 = 0xc;
    obj->field30 = 6;                   /* the short-character alternative */

    c = obj->field08->field24;
    obj->field1c = c;

    if (c == 0xb) {
        uint32_t a = obj->field08->field2c;

        obj->field1c = a;
        if ((uint32_t)(a - 0x1e3) <= 2)         /* 0x1e3, 0x1e4 or 0x1e5 */
            obj->field40 = 6;
    }

    tall_or_short_ani(obj);
}


/* --------------------------------------------------------- repell_one_of_us
 *
 * armv7 0x000432b8, sixty-four bytes.  **Complete.**
 *
 *      am_i_close_to_edge(obj)
 *      if (obj->field5c == 0) { away_x_vel(obj); return; }
 *      if (obj->field38 != 0) {
 *          s1 = obj->field1c; s2 = obj->field20
 *          takeover_him(obj)
 *          obj->field1c = s1; obj->field20 = s2
 *      }
 *      obj->field1c = obj->field20
 *      call_for_him(obj, away_x_vel)
 *
 * Two fighters cannot occupy the same ground, and one of them has to give.
 * Away from the edge, this one moves itself. Against it, HE moves instead --
 * `call_for_him` runs `away_x_vel` on the other fighter, which is the same
 * routine pointed the other way.
 *
 * The name says "one of us" and the body says which: whoever is not cornered.
 *
 * `takeover_him` runs first when 0x38 is set, with 0x1c and 0x20 saved and put
 * back around it -- the borrow-and-restore this directory does everywhere, here
 * protecting two slots the callee is known to use.
 *
 * `away_x_vel` arrives through a pointer slot even though the other branch
 * calls it directly four instructions earlier. One function, one routine, two
 * ways of naming it -- because a direct call is a `bl` and a pointer handed to
 * `call_for_him` has to be an address.
 */
void am_i_close_to_edge(MK3OBJ *obj);
void takeover_him(MK3OBJ *obj);
void call_for_him(MK3OBJ *obj, void (*what)(MK3OBJ *));

void repell_one_of_us(MK3OBJ *obj)
{
    am_i_close_to_edge(obj);

    if (obj->field5c == 0) {            /* room to move: move myself */
        away_x_vel(obj);
        return;
    }

    if (obj->field38 != 0) {
        uint32_t s1 = obj->field1c;
        uint32_t s2 = obj->field20;

        takeover_him(obj);
        obj->field1c = s1;
        obj->field20 = s2;
    }

    obj->field1c = obj->field20;
    call_for_him(obj, away_x_vel);      /* cornered: he moves */
}


/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_ccp3(struct MK3THREAD *thread);

/* t_cc_hi_punch -- armv7 0x000415c4, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field30 = 0x6
 *      obj->field34 = 0x4
 *      frame[frame].handler = t_ccp3
 *      frame[frame+1].w0 = 0
 */

long t_cc_hi_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field30 = 0x6;
    obj->field34 = 0x4;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_ccp3);
}

/* t_cc_lo_punch -- armv7 0x00041604, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field30 = 0x5
 *      obj->field34 = 0x3
 *      frame[frame].handler = t_ccp3
 *      frame[frame+1].w0 = 0
 */

long t_cc_lo_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field30 = 0x5;
    obj->field34 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_ccp3);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
 * -------------------------------------------------------------------- */

long t_airborn_hit_no_sound(struct MK3THREAD *thread);
long t_b_combo(struct MK3THREAD *thread);
long t_b_weak_silent(struct MK3THREAD *thread);
long t_combo43(struct MK3THREAD *thread);
long t_fall_on_my_back(struct MK3THREAD *thread);
long t_joy_down(struct MK3THREAD *thread);
long t_joy_getup_entry(struct MK3THREAD *thread);
long t_ken_masters_xfer(struct MK3THREAD *thread);
long t_r_freeze(struct MK3THREAD *thread);
long t_rek3(struct MK3THREAD *thread);
long t_rup3(struct MK3THREAD *thread);
long am_i_airborn(MK3OBJ *obj);
long create_blood_proc(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);
void find_last_frame(MK3OBJ *obj);
long do_next_a9_frame(MK3OBJ *obj);
void find_ani_last_frame(MK3OBJ *obj);
void get_his_action(MK3OBJ *obj);
void his_ochar_sound(MK3OBJ *obj);
void ochar_sound_c(MK3OBJ *obj, uint32_t arg);
void set_half_damage(MK3OBJ *obj);

/* t_r_lk_zap -- armv7 0x00042190, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      group_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_lk_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_pit_abort -- armv7 0x000421d4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      group_sound(obj)
 *      frame[frame].handler = t_rup3
 *      frame[frame+1].w0 = 0
 */

long t_pit_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    group_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rup3);
}

/* t_b_knee_elbow -- armv7 0x00042310, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x40004
 *      shake_a11(obj)
 *      frame[frame].handler = t_b_combo
 *      frame[frame+1].w0 = 0
 */

long t_b_knee_elbow(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x40004;
    shake_a11(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_combo);
}

/* t_r_rocket -- armv7 0x00042400, 72 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x60006
 *      shake_a11(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_rocket(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x60006;
    shake_a11(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_b_weak -- armv7 0x00042778, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x6)
 *      frame[frame].handler = t_b_weak_silent
 *      frame[frame+1].w0 = 0
 */

long t_b_weak(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x6);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_weak_silent);
}

/* t_b_hard_ken_masters -- armv7 0x000427bc, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x5)
 *      obj->field38 = t_cc_block_avoid_corner
 *      frame[frame].handler = t_block2
 *      frame[frame+1].w0 = 0
 */

long t_b_hard_ken_masters(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x5);
    obj->field38 = (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block2);
}

/* t_b_hard -- armv7 0x0004280c, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x5)
 *      frame[frame].handler = t_b_hard_silent
 *      frame[frame+1].w0 = 0
 */

long t_b_hard(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x5);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_b_hard_silent);
}

/* t_generic_airborn_hit -- armv7 0x00042850, 76 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x8)
 *      rsnd_react_voice(obj)
 *      frame[frame].handler = t_airborn_hit_no_sound
 *      frame[frame+1].w0 = 0
 */

long t_generic_airborn_hit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x8);
    rsnd_react_voice(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_airborn_hit_no_sound);
}

/* t_r_elbow_knee -- armv7 0x00042ed4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      rsnd_func(obj, 0x8)
 *      frame[frame].handler = t_rek3
 *      frame[frame+1].w0 = 0
 */

long t_r_elbow_knee(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    rsnd_func(obj, 0x8);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_rek3);
}

/* t_separate_us -- armv7 0x00043250, 104 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      am_i_close_to_edge(obj)
 *      obj->field1c = 0x30000
 *      obj->field38 = t_ken_masters_xfer
 *      takeover_him(obj)
 *      frame[frame].handler = t_stumble_back_vel
 *      frame[frame+1].w0 = 0
 */

long t_separate_us(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_close_to_edge(obj);
    obj->field1c = 0x30000;
    obj->field38 = (uint32_t)(uintptr_t)t_ken_masters_xfer;
    takeover_him(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_stumble_back_vel);
}

/* t_block3 -- armv7 0x00043698, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field48 = 0x40004
 *      shake_a11(obj)
 *      obj->field1c = 0x20000
 *      away_x_vel(obj)
 *      obj->field48 = 0x2
 *      obj->a10 = 0x3
 *      frame[frame].handler = t_block_shake_n_exit
 *      frame[frame+1].w0 = 0
 */

long t_block3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field48 = 0x40004;
    shake_a11(obj);
    obj->field1c = 0x20000;
    away_x_vel(obj);
    obj->field48 = 0x2;
    obj->a10 = 0x3;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}

/* t_joy_getup_abort -- armv7 0x000443c4, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      player_normpal(obj)
 *      frame[frame].handler = t_joy_down
 *      frame[frame+1].w0 = 0
 */

long t_joy_getup_abort(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    player_normpal(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_down);
}

/* t_getup_stay_ducked -- armv7 0x00044408, 84 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      back_to_normal(obj)
 *      obj->field40 = 0x4
 *      find_ani_last_frame(obj)
 *      do_next_a9_frame(obj)
 *      frame[frame].handler = t_joy_getup_entry
 *      frame[frame+1].w0 = 0
 */

long t_getup_stay_ducked(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    back_to_normal(obj);
    obj->field40 = 0x4;
    find_ani_last_frame(obj);
    do_next_a9_frame(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_joy_getup_entry);
}

/* t_r_boss_hit1 -- armv7 0x00045230, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x4
 *      create_blood_proc(obj)
 *      obj->field1c = 0x1
 *      create_blood_proc(obj)
 *      frame[frame].handler = t_combo43
 *      frame[frame+1].w0 = 0
 */

long t_r_boss_hit1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x4;
    create_blood_proc(obj);
    obj->field1c = 0x1;
    create_blood_proc(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo43);
}

/* t_r_bike_kicked_done -- armv7 0x000461ac, 92 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      am_i_airborn(obj)
 *      obj->field1c = 0   (the register the guard proved)
 *      obj->field24 = 0x6000
 *      obj->field20 = 0   (the register the guard proved)
 *      obj->field28 = 0x5
 *      frame[frame].handler = t_fall_on_my_back
 *      frame[frame+1].w0 = 0
 */

long t_r_bike_kicked_done(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_airborn(obj);
    obj->field1c = 0;   /* the guard proved this register */
    obj->field24 = 0x6000;
    obj->field20 = 0;   /* the guard proved this register */
    obj->field28 = 0x5;

    return mk3_push_handler(thread, (MK3THREADFUNC)t_fall_on_my_back);
}

/* t_r_decoy_freeze -- armv7 0x00046208, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x3
 *      create_fx(obj)
 *      obj->field1c = 0x5
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_r_freeze
 *      frame[frame+1].w0 = 0
 */

long t_r_decoy_freeze(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x3;
    create_fx(obj);
    obj->field1c = 0x5;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_freeze);
}

/* t_r_sonya_zap -- armv7 0x00046258, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x1
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_r_ermac_zap
 *      frame[frame+1].w0 = 0
 */

long t_r_sonya_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x1;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_r_ermac_zap);
}

/* t_r_sg_zap -- armv7 0x0004629c, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_sg_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_kano_zap -- armv7 0x000462e0, 68 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x2
 *      his_ochar_sound(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_kano_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x2;
    his_ochar_sound(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_mileena_zap -- armv7 0x00046710, 80 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      obj->field1c = 0x9
 *      ochar_sound_c(obj, 0x11)
 *      set_half_damage(obj)
 *      frame[frame].handler = t_zap_stumble
 *      frame[frame+1].w0 = 0
 */

long t_r_mileena_zap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x9;
    ochar_sound_c(obj, 0x11);
    set_half_damage(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_zap_stumble);
}

/* t_r_combo4 -- armv7 0x00046808, 64 bytes.  **Complete.**
 *
 *      if (frame[frame+1].w0 != 0) return -3
 *      set_half_damage(obj)
 *      frame[frame].handler = t_combo43
 *      frame[frame+1].w0 = 0
 */

long t_r_combo4(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    set_half_damage(obj);

    return mk3_push_handler(thread, (MK3THREADFUNC)t_combo43);
}





/* --------------------------------------------------------------------
 * What the readers could prove. See tools/pushfn.py, which executes
 * a body symbolically, and tools/microfn.py, which matches whole
 * bodies against templates. Both refuse anything they cannot account
 * for instruction by instruction.
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

long t_local_reaction_exit(MK3THREAD *thread);
long t_net_struggle(MK3THREAD *thread);
long t_rhat_wake(MK3THREAD *thread);
long t_suspend_wait_action_jsrp(MK3THREAD *thread);
long t_suspend_wait_wake(MK3THREAD *thread);

/* t_r_bike_kicked -- armv7 0x000412bc, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x4be, duration 0x80)
 *      token == 0x4be:
 *          frame[frame].handler = t_r_bike_kicked_done
 *      otherwise:  return -3
 */
long t_r_bike_kicked(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x4be;
        thread->fieldfc = 0x80;
        return 0x80;
    }

    if (token != 0x4be)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_r_bike_kicked_done);
}

/* t_net_sleep -- armv7 0x00041308, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x4cd, duration 0x1)
 *      token == 0x4cd:
 *          frame[frame].handler = t_net_struggle
 *      otherwise:  return -3
 */
long t_net_sleep(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x4cd;
        thread->fieldfc = 0x1;
        return 0x1;
    }

    if (token != 0x4cd)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_net_struggle);
}

/* t_r_airborn_duck_kick -- armv7 0x000416f4, 120 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field20 = 0x1
 *          token := 0x1067, then descend into t_avoid_corner_trap
 *      token == 0x1067:
 *          frame[frame].handler = t_generic_airborn_hit
 *      otherwise:  return -3
 */
long t_r_airborn_duck_kick(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field20 = 0x1;
        *mk3_frame(thread, thread->frame + 1) = 0x1067;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_avoid_corner_trap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1067)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_generic_airborn_hit);
}

/* t_rhat_sleep -- armv7 0x00041a2c, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x11ea, duration 0x1)
 *      token == 0x11ea:
 *          frame[frame].handler = t_rhat_wake
 *      otherwise:  return -3
 */
long t_rhat_sleep(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x11ea;
        thread->fieldfc = 0x1;
        return 0x1;
    }

    if (token != 0x11ea)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_rhat_wake);
}

/* t_susp3 -- armv7 0x00041e48, 76 bytes.  **Complete.**
 *
 *      token == 0:
 *          park(token 0x1453, duration 0x2)
 *      token == 0x1453:
 *          frame[frame].handler = t_suspend_wait_wake
 *      otherwise:  return -3
 */
long t_susp3(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1453;
        thread->fieldfc = 0x2;
        return 0x2;
    }

    if (token != 0x1453)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_suspend_wait_wake);
}

/* t_suspend_wait_action -- armv7 0x00041e94, 104 bytes.  **Complete.**
 *
 *      token == 0:
 *          token := 0x145c, then descend into t_suspend_wait_action_jsrp
 *      token == 0x145c:
 *          frame[frame].handler = t_local_reaction_exit
 *      otherwise:  return -3
 */
long t_suspend_wait_action(MK3THREAD *thread)
{
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x145c;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_suspend_wait_action_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x145c)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_block_exit(MK3THREAD *thread);
long t_block_shake(MK3THREAD *thread);

/* t_block_shake_n_exit -- armv7 0x00044864, 120 bytes.  **Complete.**
 *
 *      token == 0:
 *          get_block_ani_offset(obj)
 *          token := 0x13eb, then descend into t_block_shake
 *      token == 0x13eb:
 *          frame[frame].handler = t_block_exit
 *      otherwise:  return -3
 */
long t_block_shake_n_exit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        get_block_ani_offset(obj);
        *mk3_frame(thread, thread->frame + 1) = 0x13eb;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_block_shake;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13eb)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_block_exit);
}

/* --------------------------------------------------------------------
 * Added by a later sweep -- tools/sweep.py, running the same
 * readers again after one of them learned something. Each still
 * refuses anything it cannot account for instruction by
 * instruction; see tools/pushfn.py and tools/leaffn.py.
 * -------------------------------------------------------------------- */

long t_flight(MK3THREAD *thread);
long t_land_on_my_back(MK3THREAD *thread);
long t_reaction_land(MK3THREAD *thread);

/* t_airborn_hit_no_sound -- armv7 0x0004176c, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x38000
 *          obj->field20 = 0xfffa0000
 *          obj->field24 = 0x8000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x1073, then descend into t_flight
 *      token == 0x1073:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_airborn_hit_no_sound(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x38000;
        obj->field20 = 0xfffa0000;
        obj->field24 = 0x8000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x1073;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1073)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_r_post_shake -- armv7 0x00041904, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x40000
 *          obj->field20 = 0xfffc0000
 *          obj->field24 = 0x8000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x113b, then descend into t_flight
 *      token == 0x113b:
 *          frame[frame].handler = t_reaction_land
 *      otherwise:  return -3
 */
long t_r_post_shake(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x40000;
        obj->field20 = 0xfffc0000;
        obj->field24 = 0x8000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x113b;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x113b)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_reaction_land);
}

/* t_r_post_bike -- armv7 0x00041998, 148 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x40000
 *          obj->field20 = 0xfffa0000
 *          obj->field24 = 0xa000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x1145, then descend into t_flight
 *      token == 0x1145:
 *          frame[frame].handler = t_reaction_land
 *      otherwise:  return -3
 */
long t_r_post_bike(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x40000;
        obj->field20 = 0xfffa0000;
        obj->field24 = 0xa000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x1145;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1145)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_reaction_land);
}

/* t_combo_airborn_hit -- armv7 0x0004289c, 176 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x2
 *          group_sound(obj)
 *          rsnd_func(obj, 0xa)
 *          obj->field48 = 0x60006
 *          shake_a11(obj)
 *          obj->field1c = 0x50000
 *          obj->field20 = 0xfffd0000
 *          obj->field24 = 0x8000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0x1061, then descend into t_flight
 *      token == 0x1061:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_combo_airborn_hit(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x2;
        group_sound(obj);
        rsnd_func(obj, 0xa);
        obj->field48 = 0x60006;
        shake_a11(obj);
        obj->field1c = 0x50000;
        obj->field20 = 0xfffd0000;
        obj->field24 = 0x8000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0x1061;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1061)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}

/* t_combo2 -- armv7 0x00046944, 172 bytes.  **Complete.**
 *
 *      token == 0:
 *          obj->field1c = 0x4
 *          create_blood_proc(obj)
 *          set_half_damage(obj)
 *          obj->field1c = 0xe
 *          create_fx(obj)
 *          obj->field1c = 0x40000
 *          obj->field20 = 0xfff80000
 *          obj->field24 = 0x8000
 *          obj->field28 = 0x5
 *          obj->field40 = 0x1e
 *          token := 0xca9, then descend into t_flight
 *      token == 0xca9:
 *          frame[frame].handler = t_land_on_my_back
 *      otherwise:  return -3
 */
long t_combo2(MK3THREAD *thread)
{
    MK3OBJ  *obj   = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 0x4;
        create_blood_proc(obj);
        set_half_damage(obj);
        obj->field1c = 0xe;
        create_fx(obj);
        obj->field1c = 0x40000;
        obj->field20 = 0xfff80000;
        obj->field24 = 0x8000;
        obj->field28 = 0x5;
        obj->field40 = 0x1e;
        *mk3_frame(thread, thread->frame + 1) = 0xca9;
        thread->frame = thread->frame + 1;      /* push a level */
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xca9)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);
}


/* ======================================================================
 * The reactions. What happens to the fighter who is HIT, which is the half
 * of a fight this port has been missing.
 *
 * Every one below was read from the annotated disassembly and checked with
 * tools/factdiff.py against tools/facts_asm.py's reading of the same
 * function, so a store, a call, a handler or a token that differs between
 * the two is a difference the tool names rather than something a person has
 * to notice.
 * ====================================================================== */

void delete_slave_notproj(MK3OBJ *obj);
void player_normpal(MK3OBJ *obj);
void face_opponent(MK3OBJ *obj);
void stop_me_player(MK3OBJ *obj);
long t_rst5(struct MK3THREAD *thread);


/* ----------------------------------------------------- reaction_start_chores
 *
 * armv7 0x00044b0c, a hundred and twenty bytes.
 *
 *      inc_p_hit(obj)
 *      obj->field38 = 0 ; obj->field08->field20 = 0
 *      if (obj->field00->field10 & 8) {
 *          obj->field1c = 1 ; G[0x452] = 1        ; the halfword, as a SHORT
 *      }
 *      obj->field2c = obj->field00->field10 | 4
 *      obj->field00->field10 = obj->field2c
 *      delete_slave_notproj(obj)
 *      obj->field2c = (obj->field08->field30 & ~0x1a4) | 0x10
 *      obj->field08->field30 = obj->field2c
 *      obj->field1c = 0
 *      obj->field00->field50 = 0 ; obj->field00->field58 = 0
 *      player_normpal ; face_opponent ; stop_me_player ; uhq_entry
 *
 * **Everything that has to be true before a reaction can play**, in one
 * routine that eight of them call. Read as a list of what a hit costs you:
 * your slave object, your palette, your facing, your velocity, and four
 * separate flag words.
 *
 * `G[0x452]` is the halfword the punch swings test before their strike check
 * -- `t_jhp4` and its three siblings retract instead of striking when it is
 * set. This is where the 1 comes from, and it is written only when bit 3 of
 * the header's 0x10 is already up, so not every reaction raises it.
 *
 * The mask `~0x1a4` clears bits 2, 5, 7 and 8 of the other object's 0x30 and
 * then sets bit 4. Five bits touched in one expression, which the compiler
 * folded into a `bic` and an `orr`; both are kept rather than collapsed into
 * a single constant, because the pair is what the original says.
 *
 * `stop_me_player` here is the same full stop `t_air_strike` uses to land a
 * fighter: velocity cleared and then applied, so it is zero.
 */
void reaction_start_chores(MK3OBJ *obj)
{
    uint32_t flags;

    inc_p_hit(obj);

    obj->field38 = 0;
    obj->field08->field20 = 0;

    flags = obj->field00->field10;
    obj->field2c = flags;
    if (flags & 8) {
        obj->field1c = 1;
        *(uint16_t *)(void *)(G_BYTES + 0x452) = 1;
    }

    obj->field2c = obj->field2c | 4;
    obj->field00->field10 = obj->field2c;

    delete_slave_notproj(obj);

    obj->field2c = (obj->field08->field30 & ~0x1a4u) | 0x10u;
    obj->field08->field30 = obj->field2c;

    obj->field1c = 0;
    obj->field00->field50 = 0;
    obj->field00->field58 = obj->field1c;

    player_normpal(obj);
    face_opponent(obj);
    stop_me_player(obj);
    uhq_entry(obj);
}


/* --------------------------------------------------------- t_reaction_start
 *
 * armv7 0x00044b84, a hundred and eight bytes.
 *
 *      state 0 only
 *          obj->field1c = 0x503 ; part->field18 = 0x503
 *          save obj->field30, obj->field34, obj->field38
 *          reaction_start_chores(obj)
 *          restore the three
 *          install t_rst5
 *
 * **The save and restore is the whole point.** `reaction_start_chores` zeroes
 * field38 on its second line and writes field2c all over, and this routine
 * pulls 0x30, 0x34 and 0x38 into three registers BEFORE the call and puts
 * them back after it. So whatever the hit deposited in those three survives
 * the housekeeping, and the housekeeping does not have to know about them.
 *
 * The compiler keeps them in fp, sl and r8 -- three callee-saved registers
 * pushed in the prologue for exactly this -- which is how you can tell the
 * saving is deliberate and not an artefact.
 *
 * 0x503 is the action tag for a reaction. It goes in both places the tag
 * lives: the object's own 0x1c and the header's 0x18, which is the pair
 * `is_he_blocking` and the strike tests read.
 */
long t_reaction_start(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t saved30, saved34, saved38;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x503;
    obj->field00->field18 = 0x503;

    saved30 = obj->field30;
    saved34 = obj->field34;
    saved38 = obj->field38;

    reaction_start_chores(obj);

    obj->field30 = saved30;
    obj->field34 = saved34;
    obj->field38 = saved38;

    return mk3_install(thread, (MK3THREADFUNC)t_rst5);
}


/* ======================================================================
 * The one-shot reaction steps.
 *
 * Three of the same shape, and it is the commonest shape in this file: do
 * one thing, then POP. No token of their own, no state to resume at -- the
 * caller pushed them, they act once, and the frame index comes back down.
 * The `t_local_reaction_exit` at the bottom of each is the floor: a routine
 * pushed at the bottom of the stack has nothing to pop to, and that is where
 * it goes instead.
 * ====================================================================== */

void repell_one_of_us(MK3OBJ *obj);


/* ------------------------------------------------------- t_block_shake_wake
 *
 * armv7 0x00041e04, sixty-eight bytes.
 *
 *      state 0 only:  pop
 *
 * **It does nothing.** No call, no store, not one field touched -- the whole
 * body is the guard and the pop. It exists to be a NAME in the frame: the
 * block shake pushes it, sleeps, and the wake-up is this routine returning
 * control to whatever was underneath.
 *
 * Worth writing out rather than folding into its caller, because a handler
 * is identified by its address and the shake needs something to point at.
 * Several of these appear in this file and none of them is dead code.
 */
long t_block_shake_wake(MK3THREAD *thread)
{
    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ----------------------------------------------------------- t_net_struggle
 *
 * armv7 0x0004416c, eighty bytes.
 *
 *      state 0 only:  next_anirate(obj) ; pop
 *
 * One frame of animation and out. `next_anirate` is the clock -- it counts
 * the rate down and advances a frame only when it reaches zero -- so a
 * caller that pushes this on a loop plays the struggle at whatever rate is
 * already installed, without knowing what that rate is.
 *
 * The name says a net; nothing here does. What it is a struggle AGAINST is
 * decided entirely by whichever animation the caller set up.
 */
long t_net_struggle(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    next_anirate(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------- t_cc_block_sweep
 *
 * armv7 0x000432f8, ninety-two bytes.
 *
 *      state 0 only
 *          obj->field38 = 0
 *          obj->field1c = 0x30000 ; obj->field20 = 0x30000
 *          repell_one_of_us(obj)
 *          pop
 *
 * **0x30000 is 3.0.** The same 16.16 the jump's -10.0 and +0.5 are written
 * in, and it goes into BOTH velocity slots from one register -- `mov.w r3,
 * #0x30000` and two stores. So this is three units a frame, in whichever
 * pair 0x1c and 0x20 are, applied just before the two fighters are pushed
 * apart.
 *
 * `repell_one_of_us` is the separation. `_repell` in the port's own tick
 * carries the reading of the leash at 304 units; this is the half of it that
 * moves ONE fighter, which is what a sweep needs -- the man on the floor
 * stays put and the man who swept is the one who gives ground.
 */
long t_cc_block_sweep(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field38 = 0;
    obj->field1c = 0x30000;         /* 3.0 in 16.16 */
    obj->field20 = 0x30000;
    repell_one_of_us(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


void pose_stumble_frame_1(MK3OBJ *obj);
long t_susp3(struct MK3THREAD *thread);
long t_shake_ob_up(struct MK3THREAD *thread);
long t_rek3(struct MK3THREAD *thread);


/* ------------------------------------------- t_suspend_wait_action_jsrp
 *
 * armv7 0x00044674, seventy-two bytes.
 *
 *      state 0 only
 *          get_his_action(obj)
 *          obj->field48 = obj->field20
 *          install t_susp3
 *
 * `get_his_action` leaves the other fighter's action tag in field20, and
 * this copies it straight into field48 before handing on. So whatever
 * `t_susp3` does about a suspended fighter, it does it against **the tag the
 * opponent had at this instant**, frozen here rather than read later.
 *
 * That is worth naming because the tag moves: a fighter changes action
 * several times a second, and a routine that asked again two frames on
 * would get a different answer.
 */
long t_suspend_wait_action_jsrp(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_his_action(obj);
    obj->field48 = obj->field20;

    return mk3_install(thread, (MK3THREADFUNC)t_susp3);
}


/* ------------------------------------------------------- t_slammed_shake_up
 *
 * armv7 0x00047af4, ninety-two bytes.
 *
 *      state 0 only
 *          pose_stumble_frame_1(obj)
 *          obj->field08->field1c = 0xfffe0000      ; -2.0
 *          obj->field1c = 0x30003
 *          obj->field20 = 2 ; obj->field24 = 4
 *          install t_shake_ob_up
 *
 * **-2.0 upward, and the number is written as one literal.** The other
 * object's 0x1c takes -0x20000, which in the 16.16 this engine writes its
 * positions in is minus two -- a small hop, an eighth of the jump's -10.0.
 * So being slammed lifts you a little rather than launching you.
 *
 * 0x30003 is not a coordinate. It is two halves, 3 and 3, in the slot the
 * animation rate lives in -- the same packed-pair habit `t_do_flip` uses for
 * its animation numbers. Which half is which is not established here.
 *
 * The 4 in field24 is `adds r3, r3, r3` on the 2 that just went into
 * field20: the compiler doubled the register rather than loading a second
 * constant, and the pair is kept as a pair for that reason.
 */
long t_slammed_shake_up(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    pose_stumble_frame_1(obj);

    obj->field08->field1c = 0xfffe0000u;    /* -2.0 in 16.16 */
    obj->field1c = 0x30003;
    obj->field20 = 2;
    obj->field24 = 2 + 2;

    return mk3_install(thread, (MK3THREADFUNC)t_shake_ob_up);
}


/* -------------------------------------------------------- t_block_shake_ani
 *
 * armv7 0x0004445c, a hundred bytes.
 *
 *      state 0
 *          do_next_a9_frame(obj)
 *          obj->field1c = obj->field48
 *          token = 0x1436 ; thread->fieldfc = obj->field1c
 *          return obj->field1c
 *      state 0x1436
 *          install t_block_shake_wake
 *
 * **The sleep length comes out of field48, not out of a constant.** One
 * frame of animation, then park for however many frames the caller left
 * there -- and the same value is both the sleep counter and the return, the
 * way every parking state in this directory does it.
 *
 * So the shake's rhythm is set by whoever pushed it, and this routine is the
 * one beat. `t_block_shake_wake` underneath does nothing at all, which makes
 * the pair a pure timer: play a frame, wait, hand back.
 */
long t_block_shake_ani(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        do_next_a9_frame(obj);
        obj->field1c = obj->field48;

        *mk3_frame(thread, thread->frame + 1) = 0x1436;
        thread->fieldfc = obj->field1c;
        return (long)obj->field1c;
    }

    if (token != 0x1436)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_wake);
}


/* ----------------------------------------------------------- t_r_tusk_elbow
 *
 * armv7 0x00044e90, a hundred bytes.
 *
 *      state 0 only
 *          obj->field1c = 4 ; create_blood_proc(obj)
 *          obj->field1c = 4 ; create_blood_proc(obj)
 *          rsnd_func(obj, 3)
 *          install t_rek3
 *
 * **Two of the same blood event, back to back.** field1c is reloaded with 4
 * between the calls because `create_blood_proc` re-reads it after firing the
 * event and can leave something else there -- so the second 4 is not a
 * redundant store, it is the reload that makes the second spray happen.
 *
 * `create_blood_proc` refuses anything above 12, so 4 is one of thirteen
 * kinds and this reaction asks for the same kind twice rather than for a
 * bigger one. Sound 3 goes with it.
 *
 * The compiler keeps the 4 in r8 across both calls, which is why the
 * prologue saves that register in a function with nothing else to spill.
 */
long t_r_tusk_elbow(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 4;
    create_blood_proc(obj);
    obj->field1c = 4;
    create_blood_proc(obj);

    rsnd_func(obj, 3);

    return mk3_install(thread, (MK3THREADFUNC)t_rek3);
}


void tsound_func(MK3OBJ *obj, long which);
long t_rhat_sleep(struct MK3THREAD *thread);


/* ------------------------------------------------------- t_suspend_wait_wake
 *
 * armv7 0x0004460c, a hundred and four bytes.
 *
 *      state 0 only
 *          get_his_action(obj)
 *          obj->field20 == obj->field48 ? install t_susp3
 *                                       : pop
 *
 * The other half of `t_suspend_wait_action_jsrp`, which froze the opponent's
 * tag in field48. This asks for it again and compares: **the same tag means
 * he has not moved on**, and only then does the suspension continue into
 * `t_susp3`. Any change at all and this pops, which ends the wait.
 *
 * So the pair is a "hold while he is still doing that" and the equality is
 * exact -- not a mask, not a range. One tag, tested whole.
 */
long t_suspend_wait_wake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    get_his_action(obj);
    if (obj->field20 == obj->field48)
        return mk3_install(thread, (MK3THREADFUNC)t_susp3);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------ t_bone_grind_sound and t_machine_sound
 *
 * armv7 0x0004791c and 0x00047984, a hundred and four bytes each.
 *
 *      state 0        obj->a10 = N            ; 3 grinds, 6 machine
 *                     -> play
 *      state TOK      if (--obj->a10 != 0) -> play
 *                     token = DONETOK ; thread->fieldfc = MK3_THREAD_DONE
 *                     return MK3_THREAD_DONE
 *      play:          tsound_func(obj, S)     ; 0x23 grind, 0x22 machine
 *                     token = TOK ; thread->fieldfc = 0x10 ; return 0x10
 *
 * **A sound played N times, sixteen frames apart, and then the thread
 * deletes itself.** The counter lives in a10 -- the argument slot -- rather
 * than in a state, and the loop is a branch back into the play block from
 * the resume, which is why both share one tail.
 *
 * The 0x16462 at the end is `MK3_THREAD_DONE`: the header establishes that
 * a handler returning it is unlinked and freed on the spot, so these do not
 * pop to a caller. They are their own thread and they end it.
 *
 * The two differ in exactly three constants -- the count, the sound and the
 * pair of tokens -- and in nothing else, so they are written together.
 */
long t_bone_grind_sound(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 3;
    } else {
        if (token != 0x9b7)
            return -3;
        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x9bb;
            thread->fieldfc = MK3_THREAD_DONE;
            return MK3_THREAD_DONE;
        }
    }

    tsound_func(obj, 0x23);
    *mk3_frame(thread, thread->frame + 1) = 0x9b7;
    thread->fieldfc = 0x10;
    return 0x10;
}


long t_machine_sound(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->a10 = 6;
    } else {
        if (token != 0x9ac)
            return -3;
        obj->a10 = obj->a10 - 1;
        if (obj->a10 == 0) {
            *mk3_frame(thread, thread->frame + 1) = 0x9b0;
            thread->fieldfc = MK3_THREAD_DONE;
            return MK3_THREAD_DONE;
        }
    }

    tsound_func(obj, 0x22);
    *mk3_frame(thread, thread->frame + 1) = 0x9ac;
    thread->fieldfc = 0x10;
    return 0x10;
}


/* -------------------------------------------------------------- t_rhat_wake
 *
 * armv7 0x00044bf0, a hundred and twelve bytes.
 *
 *      state 0 only
 *          obj->field1c = obj->field00->field20
 *          if (obj->field1c == 1) { obj->field1c = 5 ; create_blood_proc }
 *          next_anirate(obj)
 *          --obj->a10 > 0 ? install t_rhat_sleep
 *                         : install t_local_reaction_exit
 *
 * **Blood on one frame of the animation and no other.** The proc's 0x20 is
 * the animation's own counter -- it runs down from the rate and reloads --
 * so `== 1` is true on exactly the tick before a frame advances. One spray
 * per animation frame, and the routine does not have to know the rate.
 *
 * The 5 is `adds r3, #4` on the 1 that was just compared, which is the same
 * register trick `t_slammed_shake_up` uses for its 2 and 4. It is kept as an
 * addition rather than written as 5 because that is what the original says.
 *
 * Unlike the pop-shaped routines above, both exits here are INSTALLS: this
 * one does not come back, it hands on. A countdown in a10 decides which.
 */
long t_rhat_wake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = obj->field00->field20;
    if (obj->field1c == 1) {
        obj->field1c = 1 + 4;
        create_blood_proc(obj);
    }

    next_anirate(obj);

    obj->a10 = obj->a10 - 1;
    if ((long)obj->a10 > 0)
        return mk3_install(thread, (MK3THREADFUNC)t_rhat_sleep);

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


void am_i_close_to_edge(MK3OBJ *obj);
void xfer_otherguy(MK3OBJ *obj);
void zero_my_p_hit(MK3OBJ *obj);
void inc_p_block(MK3OBJ *obj);
long t_block3(struct MK3THREAD *thread);
long t_blocked_start(struct MK3THREAD *thread);
long t_ken_masters_xfer(struct MK3THREAD *thread);
long t_pit_abort(struct MK3THREAD *thread);
long t_fall_down_pit(struct MK3THREAD *thread);
long t_fall_down_bell_tower(struct MK3THREAD *thread);
long t_fall_on_trax(struct MK3THREAD *thread);
long t_fall_in_lava(struct MK3THREAD *thread);


/* ---------------------------------------------------------------- t_block2
 *
 * armv7 0x00041b78, a hundred and sixteen bytes.
 *
 *      state 0       part->field30 = 0 ; part->field34 = 0
 *                    push t_blocked_start             (0x1322)
 *      state 0x1322  install t_block3
 *
 * `part->field34` is the DIRECTION MASK -- `mask_joystick` ANDs the stick's
 * four bits with it -- so clearing it takes every direction away for the
 * duration of the block. 0x30 goes with it, and this is the only writer of
 * the pair in the file.
 *
 * So a blocked hit costs you the stick before anything else happens, and
 * gives it back through whatever restores 0x34 later.
 */
long t_block2(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 0;

        *mk3_frame(thread, thread->frame + 1) = 0x1322;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1322)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_block3);
}


/* ------------------------------------------------------- t_blocked_start
 *
 * armv7 0x000475a0, a hundred and twenty-four bytes.
 *
 *      state 0 only
 *          obj->field1c = 0x503 ; part->field18 = 0x503
 *          save 0x30, 0x34, 0x38 ; reaction_start_chores ; restore
 *          zero_my_p_hit(obj)
 *          inc_p_block(obj)
 *          obj->field30 = 0
 *          install t_rst5
 *
 * **`t_reaction_start` with two lines added, and those two lines are the
 * whole difference between being hit and blocking a hit.**
 *
 * Everything up to the restore is the same function, register for register,
 * including the same save of the three fields the chores would destroy. Then
 * this one CLEARS the hit counter and BUMPS the block counter. The tag it
 * writes is the same 0x503 -- so as far as every other routine is concerned
 * a blocked hit is a reaction like any other, and only the two counters know
 * the difference.
 *
 * That is worth stating because it means the block has no tag of its own to
 * test for. Anything wanting to know reads p_hit and p_block.
 */
long t_blocked_start(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t saved30, saved34, saved38;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0x503;
    obj->field00->field18 = 0x503;

    saved30 = obj->field30;
    saved34 = obj->field34;
    saved38 = obj->field38;

    reaction_start_chores(obj);

    obj->field30 = saved30;
    obj->field34 = saved34;
    obj->field38 = saved38;

    zero_my_p_hit(obj);
    inc_p_block(obj);
    obj->field30 = 0;

    return mk3_install(thread, (MK3THREADFUNC)t_rst5);
}


/* --------------------------------------------------- t_avoid_corner_trap
 *
 * armv7 0x00047b50, a hundred and sixteen bytes.
 *
 *      state 0 only
 *          am_i_close_to_edge(obj)
 *          if (obj->field5c) {
 *              obj->field1c = obj->field00->p_hit
 *              if (obj->field1c >= obj->field20) {
 *                  obj->field38 = t_ken_masters_xfer
 *                  xfer_otherguy(obj)
 *              }
 *          }
 *          pop
 *
 * **A mercy rule, and it has two conditions.** Near a wall AND having taken
 * at least `field20` hits, the other fighter is handed to
 * `t_ken_masters_xfer` -- which is to say the game moves HIM rather than
 * the man in the corner.
 *
 * The threshold is not a constant: 0x20 is whatever the caller left there,
 * so how many hits count as a trap is decided outside. `p_hit` at 0x44 of
 * the header is the counter `zero_my_p_hit` clears and `inc_p_hit` bumps,
 * which is the same one `t_blocked_start` resets on a block -- so blocking
 * genuinely buys you out of the corner rule.
 *
 * The handler goes into field38 and then `xfer_otherguy` acts on it. Storing
 * a routine in a field for another function to pick up is the same handover
 * `obj->field34` does for the jump's per-frame callback.
 */
long t_avoid_corner_trap(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_close_to_edge(obj);
    if (obj->field5c != 0) {
        obj->field1c = obj->field00->p_hit;
        if ((long)obj->field1c >= (long)obj->field20) {
            obj->field38 = (uint32_t)(uintptr_t)t_ken_masters_xfer;
            xfer_otherguy(obj);
        }
    }

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------- t_background_death
 *
 * armv7 0x00041364, a hundred and twenty bytes.
 *
 *      state 0 only
 *          switch (G[0x24] - 1) {
 *              case 0: install t_fall_down_pit
 *              case 1: install t_fall_down_bell_tower
 *              case 2: install t_fall_on_trax
 *              case 3: install t_fall_in_lava
 *              default: install t_pit_abort
 *          }
 *
 * **The stage hazards, as one table.** `G[0x24]` is which stage is being
 * played; subtract one and four of them have a death of their own. Every
 * other stage gets `t_pit_abort`, which is to say nothing happens.
 *
 * The compiler emitted it as a `tbb` -- a byte table of branch offsets
 * immediately after the instruction, indexed by the register -- so the four
 * cases really are a switch in the original and not a chain of compares.
 * The bound is `cmp r3, #3 ; bhi`, unsigned, so a stage number of zero wraps
 * to a huge value and takes the default rather than falling off the table.
 *
 * Four hazards for a game with more stages than that: the Pit, the Bell
 * Tower, the Subway and the Lava. Which stage number is which is not
 * established here.
 *
 * **CHECKED BY HAND, not by tools/factdiff.py.** The four cases branch into
 * one shared store, so the asm reader sees a single handler with a value it
 * cannot resolve and reports all four of these as invented. The four targets
 * were resolved individually off the `tbb` table at 0x00041388 -- offsets
 * 0x11, 0x14, 0x18, 0x1b from it, landing on 0x413aa, 0x413b0, 0x413b8 and
 * 0x413be -- and each pc-relative load there names a real symbol. That is
 * the evidence; the tool is not able to repeat it yet and its gap list says
 * so.
 */
long t_background_death(MK3THREAD *thread)
{
    uint32_t stage;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    stage = *(const uint32_t *)(const void *)(G_BYTES + 0x24) - 1;

    if (stage > 3)
        return mk3_install(thread, (MK3THREADFUNC)t_pit_abort);

    switch (stage) {
    case 0:
        return mk3_install(thread, (MK3THREADFUNC)t_fall_down_pit);
    case 1:
        return mk3_install(thread, (MK3THREADFUNC)t_fall_down_bell_tower);
    case 2:
        return mk3_install(thread, (MK3THREADFUNC)t_fall_on_trax);
    default:
        return mk3_install(thread, (MK3THREADFUNC)t_fall_in_lava);
    }
}


long t_cc_ken_masters(struct MK3THREAD *thread);


/* ------------------------------------------------------- t_r_null_speared
 *
 * armv7 0x00041144, a hundred and thirty-two bytes.
 *
 *      state 0
 *          part->field30 = 0 ; part->field34 = 0 ; part->field38 = 0
 *          push t_reaction_start                  (0x3f4)
 *      state 0x3f4
 *          obj->field1c = 0x40000                 ; 4.0
 *          pop
 *
 * A reaction with a number left over for whoever pops back to. 0x40000 is
 * 4.0 in the engine's 16.16, the same shape as the sweep's 3.0 and the
 * flip's 4.0 -- so this is a speed handed up rather than a state of its own.
 * The name says a speared reaction with nothing to react TO; the number is
 * what a caller further up does with that.
 */
long t_r_null_speared(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = 0;

        *mk3_frame(thread, thread->frame + 1) = 0x3f4;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_reaction_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x3f4)
        return -3;

    obj->field1c = 0x40000;         /* 4.0 in 16.16 */

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* -------------------------------------------------------------- t_r_zoom
 *
 * armv7 0x0004123c, a hundred and twenty-eight bytes.
 *
 *      state 0
 *          part->field30 = 0 ; part->field34 = 1 ; part->field38 = 0
 *          push t_reaction_start                  (0x43a)
 *      state 0x43a
 *          pop
 *
 * The same shape as `t_r_null_speared` with one bit changed: field34 is set
 * to 1 rather than cleared, and there is no number left behind on the way
 * out. Field34 is the direction mask `mask_joystick` reads, so this reaction
 * leaves exactly ONE direction bit standing rather than none.
 */
long t_r_zoom(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 1;
        obj->field00->field38 = 0;

        *mk3_frame(thread, thread->frame + 1) = 0x43a;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_reaction_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x43a)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------- t_b_weak_silent
 *
 * armv7 0x00041d40, a hundred and thirty-two bytes.
 *
 *      state 0
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_ken_masters
 *          push t_blocked_start                   (0x13bd)
 *      state 0x13bd
 *          pop
 *
 * A BLOCK, not a hit -- it pushes `t_blocked_start`, the routine that clears
 * p_hit and bumps p_block, where the two above push `t_reaction_start`. And
 * it parks `t_cc_ken_masters` in field38, the same handover slot
 * `t_avoid_corner_trap` uses for its own transfer, so whatever reads field38
 * next hands this block off to that routine specifically.
 *
 * "Silent" and "no masters" together suggest this is a blocked hit from an
 * opponent the corner rule does not apply to; nothing in this function
 * itself says why, and that is left unguessed.
 */
long t_b_weak_silent(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = (uint32_t)(uintptr_t)t_cc_ken_masters;

        *mk3_frame(thread, thread->frame + 1) = 0x13bd;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13bd)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ---------------------------------------------------- t_b_weak_no_masters
 *
 * armv7 0x000426f4, a hundred and thirty-two bytes.
 *
 *      state 0
 *          rsnd_func(obj, 6)
 *          part->field30 = 0 ; part->field34 = 0 ; part->field38 = 0
 *          push t_blocked_start                   (0x13ca)
 *      state 0x13ca
 *          pop
 *
 * The plain block: a sound, the three fields cleared with no handover parked
 * in field38, and `t_blocked_start`. Same family as `t_b_weak_silent`, minus
 * whatever "silent" was withholding -- here the sound plays and nothing is
 * queued in field38 for a later routine to pick up.
 */
long t_b_weak_no_masters(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 6);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = 0;

        *mk3_frame(thread, thread->frame + 1) = 0x13ca;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13ca)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


long t_generic_airborn_hit(struct MK3THREAD *thread);
long t_joy_block_loop(struct MK3THREAD *thread);
long t_joy_duck_block_loop(struct MK3THREAD *thread);
long t_flight(struct MK3THREAD *thread);
long t_d_post_block(struct MK3THREAD *thread);


/* ----------------------------------------------------------------- t_cc_punch
 *
 * armv7 0x00041bec, a hundred and thirty-six bytes.
 *
 *      state 0        proc->field20 = 3
 *                      token = 0x137c ; return proc->field20 park
 *      state 0x137c   --obj->field20 > 0 ? sleep again : pop
 *
 * The proc's 0x20 is the animation counter -- the same field `t_rhat_wake`
 * reads for its once-per-frame test -- but here nothing paces it against an
 * animation at all; this just parks the token, sleeps a fixed number of
 * turns, and pops. Three frames of nothing but waiting, which is the pause
 * that makes a combo hit read as a hit rather than a tap.
 */
long t_cc_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field08->field20 = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x137c;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_local_reaction_exit;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x137c)
        return -3;

    obj->field20 = obj->field08->field20 - 1;
    if ((long)obj->field20 > 0) {
        thread->fieldfc = 1;
        return 1;
    }

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* -------------------------------------------------------------- t_r_last_noogy
 *
 * armv7 0x00042db0, a hundred and forty bytes.
 *
 *      state 0
 *          rsnd_func(obj, 8)
 *          part->field38 = 0
 *          part->field30 = t_generic_airborn_hit
 *          part->field34 = 1
 *          push t_reaction_start                  (0xe35)
 *      state 0xe35
 *          pop
 *
 * Parks `t_generic_airborn_hit` in field30 -- the WALK ROUTINE slot
 * `plyrthread` calls indirectly -- rather than in field38 the way the block
 * handovers do. So this reaction is not queuing a routine for a later step
 * to pick up; it is substituting what runs on the object's normal update in
 * place of walking, for as long as field30 holds it.
 */
long t_r_last_noogy(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 8);

        obj->field08->field38 = 0;
        obj->field08->field30 = (uint32_t)(uintptr_t)t_generic_airborn_hit;
        obj->field08->field34 = 1;

        *mk3_frame(thread, thread->frame + 1) = 0xe35;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_reaction_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xe35)
        return -3;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------ t_fall_on_my_back
 *
 * armv7 0x00041efc, a hundred and forty-four bytes.
 *
 *      state 0
 *          part->field24 = 0x8000                 ; 0.5
 *          part->field1c = 0 ; part->field20 = 0
 *          part->field28 = 5
 *          part->field40 = 5 + 0x19               ; 30, SCKNOCKDOWN
 *          push t_flight                          (0x1474)
 *      state 0x1474
 *          install t_reaction_land
 *
 * The same launch shape `t_do_flip` uses -- a velocity, a gravity, an
 * animation number -- built here for a fall onto your back rather than a
 * jump. `part->field40 = 30` is animation 30, which `docs`/other work has
 * already pinned as SCKNOCKDOWN. So this is what happens after a hit strong
 * enough to put you flat: a short flight, then `t_reaction_land`, which
 * this file's own comment on `FALL_TAIL` in the Godot port already reads --
 * it plays the two extra knockdown frames and holds the last one.
 *
 * 0x8000 is 0.5 in 16.16, the same magnitude the jump's gravity uses; only
 * the velocity in field1c/field20 differs, and both are zero here, which
 * means this fall's motion is gravity alone with no initial push.
 */
long t_fall_on_my_back(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field08->field24 = 0x8000;         /* 0.5 in 16.16 */
        obj->field08->field1c = 0;
        obj->field08->field20 = 0;
        obj->field08->field28 = 5;
        obj->field08->field40 = 5 + 0x19;        /* 30, SCKNOCKDOWN */

        *mk3_frame(thread, thread->frame + 1) = 0x1474;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1474)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_reaction_land);
}


/* -------------------------------------------------------------- t_block_exit
 *
 * armv7 0x000448dc, a hundred and forty-four bytes.
 *
 *      state 0
 *          obj->field1c = 0
 *          obj->field00->p_hit = 0 ; obj->field00->field4c = obj->field1c
 *          back_to_normal(obj)
 *          am_i_joy(obj)
 *          if (!obj->field5c)
 *              install t_d_post_block
 *          am_i_short(obj)
 *          if (obj->field5c)
 *              install t_joy_duck_block_loop
 *          install t_joy_block_loop
 *
 * **Three ways out of a block, in order.** Against the machine, always
 * `t_d_post_block` -- a player only reaches the other two. A human is then
 * asked if he is short -- ducking -- and goes back into the duck-block loop
 * or the standing one accordingly.
 *
 * `am_i_short` is asked with `am_i_joy` already known true, so it is not
 * "am I a small character" but "is the stick held down right now": the
 * routine is choosing which loop to re-enter based on the CURRENT stance,
 * not resuming whichever one was interrupted.
 *
 * `back_to_normal` runs unconditionally before any of the three branches,
 * so whatever it undoes is undone regardless of which loop comes next.
 *
 * **`p_hit` is cleared here too, and field4c is a mirror of the same 0.**
 * Blocking ends with the hit counter at zero exactly the way
 * `t_blocked_start` clears it going in; leaving the block does not carry a
 * count into whatever comes next.
 */
long t_block_exit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field1c = 0;
    obj->field00->p_hit = 0;
    obj->field00->field4c = obj->field1c;

    back_to_normal(obj);

    am_i_joy(obj);
    if (obj->field5c == 0)
        return mk3_install(thread, (MK3THREADFUNC)t_d_post_block);

    am_i_short(obj);
    if (obj->field5c != 0)
        return mk3_install(thread, (MK3THREADFUNC)t_joy_duck_block_loop);

    return mk3_install(thread, (MK3THREADFUNC)t_joy_block_loop);
}


long t_pit_fall_scan(struct MK3THREAD *thread);
long t_flight_loop(struct MK3THREAD *thread);
void clear_shadow_bit(MK3OBJ *obj);
void center_around_me(MK3OBJ *obj);
void ground_player(MK3OBJ *obj);
void MKEvent_Add(long type, long subtype, long param, long player);


/* -------------------------------------------------------------------- t_b_sweep
 *
 * armv7 0x00042660, a hundred and forty-eight bytes.
 *
 *      state 0
 *          rsnd_func(obj, 6)
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_block_sweep
 *          push t_blocked_start                   (0x13d4)
 *      state 0x13d4
 *          part->field48 = 2 ; part->field44 = 2
 *          pop
 *
 * A block, like `t_b_weak_silent`, and it hands off to `t_cc_block_sweep`
 * through field38 the same way -- which is the routine that writes 3.0 into
 * both velocity slots and calls `repell_one_of_us`, so blocking a sweep
 * still pushes you back rather than standing you in place.
 *
 * The two 2s after the reaction starts are p_hit's neighbours -- 0x44 is
 * p_hit itself and 0x48 the field beside it -- both written from the same
 * register, which is the compiler reusing a value rather than two separate
 * constants happening to match.
 */
long t_b_sweep(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 6);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = (uint32_t)(uintptr_t)t_cc_block_sweep;

        *mk3_frame(thread, thread->frame + 1) = 0x13d4;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13d4)
        return -3;

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2;

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------------------- t_pounce4
 *
 * armv7 0x000446bc, a hundred and forty-eight bytes.
 *
 *      state 0
 *          get_his_action(obj)
 *          obj->field20 == 0x20f ? go to the wait branch
 *                                : install t_getup_reaction_exit
 *      wait branch
 *          token = 0x4a0 ; push t_suspend_wait_action_jsrp
 *      state 0x4a0
 *          install t_getup_reaction_exit
 *
 * **A one-shot poll, not a loop.** This asks the opponent's action exactly
 * once. If he is already in 0x20f it defers to
 * `t_suspend_wait_action_jsrp` -- which itself freezes the tag and hands to
 * `t_susp3` -- for one extra step; any other action goes straight to
 * `t_getup_reaction_exit`. So the pounce only waits when it catches him in
 * that specific state, and only for the single step the suspend routine
 * takes.
 */
long t_pounce4(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        get_his_action(obj);
        if (obj->field20 != 0x20f)
            return mk3_install(thread, (MK3THREADFUNC)t_getup_reaction_exit);

        *mk3_frame(thread, thread->frame + 1) = 0x4a0;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_suspend_wait_action_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x4a0)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_getup_reaction_exit);
}


/* ------------------------------------------------------------ t_slammed_slam_down
 *
 * armv7 0x000470dc, a hundred and forty-eight bytes.
 *
 *      state 0
 *          part->field20 = 0x80000 ; part->field20's sibling on the other
 *              object = 0x80000                    ; 8.0
 *          token = 0x1cf ; thread->fieldfc = 1 ; return 1
 *      state 0x1cf
 *          obj->field1c = (int16_t)MK3_FIELD12(other)
 *          obj->field20 = other->field00->field40
 *          if (obj->field20 > obj->field1c) sleep again
 *          stop_me_player(obj) ; ground_player(obj)
 *          pop
 *
 * **The floor test, written out a second time.** `field20 > field1c` is the
 * same "am I still above the floor" comparison `t_air_strike` makes against
 * `MK3_FIELD12`, one frame at a time, and it ends the same way: a full stop
 * and a snap to the ground. Gravity itself is 8.0 here rather than the
 * jump's 0.5 -- a much harder fall, which fits a slam.
 */
long t_slammed_slam_down(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field20 = 0x80000;        /* 8.0 in 16.16 */
        obj->field08->field20 = 0x80000;

        *mk3_frame(thread, thread->frame + 1) = 0x1cf;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0x1cf)
        return -3;

    obj->field1c = (uint32_t)(int32_t)(int16_t)MK3_FIELD12(obj->field08);
    obj->field20 = obj->field08->field00->field40;
    if ((long)obj->field20 > (long)obj->field1c) {
        thread->fieldfc = 1;
        return 1;
    }

    stop_me_player(obj);
    ground_player(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------- t_fall_down_bell_tower
 *
 * armv7 0x0004858c, a hundred and thirty-two bytes.
 *
 *      state 0 only
 *          MKEvent_Add(4, 0x3d, 0, obj->field00->field08)
 *          obj->field1c = 9 ; group_sound(obj)
 *          clear_shadow_bit(obj) ; center_around_me(obj)
 *          obj->field48 = 0x6000a ; shake_a11(obj)
 *          obj->field1c = 0 ; obj->field20 = 0xfff40000  ; -12.0
 *          obj->field24 = 0xfff40000 + 0xc6000            ; -0.406
 *          obj->field28 = 5 ; obj->field40 = 5 + 0x19  ; 30, SCKNOCKDOWN
 *          obj->field34 = t_pit_fall_scan
 *          install t_pit_fall_scan
 *
 * **The stage's own death, chosen by `t_background_death`'s table.** The
 * event, 4/0x3d, carries the strength index at proc->0x08 as its player
 * argument and 0 (the token, still zero here) as its param; presumably the
 * fall's own trigger for whatever the front end does with a background
 * death, and nothing here says more about it.
 *
 * **The fall is UPWARD first, not down.** -12.0 in 16.16 is a negative
 * velocity, the same sign the jump's -10.0 has, so the bell-tower death
 * launches him before gravity takes over -- and the gravity it adds each
 * frame, -0.406, is also negative: this pair keeps accelerating him
 * upward rather than pulling him back down, unlike every other flight in
 * this file. `shake_a11` runs with `field48` carrying an event id the way
 * the shake pair's own field28 does with `him` or the object's 0x08, so
 * 0x6000a names whatever camera or screen event a bell-tower fall
 * triggers.
 */
long t_fall_down_bell_tower(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    MKEvent_Add(4, 0x3d, 0, (long)obj->field00->field08);

    obj->field1c = 9;
    group_sound(obj);

    clear_shadow_bit(obj);
    center_around_me(obj);

    obj->field48 = 0x6000a;
    shake_a11(obj);

    obj->field1c = 0;
    obj->field20 = 0xfff40000u;      /* -12.0 in 16.16 */
    obj->field24 = 0xfff40000u + 0xc6000u;
    obj->field28 = 5;
    obj->field40 = 5 + 0x19;         /* 30, SCKNOCKDOWN */
    obj->field34 = (uint32_t)(uintptr_t)t_pit_fall_scan;

    return mk3_install(thread, (MK3THREADFUNC)t_pit_fall_scan);
}


long t_stumble_back_vel(struct MK3THREAD *thread);
long t_cc_block_avoid_corner(struct MK3THREAD *thread);
long t_block_shake_n_exit(struct MK3THREAD *thread);


/* ------------------------------------------------------- t_avoid_corner_trap_b
 *
 * armv7 0x00041c74, two hundred and four bytes.
 *
 *      state 0
 *          obj->field1c = obj->field00->p_hit
 *          thread->args[fieldf8++] = obj->field1c    ; save p_hit
 *          obj->field00->field4c = obj->field1c
 *          obj->field00->p_hit = obj->field1c
 *          push t_avoid_corner_trap                  (0x13ad)
 *      state 0x13ad
 *          --thread->fieldf8
 *          obj->field00->p_hit = thread->args[fieldf8]  ; restore
 *          pop
 *
 * **The B-suffix is a SAVE/RESTORE wrapper around its own A version.**
 * `t_avoid_corner_trap` reads and can change p_hit through the corner
 * check; this pushes it, lets the check run, and puts the original value
 * back afterwards -- so whatever the corner rule does to the hit count is
 * undone once this caller resumes. The two self-writes before the push
 * (field4c and p_hit both set to the same value just read) leave the count
 * unchanged; they exist because the save happens through field1c as a
 * relay rather than copying p_hit to p_hit directly.
 */
long t_avoid_corner_trap_b(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t cur;

    if (token == 0) {
        obj->field1c = obj->field00->p_hit;

        cur = thread->fieldf8;
        *mk3_arg(thread, cur) = obj->field1c;
        thread->fieldf8 = cur + 1;

        obj->field00->field4c = obj->field1c;
        obj->field00->p_hit = obj->field1c;

        *mk3_frame(thread, thread->frame + 1) = 0x13ad;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_avoid_corner_trap;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x13ad)
        return -3;

    thread->fieldf8 = thread->fieldf8 - 1;
    obj->field00->p_hit = *mk3_arg(thread, thread->fieldf8);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* -------------------------------------------------------------- t_b_boss_hit1
 *
 * armv7 0x000436f4, two hundred and twelve bytes.
 *
 *      state 0
 *          token == 0x1305 ? go to the block branch
 *          token == 0x1311 ? go to the vel branch
 *          token == 0      ? part->field38/30/34 = 0
 *                            push t_blocked_start     (0x1305)
 *          otherwise refuse
 *      block branch (0x1305)
 *          part->field1c = 0x40000                    ; 4.0
 *          pop
 *      vel branch (0x1311)
 *          rsnd_func(obj, 5)
 *          part->field1c = 0x60000 ; away_x_vel(obj)
 *          part->field48 = 0x60006 ; shake_a11(obj)
 *          part->field48 = 2 ; obj->p_hit = 3 ; part->field40 = 0xc
 *          push t_stumble_back_vel                    (0x1311)
 *
 * **Three states sharing one entry, and the entry is a normal block.** It
 * pushes `t_blocked_start` like the plain block reactions; what makes this
 * one different is what happens when the two children resume. Coming back
 * from the block leaves a speed of 4.0 for the caller. Coming back from the
 * second half fires a knockback sound, a hard push away (6.0), a shake
 * event, and then re-enters through `t_stumble_back_vel` with p_hit/field48
 * carrying a short countdown -- 3 frames at rate 2 by the pair's own
 * convention.
 *
 * A boss hit, then, is a block followed by a shove: the victim is not just
 * absorbing it, he is being knocked back hard enough to need his own
 * stumble routine.
 */
long t_b_boss_hit1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x1305) {
        obj->field00->field1c = 0x40000;        /* 4.0 in 16.16 */

        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    if (token == 0x1311) {
        rsnd_func(obj, 5);

        obj->field00->field1c = 0x60000;        /* 6.0 in 16.16 */
        away_x_vel(obj);

        obj->field00->field48 = 0x60006;
        shake_a11(obj);

        obj->field00->field48 = 2;
        obj->field00->p_hit = 2 + 1;
        obj->field00->field40 = 0xc;

        *mk3_frame(thread, thread->frame + 1) = 0x1311;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_stumble_back_vel;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0)
        return -3;

    obj->field00->field38 = 0;
    obj->field00->field30 = 0;
    obj->field00->field34 = 0;

    *mk3_frame(thread, thread->frame + 1) = 0x1305;
    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_blocked_start;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* ------------------------------------------------------------------- t_b_combo
 *
 * armv7 0x000435f8, a hundred and forty bytes.
 *
 *      state 0
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_block_avoid_corner
 *          push t_blocked_start                       (0x133f)
 *      state 0x133f
 *          rsnd_func(obj, 5)
 *          part->field1c = 0x40000 ; away_x_vel(obj)
 *          part->field48 = 2 ; obj->p_hit = 3
 *          install t_block_shake_n_exit
 *
 * Blocks, hands the corner check to `t_cc_block_avoid_corner` through the
 * usual field38 slot, and on return pushes the victim away at 4.0 with a
 * short shake countdown before handing to the exit routine -- softer than
 * `t_b_boss_hit1`'s 6.0, which fits a combo hit rather than a boss hit.
 */
long t_b_combo(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 =
            (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

        *mk3_frame(thread, thread->frame + 1) = 0x133f;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x133f)
        return -3;

    rsnd_func(obj, 5);

    obj->field00->field1c = 0x40000;        /* 4.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* -------------------------------------------------------------- t_b_combo_hard
 *
 * armv7 0x00043548, a hundred and sixty bytes.
 *
 *      state 0
 *          part->field48 = 0x40004 ; shake_a11(obj)
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_block_avoid_corner
 *          push t_blocked_start                       (0x1350)
 *      state 0x1350
 *          rsnd_func(obj, 5)
 *          part->field1c = 0x50000 ; away_x_vel(obj)
 *          obj->p_hit = 4 ; part->field48 = 3
 *          install t_block_shake_n_exit
 *
 * The same shape as `t_b_combo` with three numbers changed: a shake BEFORE
 * the block starts (0x40004, its own event id), a push of 5.0 rather than
 * 4.0, and a longer countdown (p_hit/field48 = 4/3 rather than 3/2). "Hard"
 * is exactly these three increments over the plain combo block.
 */
long t_b_combo_hard(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field48 = 0x40004;
        shake_a11(obj);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 =
            (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

        *mk3_frame(thread, thread->frame + 1) = 0x1350;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1350)
        return -3;

    rsnd_func(obj, 5);

    obj->field00->field1c = 0x50000;        /* 5.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->p_hit = 4;
    obj->field00->field48 = 4 - 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* --------------------------------------------------------- t_b_duck_hit_hard
 *
 * armv7 0x000433f8, a hundred and sixty-eight bytes.
 *
 *      state 0
 *          part->field34 = 0
 *          part->field30 = t_generic_airborn_hit
 *          part->field38 = t_cc_block_avoid_corner
 *          push t_blocked_start                       (0x136f)
 *      state 0x136f
 *          rsnd_func(obj, 5)
 *          part->field1c = 0x50000 ; away_x_vel(obj)
 *          part->field48 = 2 ; obj->p_hit = 3
 *          install t_block_shake_n_exit
 *
 * A duck-block whose walk-routine slot (field30) is set to
 * `t_generic_airborn_hit` rather than left at 0 the way the standing combo
 * blocks leave it. That parks a routine for the object's own update to run
 * instead of walking, the same handover `t_r_last_noogy` uses -- so a hard
 * hit while ducking substitutes airborne-hit handling underneath the block,
 * even though the fighter never leaves the ground here.
 */
long t_b_duck_hit_hard(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field34 = 0;
        obj->field00->field30 = (uint32_t)(uintptr_t)t_generic_airborn_hit;
        obj->field00->field38 =
            (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

        *mk3_frame(thread, thread->frame + 1) = 0x136f;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x136f)
        return -3;

    rsnd_func(obj, 5);

    obj->field00->field1c = 0x50000;        /* 5.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* --------------------------------------------------------- t_b_duck_hit_soft
 *
 * armv7 0x000434a0, a hundred and sixty-eight bytes.
 *
 *      state 0
 *          part->field34 = 0
 *          part->field30 = t_generic_airborn_hit
 *          part->field38 = t_cc_block_avoid_corner
 *          push t_blocked_start                       (0x135f)
 *      state 0x135f
 *          rsnd_func(obj, 6)
 *          part->field1c = 0x20000 ; away_x_vel(obj)
 *          part->field48 = 2 ; obj->p_hit = 3
 *          install t_block_shake_n_exit
 *
 * `t_b_duck_hit_hard` with the sound and the push changed -- 6 instead of 5,
 * 2.0 instead of 5.0 -- and nothing else. Same substitution of
 * `t_generic_airborn_hit` into the walk slot.
 */
long t_b_duck_hit_soft(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field34 = 0;
        obj->field00->field30 = (uint32_t)(uintptr_t)t_generic_airborn_hit;
        obj->field00->field38 =
            (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

        *mk3_frame(thread, thread->frame + 1) = 0x135f;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x135f)
        return -3;

    rsnd_func(obj, 6);

    obj->field00->field1c = 0x20000;        /* 2.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* -------------------------------------------------------------- t_b_lo_punch
 *
 * armv7 0x0004496c, a hundred and eighty-four bytes.
 *
 *      state 0
 *          rsnd_func(obj, 6)
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_punch
 *          push t_blocked_start                       (0x1386)
 *      state 0x1386
 *          obj->field54 = 0x50000                     ; 5.0
 *          am_i_short(obj)
 *          if (obj->field5c == 0)
 *              obj->field54 += 0x30000                ; 8.0 standing
 *          obj->field1c = obj->field54 ; away_x_vel(obj)
 *          obj->field48 = 2 ; obj->p_hit = 3
 *          install t_block_shake_n_exit
 *
 * **The low punch's block pushes harder if you are NOT ducking.** field54
 * starts at 5.0 and gains 3.0 more -- to 8.0 -- unless `am_i_short` says the
 * victim is crouched. So blocking a low punch while standing costs more
 * ground than blocking it while already down, the opposite of what the
 * duck-hit pair above does for a hit that lands while ducking.
 *
 * This time the corner handover in field38 is `t_cc_punch` rather than
 * `t_cc_block_avoid_corner` -- the pause-and-pop routine, not the corner
 * check -- so a blocked low punch does not get the avoid-corner treatment
 * at all.
 */
long t_b_lo_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 6);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = (uint32_t)(uintptr_t)t_cc_punch;

        *mk3_frame(thread, thread->frame + 1) = 0x1386;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1386)
        return -3;

    obj->field00->field54 = 0x50000;        /* 5.0 in 16.16 */
    am_i_short(obj);
    if (obj->field5c == 0)
        obj->field00->field54 = obj->field00->field54 + 0x30000; /* +3.0 */

    obj->field1c = obj->field00->field54;
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* ----------------------------------------------------------------- t_b_punch
 *
 * armv7 0x00043354, a hundred and sixty-four bytes.
 *
 *      state 0
 *          rsnd_func(obj, 6)
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_block_avoid_corner
 *          push t_blocked_start                       (0x139c)
 *      state 0x139c
 *          part->field1c = 0x20000 ; away_x_vel(obj)
 *          part->field48 = 2 ; obj->p_hit = 3
 *          install t_block_shake_n_exit
 *
 * The plain high-punch block: a fixed 2.0 push, no stance question, and the
 * ordinary corner handover. This is the baseline every other block above
 * varies from -- `t_b_combo` doubles the push to 4.0, `t_b_boss_hit1`
 * triples it to 6.0, `t_b_lo_punch` conditions it on stance.
 */
long t_b_punch(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 6);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 =
            (uint32_t)(uintptr_t)t_cc_block_avoid_corner;

        *mk3_frame(thread, thread->frame + 1) = 0x139c;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x139c)
        return -3;

    obj->field00->field1c = 0x20000;        /* 2.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 1;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


long t_cc_block_upcut(struct MK3THREAD *thread);
long t_jump_up_land_jsrp(struct MK3THREAD *thread);
void ground_ochar(MK3OBJ *obj);
long is_stick_away(MK3OBJ *obj);


/* -------------------------------------------------------------------- t_b_uppercut
 *
 * armv7 0x000437c8, a hundred and seventy-six bytes.
 *
 *      state 0
 *          rsnd_func(obj, 5)
 *          part->field48 = 0x40004 ; shake_a11(obj)
 *          part->field30 = 0 ; part->field34 = 0
 *          part->field38 = t_cc_block_upcut
 *          push t_blocked_start                       (0x12f6)
 *      state 0x12f6
 *          part->field1c = 0x40000 ; away_x_vel(obj)
 *          part->field48 = 2 ; obj->p_hit = 2 + 2
 *          install t_block_shake_n_exit
 *
 * Blocking an uppercut shakes first, like `t_b_combo_hard`, and hands its
 * corner check to `t_cc_block_upcut` -- a third variant of the handover
 * `t_cc_block_avoid_corner` and `t_cc_punch` already cover, specific to
 * this move. The push is 4.0 and the countdown 4, in between the plain
 * punch block's 2.0/3 and the boss hit's 6.0.
 */
long t_b_uppercut(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        rsnd_func(obj, 5);

        obj->field00->field48 = 0x40004;
        shake_a11(obj);

        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = (uint32_t)(uintptr_t)t_cc_block_upcut;

        *mk3_frame(thread, thread->frame + 1) = 0x12f6;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_blocked_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x12f6)
        return -3;

    obj->field00->field1c = 0x40000;        /* 4.0 in 16.16 */
    away_x_vel(obj);

    obj->field00->field48 = 2;
    obj->field00->p_hit = 2 + 2;

    return mk3_install(thread, (MK3THREADFUNC)t_block_shake_n_exit);
}


/* --------------------------------------------------------------- t_block_shake
 *
 * armv7 0x00044750, two hundred and eight bytes.
 *
 *      state 0
 *          get_char_ani(obj) ; obj->field40 += 4
 *          token = 0x1440 ; push t_block_shake_ani
 *      state 0x1440
 *          token = 0x1441 ; push t_block_shake_ani
 *      state 0x1441
 *          obj->field40 -= 8
 *          if (--obj->a10 != 0)
 *              token = 0x1440 ; push t_block_shake_ani     ; loop
 *          else
 *              stop_me_player(obj) ; pop
 *      otherwise refuse
 *
 * **The animation runs BACKWARDS, two words at a time.** `get_char_ani` and
 * one advance of 4 set up the clip's tail; every pass after that pulls the
 * cursor back 8, twice the step it moved forward, so the net motion per
 * loop is backward. `t_block_shake_ani` -- see its own banner -- plays one
 * frame and parks for whatever `obj->a10` holds, and THIS routine is what
 * decrements a10 and decides whether to loop or stop.
 *
 * So the shake is: play a frame going backward through the clip, wait,
 * repeat, for `a10` frames, then a full stop. State 0 and state 0x1440 push
 * the same child for the same reason -- 0 does the one-time setup first and
 * 0x1440 is the bare re-entry the loop uses afterward.
 */
long t_block_shake(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        get_char_ani(obj);
        obj->field40 = obj->field40 + 4;

        *mk3_frame(thread, thread->frame + 1) = 0x1440;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_block_shake_ani;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x1440) {
        *mk3_frame(thread, thread->frame + 1) = 0x1441;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_block_shake_ani;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0x1441)
        return -3;

    obj->field40 = obj->field40 - 8;
    obj->a10 = obj->a10 - 1;
    if (obj->a10 != 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x1440;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_block_shake_ani;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    stop_me_player(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* --------------------------------------------------------- t_back_to_the_fight
 *
 * armv7 0x00047bc4, two hundred and ninety-six bytes.
 *
 *      state 0
 *          MK3_SET_FIELD12(obj->field08, G[0xac] + 0x32)
 *          obj->field40 = 0x16 ; get_char_ani(obj)
 *          obj->field40 += 4 ; do_next_a9_frame(obj)
 *          face_opponent(obj)
 *          obj->field08->field20 = 0
 *          obj->field1c = obj->field08->field1c = 0xfff40000     ; -12.0
 *          token = 0xbb0 ; thread->fieldfc = 1 ; return 1
 *      state 0xbb0
 *          if ((int16_t)MK3_FIELD12(obj->field08) > obj->field00->field40)
 *              sleep again at 0xbb0
 *          obj->field1c = 0
 *          obj->field20 = obj->field08->field1c    ; -12.0, carried over
 *          obj->field24 = 0x10000 ; obj->field28 = 0xfff
 *          push t_flight                            (0xbb8)
 *      state 0xbb8
 *          ground_ochar(obj)
 *          MKEvent_Add(4, 0x38, 0, obj->field00->field08)
 *          install t_local_reaction_exit
 *          push t_jump_up_land_jsrp
 *
 * **The reverse of `t_fall_down_bell_tower`.** That launches upward at
 * -12.0; this waits for the SAME fighter to come back down -- the height
 * test compares `MK3_FIELD12` against the floor exactly the way
 * `t_air_strike` and `t_slammed_slam_down` do -- and once he is down it
 * grounds him, fires a different event (4/0x38, "back to the fight" rather
 * than the fall's 4/0x3d), replaces itself with `t_local_reaction_exit`,
 * and pushes `t_jump_up_land_jsrp` on top of that. So the routine that
 * finishes the landing outlives this one: when it eventually pops, it
 * returns into the exit rather than back here.
 *
 * `G[0xac] + 0x32` written into the OTHER object's field12 is a countdown
 * or a timestamp of some kind that this file does not otherwise explain;
 * it is transcribed as read and not guessed at further.
 */
long t_back_to_the_fight(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0xbb0) {
        if ((int32_t)(int16_t)MK3_FIELD12(obj->field08)
            > (long)obj->field00->field40) {
            *mk3_frame(thread, thread->frame + 1) = 0xbb0;
            thread->fieldfc = 1;
            return 1;
        }

        obj->field1c = 0;
        obj->field20 = obj->field08->field1c;
        obj->field24 = 0x10000;         /* 1.0 in 16.16 */
        obj->field28 = 0xfff;

        *mk3_frame(thread, thread->frame + 1) = 0xbb8;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xbb8) {
        ground_ochar(obj);
        MKEvent_Add(4, 0x38, 0, (long)obj->field00->field08);

        mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_jump_up_land_jsrp;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0)
        return -3;

    MK3_SET_FIELD12(obj->field08,
                    (uint32_t)(*(const uint32_t *)(const void *)(G_BYTES
                                                                 + 0xac)
                              + 0x32));

    obj->field40 = 0x16;
    get_char_ani(obj);
    obj->field40 = obj->field40 + 4;
    do_next_a9_frame(obj);

    face_opponent(obj);

    obj->field08->field20 = 0;

    obj->field1c = 0xfff40000u;              /* -12.0 in 16.16 */
    obj->field08->field1c = obj->field1c;

    *mk3_frame(thread, thread->frame + 1) = 0xbb0;
    thread->fieldfc = 1;
    return 1;
}


long t_flight_call(struct MK3THREAD *thread);
void find_ani_part2(MK3OBJ *obj);
void death_scream(MK3OBJ *obj);
void death_blow_complete(MK3OBJ *obj);
extern long *RoundParam;                /* pointer slot -> 0x0038ed04 */


/* ------------------------------------------------------------------- t_brp1
 *
 * armv7 0x000483a0, two hundred and sixteen bytes.
 *
 *      state 0
 *          token = 0x7e0 ; push t_flight_call
 *      state 0x7e0
 *          tsound_func(obj, 0xb) ; stop_me_player(obj)
 *          MKEvent_Add(4, 0x3f, 0, obj->field00->field08)
 *          rsnd_func(obj, 3) ; death_scream(obj)
 *          obj->field40 = 0x1e ; find_ani_part2(obj) ; do_next_a9_frame(obj)
 *          obj->field1c = 0xa ; create_blood_proc(obj)
 *          death_blow_complete(obj)
 *          token = 0x7ed ; thread->fieldfc = 0xa ; return 0xa
 *      state 0x7ed
 *          install t_local_reaction_exit
 *
 * A death that flies before it finishes: `t_flight_call` is let run first,
 * and only once it pops back does this play the scream, the blood and
 * `death_blow_complete` -- all of it timed to the SAME animation 30
 * (SCKNOCKDOWN) every hard fall in this file lands on. Ten frames after that
 * it ends for good through `t_local_reaction_exit`, which this installs
 * directly rather than popping to, so there is nothing left above it.
 */
long t_brp1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        *mk3_frame(thread, thread->frame + 1) = 0x7e0;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_flight_call;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x7ed)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);

    if (token != 0x7e0)
        return -3;

    tsound_func(obj, 0xb);
    stop_me_player(obj);

    MKEvent_Add(4, 0x3f, 0, (long)obj->field00->field08);

    rsnd_func(obj, 3);
    death_scream(obj);

    obj->field40 = 0x1e;             /* 30, SCKNOCKDOWN */
    find_ani_part2(obj);
    do_next_a9_frame(obj);

    obj->field1c = 0xa;
    create_blood_proc(obj);

    death_blow_complete(obj);

    *mk3_frame(thread, thread->frame + 1) = 0x7ed;
    thread->fieldfc = 0xa;
    return 0xa;
}


/* --------------------------------------------------------- t_blast_through_anything
 *
 * armv7 0x00047cec, five hundred and four bytes -- the largest function in
 * this file so far.
 *
 *      state 0
 *          MKEvent_Add(4, 0x36, 0, obj->field00->field08)
 *          obj->field38 = t_ken_masters_xfer ; xfer_otherguy(obj)
 *          obj->field1c = 0x10000 ; away_x_vel(obj)             ; 1.0
 *          obj->field24 = 0x5000                                ; 0.3125
 *          obj->field20 = 0xffe70000                            ; -25.0
 *          obj->field08->field1c = obj->field20
 *          obj->field08->field20 = obj->field24
 *          obj->field40 = 0x1e ; get_char_ani(obj)               ; SCKNOCKDOWN
 *          obj->field1c = 0xf ; init_anirate(obj)
 *          token = 0xb6b ; thread->fieldfc = 1 ; return 1
 *      state 0xb6b
 *          next_anirate(obj)
 *          obj->field1c = obj->field08->field1c
 *          if (obj->field1c < 0) sleep again at 0xb6b
 *          RoundParam[2] and the other fighter's proc.field40 both lose
 *              RoundParam[2] worth of value, RoundParam[2] itself cleared:
 *                  obj->field00->field40 -= RoundParam[2]
 *                  otherObj->field00->field40 -= RoundParam[2]
 *                  RoundParam->0x30 (byte) = 0
 *                  G->field0xac -= RoundParam[2]   ; before clearing it
 *                  RoundParam[2] = 0
 *          MKEvent_Add(4, 0x37, 0, obj->field00->field08)
 *          obj->field1c = 0xd ; obj->field20 = 0xd  ; sentinels, leave alone
 *          obj->field24 = 0x8000 ; obj->field28 = 5              ; 0.5, count 5
 *          token = 0xb82 ; push t_flight
 *      state 0xb82
 *          install t_getup_reaction_exit
 *      state 0xb90
 *          install t_getup_reaction_exit
 *      state 0
 *          (also reached from `beq 0` inside the low branch, but the
 *           low-branch chooses between token 0 and 0xb6b by an explicit
 *           `cmp #0` first)
 *      state 0xb8e
 *          ground_ochar(obj)
 *          obj->field40 = (int16_t)MK3_FIELD12(obj->field08)
 *          obj->field38 = t_back_to_the_fight ; xfer_otherguy(obj)
 *          shake_n_sound(obj)
 *          obj->field40 = 0x1e ; find_ani_part2(obj)
 *          obj->field1c = 4
 *          token = 0xb90 ; thread->fieldfc = 0x20 ; return 0x20
 *
 * **A blast that both fighters pay for.** The launch is symmetric -- both
 * fighters get the same -25.0/0.3125 velocity and gravity written into
 * field1c/field20, one directly and one through obj->field08 -- and the
 * RoundParam subtraction removes the SAME stored value from both sides'
 * proc.field40 before clearing it, which reads as undoing whatever
 * RoundParam[2] had been contributing to each of them individually.
 *
 * The five states are two flights back to back: `t_flight_call` for the
 * initial launch (0xb6b's own frame-by-frame descent, not pushed -- it
 * calls `next_anirate` itself each pass), then once RoundParam's value is
 * cleared, a SECOND flight through `t_flight` at 0.5 gravity for five
 * ticks (0xb82). Landing installs `t_getup_reaction_exit` twice over --
 * once directly from 0xb82 and again from 0xb90, the second of which is
 * reached from 0xb8e's own separate wait rather than from 0xb82's push,
 * so the two are alternate endings rather than one calling the other.
 *
 * `RoundParam[2]` is `RoundParam + 0x08`, and `RoundParam->0x30` a byte
 * inside the same block -- both already established as a `long*` reached
 * through a pointer slot; nothing further about what index 2 or byte 0x30
 * mean is claimed here.
 */
long t_blast_through_anything(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0xb82)
        return mk3_install(thread, (MK3THREADFUNC)t_getup_reaction_exit);

    if (token == 0xb8e) {
        ground_ochar(obj);

        obj->field40 = (uint32_t)(int32_t)(int16_t)MK3_FIELD12(obj->field08);
        obj->field38 = (uint32_t)(uintptr_t)t_back_to_the_fight;
        xfer_otherguy(obj);

        shake_n_sound(obj);

        obj->field40 = 0x1e;         /* 30, SCKNOCKDOWN */
        find_ani_part2(obj);

        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xb90;
        thread->fieldfc = 0x20;
        return 0x20;
    }

    if (token == 0xb90)
        return mk3_install(thread, (MK3THREADFUNC)t_getup_reaction_exit);

    if (token != 0 && token != 0xb6b)
        return -3;

    if (token == 0xb6b) {
        next_anirate(obj);

        obj->field1c = obj->field08->field1c;
        if ((long)obj->field1c < 0) {
            *mk3_frame(thread, thread->frame + 1) = 0xb6b;
            thread->fieldfc = 1;
            return 1;
        }

        obj->field00->field40 = obj->field00->field40 - RoundParam[2];
        obj->field00->field00->field00->field40 =
            obj->field00->field00->field00->field40 - RoundParam[2];
        *(uint8_t *)((char *)RoundParam + 0x30) = 0;
        *(uint32_t *)(void *)(G_BYTES + 0xac) =
            *(const uint32_t *)(const void *)(G_BYTES + 0xac) - RoundParam[2];
        RoundParam[2] = 0;

        MKEvent_Add(4, 0x37, 0, (long)obj->field00->field08);

        obj->field1c = 0xd;               /* sentinel: leave alone */
        obj->field20 = 0xd;               /* sentinel: leave alone */
        obj->field24 = 0x8000;            /* 0.5 in 16.16 */
        obj->field28 = 5;

        *mk3_frame(thread, thread->frame + 1) = 0xb82;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    MKEvent_Add(4, 0x36, 0, (long)obj->field00->field08);

    obj->field38 = (uint32_t)(uintptr_t)t_ken_masters_xfer;
    xfer_otherguy(obj);

    obj->field1c = 0x10000;           /* 1.0 in 16.16 */
    away_x_vel(obj);

    obj->field24 = 0x5000;            /* 0.3125 in 16.16 */
    obj->field20 = 0xffe70000u;       /* -25.0 in 16.16 */
    obj->field08->field1c = obj->field20;
    obj->field08->field20 = obj->field24;

    obj->field40 = 0x1e;              /* 30, SCKNOCKDOWN */
    get_char_ani(obj);

    obj->field1c = 0xf;
    init_anirate(obj);

    *mk3_frame(thread, thread->frame + 1) = 0xb6b;
    thread->fieldfc = 1;
    return 1;
}


long t_wait_forever(struct MK3THREAD *thread);
long t_separate_us(struct MK3THREAD *thread);


/* -------------------------------------------------------------------- t_ccp3
 *
 * armv7 0x000477bc, three hundred and fifty-two bytes.
 *
 *      state 0 only
 *          am_i_joy(obj)
 *          if (obj->field5c) {
 *              is_stick_away(obj)
 *              if (!obj->field5c) obj->field34 = obj->field30
 *          }
 *          obj->field1c = obj->field00->field4c
 *          if (obj->field1c < obj->field34)
 *              pop one level, plain
 *          else
 *              pop-erase three times over, each restoring the level below
 *              before the next, and land on `t_separate_us`
 *
 * **The corner check reads differently for a human and the machine.** A
 * human's answer comes from `is_stick_away` -- if he is not holding back,
 * `field34` is overwritten from `field30` before the comparison runs at
 * all. The AI skips straight to the comparison with whatever `field34`
 * already holds. Either way the same test decides the outcome:
 * `p_hit`'s mirror at field4c against field34, the identical shape
 * `t_avoid_corner_trap` uses for its own hit-count threshold.
 *
 * **Below the threshold, it is one ordinary pop.** At or past it, the
 * routine erases itself from the call stack THREE LEVELS DEEP -- the same
 * below/carried shuffle `t_knee_check` and `t_elbow_check` use once each,
 * chained three times in a row -- and only the last of the three lands on
 * a real destination, `t_separate_us`; the first two erasures land on
 * `t_local_reaction_exit` only if the stack runs out early, which is the
 * same safety floor every one-shot pop in this file falls back to.
 */
long t_ccp3(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t below, carried;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    am_i_joy(obj);
    if (obj->field5c != 0) {
        is_stick_away(obj);
        if (obj->field5c == 0)
            obj->field00->field34 = obj->field00->field30;
    }

    obj->field1c = obj->field00->field4c;
    if ((long)obj->field1c < (long)obj->field00->field34) {
        if ((long)thread->frame > 0) {
            thread->frame = thread->frame - 1;
            return 0;
        }
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    }

    /* First erasure. */
    if ((long)thread->frame <= 0)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    below   = mk3_frame(thread, thread->frame + 1)[1];
    carried = *mk3_frame(thread, thread->frame + 2);
    *mk3_frame(thread, thread->frame + 1) = carried;
    mk3_frame(thread, thread->frame)[1] = below;

    /* Second erasure. */
    if ((long)thread->frame <= 0)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    below   = mk3_frame(thread, thread->frame + 1)[1];
    carried = *mk3_frame(thread, thread->frame + 2);
    *mk3_frame(thread, thread->frame + 1) = carried;
    mk3_frame(thread, thread->frame)[1] = below;

    /* Third erasure, landing on t_separate_us. */
    if ((long)thread->frame <= 0)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    below   = mk3_frame(thread, thread->frame + 1)[1];
    carried = *mk3_frame(thread, thread->frame + 2);
    *mk3_frame(thread, thread->frame + 1) = carried;

    return mk3_install(thread, (MK3THREADFUNC)t_separate_us);
}


/* -------------------------------------------------------------- t_check_stay_down
 *
 * armv7 0x00042004, two hundred and twenty-four bytes.
 *
 *      state 0 only
 *          obj->field2c = obj->field00->field10
 *          if (obj->field2c & 0x40) {
 *              pop-erase once, install t_wait_forever
 *          } else {
 *              obj->field1c = (int16_t)G[0x45c]
 *              if (raw == 0 || obj->field1c == 3) goto plain-pop
 *              obj->field20 = obj->field00->field08 + 1
 *              if (obj->field20 == obj->field1c) goto plain-pop
 *              -- otherwise, treat it as the 0x40-bit-set case: pop-erase
 *                 once, install t_wait_forever
 *          }
 *      plain-pop: one ordinary pop
 *
 * **The stay-down bit overrides the round status.** If bit 6 of the
 * header's field10 is already up, this erases itself and installs
 * `t_wait_forever` without even looking at the round -- that bit alone is
 * enough to keep a fighter down. Otherwise it reads `G[0x45c]`, the same
 * status word `t_check_winner_status` reads, and only when the round is
 * live (nonzero) AND not finished (not 3) AND the strength index plus one
 * matches does it fall through to a plain pop; every other combination --
 * including the round having just ended -- routes into the SAME
 * erase-and-wait as the explicit stay-down bit.
 */
long t_check_stay_down(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint16_t raw;
    uint32_t below, carried;

    if (*mk3_frame(thread, thread->frame + 1) != 0)
        return -3;

    obj->field2c = obj->field00->field10;

    if ((obj->field2c & 0x40) == 0) {
        raw = *(const uint16_t *)(const void *)(G_BYTES + 0x45c);
        obj->field1c = (uint32_t)(int32_t)(int16_t)raw;

        if (raw != 0 && (int32_t)obj->field1c != 3) {
            obj->field20 = obj->field00->field08 + 1;
            if (obj->field20 == obj->field1c)
                goto plain_pop;
        } else {
            goto plain_pop;
        }
    }

    if ((long)thread->frame <= 0)
        return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
    thread->frame = thread->frame - 1;
    below   = mk3_frame(thread, thread->frame + 1)[1];
    carried = *mk3_frame(thread, thread->frame + 2);
    *mk3_frame(thread, thread->frame + 1) = carried;
    mk3_frame(thread, thread->frame)[1] = below;

    return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);

plain_pop:
    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ----------------------------------------------------------------- t_combo1
 *
 * armv7 0x00045280, two hundred bytes.
 *
 *      state 0
 *          obj->field1c = 4 ; create_blood_proc(obj)
 *          obj->field1c = 0x20000 ; away_x_vel(obj)              ; 2.0
 *          obj->field40 = 0x1c ; get_char_ani(obj)
 *          obj->field44 = obj->field40 ; obj->field40 += 0xc
 *          do_next_a9_frame(obj)
 *          token = 0xc77 ; thread->fieldfc = 3 ; return 3
 *      state 0xc77
 *          obj->field40 = obj->field44 ; obj->field1c = 4
 *          push t_mframew                             (0xc7a)
 *      state 0xc7a
 *          install t_local_reaction_exit
 *
 * `a10` -- the argument slot, not p_hit; this function works on `obj`
 * directly rather than through `obj->field00` -- parks `field40`'s value
 * across `do_next_a9_frame`'s three-tick wait and restores it afterward.
 * The same slot other functions in this file use for a countdown is used
 * here to carry a single animation-cursor value instead.
 */
long t_combo1(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field1c = 4;
        create_blood_proc(obj);

        obj->field1c = 0x20000;         /* 2.0 in 16.16 */
        away_x_vel(obj);

        obj->field40 = 0x1c;
        get_char_ani(obj);

        obj->a10 = obj->field40;
        obj->field40 = obj->field40 + 0xc;
        do_next_a9_frame(obj);

        *mk3_frame(thread, thread->frame + 1) = 0xc77;
        thread->fieldfc = 3;
        return 3;
    }

    if (token == 0xc77) {
        obj->field40 = obj->a10;
        obj->field1c = 4;

        *mk3_frame(thread, thread->frame + 1) = 0xc7a;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_mframew;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xc7a)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


long t_land_on_my_back(struct MK3THREAD *thread);
void set_no_block(MK3OBJ *obj);
void create_fx(MK3OBJ *obj);


/* ---------------------------------------------------------------- t_combo43
 *
 * armv7 0x00045ddc, two hundred and forty-eight bytes.
 *
 *      state 0
 *          obj->field30 = 0 ; obj->field34 = 0 ; obj->field38 = 9
 *          push t_reaction_start                      (0xce8)
 *      state 0xce8
 *          set_no_block(obj)
 *          obj->field1c = 4 ; create_blood_proc(obj)
 *          obj->field1c = 2 ; group_sound(obj)
 *          rsnd_func(obj, 0xa)
 *          obj->field1c = 0xe ; create_fx(obj)
 *          obj->field48 = 0xa000a ; shake_a11(obj)
 *          obj->field1c = 0xa0000                       ; 10.0
 *          obj->field20 = obj->field1c - 0x120000        ; -8.0
 *          obj->field24 = obj->field20 + 0x88000         ; 0.53125
 *          obj->field28 = 5 ; obj->field40 = 5 + 0x19    ; 30, SCKNOCKDOWN
 *          push t_flight                                (0xcfb)
 *      state 0xcfb
 *          install t_land_on_my_back
 *
 * Sets `field38 = 9` before the reaction even starts -- a plain word, not
 * a handler, unlike every other reaction that parks a routine there. This
 * combo finisher then blocks blocking outright (`set_no_block`), sprays
 * blood and an effect, shakes, and launches on the same 10.0/-8.0 pair
 * (net -8.0 velocity against a small positive `field24`) that lands on
 * animation 30 -- the knockdown every hard fall in this file shares --
 * before handing the landing to `t_land_on_my_back` once the flight ends.
 */
long t_combo43(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field30 = 0;
        obj->field00->field34 = 0;
        obj->field00->field38 = 9;

        *mk3_frame(thread, thread->frame + 1) = 0xce8;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_reaction_start;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xcfb)
        return mk3_install(thread, (MK3THREADFUNC)t_land_on_my_back);

    if (token != 0xce8)
        return -3;

    set_no_block(obj);

    obj->field1c = 4;
    create_blood_proc(obj);

    obj->field1c = 2;
    group_sound(obj);

    rsnd_func(obj, 0xa);

    obj->field1c = 0xe;
    create_fx(obj);

    obj->field48 = 0xa000a;
    shake_a11(obj);

    obj->field1c = 0xa0000;                     /* 10.0 in 16.16 */
    obj->field20 = obj->field1c - 0x120000;     /* -8.0 */
    obj->field24 = obj->field20 + 0x88000;      /* 0.53125 */
    obj->field28 = 5;
    obj->field40 = 5 + 0x19;                    /* 30, SCKNOCKDOWN */

    *mk3_frame(thread, thread->frame + 1) = 0xcfb;
    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* --------------------------------------------------------- t_death_slam_pause
 *
 * armv7 0x00049a64, two hundred and four bytes.
 *
 *      state 0
 *          death_scream(obj)
 *          obj->field40 = 0x1e ; find_ani_part2(obj) ; find_last_frame(obj)
 *          do_next_a9_frame(obj)
 *          save obj->field48 on the arg ring
 *          obj->field48 = 0x80005 ; shake_a11(obj)
 *          restore obj->field48 from the ring
 *          tsound_func(obj, 0x81)
 *          token = 0x1e4 ; thread->fieldfc = 3 ; return 3
 *      state 0x1e4
 *          pose_stumble_frame_1(obj) ; pop
 *
 * **field48 is borrowed and given back in the same breath.** It is saved
 * on `thread->args` before `shake_a11` needs a fresh event id there and
 * restored the instruction after the call returns -- the shortest save
 * this file makes, one call wide, rather than spanning a push the way
 * `t_reaction_start` spans its child.
 */
long t_death_slam_pause(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);
    uint32_t cur, saved;

    if (token == 0) {
        death_scream(obj);

        obj->field40 = 0x1e;
        find_ani_part2(obj);
        find_last_frame(obj);
        do_next_a9_frame(obj);

        cur = thread->fieldf8;
        saved = obj->field48;
        *mk3_arg(thread, cur) = saved;
        thread->fieldf8 = cur + 1;

        obj->field48 = 0x80005;
        shake_a11(obj);

        thread->fieldf8 = thread->fieldf8 - 1;
        obj->field48 = *mk3_arg(thread, thread->fieldf8);

        tsound_func(obj, 0x81);

        *mk3_frame(thread, thread->frame + 1) = 0x1e4;
        thread->fieldfc = 3;
        return 3;
    }

    if (token != 0x1e4)
        return -3;

    pose_stumble_frame_1(obj);

    if ((long)thread->frame > 0) {
        thread->frame = thread->frame - 1;
        return 0;
    }
    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


long t_animate_a0_frames(struct MK3THREAD *thread);
long t_d_beware(struct MK3THREAD *thread);
long t_d_beware_mframew(struct MK3THREAD *thread);


/* ------------------------------------------------------------ t_dizzy_by_boss
 *
 * armv7 0x00043f18, a hundred and fifty-two bytes.
 *
 *      state 0
 *          part->field18 = 0x620 ; obj->field1c = 0x620
 *          obj->field40 = 0x25 ; get_char_ani(obj)
 *          obj->field1c = 0x25 (reloaded via a literal after the call)
 *          push t_animate_a0_frames                   (0xd8d)
 *      state 0xd8d
 *          install t_local_reaction_exit
 */
long t_dizzy_by_boss(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0) {
        obj->field00->field18 = 0x620;
        obj->field1c = 0x620;

        obj->field40 = 0x25;
        get_char_ani(obj);

        obj->field1c = 0x25;

        *mk3_frame(thread, thread->frame + 1) = 0xd8d;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_animate_a0_frames;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token != 0xd8d)
        return -3;

    return mk3_install(thread, (MK3THREADFUNC)t_local_reaction_exit);
}


/* ------------------------------------------------------- t_drone_flipk_getup
 *
 * armv7 0x00041410, three hundred and eight bytes -- seven states, one for
 * each numbered stop between 0xe10 and 0xe17.
 *
 *      state 0
 *          obj->field1c = 3
 *          push t_d_beware_mframew                    (0xe10)
 *      state 0xe10
 *          push t_d_beware                             (0xe12)
 *      state 0xe12
 *          thread->fieldfc = 1 ; return 1              ; continues as 0xe13
 *      state 0xe13
 *          push t_d_beware                             (0xe14)
 *      state 0xe14
 *          thread->fieldfc = 1 ; return 1              ; continues as 0xe15
 *      state 0xe15
 *          push t_d_beware                             (0xe16)
 *      state 0xe16
 *          thread->fieldfc = 1 ; return 1              ; continues as 0xe17
 *      state 0xe17
 *          install t_getup_reaction_exit
 *
 * **The wait states are the same eleven bytes twice over, and the register
 * that makes it work is a coincidence of the dispatch order, not a shared
 * routine.** In the binary, states 0xe12 and 0xe14 branch into ONE block
 * that stores whatever the CPU's `ip` register happens to hold and sleeps.
 * `ip` gets there by falling out of a failed comparison one step earlier in
 * the dispatch chain -- checking "is this 0xe13" leaves 0xe13 sitting in a
 * register that state 0xe12 then stores as its own next token, and the same
 * happens with 0xe15 for state 0xe14. It works because the numbering is
 * sequential and the compiler's own dispatch order matches it; nothing
 * about the source needed to know that. The C here writes each state's
 * real continuation directly rather than reproducing the register reuse,
 * which is what `landfn.sh` checks: the STORED VALUES match, however they
 * got into the register that wrote them.
 *
 * `t_d_beware` is pushed three times running, once per odd-to-even step,
 * and `t_d_beware_mframew` once at the very start -- a getup with three
 * separate glances before the fighter is finally handed to
 * `t_getup_reaction_exit`.
 */
long t_drone_flipk_getup(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0xe13) {
        *mk3_frame(thread, thread->frame + 1) = 0xe14;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_d_beware;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xe12) {
        *mk3_frame(thread, thread->frame + 1) = 0xe13;
        thread->fieldfc = 1;
        return 1;
    }

    if (token == 0xe15) {
        *mk3_frame(thread, thread->frame + 1) = 0xe16;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_d_beware;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xe16) {
        *mk3_frame(thread, thread->frame + 1) = 0xe17;
        thread->fieldfc = 1;
        return 1;
    }

    if (token == 0xe17)
        return mk3_install(thread, (MK3THREADFUNC)t_getup_reaction_exit);

    if (token == 0xe10) {
        *mk3_frame(thread, thread->frame + 1) = 0xe12;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_d_beware;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0xe14) {
        *mk3_frame(thread, thread->frame + 1) = 0xe15;
        thread->fieldfc = 1;
        return 1;
    }

    if (token != 0)
        return -3;

    obj->field1c = 3;

    *mk3_frame(thread, thread->frame + 1) = 0xe10;
    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] =
        (uint32_t)(uintptr_t)t_d_beware_mframew;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


long t_up_2_ceiling(struct MK3THREAD *thread);
long t_wait_forever(struct MK3THREAD *thread);
long t_pit_fall_scan(struct MK3THREAD *thread);
long t_shake_ob_up(struct MK3THREAD *thread);
void set_inviso(MK3OBJ *obj);
MK3THREAD *NewThread(void *owner_p, MK3THREADFUNC func);


/* -------------------------------------------------------------------- t_fall_in_lava
 *
 * armv7 0x0004819c, a hundred and fifty-two bytes.
 *
 *      state 0
 *          token = 0xa46 ; push t_up_2_ceiling
 *      state 0xa46
 *          obj->field08->field2c = obj->field08->field24 + 0x1bc6
 *          token = 0xa48 ; thread->fieldfc = 0xb4 ; return 0xb4
 *      state 0xa48
 *          death_blow_complete(obj)
 *          install t_wait_forever
 *
 * Sends the fighter up before the lava does anything else --
 * `t_up_2_ceiling` runs first -- and only once that pops does the wait
 * begin: 0x1bc6 added to the other object's own field24 and parked in its
 * field2c, then a hundred and eighty frames of nothing before
 * `death_blow_complete` and `t_wait_forever` end it for good.
 */
long t_fall_in_lava(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0xa46) {
        obj->field08->field2c = obj->field08->field24 + 0x1bc6;

        *mk3_frame(thread, thread->frame + 1) = 0xa48;
        thread->fieldfc = 0xb4;
        return 0xb4;
    }

    if (token == 0xa48) {
        death_blow_complete(obj);
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    *mk3_frame(thread, thread->frame + 1) = 0xa46;
    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_up_2_ceiling;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}


/* -------------------------------------------------------------------- t_fall_down_pit
 *
 * armv7 0x0004823c, three hundred and thirty-two bytes -- the OTHER stage
 * hazard `t_background_death`'s table can choose, alongside
 * `t_fall_in_lava` above.
 *
 *      state 0
 *          MKEvent_Add(4, 0x3b, 0, obj->field00->field08)
 *          obj->field1c = 9 ; group_sound(obj) ; obj->field1c = 0
 *          obj->field20 = 0xfff40000                    ; -12.0
 *          obj->field24 = 0x6000                        ; 0.375
 *          obj->field28 = 5 ; obj->field40 = 5 + 0x19    ; 30, SCKNOCKDOWN
 *          obj->field34 = t_pit_fall_scan                ; parked, not run
 *          push t_flight_call                            (0x9e2)
 *      state 0x9e2
 *          obj->field1c = 0x1a ; create_fx(obj)
 *          NewThread(obj, t_machine_sound)
 *          NewThread(obj, t_bone_grind_sound)
 *          obj->field1c = 5 ; obj->field20 = 3 ; obj->field24 = 3
 *          push t_shake_ob_up                            (0x9ed)
 *      state 0x9ed
 *          set_inviso(obj)
 *          MKEvent_Add(4, 0x3c, 0, obj->field00->field08)
 *          token = 0x9f0 ; thread->fieldfc = 0x60 ; return 0x60
 *      state 0x9f0
 *          death_blow_complete(obj)
 *          install t_wait_forever
 *
 * **Two independent sound threads, spawned and left running.** Neither
 * `NewThread` call is saved anywhere -- this routine never touches them
 * again -- so `t_machine_sound` and `t_bone_grind_sound` each finish on
 * their own schedule (three and six plays, per their own banners) and
 * delete themselves through `MK3_THREAD_DONE`, independent of whichever
 * state this function is in by the time they do.
 *
 * `field34` is parked with `t_pit_fall_scan` during the fall but nothing
 * in this function ever installs or calls it -- the same handover shape
 * used elsewhere in this file for a routine some OTHER caller picks up,
 * here left for whatever reads the object's own field34 during the flight
 * that follows.
 */
long t_fall_down_pit(MK3THREAD *thread)
{
    MK3OBJ *obj = (MK3OBJ *)thread->proc;
    uint32_t token = *mk3_frame(thread, thread->frame + 1);

    if (token == 0x9e2) {
        obj->field1c = 0x1a;
        create_fx(obj);

        NewThread(obj, (MK3THREADFUNC)t_machine_sound);
        NewThread(obj, (MK3THREADFUNC)t_bone_grind_sound);

        obj->field1c = 5;
        obj->field20 = 3;
        obj->field24 = 3;

        *mk3_frame(thread, thread->frame + 1) = 0x9ed;
        thread->frame = thread->frame + 1;
        mk3_frame(thread, thread->frame)[1] =
            (uint32_t)(uintptr_t)t_shake_ob_up;
        *mk3_frame(thread, thread->frame + 1) = 0;
        return 0;
    }

    if (token == 0x9ed) {
        set_inviso(obj);
        MKEvent_Add(4, 0x3c, 0, (long)obj->field00->field08);

        *mk3_frame(thread, thread->frame + 1) = 0x9f0;
        thread->fieldfc = 0x60;
        return 0x60;
    }

    if (token == 0x9f0) {
        death_blow_complete(obj);
        return mk3_install(thread, (MK3THREADFUNC)t_wait_forever);
    }

    if (token != 0)
        return -3;

    MKEvent_Add(4, 0x3b, 0, (long)obj->field00->field08);

    obj->field1c = 9;
    group_sound(obj);
    obj->field1c = 0;

    obj->field20 = 0xfff40000u;      /* -12.0 in 16.16 */
    obj->field24 = 0x6000;           /* 0.375 in 16.16 */
    obj->field28 = 5;
    obj->field40 = 5 + 0x19;         /* 30, SCKNOCKDOWN */
    obj->field34 = (uint32_t)(uintptr_t)t_pit_fall_scan;

    *mk3_frame(thread, thread->frame + 1) = 0x9e2;
    thread->frame = thread->frame + 1;
    mk3_frame(thread, thread->frame)[1] = (uint32_t)(uintptr_t)t_flight_call;
    *mk3_frame(thread, thread->frame + 1) = 0;
    return 0;
}
