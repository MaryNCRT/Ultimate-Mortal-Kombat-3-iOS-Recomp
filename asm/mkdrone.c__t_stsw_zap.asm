========================================================================
t_stsw_zap  0x0006d60c  96 bytes   mkdrone.c
========================================================================

0006d60c  push    {r4, r5, r6, r7, lr}
0006d60e  add     r7, sp, #0xc
0006d610  ldr.w   r3, [r0, #0xa4]
0006d614  mov     r4, r0
0006d616  ldr.w   r5, [r0, #0x108]
0006d61a  adds    r3, #1
0006d61c  ldr.w   r6, [r0, r3, lsl #3]
0006d620  cbnz    r6, #0x6d64a
0006d622  mov     r0, r5
0006d624  bl      #0x2f3a0 ; -> get_x_dist
0006d628  ldr     r0, [r5, #0x28]
0006d62a  cmp     r0, #0x7f
0006d62c  bgt     #0x6d650
0006d62e  ldr     r2, [pc, #0x30]
0006d630  add     r2, pc ; -> 0x000686c5  t_d_crossover_kick
0006d632  ldr.w   r3, [r4, #0xa4]
0006d636  mov     r0, r6
0006d638  lsls    r3, r3, #3
0006d63a  adds    r3, r3, r4
0006d63c  str     r2, [r3, #4]
0006d63e  ldr.w   r3, [r4, #0xa4]
0006d642  adds    r3, #1
0006d644  str.w   r6, [r4, r3, lsl #3]
0006d648  b       #0x6d64e
0006d64a  mvn     r0, #2
0006d64e  pop     {r4, r5, r6, r7, pc}
0006d650  cmp     r0, #0xd0
0006d652  ble     #0x6d65a
0006d654  ldr     r2, [pc, #0xc]
0006d656  add     r2, pc ; -> 0x00067f91  t_d_zap
0006d658  b       #0x6d632
0006d65a  ldr     r2, [pc, #0xc]
0006d65c  add     r2, pc ; -> 0x0006fa21  t_d_block
0006d65e  b       #0x6d632
0006d660  sub     sp, #0x44
