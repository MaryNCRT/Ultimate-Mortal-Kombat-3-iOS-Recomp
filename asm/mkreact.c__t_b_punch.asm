========================================================================
t_b_punch  0x00043354  164 bytes   mkreact.c
========================================================================

00043354  push    {r4, r5, r6, r7, lr}
00043356  add     r7, sp, #0xc
00043358  ldr.w   r3, [r0, #0xa4]
0004335c  mov     r4, r0
0004335e  ldr.w   r5, [r0, #0x108]
00043362  adds    r3, #1
00043364  ldr.w   r6, [r0, r3, lsl #3]
00043368  cbnz    r6, #0x433ac
0004336a  mov     r0, r5
0004336c  movs    r1, #6
0004336e  bl      #0x57dbc ; -> rsnd_func
00043372  ldr     r3, [pc, #0x78]
00043374  str     r6, [r5, #0x30]
00043376  str     r6, [r5, #0x34]
00043378  add     r3, pc ; -> 0x00041bed  t_cc_punch
0004337a  str     r3, [r5, #0x38]
0004337c  ldr.w   r3, [r4, #0xa4]
00043380  movw    r2, #0x139c
00043384  mov     r0, r6
00043386  adds    r3, #1
00043388  str.w   r2, [r4, r3, lsl #3]
0004338c  ldr.w   r3, [r4, #0xa4]
00043390  ldr     r2, [pc, #0x5c]
00043392  adds    r3, #1
00043394  str.w   r3, [r4, #0xa4]
00043398  lsls    r3, r3, #3
0004339a  adds    r3, r3, r4
0004339c  add     r2, pc ; -> 0x000475a1  t_blocked_start
0004339e  str     r2, [r3, #4]
000433a0  ldr.w   r3, [r4, #0xa4]
000433a4  adds    r3, #1
000433a6  str.w   r6, [r4, r3, lsl #3]
000433aa  pop     {r4, r5, r6, r7, pc}
000433ac  movw    r3, #0x139c
000433b0  cmp     r6, r3
000433b2  it      ne
000433b4  mvnne   r0, #2
000433b8  bne     #0x433aa
000433ba  mov     r0, r5
000433bc  mov.w   r3, #0x20000
000433c0  str     r3, [r5, #0x1c]
000433c2  bl      #0x55ab0 ; -> away_x_vel
000433c6  movs    r3, #2
000433c8  str     r3, [r5, #0x48]
000433ca  adds    r3, #1
000433cc  str     r3, [r5, #0x44]
000433ce  ldr.w   r3, [r4, #0xa4]
000433d2  ldr     r2, [pc, #0x20]
000433d4  movs    r0, #0
000433d6  lsls    r3, r3, #3
000433d8  adds    r3, r3, r4
000433da  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
000433dc  str     r2, [r3, #4]
000433de  ldr.w   r3, [r4, #0xa4]
000433e2  adds    r3, #1
000433e4  str.w   r0, [r4, r3, lsl #3]
000433e8  b       #0x433aa
000433ea  nop     
000433ec  ldrd    pc, pc, [r1], #-0x3fc
000433f0  tst     r1, r0
000433f2  movs    r0, r0
000433f4  asrs    r7, r0, #0x12
000433f6  movs    r0, r0
