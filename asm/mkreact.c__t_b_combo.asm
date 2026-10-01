========================================================================
t_b_combo  0x000435f8  160 bytes   mkreact.c
========================================================================

000435f8  push    {r4, r5, r7, lr}
000435fa  add     r7, sp, #8
000435fc  ldr.w   r3, [r0, #0xa4]
00043600  mov     r4, r0
00043602  ldr.w   r5, [r0, #0x108]
00043606  adds    r3, #1
00043608  ldr.w   r0, [r0, r3, lsl #3]
0004360c  cbnz    r0, #0x43646
0004360e  ldr     r3, [pc, #0x7c]
00043610  str     r0, [r5, #0x30]
00043612  str     r0, [r5, #0x34]
00043614  add     r3, pc ; -> 0x00041645  t_cc_block_avoid_corner
00043616  str     r3, [r5, #0x38]
00043618  ldr.w   r3, [r4, #0xa4]
0004361c  movw    r2, #0x133f
00043620  adds    r3, #1
00043622  str.w   r2, [r4, r3, lsl #3]
00043626  ldr.w   r3, [r4, #0xa4]
0004362a  ldr     r2, [pc, #0x64]
0004362c  adds    r3, #1
0004362e  str.w   r3, [r4, #0xa4]
00043632  lsls    r3, r3, #3
00043634  adds    r3, r3, r4
00043636  add     r2, pc ; -> 0x000475a1  t_blocked_start
00043638  str     r2, [r3, #4]
0004363a  ldr.w   r3, [r4, #0xa4]
0004363e  adds    r3, #1
00043640  str.w   r0, [r4, r3, lsl #3]
00043644  pop     {r4, r5, r7, pc}
00043646  movw    r3, #0x133f
0004364a  cmp     r0, r3
0004364c  it      ne
0004364e  mvnne   r0, #2
00043652  bne     #0x43644
00043654  mov     r0, r5
00043656  movs    r1, #5
00043658  bl      #0x57dbc ; -> rsnd_func
0004365c  mov     r0, r5
0004365e  mov.w   r3, #0x40000
00043662  str     r3, [r5, #0x1c]
00043664  bl      #0x55ab0 ; -> away_x_vel
00043668  movs    r3, #2
0004366a  str     r3, [r5, #0x48]
0004366c  adds    r3, #1
0004366e  str     r3, [r5, #0x44]
00043670  ldr.w   r3, [r4, #0xa4]
00043674  ldr     r2, [pc, #0x1c]
00043676  movs    r0, #0
00043678  lsls    r3, r3, #3
0004367a  adds    r3, r3, r4
0004367c  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
0004367e  str     r2, [r3, #4]
00043680  ldr.w   r3, [r4, #0xa4]
00043684  adds    r3, #1
00043686  str.w   r0, [r4, r3, lsl #3]
0004368a  b       #0x43644
0004368c  b       #0x436ea
