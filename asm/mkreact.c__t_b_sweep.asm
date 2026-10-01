========================================================================
t_b_sweep  0x00042660  148 bytes   mkreact.c
========================================================================

00042660  push    {r4, r5, r6, r7, lr}
00042662  add     r7, sp, #0xc
00042664  ldr.w   r3, [r0, #0xa4]
00042668  mov     r4, r0
0004266a  ldr.w   r5, [r0, #0x108]
0004266e  adds    r3, #1
00042670  ldr.w   r6, [r0, r3, lsl #3]
00042674  cbnz    r6, #0x426b8
00042676  mov     r0, r5
00042678  movs    r1, #6
0004267a  bl      #0x57dbc ; -> rsnd_func
0004267e  ldr     r3, [pc, #0x68]
00042680  str     r6, [r5, #0x30]
00042682  str     r6, [r5, #0x34]
00042684  add     r3, pc ; -> 0x000432f9  t_cc_block_sweep
00042686  str     r3, [r5, #0x38]
00042688  ldr.w   r3, [r4, #0xa4]
0004268c  movw    r2, #0x13d4
00042690  mov     r0, r6
00042692  adds    r3, #1
00042694  str.w   r2, [r4, r3, lsl #3]
00042698  ldr.w   r3, [r4, #0xa4]
0004269c  ldr     r2, [pc, #0x4c]
0004269e  adds    r3, #1
000426a0  str.w   r3, [r4, #0xa4]
000426a4  lsls    r3, r3, #3
000426a6  adds    r3, r3, r4
000426a8  add     r2, pc ; -> 0x000475a1  t_blocked_start
000426aa  str     r2, [r3, #4]
000426ac  ldr.w   r3, [r4, #0xa4]
000426b0  adds    r3, #1
000426b2  str.w   r6, [r4, r3, lsl #3]
000426b6  pop     {r4, r5, r6, r7, pc}
000426b8  movw    r3, #0x13d4
000426bc  cmp     r6, r3
000426be  it      ne
000426c0  mvnne   r0, #2
000426c4  bne     #0x426b6
000426c6  movs    r3, #2
000426c8  str     r3, [r5, #0x48]
000426ca  str     r3, [r5, #0x44]
000426cc  ldr.w   r3, [r4, #0xa4]
000426d0  ldr     r2, [pc, #0x1c]
000426d2  movs    r0, #0
000426d4  lsls    r3, r3, #3
000426d6  adds    r3, r3, r4
000426d8  add     r2, pc ; -> 0x00044865  t_block_shake_n_exit
000426da  str     r2, [r3, #4]
000426dc  ldr.w   r3, [r4, #0xa4]
000426e0  adds    r3, #1
000426e2  str.w   r0, [r4, r3, lsl #3]
000426e6  b       #0x426b6
000426e8  lsrs    r1, r6, #0x11
000426ea  movs    r0, r0
000426ec  ldr     r6, [pc, #0x3d4]
000426ee  movs    r0, r0
000426f0  movs    r1, #0x89
000426f2  movs    r0, r0
