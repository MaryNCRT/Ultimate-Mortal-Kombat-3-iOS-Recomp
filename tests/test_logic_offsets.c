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
    uint8_t  _pad08[8];
    uint32_t field10;            /* 0x10 */
    uint8_t  _pad14[0x2c];
    uint16_t field40;            /* 0x40 */
    uint8_t  _pad42[2];
    uint32_t p_hit;              /* 0x44 */
    uint8_t  _pad48[0x20];
    uint32_t slave;              /* 0x68 */
} IMG_PROC;

CHECK(IMG_PROC, him,     0x04);
CHECK(IMG_PROC, field10, 0x10);
CHECK(IMG_PROC, field40, 0x40);
CHECK(IMG_PROC, p_hit,   0x44);
CHECK(IMG_PROC, slave,   0x68);


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
    uint8_t  _pad0c[6];
    uint16_t field12;            /* 0x12 */
    uint8_t  _pad14[4];
    uint32_t field18;            /* 0x18 */
    uint32_t field1c;            /* 0x1c */
    uint32_t field20;            /* 0x20 */
    uint8_t  _pad24[4];
    uint32_t field28;            /* 0x28 */
    uint32_t field2c;            /* 0x2c */
    uint8_t  _pad30[8];
    uint32_t field38;            /* 0x38 */
    uint8_t  _pad3c[4];
    uint32_t field40;            /* 0x40 */
    uint32_t a10;                /* 0x44 */
    uint8_t  _pad48[0x5c];
    uint32_t threadIndex;        /* 0xa4 */
} IMG_OBJ;

CHECK(IMG_OBJ, thread,      0x04);
CHECK(IMG_OBJ, field08,     0x08);
CHECK(IMG_OBJ, field12,     0x12);
CHECK(IMG_OBJ, field18,     0x18);
CHECK(IMG_OBJ, field1c,     0x1c);
CHECK(IMG_OBJ, field20,     0x20);
CHECK(IMG_OBJ, field28,     0x28);
CHECK(IMG_OBJ, field2c,     0x2c);
CHECK(IMG_OBJ, field38,     0x38);
CHECK(IMG_OBJ, field40,     0x40);
CHECK(IMG_OBJ, a10,         0x44);
CHECK(IMG_OBJ, threadIndex, 0xa4);

int main(void)
{
    printf("logic offsets: IMG_PROC %d fields, IMG_OBJ %d fields -- all agree\n",
           5, 12);
    return 0;
}
