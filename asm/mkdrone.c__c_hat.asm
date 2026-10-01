========================================================================
c_hat  0x0006e288  136 bytes   mkdrone.c
========================================================================

0006e288  push    {r4, r5, r7, lr}
0006e28a  add     r7, sp, #8
0006e28c  ldr.w   r3, [r0, #0xa4]
0006e290  mov     r4, r0
0006e292  ldr.w   r5, [r0, #0x108]
0006e296  adds    r3, #1
0006e298  ldr.w   r0, [r0, r3, lsl #3]
0006e29c  cbnz    r0, #0x6e2c6
0006e29e  movw    r2, #0xdad
0006e2a2  str.w   r2, [r4, r3, lsl #3]
0006e2a6  ldr.w   r3, [r4, #0xa4]
0006e2aa  ldr     r2, [pc, #0x58]
0006e2ac  adds    r3, #1
0006e2ae  str.w   r3, [r4, #0xa4]
0006e2b2  lsls    r3, r3, #3
0006e2b4  adds    r3, r3, r4
0006e2b6  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006e2b8  str     r2, [r3, #4]
0006e2ba  ldr.w   r3, [r4, #0xa4]
0006e2be  adds    r3, #1
0006e2c0  str.w   r0, [r4, r3, lsl #3]
0006e2c4  pop     {r4, r5, r7, pc}
0006e2c6  movw    r3, #0xdad
0006e2ca  cmp     r0, r3
0006e2cc  it      ne
0006e2ce  mvnne   r0, #2
0006e2d2  bne     #0x6e2c4
0006e2d4  mov     r0, r5
0006e2d6  bl      #0x2f3a0 ; -> get_x_dist
0006e2da  ldr     r0, [r5, #0x28]
0006e2dc  cmp     r0, #0xbf
0006e2de  ble     #0x6e2fe
0006e2e0  ldr.w   r2, [pc, #0x24]
0006e2e4  add     r2, pc ; -> 0x0006aac5  t_d_flipk_over_proj
0006e2e6  ldr.w   r3, [r4, #0xa4]
0006e2ea  movs    r0, #0
0006e2ec  lsls    r3, r3, #3
0006e2ee  adds    r3, r3, r4
0006e2f0  str     r2, [r3, #4]
0006e2f2  ldr.w   r3, [r4, #0xa4]
0006e2f6  adds    r3, #1
0006e2f8  str.w   r0, [r4, r3, lsl #3]
0006e2fc  b       #0x6e2c4
0006e2fe  ldr     r2, [pc, #0xc]
0006e300  add     r2, pc ; -> 0x00068ccd  t_d_block_projectile
0006e302  b       #0x6e2e6
0006e304  add     r1, sp, #0x22c
