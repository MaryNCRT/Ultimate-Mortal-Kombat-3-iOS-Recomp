========================================================================
t_d_wait_nonattack  0x0006c77c  128 bytes   mkdrone.c
========================================================================

0006c77c  push    {r4, r5, r7, lr}
0006c77e  add     r7, sp, #8
0006c780  ldr.w   r2, [r0, #0xa4]
0006c784  mov     r4, r0
0006c786  ldr.w   r5, [r0, #0x108]
0006c78a  adds    r3, r2, #1
0006c78c  ldr.w   r3, [r0, r3, lsl #3]
0006c790  cbnz    r3, #0x6c7a4
0006c792  adds    r3, r2, #1
0006c794  movs    r0, #1
0006c796  movw    r2, #0x779
0006c79a  str.w   r2, [r4, r3, lsl #3]
0006c79e  str.w   r0, [r4, #0xfc]
0006c7a2  pop     {r4, r5, r7, pc}
0006c7a4  movw    r2, #0x779
0006c7a8  cmp     r3, r2
0006c7aa  it      ne
0006c7ac  mvnne   r0, #2
0006c7b0  bne     #0x6c7a2
0006c7b2  ldr     r3, [r5, #0x44]
0006c7b4  subs    r3, #1
0006c7b6  str     r3, [r5, #0x44]
0006c7b8  cbnz    r3, #0x6c7cc
0006c7ba  ldr.w   r3, [r4, #0xa4]
0006c7be  cmp     r3, #0
0006c7c0  ble     #0x6c7de
0006c7c2  subs    r3, #1
0006c7c4  movs    r0, #0
0006c7c6  str.w   r3, [r4, #0xa4]
0006c7ca  b       #0x6c7a2
0006c7cc  mov     r0, r5
0006c7ce  bl      #0x6c6b0 ; -> is_he_attacking
0006c7d2  ldr     r0, [r5, #0x5c]
0006c7d4  cmp     r0, #0
0006c7d6  beq     #0x6c7ba
0006c7d8  ldr.w   r2, [r4, #0xa4]
0006c7dc  b       #0x6c792
0006c7de  ldr     r2, [pc, #0x18]
0006c7e0  lsls    r3, r3, #3
0006c7e2  adds    r3, r3, r4
0006c7e4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006c7e6  movs    r0, #0
0006c7e8  ldr     r2, [r2]
0006c7ea  str     r2, [r3, #4]
0006c7ec  ldr.w   r3, [r4, #0xa4]
0006c7f0  adds    r3, #1
0006c7f2  str.w   r0, [r4, r3, lsl #3]
0006c7f6  b       #0x6c7a2
0006c7f8  ldr     r0, [r4, #0x70]
0006c7fa  movs    r0, r1
