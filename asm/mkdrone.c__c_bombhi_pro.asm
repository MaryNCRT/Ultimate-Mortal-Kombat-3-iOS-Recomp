========================================================================
c_bombhi_pro  0x0006e084  140 bytes   mkdrone.c
========================================================================

0006e084  push    {r4, r5, r7, lr}
0006e086  add     r7, sp, #8
0006e088  ldr.w   r3, [r0, #0xa4]
0006e08c  mov     r4, r0
0006e08e  ldr.w   r5, [r0, #0x108]
0006e092  adds    r3, #1
0006e094  ldr.w   r0, [r0, r3, lsl #3]
0006e098  cbnz    r0, #0x6e0c2
0006e09a  movw    r2, #0xe13
0006e09e  str.w   r2, [r4, r3, lsl #3]
0006e0a2  ldr.w   r3, [r4, #0xa4]
0006e0a6  ldr     r2, [pc, #0x5c]
0006e0a8  adds    r3, #1
0006e0aa  str.w   r3, [r4, #0xa4]
0006e0ae  lsls    r3, r3, #3
0006e0b0  adds    r3, r3, r4
0006e0b2  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006e0b4  str     r2, [r3, #4]
0006e0b6  ldr.w   r3, [r4, #0xa4]
0006e0ba  adds    r3, #1
0006e0bc  str.w   r0, [r4, r3, lsl #3]
0006e0c0  pop     {r4, r5, r7, pc}
0006e0c2  movw    r3, #0xe13
0006e0c6  cmp     r0, r3
0006e0c8  it      ne
0006e0ca  mvnne   r0, #2
0006e0ce  bne     #0x6e0c0
0006e0d0  mov     r0, r5
0006e0d2  bl      #0x2f3a0 ; -> get_x_dist
0006e0d6  ldr     r0, [r5, #0x28]
0006e0d8  cmp.w   r0, #0x110
0006e0dc  blt     #0x6e0fc
0006e0de  ldr.w   r2, [pc, #0x28]
0006e0e2  add     r2, pc ; -> 0x00067895  t_run_in_close
0006e0e4  ldr.w   r3, [r4, #0xa4]
0006e0e8  movs    r0, #0
0006e0ea  lsls    r3, r3, #3
0006e0ec  adds    r3, r3, r4
0006e0ee  str     r2, [r3, #4]
0006e0f0  ldr.w   r3, [r4, #0xa4]
0006e0f4  adds    r3, #1
0006e0f6  str.w   r0, [r4, r3, lsl #3]
0006e0fa  b       #0x6e0c0
0006e0fc  ldr.w   r2, [pc, #0xc]
0006e100  add     r2, pc ; -> 0x00070309  t_duck_under_proj
0006e102  b       #0x6e0e4
0006e104  add     r3, sp, #0x23c
