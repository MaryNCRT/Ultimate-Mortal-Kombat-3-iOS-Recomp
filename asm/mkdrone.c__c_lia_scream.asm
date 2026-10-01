========================================================================
c_lia_scream  0x0006d260  208 bytes   mkdrone.c
========================================================================

0006d260  push    {r4, r5, r6, r7, lr}
0006d262  add     r7, sp, #0xc
0006d264  ldr.w   r2, [r0, #0xa4]
0006d268  mov     r4, r0
0006d26a  ldr.w   r5, [r0, #0x108]
0006d26e  adds    r3, r2, #1
0006d270  ldr.w   r6, [r0, r3, lsl #3]
0006d274  cbnz    r6, #0x6d2a2
0006d276  ldr     r3, [pc, #0x9c]
0006d278  mov     r0, r5
0006d27a  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006d27c  str     r3, [r5, #0x1c]
0006d27e  bl      #0x6c9c8 ; -> ask_mr_diff
0006d282  ldr     r3, [r5, #0x5c]
0006d284  cbnz    r3, #0x6d2c8
0006d286  ldr     r2, [pc, #0x90]
0006d288  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d28a  ldr.w   r3, [r4, #0xa4]
0006d28e  lsls    r3, r3, #3
0006d290  adds    r3, r3, r4
0006d292  mov     r0, r6
0006d294  str     r2, [r3, #4]
0006d296  ldr.w   r3, [r4, #0xa4]
0006d29a  adds    r3, #1
0006d29c  str.w   r6, [r4, r3, lsl #3]
0006d2a0  pop     {r4, r5, r6, r7, pc}
0006d2a2  movw    r3, #0x13ce
0006d2a6  cmp     r6, r3
0006d2a8  it      ne
0006d2aa  mvnne   r0, #2
0006d2ae  bne     #0x6d2a0
0006d2b0  ldr     r1, [pc, #0x68]
0006d2b2  lsls    r3, r2, #3
0006d2b4  adds    r3, r3, r4
0006d2b6  add     r1, pc ; -> 0x00067fe1  t_d_zap_now
0006d2b8  str     r1, [r3, #4]
0006d2ba  ldr.w   r3, [r4, #0xa4]
0006d2be  movs    r0, #0
0006d2c0  adds    r3, #1
0006d2c2  str.w   r0, [r4, r3, lsl #3]
0006d2c6  b       #0x6d2a0
0006d2c8  mov     r0, r5
0006d2ca  bl      #0x2f3a0 ; -> get_x_dist
0006d2ce  ldr     r3, [r5, #0x28]
0006d2d0  cmp     r3, #0xa0
0006d2d2  ble     #0x6d2da
0006d2d4  ldr     r2, [pc, #0x48]
0006d2d6  add     r2, pc ; -> 0x00067fe1  t_d_zap_now
0006d2d8  b       #0x6d28a
0006d2da  cmp     r3, #0x7f
0006d2dc  bgt     #0x6d2ea
0006d2de  ldr.w   r2, [pc, #0x44]
0006d2e2  ldr.w   r3, [r4, #0xa4]
0006d2e6  add     r2, pc ; -> 0x0006c821  t_d_sweep_kick
0006d2e8  b       #0x6d28e
0006d2ea  movs    r3, #0x40
0006d2ec  str     r3, [r5, #0x44]
0006d2ee  ldr     r3, [pc, #0x38]
0006d2f0  movw    r2, #0x13ce
0006d2f4  add     r3, pc ; -> 0x0006d331  q_dist_lift
0006d2f6  str     r3, [r5, #0x48]
0006d2f8  ldr.w   r3, [r4, #0xa4]
0006d2fc  adds    r3, #1
0006d2fe  str.w   r2, [r4, r3, lsl #3]
0006d302  ldr.w   r2, [pc, #0x28]
0006d306  ldr.w   r3, [r4, #0xa4]
0006d30a  add     r2, pc ; -> 0x000726e9  t_retreat_wait_yes
0006d30c  adds    r3, #1
0006d30e  str.w   r3, [r4, #0xa4]
0006d312  b       #0x6d28e
0006d314  ldr     r5, [pc, #0xa8]
0006d316  movs    r0, r2
0006d318  mrc     p15, #7, apsr_nzcv, c9, c15, #7
0006d31c  add     r5, sp, #0x9c
