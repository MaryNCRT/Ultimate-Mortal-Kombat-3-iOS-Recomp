========================================================================
t_ct_lao_spin  0x0006d0cc  272 bytes   mkdrone.c
========================================================================

0006d0cc  push    {r4, r5, r7, lr}
0006d0ce  add     r7, sp, #8
0006d0d0  ldr.w   r2, [r0, #0xa4]
0006d0d4  mov     r4, r0
0006d0d6  ldr.w   r5, [r0, #0x108]
0006d0da  adds    r3, r2, #1
0006d0dc  movw    r1, #0x143e
0006d0e0  ldr.w   r0, [r0, r3, lsl #3]
0006d0e4  cmp     r0, r1
0006d0e6  beq     #0x6d140
0006d0e8  ble     #0x6d0fe
0006d0ea  movw    r3, #0x143f
0006d0ee  cmp     r0, r3
0006d0f0  beq     #0x6d112
0006d0f2  adds    r3, #8
0006d0f4  cmp     r0, r3
0006d0f6  beq     #0x6d128
0006d0f8  mvn     r0, #2
0006d0fc  pop     {r4, r5, r7, pc}
0006d0fe  cmp     r0, #0
0006d100  bne     #0x6d0f8
0006d102  ldr     r3, [pc, #0xc0]
0006d104  add     r3, pc ; -> 0x000f357c  G
0006d106  ldr     r3, [r3]
0006d108  ldrsh.w r3, [r3, #0x44c]
0006d10c  cmp     r3, #3
0006d10e  str     r3, [r5, #0x1c]
0006d110  ble     #0x6d190
0006d112  mov     r0, r5
0006d114  bl      #0x2f3a0 ; -> get_x_dist
0006d118  ldr     r3, [r5, #0x28]
0006d11a  cmp     r3, #0x45
0006d11c  bgt     #0x6d16c
0006d11e  ldr     r2, [pc, #0xa8]
0006d120  ldr.w   r3, [r4, #0xa4]
0006d124  add     r2, pc ; -> 0x00067f91  t_d_zap
0006d126  b       #0x6d158
0006d128  ldr     r1, [pc, #0xa0]
0006d12a  lsls    r3, r2, #3
0006d12c  adds    r3, r3, r4
0006d12e  add     r1, pc ; -> 0x00067f91  t_d_zap
0006d130  str     r1, [r3, #4]
0006d132  ldr.w   r3, [r4, #0xa4]
0006d136  movs    r0, #0
0006d138  adds    r3, #1
0006d13a  str.w   r0, [r4, r3, lsl #3]
0006d13e  b       #0x6d0fc
0006d140  movw    r2, #0x143f
0006d144  str.w   r2, [r4, r3, lsl #3]
0006d148  ldr.w   r2, [pc, #0x84]
0006d14c  ldr.w   r3, [r4, #0xa4]
0006d150  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006d152  adds    r3, #1
0006d154  str.w   r3, [r4, #0xa4]
0006d158  lsls    r3, r3, #3
0006d15a  adds    r3, r3, r4
0006d15c  movs    r0, #0
0006d15e  str     r2, [r3, #4]
0006d160  ldr.w   r3, [r4, #0xa4]
0006d164  adds    r3, #1
0006d166  str.w   r0, [r4, r3, lsl #3]
0006d16a  b       #0x6d0fc
0006d16c  movs    r3, #0x20
0006d16e  str     r3, [r5, #0x44]
0006d170  ldr.w   r3, [r4, #0xa4]
0006d174  movw    r2, #0x1447
0006d178  adds    r3, #1
0006d17a  str.w   r2, [r4, r3, lsl #3]
0006d17e  ldr.w   r2, [pc, #0x54]
0006d182  ldr.w   r3, [r4, #0xa4]
0006d186  add     r2, pc ; -> 0x000720d5  t_d_stance_pause
0006d188  adds    r3, #1
0006d18a  str.w   r3, [r4, #0xa4]
0006d18e  b       #0x6d158
0006d190  movs    r3, #0xc0
0006d192  str     r3, [r5, #0x44]
0006d194  subs    r3, #0x50
0006d196  str     r3, [r5, #0x48]
0006d198  ldr.w   r3, [r4, #0xa4]
0006d19c  ldr     r2, [pc, #0x38]
0006d19e  adds    r3, #1
0006d1a0  add     r2, pc ; -> 0x00072b95  t_d_stalk_a11
0006d1a2  str.w   r1, [r4, r3, lsl #3]
0006d1a6  ldr.w   r3, [r4, #0xa4]
0006d1aa  adds    r3, #1
0006d1ac  str.w   r3, [r4, #0xa4]
0006d1b0  lsls    r3, r3, #3
0006d1b2  adds    r3, r3, r4
0006d1b4  str     r2, [r3, #4]
0006d1b6  ldr.w   r3, [r4, #0xa4]
0006d1ba  adds    r3, #1
0006d1bc  str.w   r0, [r4, r3, lsl #3]
0006d1c0  b       #0x6d0fc
0006d1c2  nop     
0006d1c4  str     r4, [r6, #0x44]
0006d1c6  movs    r0, r1
0006d1c8  add     r6, sp, #0x1a4
