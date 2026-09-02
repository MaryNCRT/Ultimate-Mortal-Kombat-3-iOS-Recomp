/*
 * other.c — src/gamecode/logic/other.c (process scheduler)
 *
 * The fight engine runs on cooperative "threads": each player object owns a
 * PROC, and state changes are queued rather than applied directly. This file
 * is the queueing side of that machinery.
 *
 * Hand-written from the disassembly of the armv7 slice and verified against
 * the oracle: tests/test_switchqueue_diff.c.
 *
 * The entry points into this system, all confirmed present in the binary:
 *
 *   _StartThreadAt    0x00056cac
 *   _KillSThread      0x00056cbc
 *   _KillProc         0x00056d14
 *   _SwitchQueue      0x00055ed4   <- implemented here
 *   _DoSwitchJump     0x00055efc   <- dispatches through function pointers
 *   _QueueAndJump     0x000572b8
 *   _UnstackSwitches  0x000573e8
 *   _clear_queues     0x00058974
 *
 * Note _DoSwitchJump reaches its target through a table of function pointers,
 * so the static recompiler cannot follow it. It has to be decompiled by hand
 * and checked by observation against the game running in touchHLE.
 */

#include <stdint.h>


/* ------------------------------------------------------------------------
 * The player object, as far as isp2 establishes it.
 *
 * Two offsets only. Everything else about this struct is unmapped and stays
 * that way -- a placeholder array would imply a size nobody has measured.
 * ------------------------------------------------------------------------ */
typedef struct MK3OBJPROC {
    uint8_t  _pad00[4];
    uint32_t him;                /* 0x04  the opponent, per f_set_a10_to_him */
    uint8_t  _pad08[8];
    uint32_t field10;            /* 0x10  isp2 ORs bit 4 into this */
    uint8_t  _pad14[0x2c];
    uint16_t field40;            /* 0x40  ground_player copies it out */
    uint8_t  _pad42[2];
    uint32_t p_hit;              /* 0x44  per zero_my_p_hit */
    uint8_t  _pad48[0x20];
    uint32_t slave;              /* 0x68  per f_set_a10_to_slave */
} MK3OBJPROC;

typedef struct MK3OBJ {
    MK3OBJPROC *field00;         /* 0x00  ldr r2, [r4] */
    /* 0x04  the object's thread. KillProc and StartProcAt both take it out of
     * here and hand it to KillSThread / StartThreadAt, which is what makes the
     * pair the object-level spelling of the thread-level calls. */
    void       *thread;          /* 0x04 */
    struct MK3OBJ *field08;      /* 0x08  another object: player_swpal writes
                                  *       through it and ani2 passes it on */
    uint8_t     _pad0c[6];
    uint16_t    field12;         /* 0x12  a signed halfword offset; see
                                  *       highest_mpart_ob and lowest_mpart_ob */
    uint8_t     _pad14[4];
    uint32_t    field18;         /* 0x18  the A8 pair, cleared together */
    uint32_t    field1c;         /* 0x1c  and the high bound */
    uint32_t    field20;         /* 0x20  and the low one */
    uint8_t     _pad24[4];
    uint32_t    field28;         /* 0x28  bit 4 toggled by the flip_multi trio */
    uint32_t    field2c;         /* 0x2c  receives the same OR-ed value */
    uint8_t     _pad30[8];
    uint32_t    field38;         /* 0x38  the base highest_mpart_ob adds to */
    uint8_t     _pad3c[4];
    uint32_t    field40;         /* 0x40  and the one lowest_mpart_ob adds to */
    /* 0x44  what used to be the A10 register: the argument slot the arcade
     * loaded before a call. Three of the routines below do nothing but fill
     * it. */
    uint32_t    a10;             /* 0x44 */
    uint8_t     _pad48[0x5c];
    uint32_t    threadIndex;     /* 0xa4  scaled by 8 to index from the object */
} MK3OBJ;

/* Called by isp2 and decompiled elsewhere. Declared, not defined: this file
 * owns the sequencing and not the steps. */
void face_opponent(MK3OBJ *obj);
void set_no_block(MK3OBJ *obj);
void me_in_front(MK3OBJ *obj);
void player_normpal(MK3OBJ *obj);
void disable_all_buttons(MK3OBJ *obj);

/*
 * The ring buffer.
 *
 * `head` is a pointer, not an index — the original advances it with a
 * post-indexed store and wraps by comparing against the end of the array.
 * Twenty slots: the wrap check is against `q + 0x54`, the writes start at
 * `q + 4`, and each entry is four bytes.
 */
#define SWITCH_QUEUE_SLOTS  20

typedef struct SWITCHQUEUE {
    uint32_t *head;                        /* +0x00 */
    uint32_t  slots[SWITCH_QUEUE_SLOTS];   /* +0x04 .. +0x53 */
} SWITCHQUEUE;

/*
 * The global game-state pointer.
 *
 * The original is NOT a function call. It loads a pointer from
 * `__DATA,__nl_symbol_ptr` at 0x000f357c, dereferences it, and reads a
 * uint16 at +0xa8:
 *
 *     ldr    r2, [pc, #0x20]     ; literal -> 0x0009d6a0
 *     add    r2, pc              ; -> 0x000f357c
 *     ldr    r2, [r2]            ; -> _G  (0x0038c1fc)
 *     ldrh.w r2, [r2, #0xa8]
 *
 * The symbol at the end of that chain is `_G`, the game's global state
 * struct. An earlier version of this file declared
 * `extern uint16_t proc_switch_counter(void)` and called it, which is
 * behaviourally equivalent under the differential test but structurally
 * wrong: there is no such function in the binary and no such name in its
 * symbol table. The name came from notes derived from a source we do not
 * use. What the binary does is read a field, so that is what this says.
 *
 * The field's purpose — a scheduling generation counter — is inferred from
 * how the value is used, and stays inferred until something confirms it.
 */
typedef struct GAMESTATE GAMESTATE;
extern GAMESTATE *G;                       /* 0x0038c1fc */

#define G_SWITCH_COUNTER(g)  (*(const uint16_t *)((const char *)(g) + 0xa8))

/*
 * Push a value onto a process's switch queue.
 *
 * Each entry packs two 16-bit halves:
 *   low  16 bits — a counter read from the global state struct at +0xa8
 *   high 16 bits — the caller's value
 *
 * so a consumer can tell which scheduling generation an entry belongs to.
 *
 * The wrap is deliberately checked *after* the store, which means the last
 * slot is written and then `head` resets. Reordering it would drop an entry.
 */
void SwitchQueue(uint16_t value, SWITCHQUEUE *q)
{
    uint32_t packed = (uint32_t)G_SWITCH_COUNTER(G)
                    | ((uint32_t)value << 16);

    *q->head = packed;
    q->head++;

    if (q->head >= &q->slots[SWITCH_QUEUE_SLOTS]) {
        q->head = &q->slots[0];
    }
}


/* ------------------------------------------------------------------ isp2
 *
 * armv7 0x00058798, 48 bytes.  `_isp2`
 *
 * The first function decompiled out of `gamecode`, and it is mostly a
 * sequencer: five calls in order, then two stores, then a sixth call.
 *
 *      face_opponent(obj)
 *      set_no_block(obj)
 *      me_in_front(obj)
 *      player_normpal(obj)
 *      flags = obj->field00->field10 | 0x10
 *      obj->field2c = flags
 *      obj->field00->field10 = flags
 *      disable_all_buttons(obj)
 *
 * ## What the two stores are, and what they are not
 *
 *      ldr r2, [r4]           ; obj->field00 -- a POINTER
 *      ldr r3, [r2, #0x10]
 *      orr r3, r3, #0x10
 *      str r3, [r4, #0x2c]    ; into the OBJECT
 *      str r3, [r2, #0x10]    ; and back into whatever field00 points at
 *
 * The same value lands in two places, which is worth noticing rather than
 * tidying: `obj->field2c` is not a copy that drifts, it is set from the
 * combined value at the moment the bit goes in.
 *
 * ## Names not given
 *
 * `field00` is a pointer to something carrying a flags word at `+0x10`. The
 * header of this file says each player object owns a PROC, and a process
 * pointer at offset zero would fit — but "would fit" is not the standard this
 * project holds itself to, and one function reading an offset is a hypothesis.
 * So both fields are named by offset and the bit is left as `0x10`.
 *
 * Nor is the function's own name interpreted. `isp2` sits beside `gup2` in the
 * two-player code and it is tempting to read it as something about player two;
 * nothing here supports that, and the five calls it makes are all
 * player-agnostic.
 *
 * Verified against the oracle by tests/test_isp2_diff.c: the call ORDER and the
 * two stores, over a sweep of starting flag values.
 */
void isp2(MK3OBJ *obj)
{
    uint32_t flags;

    face_opponent(obj);
    set_no_block(obj);
    me_in_front(obj);
    player_normpal(obj);

    flags = obj->field00->field10 | 0x10u;
    obj->field2c = flags;
    obj->field00->field10 = flags;

    disable_all_buttons(obj);
}


/* ------------------------------------------------------------------------
 * The A10 loaders.
 *
 * armv7 0x00057594 and 0x0005759c, four bytes each.  **Complete.**
 *
 *      ldr r3, [r0]        ; the object's PROC
 *      ldr r3, [r3, #4]    ; or #0x68
 *      str r3, [r0, #0x44]
 *
 * Two instructions and a store, and the only difference between them is which
 * field of the PROC is read. The names say what those fields are -- `him` and
 * `slave` -- and that is the whole of what is established: 0x04 of a PROC is
 * the opponent and 0x68 is the slave object.
 * ------------------------------------------------------------------------ */
void f_set_a10_to_him(MK3OBJ *obj)
{
    obj->a10 = obj->field00->him;
}

void f_set_a10_to_slave(MK3OBJ *obj)
{
    obj->a10 = obj->field00->slave;
}


/* ---------------------------------------------------------------- player_swpal
 *
 * armv7 0x00057480, six bytes.  **Complete.**
 *
 *      ldr r3, [r0, #8]
 *      str r1, [r3, #0x44]
 *
 * Writes the caller's second argument into the OTHER object's A10 slot -- not
 * its own. "swpal" is swap palette, and the value goes where an argument goes,
 * so this sets up the call rather than performing it.
 *
 * The argument is a flag and not a palette. Its only two callers are
 * `player_normpal`, which passes 0, and `player_froze_pal`, which passes 1.
 */
void player_swpal(MK3OBJ *obj, uint32_t frozen)
{
    obj->field08->a10 = frozen;
}


/* -------------------------------------------------------------------- stop_a8
 *
 * armv7 0x00055a60, six bytes.  **Complete.**
 *
 * Clears 0x18 and 0x1c together. The name gives them as the A8 pair; what the
 * pair MEANS is not in these three instructions and is not guessed at here.
 */
void stop_a8(MK3OBJ *obj)
{
    obj->field18 = 0;
    obj->field1c = 0;
}


/* ------------------------------------------------------------- zero_my_p_hit
 *
 * armv7 0x00054ec8, six bytes.  **Complete.**
 *
 *      ldr r0, [r0]        ; note r0 is REASSIGNED
 *      str r3, [r0, #0x44]
 *
 * The store goes through the PROC, so this clears the PROC's 0x44 and not the
 * object's. Same offset, different struct -- worth stating, because the three
 * routines above write the object's.
 */
void zero_my_p_hit(MK3OBJ *obj)
{
    obj->field00->p_hit = 0;
}


/* ------------------------------------------------------------- GetThreadFunc
 *
 * armv7 0x000575dc, ten bytes.  **Complete.**
 *
 *      ldr.w r3, [r0, #0xa4]
 *      lsls  r3, r3, #3        ; times eight
 *      adds  r3, r3, r0        ; from the object itself
 *      ldr   r0, [r3, #4]
 *
 * An array of eight-byte entries laid out at the object's own address, indexed
 * by 0xa4, and the function is the second word of the entry. The array
 * OVERLAPS the fields above -- entry 0 is the object's first eight bytes -- so
 * the index is never small in practice; nothing here says what its range is.
 */
void *GetThreadFunc(MK3OBJ *obj)
{
    const uint32_t *entry =
        (const uint32_t *)((const char *)obj + obj->threadIndex * 8);
    return (void *)(uintptr_t)entry[1];
}


/* -------------------------------------------------- KillProc and StartProcAt
 *
 * armv7 0x00056d14 and 0x00056cd0, ten bytes each.  **Complete.**
 *
 * The object-level spelling of the two thread calls this file's header lists.
 * Each takes the thread out of the object and forwards it unchanged.
 */
void KillSThread(void *thread);
void StartThreadAt(void *thread);

void KillProc(MK3OBJ *obj)
{
    KillSThread(obj->thread);
}

void StartProcAt(MK3OBJ *obj)
{
    StartThreadAt(obj->thread);
}


/* ------------------------------------------------------- the object wrappers
 *
 * armv7 0x00055070, 0x000551f0, 0x00058508 and 0x00059750, ten bytes each.
 * **Complete.**
 *
 * Four of the same shape:
 *
 *      mov r1, r0          ; or: ldr r1, [r0, #8]
 *      bl  <the real one>
 *
 * r0 is not touched, so the callee receives the object twice -- as the subject
 * and as the target. The suffixed names are the ones that take the target
 * explicitly and these are the convenience spellings that supply it, which is
 * why `am_i_airborn` and `aborn4` are not the same function.
 *
 * `ani2` is the exception: it passes the object at 0x08 rather than itself, so
 * `ani2_ob` acts on the other one.
 */
long aborn4(MK3OBJ *obj, MK3OBJ *target);
long am_i_facing_him_px(MK3OBJ *obj, MK3OBJ *target);
void ani2_ob(MK3OBJ *obj, MK3OBJ *target);
void back_to_normal_px(MK3OBJ *obj, MK3OBJ *target);

long am_i_airborn(MK3OBJ *obj)
{
    return aborn4(obj, obj);
}

long am_i_facing_him(MK3OBJ *obj)
{
    return am_i_facing_him_px(obj, obj);
}

void ani2(MK3OBJ *obj)
{
    ani2_ob(obj, obj->field08);
}

void back_to_normal(MK3OBJ *obj)
{
    back_to_normal_px(obj, obj);
}


/* ------------------------------------------------------------- the flip_multi trio
 *
 * armv7 0x00055358, 0x00055364 and 0x00055394.  **Complete.**
 *
 *      _ob:  obj->field28  ^= 0x10
 *      _px:  target->field08->field28 ^= 0x10
 *      bare: flip_multi_px(obj, obj)
 *
 * The same bit 4 at 0x28 in all three, reached through a different number of
 * pointers. `isp2` above ORs bit 4 into 0x10 of the PROC; this is a different
 * field of a different struct and the shared bit number is a coincidence worth
 * naming as one.
 */
void flip_multi_ob(MK3OBJ *obj)
{
    obj->field28 ^= 0x10u;
}

void flip_multi_px(MK3OBJ *obj, MK3OBJ *target)
{
    (void)obj;                          /* r0 is not read */
    target->field08->field28 ^= 0x10u;
}

void flip_multi(MK3OBJ *obj)
{
    flip_multi_px(obj, obj);
}


/* -------------------------------------------------------------- face_opponent
 *
 * armv7 0x00055388, ten bytes.  **Complete.**
 *
 * Declared at the top of this file because `isp2` calls it; here is the body.
 * It is the wrapper, and `face_opponent_px` does the work.
 */
void face_opponent_px(MK3OBJ *obj, MK3OBJ *target);

void face_opponent(MK3OBJ *obj)
{
    face_opponent_px(obj, obj);
}


/* --------------------------------------------------------- gmo_proc_insobja8
 *
 * armv7 0x00059c54, eight bytes.  **Complete.**
 *
 * A tail call to `getobjectinsert` with the arguments untouched -- not even a
 * register move. The wrapper exists for the name.
 */
void *getobjectinsert(MK3OBJ *obj);

void *gmo_proc_insobja8(MK3OBJ *obj)
{
    return getobjectinsert(obj);
}


/* ------------------------------------------------------------- ground_player
 *
 * armv7 0x0005533c, ten bytes.  **Complete.**
 *
 *      ldr   r3, [r0, #8]
 *      ldr   r0, [r0]
 *      ldrh  r0, [r0, #0x40]
 *      strh  r0, [r3, #0x12]
 *
 * Copies a halfword from the PROC's 0x40 to the other object's 0x12. Both are
 * 16-bit; the load is unsigned and the store keeps the low half, so no sign
 * question arises here -- though `highest_mpart_ob` below reads the same 0x12
 * as SIGNED, which is worth knowing before anyone widens it.
 */
void ground_player(MK3OBJ *obj)
{
    obj->field08->field12 = (uint16_t)obj->field00->field40;
}


/* ------------------------------------------- highest_mpart_ob, lowest_mpart_ob
 *
 * armv7 0x0005579c and 0x00055820, ten bytes each.  **Complete.**
 *
 *      highest:  out->field1c = src->field38 + (int16_t)src->field12
 *      lowest:   out->field20 = src->field40 + (int16_t)src->field12
 *
 * `ldrsh`, so 0x12 is signed here. Two bounds, one offset added to both, and
 * the results land in adjacent words -- which is what a pair of bounds looks
 * like. Which axis is not established.
 */
void highest_mpart_ob(MK3OBJ *out, MK3OBJ *src)
{
    out->field1c = (uint32_t)(src->field38 + (int32_t)(int16_t)src->field12);
}

void lowest_mpart_ob(MK3OBJ *out, MK3OBJ *src)
{
    out->field20 = (uint32_t)(src->field40 + (int32_t)(int16_t)src->field12);
}


/* --------------------------------------------------- isa5 and joystick_in_a0
 *
 * armv7 0x00055dc4 and 0x00055d94, ten bytes each.  **Complete.**
 *
 * Two more of the wrapper shape.
 */
long isa5_px(MK3OBJ *obj, MK3OBJ *target);
long joystick_in_a0_px(MK3OBJ *obj, MK3OBJ *target);

long isa5(MK3OBJ *obj)
{
    return isa5_px(obj, obj);
}

long joystick_in_a0(MK3OBJ *obj)
{
    return joystick_in_a0_px(obj, obj);
}


/* ----------------------------------------------- player_normpal, player_froze_pal
 *
 * armv7 0x00057488 and 0x000575a4, ten bytes each.  **Complete.**
 *
 * The two callers that name player_swpal's second argument. `player_normpal`
 * is also declared at the top of this file, because `isp2` calls it.
 */
void player_normpal(MK3OBJ *obj)
{
    player_swpal(obj, 0);
}

void player_froze_pal(MK3OBJ *obj)
{
    player_swpal(obj, 1);
}


/* --------------------------------------- strike_check_a0, strike_check_a0_test
 *
 * armv7 0x000594c8 and 0x000595d8, ten bytes each.  **Complete.**
 *
 * The same pair shape: one core, called with 0 and with 1, and the `_test`
 * name on the 1. So the core's second argument asks it to report rather than
 * to act.
 */
long strike_check_a0_core(MK3OBJ *obj, long test_only);

long strike_check_a0(MK3OBJ *obj)
{
    return strike_check_a0_core(obj, 0);
}

long strike_check_a0_test(MK3OBJ *obj)
{
    return strike_check_a0_core(obj, 1);
}
