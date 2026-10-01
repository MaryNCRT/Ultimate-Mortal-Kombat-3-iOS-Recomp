========================================================================
t_r_hat  0x000440b8  180 bytes   mkreact.c
========================================================================

000440b8  push    {r4, r5, r6, r7, lr}
000440ba  add     r7, sp, #0xc
000440bc  ldr.w   r3, [r0, #0xa4]
000440c0  mov     r5, r0
000440c2  ldr.w   r4, [r0, #0x108]
000440c6  adds    r3, #1
000440c8  ldr.w   r6, [r0, r3, lsl #3]
000440cc  cbnz    r6, #0x4410c
000440ce  movs    r3, #1
000440d0  mov     r0, r4
000440d2  str     r3, [r4, #0x34]
000440d4  bl      #0x41354 ; -> if_shao_then_pass
000440d8  str     r6, [r4, #0x30]
000440da  str     r6, [r4, #0x38]
000440dc  ldr.w   r3, [r5, #0xa4]
000440e0  movw    r2, #0x11dc
000440e4  mov     r0, r6
000440e6  adds    r3, #1
000440e8  str.w   r2, [r5, r3, lsl #3]
000440ec  ldr.w   r3, [r5, #0xa4]
000440f0  ldr     r2, [pc, #0x70]
000440f2  adds    r3, #1
000440f4  str.w   r3, [r5, #0xa4]
000440f8  lsls    r3, r3, #3
000440fa  adds    r3, r3, r5
000440fc  add     r2, pc ; -> 0x00044b85  t_reaction_start
000440fe  str     r2, [r3, #4]
00044100  ldr.w   r3, [r5, #0xa4]
00044104  adds    r3, #1
00044106  str.w   r6, [r5, r3, lsl #3]
0004410a  pop     {r4, r5, r6, r7, pc}
0004410c  movw    r3, #0x11dc
00044110  cmp     r6, r3
00044112  it      ne
00044114  mvnne   r0, #2
00044118  bne     #0x4410a
0004411a  mov     r0, r4
0004411c  movs    r3, #2
0004411e  str     r3, [r4, #0x1c]
00044120  bl      #0x580a4 ; -> group_sound
00044124  mov     r0, r4
00044126  movs    r3, #0x20
00044128  str     r3, [r4, #0x40]
0004412a  bl      #0x55474 ; -> find_ani_part2
0004412e  mov     r0, r4
00044130  mov.w   r3, #0x30000
00044134  str     r3, [r4, #0x1c]
00044136  bl      #0x55ab0 ; -> away_x_vel
0004413a  mov     r0, r4
0004413c  movs    r3, #6
0004413e  str     r3, [r4, #0x1c]
00044140  bl      #0x553a0 ; -> init_anirate
00044144  movs    r3, #0x24
00044146  str     r3, [r4, #0x44]
00044148  ldr.w   r3, [r5, #0xa4]
0004414c  ldr     r2, [pc, #0x18]
0004414e  movs    r0, #0
00044150  lsls    r3, r3, #3
00044152  adds    r3, r3, r5
00044154  add     r2, pc ; -> 0x00041a2d  t_rhat_sleep
00044156  str     r2, [r3, #4]
00044158  ldr.w   r3, [r5, #0xa4]
0004415c  adds    r3, #1
0004415e  str.w   r0, [r5, r3, lsl #3]
00044162  b       #0x4410a
00044164  lsrs    r5, r0, #0xa
00044166  movs    r0, r0
00044168  bhi     #0x44116
