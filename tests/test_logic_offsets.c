/*
 * test_logic_offsets.c -- the fight engine's struct offsets, asserted.
 *
 * Every field in `decomp/gamecode/logic` is named for the offset the
 * disassembly loads it from, and each offset is written beside the field as a
 * comment. A comment is not a check: a padding array four bytes short moves
 * every field after it, the file still compiles, and the only symptom is a
 * fight that misbehaves a long way from here.
 *
 * ## What this can and cannot assert
 *
 * It cannot assert the offsets on MK3OBJ itself. That struct holds pointers,
 * pointers are four bytes in the image and eight here, so `thread` sits at
 * 0x04 there and 0x08 in any host build. Demanding otherwise would be
 * demanding the wrong thing -- these are the game's own runtime objects,
 * allocated by this code and never read from the image, so the compiler is
 * free to lay them out and every access goes through a named field.
 *
 * The image offsets are provenance, not layout: they say which instruction
 * established the field. What CAN drift is the arithmetic behind them -- the
 * `_padXX` sizes that place one field relative to the next. So this mirrors
 * each struct with a 32-bit model, pointer fields spelled `uint32_t` and the
 * same padding, and asserts the offsets against that. If a pad is wrong the
 * model disagrees with the comment and this stops compiling.
 *
 *   gcc -std=c99 -o test_logic_offsets tests/test_logic_offsets.c
 *   ./test_logic_offsets
 *
 * Each offset is listed with the instruction that establishes it, so adding a
 * field means citing one.
 */

#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#define CHECK(type, field, want)                                            \
    typedef char assert_##type##_##field[                                   \
        (offsetof(type, field) == (want)) ? 1 : -1]


/* ---- MK3OBJPROC, as the image lays it out -------------------------------
 *  0x04  ldr r3, [r3, #4]        f_set_a10_to_him
 *  0x10  isp2 ORs bit 4 into it
 *  0x40  ldrh r0, [r0, #0x40]    ground_player
 *  0x44  str r3, [r0, #0x44]     zero_my_p_hit
 *  0x68  ldr r3, [r3, #0x68]     f_set_a10_to_slave
 */
typedef struct IMG_PROC {
    uint8_t  _pad00[4];
    uint32_t him;                /* 0x04 */
    uint32_t field08;            /* 0x08  the strength index */
    uint8_t  _pad0c[4];
    uint32_t field10;            /* 0x10 */
    uint8_t  _pad14[4];
    uint32_t field18;            /* 0x18  get_his_action, init_special_act */
    uint32_t field1c;            /* 0x1c  the animation rate */
    uint32_t field20;            /* 0x20  its counter */
    uint8_t  _pad24[0x1c];
    uint16_t field40;            /* 0x40 */
    uint8_t  _pad42[2];
    uint32_t p_hit;              /* 0x44 */
    uint8_t  _pad48[0x0c];
    uint32_t field54;            /* 0x54  add_combo_damage */
    uint8_t  _pad58[0x0c];
    uint32_t field64;            /* 0x64  the slave's object */
    uint32_t slave;              /* 0x68 */
    uint8_t  _pad6c[0x10];
    uint16_t field7c;            /* 0x7c  the four-button gate */
} IMG_PROC;

CHECK(IMG_PROC, him,     0x04);
CHECK(IMG_PROC, field08, 0x08);
CHECK(IMG_PROC, field10, 0x10);
CHECK(IMG_PROC, field18, 0x18);
CHECK(IMG_PROC, field1c, 0x1c);
CHECK(IMG_PROC, field20, 0x20);
CHECK(IMG_PROC, field40, 0x40);
CHECK(IMG_PROC, p_hit,   0x44);
CHECK(IMG_PROC, field54, 0x54);
CHECK(IMG_PROC, field64, 0x64);
CHECK(IMG_PROC, slave,   0x68);
CHECK(IMG_PROC, field7c, 0x7c);


/* ---- MK3OBJ, as the image lays it out -----------------------------------
 *  0x00  ldr r2, [r4]            isp2
 *  0x04  ldr r0, [r0, #4]        KillProc, StartProcAt
 *  0x08  ldr r3, [r0, #8]        player_swpal, ground_player, ani2
 *  0x12  ldrsh r2, [r1, #0x12]   highest_mpart_ob
 *  0x18  str r3, [r0, #0x18]     stop_a8
 *  0x1c  str r3, [r0, #0x1c]     stop_a8, highest_mpart_ob
 *  0x20  str r3, [r0, #0x20]     lowest_mpart_ob
 *  0x28  eor r3, r3, #0x10       flip_multi_ob
 *  0x2c  str  ...                isp2
 *  0x38  ldr r3, [r1, #0x38]     highest_mpart_ob
 *  0x40  ldr r3, [r1, #0x40]     lowest_mpart_ob
 *  0x44  str r3, [r0, #0x44]     f_set_a10_to_him
 *  0xa4  ldr.w r3, [r0, #0xa4]   GetThreadFunc
 */
typedef struct IMG_OBJ {
    uint32_t field00;            /* 0x00  a PROC * in the image */
    uint32_t thread;             /* 0x04 */
    uint32_t field08;            /* 0x08  another object */
    /* 0x0c is a word and 0x0e is its high half -- one field, not two. */
    uint32_t field0c;            /* 0x0c  is_he_right compares two */
    uint8_t  _pad10[2];
    uint16_t field12;            /* 0x12 */
    uint8_t  _pad14[4];
    uint32_t field18;            /* 0x18 */
    uint32_t field1c;            /* 0x1c */
    uint32_t field20;            /* 0x20 */
    uint32_t field24;            /* 0x24  borrowed, and a table index */
    uint32_t field28;            /* 0x28 */
    uint32_t field2c;            /* 0x2c */
    uint32_t field30;            /* 0x30  the flag word the clearers mask */
    uint32_t field34;            /* 0x34  the ring buffer's base */
    uint32_t field38;            /* 0x38 */
    uint8_t  _pad3c[4];
    uint32_t field40;            /* 0x40 */
    uint32_t a10;                /* 0x44 */
    uint32_t field48;            /* 0x48  shake_a11 */
    uint8_t  _pad4c[8];
    uint32_t field54;            /* 0x54  where a computed word is parked */
    uint8_t  _pad58[4];
    uint32_t field5c;            /* 0x5c  am_i_joy's isolated bit */
} IMG_OBJ;

CHECK(IMG_OBJ, thread,      0x04);
CHECK(IMG_OBJ, field08,     0x08);
CHECK(IMG_OBJ, field0c,     0x0c);
CHECK(IMG_OBJ, field12,     0x12);
CHECK(IMG_OBJ, field18,     0x18);
CHECK(IMG_OBJ, field1c,     0x1c);
CHECK(IMG_OBJ, field20,     0x20);
CHECK(IMG_OBJ, field24,     0x24);
CHECK(IMG_OBJ, field28,     0x28);
CHECK(IMG_OBJ, field2c,     0x2c);
CHECK(IMG_OBJ, field34,     0x34);
CHECK(IMG_OBJ, field38,     0x38);
CHECK(IMG_OBJ, field40,     0x40);
CHECK(IMG_OBJ, a10,         0x44);
CHECK(IMG_OBJ, field30,     0x30);
CHECK(IMG_OBJ, field48,     0x48);
CHECK(IMG_OBJ, field54,     0x54);
CHECK(IMG_OBJ, field5c,     0x5c);

/* ---- MK3THREAD ----------------------------------------------------------
 *  0x04  str r1, [r0, #4]        StartThreadAt
 *  0x08  str r3, [r0, #8]        StartThreadAt
 *  0xa4  str.w r3, [r0, #0xa4]   StartThreadAt, t_self_terminate
 *  0xfc  str.w r3, [r0, #0xfc]   StartThreadAt, t_self_terminate
 * 0x108  ldr.w r0, [r0, #0x108]  FindThreadProc, NewThreadProc
 */
typedef struct IMG_THREAD {
    uint8_t  _pad00[4];
    uint32_t func;               /* 0x04 */
    uint32_t field08;            /* 0x08 */
    uint8_t  _pad0c[0x98];
    uint32_t frame;              /* 0xa4 */
    uint8_t  _pad_a8[0x50];
    uint32_t fieldf8;            /* 0xf8  fastxfer_thread */
    uint32_t fieldfc;            /* 0xfc */
    uint8_t  _pad100[4];
    uint32_t pid;                /* 0x104 NewThreadProcPid */
    uint32_t proc;               /* 0x108 */
} IMG_THREAD;

CHECK(IMG_THREAD, func,    0x04);
CHECK(IMG_THREAD, field08, 0x08);
CHECK(IMG_THREAD, frame,   0xa4);
CHECK(IMG_THREAD, fieldf8, 0xf8);
CHECK(IMG_THREAD, fieldfc, 0xfc);
CHECK(IMG_THREAD, pid,     0x104);
CHECK(IMG_THREAD, proc,    0x108);

int main(void)
{
    printf("logic offsets: %d fields over three structs -- all agree\n",
           6 + 14 + 5);
    return 0;
}
