========================================================================
t_ct_stick_sweep  0x0006d57c  144 bytes   mkdrone.c
========================================================================

0006d57c  push    {r4, r5, r6, r7, lr}
0006d57e  add     r7, sp, #0xc
0006d580  str     r8, [sp, #-0x4]!
0006d584  ldr.w   r3, [r0, #0xa4]
0006d588  mov     r4, r0
0006d58a  ldr.w   r5, [r0, #0x108]
0006d58e  adds    r3, #1
0006d590  ldr.w   r6, [r0, r3, lsl #3]
0006d594  cbnz    r6, #0x6d5c2
0006d596  mov     r0, r5
0006d598  bl      #0x67f74 ; -> is_throwing_allowed
0006d59c  ldr.w   r8, [r5, #0x5c]
0006d5a0  cmp.w   r8, #0
0006d5a4  beq     #0x6d5cc
0006d5a6  ldr.w   r3, [r4, #0xa4]
0006d5aa  ldr     r2, [pc, #0x54]
0006d5ac  mov     r0, r6
0006d5ae  lsls    r3, r3, #3
0006d5b0  adds    r3, r3, r4
0006d5b2  add     r2, pc ; -> 0x0006d60d  t_stsw_zap
0006d5b4  str     r2, [r3, #4]
0006d5b6  ldr.w   r3, [r4, #0xa4]
0006d5ba  adds    r3, #1
0006d5bc  str.w   r6, [r4, r3, lsl #3]
0006d5c0  b       #0x6d5c6
0006d5c2  mvn     r0, #2
0006d5c6  ldr     r8, [sp], #4
0006d5ca  pop     {r4, r5, r6, r7, pc}
0006d5cc  mov     r0, r5
0006d5ce  bl      #0x2f3a0 ; -> get_x_dist
0006d5d2  ldr     r0, [r5, #0x28]
0006d5d4  cmp     r0, #0x7f
0006d5d6  bgt     #0x6d5f6
0006d5d8  ldr.w   r2, [pc, #0x28]
0006d5dc  add     r2, pc ; -> 0x000686c5  t_d_crossover_kick
0006d5de  ldr.w   r3, [r4, #0xa4]
0006d5e2  mov     r0, r8
0006d5e4  lsls    r3, r3, #3
0006d5e6  adds    r3, r3, r4
0006d5e8  str     r2, [r3, #4]
0006d5ea  ldr.w   r3, [r4, #0xa4]
0006d5ee  adds    r3, #1
0006d5f0  str.w   r8, [r4, r3, lsl #3]
0006d5f4  b       #0x6d5c6
0006d5f6  ldr.w   r2, [pc, #0x10]
0006d5fa  add     r2, pc ; -> 0x0006fa21  t_d_block
0006d5fc  b       #0x6d5de
0006d5fe  nop     
0006d600  lsls    r7, r2, #1
0006d602  movs    r0, r0
0006d604  sub     sp, #0x194
