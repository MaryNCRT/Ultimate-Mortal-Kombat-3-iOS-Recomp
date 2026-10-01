========================================================================
c_lkzaplo  0x0006e310  84 bytes   mkdrone.c
========================================================================

0006e310  push    {r4, r5, r6, r7, lr}
0006e312  add     r7, sp, #0xc
0006e314  ldr.w   r3, [r0, #0xa4]
0006e318  mov     r4, r0
0006e31a  ldr.w   r5, [r0, #0x108]
0006e31e  adds    r3, #1
0006e320  ldr.w   r6, [r0, r3, lsl #3]
0006e324  cbnz    r6, #0x6e34e
0006e326  mov     r0, r5
0006e328  bl      #0x2f3a0 ; -> get_x_dist
0006e32c  ldr     r0, [r5, #0x28]
0006e32e  cmp     r0, #0x7f
0006e330  ble     #0x6e354
0006e332  ldr     r2, [pc, #0x28]
0006e334  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006e336  ldr.w   r3, [r4, #0xa4]
0006e33a  mov     r0, r6
0006e33c  lsls    r3, r3, #3
0006e33e  adds    r3, r3, r4
0006e340  str     r2, [r3, #4]
0006e342  ldr.w   r3, [r4, #0xa4]
0006e346  adds    r3, #1
0006e348  str.w   r6, [r4, r3, lsl #3]
0006e34c  b       #0x6e352
0006e34e  mvn     r0, #2
0006e352  pop     {r4, r5, r6, r7, pc}
0006e354  ldr     r2, [pc, #8]
0006e356  add     r2, pc ; -> 0x000686c5  t_d_crossover_kick
0006e358  b       #0x6e336
0006e35a  nop     
0006e35c  adr     r4, #0x34
