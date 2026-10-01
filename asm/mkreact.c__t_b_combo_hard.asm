========================================================================
t_b_combo_hard  0x00043548  176 bytes   mkreact.c
========================================================================

00043548  push    {r4, r5, r6, r7, lr}
0004354a  add     r7, sp, #0xc
0004354c  ldr.w   r3, [r0, #0xa4]
00043550  mov     r5, r0
00043552  ldr.w   r4, [r0, #0x108]
00043556  adds    r3, #1
00043558  ldr.w   r6, [r0, r3, lsl #3]
0004355c  cmp     r6, #0
0004355e  bne     #0x435a6
00043560  mov     r0, r4
00043562  mov.w   r3, #0x40004
00043566  str     r3, [r4, #0x48]
00043568  bl      #0x581e0 ; -> shake_a11
0004356c  ldr     r3, [pc, #0x7c]
0004356e  str     r6, [r4, #0x30]
00043570  str     r6, [r4, #0x34]
00043572  add     r3, pc ; -> 0x00041645  t_cc_block_avoid_corner
00043574  str     r3, [r4, #0x38]
00043576  ldr.w   r3, [r5, #0xa4]
0004357a  movw    r2, #0x1350
0004357e  mov     r0, r6
00043580  adds    r3, #1
00043582  str.w   r2, [r5, r3, lsl #3]
00043586  ldr.w   r3, [r5, #0xa4]
0004358a  ldr     r2, [pc, #0x64]
0004358c  adds    r3, #1
0004358e  str.w   r3, [r5, #0xa4]
00043592  lsls    r3, r3, #3
00043594  adds    r3, r3, r5
00043596  add     r2, pc ; -> 0x000475a1  t_blocked_start
00043598  str     r2, [r3, #4]
0004359a  ldr.w   r3, [r5, #0xa4]
0004359e  adds    r3, #1
000435a0  str.w   r6, [r5, r3, lsl #3]
000435a4  pop     {r4, r5, r6, r7, pc}
000435a6  movw    r3, #0x1350
000435aa  cmp     r6, r3
000435ac  it      ne
000435ae  mvnne   r0, #2
000435b2  bne     #0x435a4
000435b4  mov     r0, r4
000435b6  movs    r1, #5
000435b8  bl      #0x57dbc ; -> rsnd_func
000435bc  mov     r0, r4
000435be  mov.w   r3, #0x50000
000435c2  str     r3, [r4, #0x1c]
000435c4  bl      #0x55ab0 ; -> away_x_vel
000435c8  movs    r3, #4
000435ca  str     r3, [r4, #0x44]
000435cc  subs    r3, #1
000435ce  str     r3, [r4, #0x48]
000435d0  ldr.w   r3, [r5, #0xa4]
000435d4  ldr     r2, [pc, #0x1c]
000435d6  movs    r0, #0
000435d8  lsls    r3, r3, #3
000435da  adds    r3, r3, r5
000435dc  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
000435de  str     r2, [r3, #4]
000435e0  ldr.w   r3, [r5, #0xa4]
000435e4  adds    r3, #1
000435e6  str.w   r0, [r5, r3, lsl #3]
000435ea  b       #0x435a4
000435ec  b       #0x4378e
