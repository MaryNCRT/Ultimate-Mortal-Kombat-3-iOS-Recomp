========================================================================
t_lkzap5  0x0007919c  352 bytes   mkzap.c
========================================================================

0007919c  push    {r4, r5, r6, r7, lr}
0007919e  add     r7, sp, #0xc
000791a0  str     r8, [sp, #-0x4]!
000791a4  ldr.w   r2, [r0, #0xa4]
000791a8  movw    r8, #0xa66
000791ac  mov     r5, r0
000791ae  adds    r3, r2, #1
000791b0  ldr.w   r4, [r0, #0x108]
000791b4  ldr.w   r6, [r0, r3, lsl #3]
000791b8  cmp     r6, r8
000791ba  beq     #0x79224
000791bc  ble     #0x791d6
000791be  movw    r3, #0xa6f
000791c2  cmp     r6, r3
000791c4  beq     #0x79254
000791c6  adds    r3, #0xe
000791c8  cmp     r6, r3
000791ca  beq     #0x7920a
000791cc  mvn     r0, #2
000791d0  ldr     r8, [sp], #4
000791d4  pop     {r4, r5, r6, r7, pc}
000791d6  cmp     r6, #0
000791d8  bne     #0x791cc
000791da  mov     r0, r4
000791dc  bl      #0x55070 ; -> am_i_airborn
000791e0  ldr     r3, [r4, #0x5c]
000791e2  cmp     r3, #0
000791e4  bne     #0x7928c
000791e6  mov     r0, r4
000791e8  bl      #0x758b0 ; -> i_am_a_sitting_duck
000791ec  mov     r0, r4
000791ee  bl      #0x55808 ; -> am_i_short
000791f2  ldr     r0, [r4, #0x5c]
000791f4  cmp     r0, #0
000791f6  bne     #0x792d6
000791f8  ldr.w   r3, [r5, #0xa4]
000791fc  adds    r0, #0x10
000791fe  adds    r3, #1
00079200  str.w   r8, [r5, r3, lsl #3]
00079204  str.w   r0, [r5, #0xfc]
00079208  b       #0x791d0
0007920a  ldr     r3, [pc, #0xe0]
0007920c  add     r3, pc ; -> 0x000f33d4  t_drop_down_land
0007920e  ldr     r1, [r3]
00079210  lsls    r3, r2, #3
00079212  adds    r3, r3, r0
00079214  str     r1, [r3, #4]
00079216  ldr.w   r3, [r0, #0xa4]
0007921a  movs    r0, #0
0007921c  adds    r3, #1
0007921e  str.w   r0, [r5, r3, lsl #3]
00079222  b       #0x791d0
00079224  movs    r3, #0x24
00079226  mov     r0, r4
00079228  str     r3, [r4, #0x40]
0007922a  subs    r3, #0x21
0007922c  str     r3, [r4, #0x54]
0007922e  bl      #0x554a8 ; -> find_ani_part_a14
00079232  movs    r3, #4
00079234  str     r3, [r4, #0x1c]
00079236  ldr     r3, [pc, #0xb8]
00079238  movs    r0, #0
0007923a  add     r3, pc ; -> 0x000f37cc  t_mframew
0007923c  ldr     r2, [r3]
0007923e  ldr.w   r3, [r5, #0xa4]
00079242  lsls    r3, r3, #3
00079244  adds    r3, r3, r5
00079246  str     r2, [r3, #4]
00079248  ldr.w   r3, [r5, #0xa4]
0007924c  adds    r3, #1
0007924e  str.w   r0, [r5, r3, lsl #3]
00079252  b       #0x791d0
00079254  mov     r0, r4
00079256  movs    r6, #0
00079258  str     r6, [r4, #0x40]
0007925a  bl      #0x55228 ; -> get_char_ani2
0007925e  mov     r0, r4
00079260  movs    r3, #3
00079262  str     r3, [r4, #0x54]
00079264  bl      #0x55488 ; -> find_part_a14
00079268  movs    r3, #4
0007926a  str     r3, [r4, #0x1c]
0007926c  ldr.w   r3, [pc, #0x84]
00079270  mov     r0, r6
00079272  add     r3, pc ; -> 0x000f37cc  t_mframew
00079274  ldr     r2, [r3]
00079276  ldr.w   r3, [r5, #0xa4]
0007927a  lsls    r3, r3, #3
0007927c  adds    r3, r3, r5
0007927e  str     r2, [r3, #4]
00079280  ldr.w   r3, [r5, #0xa4]
00079284  adds    r3, #1
00079286  str.w   r6, [r5, r3, lsl #3]
0007928a  b       #0x791d0
0007928c  mov     r0, r4
0007928e  movs    r3, #1
00079290  str     r3, [r4, #0x40]
00079292  bl      #0x55228 ; -> get_char_ani2
00079296  mov     r0, r4
00079298  movs    r3, #3
0007929a  str     r3, [r4, #0x54]
0007929c  bl      #0x55488 ; -> find_part_a14
000792a0  movs    r3, #2
000792a2  str     r3, [r4, #0x1c]
000792a4  ldr.w   r3, [r5, #0xa4]
000792a8  movw    r2, #0xa7d
000792ac  mov     r0, r6
000792ae  adds    r3, #1
000792b0  str.w   r2, [r5, r3, lsl #3]
000792b4  ldr.w   r3, [r5, #0xa4]
000792b8  adds    r2, r3, #1
000792ba  ldr     r3, [pc, #0x3c]
000792bc  str.w   r2, [r5, #0xa4]
000792c0  add     r3, pc ; -> 0x000f37cc  t_mframew
000792c2  ldr     r1, [r3]
000792c4  lsls    r3, r2, #3
000792c6  adds    r3, r3, r5
000792c8  str     r1, [r3, #4]
000792ca  ldr.w   r3, [r5, #0xa4]
000792ce  adds    r3, #1
000792d0  str.w   r6, [r5, r3, lsl #3]
000792d4  b       #0x791d0
000792d6  ldr.w   r3, [r5, #0xa4]
000792da  movs    r0, #0x18
000792dc  movw    r2, #0xa6f
000792e0  adds    r3, #1
000792e2  str.w   r2, [r5, r3, lsl #3]
000792e6  str.w   r0, [r5, #0xfc]
000792ea  b       #0x791d0
000792ec  adr     r1, #0x310
000792ee  movs    r7, r0
000792f0  adr     r5, #0x238
000792f2  movs    r7, r0
000792f4  adr     r5, #0x158
000792f6  movs    r7, r0
000792f8  adr     r5, #0x20
000792fa  movs    r7, r0
