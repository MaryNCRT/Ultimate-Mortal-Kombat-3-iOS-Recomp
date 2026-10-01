========================================================================
t_jumpup_kick  0x0002f0d0  120 bytes   joy.c
========================================================================

0002f0d0  push    {r4, r5, r7, lr}
0002f0d2  add     r7, sp, #8
0002f0d4  mov     r4, r0
0002f0d6  ldr.w   r2, [r4, #0xa4]
0002f0da  ldr.w   r0, [r0, #0x108]
0002f0de  adds    r3, r2, #1
0002f0e0  ldr.w   r5, [r4, r3, lsl #3]
0002f0e4  cbnz    r5, #0x2f11c
0002f0e6  bl      #0x2ec68 ; -> disable_all_buttons
0002f0ea  ldr.w   r3, [r4, #0xa4]
0002f0ee  mov.w   r2, #0x1e6
0002f0f2  mov     r0, r5
0002f0f4  adds    r3, #1
0002f0f6  str.w   r2, [r4, r3, lsl #3]
0002f0fa  ldr.w   r3, [r4, #0xa4]
0002f0fe  adds    r2, r3, #1
0002f100  ldr     r3, [pc, #0x3c]
0002f102  str.w   r2, [r4, #0xa4]
0002f106  add     r3, pc ; -> 0x000f38b0  t_do_jumpup_kick
0002f108  ldr     r1, [r3]
0002f10a  lsls    r3, r2, #3
0002f10c  adds    r3, r3, r4
0002f10e  str     r1, [r3, #4]
0002f110  ldr.w   r3, [r4, #0xa4]
0002f114  adds    r3, #1
0002f116  str.w   r5, [r4, r3, lsl #3]
0002f11a  pop     {r4, r5, r7, pc}
0002f11c  cmp.w   r5, #0x1e6
0002f120  it      ne
0002f122  mvnne   r0, #2
0002f126  bne     #0x2f11a
0002f128  ldr     r1, [pc, #0x18]
0002f12a  lsls    r3, r2, #3
0002f12c  adds    r3, r3, r4
0002f12e  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002f130  str     r1, [r3, #4]
0002f132  ldr.w   r3, [r4, #0xa4]
0002f136  movs    r0, #0
0002f138  adds    r3, #1
0002f13a  str.w   r0, [r4, r3, lsl #3]
0002f13e  b       #0x2f11a
0002f140  blxns   r4
0002f142  movs    r4, r1
0002f144  lsrs    r7, r5, #0x1c
0002f146  movs    r0, r0
