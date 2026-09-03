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
/* Declared as arrays so the NAME is the address, without claiming anything
 * about what is stored there. `extern void *x` would say these are variables
 * holding pointers; they are code and a table. */
extern char t_check_stay_down[];
extern char t_check_winner_status[];
extern char t_local_reaction_exit[];
extern char t_d_getup[];
extern char t_getup_stay_ducked[];
extern char t_joy_getup_abort[];

/* A data table, not a resume target. */
extern char getup_speeds[];

/* Decompiled elsewhere; this file owns the sequencing, not the steps. */
void back_to_normal(MK3OBJ *obj);
int  am_i_joy(MK3OBJ *obj);
void is_stick_down(MK3OBJ *obj);
void get_char_ani(MK3OBJ *obj);
void init_anirate(MK3OBJ *obj);
void next_anirate(MK3OBJ *obj);
void joystick_in_a0(MK3OBJ *obj);

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

long gup2(struct MK3THREAD *thread);
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



