========================================================================
c_bomblo_pro  0x0006e110  136 bytes   mkdrone.c
========================================================================

0006e110  push    {r4, r5, r7, lr}
0006e112  add     r7, sp, #8
0006e114  ldr.w   r3, [r0, #0xa4]
0006e118  mov     r4, r0
0006e11a  ldr.w   r5, [r0, #0x108]
0006e11e  adds    r3, #1
0006e120  ldr.w   r0, [r0, r3, lsl #3]
0006e124  cbnz    r0, #0x6e14e
0006e126  movw    r2, #0xe05
0006e12a  str.w   r2, [r4, r3, lsl #3]
0006e12e  ldr.w   r3, [r4, #0xa4]
0006e132  ldr     r2, [pc, #0x58]
0006e134  adds    r3, #1
0006e136  str.w   r3, [r4, #0xa4]
0006e13a  lsls    r3, r3, #3
0006e13c  adds    r3, r3, r4
0006e13e  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006e140  str     r2, [r3, #4]
0006e142  ldr.w   r3, [r4, #0xa4]
0006e146  adds    r3, #1
0006e148  str.w   r0, [r4, r3, lsl #3]
0006e14c  pop     {r4, r5, r7, pc}
0006e14e  movw    r3, #0xe05
0006e152  cmp     r0, r3
0006e154  it      ne
0006e156  mvnne   r0, #2
0006e15a  bne     #0x6e14c
0006e15c  mov     r0, r5
0006e15e  bl      #0x2f3a0 ; -> get_x_dist
0006e162  ldr     r0, [r5, #0x28]
0006e164  cmp     r0, #0xaf
0006e166  ble     #0x6e186
0006e168  ldr.w   r2, [pc, #0x24]
0006e16c  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006e16e  ldr.w   r3, [r4, #0xa4]
0006e172  movs    r0, #0
0006e174  lsls    r3, r3, #3
0006e176  adds    r3, r3, r4
0006e178  str     r2, [r3, #4]
0006e17a  ldr.w   r3, [r4, #0xa4]
0006e17e  adds    r3, #1
0006e180  str.w   r0, [r4, r3, lsl #3]
0006e184  b       #0x6e14c
0006e186  ldr     r2, [pc, #0xc]
0006e188  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006e18a  b       #0x6e16e
0006e18c  add     r3, sp, #0xc
