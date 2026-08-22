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
    uint8_t  _pad00[0x10];
    uint32_t field10;            /* 0x10  isp2 ORs bit 4 into this */
} MK3OBJPROC;

typedef struct MK3OBJ {
    MK3OBJPROC *field00;         /* 0x00  ldr r2, [r4] */
    uint8_t     _pad04[0x28];
    uint32_t    field2c;         /* 0x2c  receives the same OR-ed value */
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
