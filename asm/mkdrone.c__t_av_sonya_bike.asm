========================================================================
t_av_sonya_bike  0x0006d6c8  84 bytes   mkdrone.c
========================================================================

0006d6c8  push    {r4, r5, r6, r7, lr}
0006d6ca  add     r7, sp, #0xc
0006d6cc  ldr.w   r3, [r0, #0xa4]
0006d6d0  mov     r4, r0
0006d6d2  ldr.w   r5, [r0, #0x108]
0006d6d6  adds    r3, #1
0006d6d8  ldr.w   r6, [r0, r3, lsl #3]
0006d6dc  cbnz    r6, #0x6d706
0006d6de  mov     r0, r5
0006d6e0  bl      #0x2f3a0 ; -> get_x_dist
0006d6e4  ldr     r0, [r5, #0x28]
0006d6e6  cmp     r0, #0x6f
0006d6e8  ble     #0x6d70c
0006d6ea  ldr     r2, [pc, #0x28]
0006d6ec  add     r2, pc ; -> 0x0006b309  t_swait_nonattack_jump
0006d6ee  ldr.w   r3, [r4, #0xa4]
0006d6f2  mov     r0, r6
0006d6f4  lsls    r3, r3, #3
0006d6f6  adds    r3, r3, r4
0006d6f8  str     r2, [r3, #4]
0006d6fa  ldr.w   r3, [r4, #0xa4]
0006d6fe  adds    r3, #1
0006d700  str.w   r6, [r4, r3, lsl #3]
0006d704  b       #0x6d70a
0006d706  mvn     r0, #2
0006d70a  pop     {r4, r5, r6, r7, pc}
0006d70c  ldr     r2, [pc, #8]
0006d70e  add     r2, pc ; -> 0x0006f0b9  t_asb2
0006d710  b       #0x6d6ee
0006d712  nop     
0006d714  bgt     #0x6d74a
