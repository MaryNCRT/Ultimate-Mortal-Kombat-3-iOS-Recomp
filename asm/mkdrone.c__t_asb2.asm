========================================================================
t_asb2  0x0006f0b8  288 bytes   mkdrone.c
========================================================================

0006f0b8  push    {r4, r5, r7, lr}
0006f0ba  add     r7, sp, #8
0006f0bc  ldr.w   r2, [r0, #0xa4]
0006f0c0  mov     r4, r0
0006f0c2  ldr.w   r5, [r0, #0x108]
0006f0c6  adds    r1, r2, #1
0006f0c8  movw    r3, #0x11ce
0006f0cc  ldr.w   r0, [r0, r1, lsl #3]
0006f0d0  cmp     r0, r3
0006f0d2  beq     #0x6f14a
0006f0d4  ble     #0x6f0ea
0006f0d6  movw    r3, #0x11d8
0006f0da  cmp     r0, r3
0006f0dc  beq     #0x6f174
0006f0de  adds    r3, #2
0006f0e0  cmp     r0, r3
0006f0e2  beq     #0x6f12e
0006f0e4  mvn     r0, #2
0006f0e8  pop     {r4, r5, r7, pc}
0006f0ea  cbnz    r0, #0x6f116
0006f0ec  movw    r3, #0x11cc
0006f0f0  str.w   r3, [r4, r1, lsl #3]
0006f0f4  ldr.w   r3, [r4, #0xa4]
0006f0f8  adds    r2, r3, #1
0006f0fa  ldr     r3, [pc, #0xc8]
0006f0fc  str.w   r2, [r4, #0xa4]
0006f100  add     r3, pc ; -> 0x000f3884  t_do_duck
0006f102  ldr     r1, [r3]
0006f104  lsls    r3, r2, #3
0006f106  adds    r3, r3, r4
0006f108  str     r1, [r3, #4]
0006f10a  ldr.w   r3, [r4, #0xa4]
0006f10e  adds    r3, #1
0006f110  str.w   r0, [r4, r3, lsl #3]
0006f114  b       #0x6f0e8
0006f116  subs    r3, #2
0006f118  cmp     r0, r3
0006f11a  bne     #0x6f0e4
0006f11c  adds    r3, r2, #1
0006f11e  movs    r0, #1
0006f120  movw    r2, #0x11ce
0006f124  str.w   r2, [r4, r3, lsl #3]
0006f128  str.w   r0, [r4, #0xfc]
0006f12c  b       #0x6f0e8
0006f12e  ldr.w   r3, [pc, #0x98]
0006f132  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f134  ldr     r1, [r3]
0006f136  lsls    r3, r2, #3
0006f138  adds    r3, r3, r4
0006f13a  movs    r0, #0
0006f13c  str     r1, [r3, #4]
0006f13e  ldr.w   r3, [r4, #0xa4]
0006f142  adds    r3, #1
0006f144  str.w   r0, [r4, r3, lsl #3]
0006f148  b       #0x6f0e8
0006f14a  mov     r0, r5
0006f14c  bl      #0x551f0 ; -> am_i_facing_him
0006f150  ldr     r0, [r5, #0x5c]
0006f152  cbnz    r0, #0x6f198
0006f154  ldr.w   r3, [r4, #0xa4]
0006f158  movw    r2, #0x11d8
0006f15c  adds    r3, #1
0006f15e  str.w   r2, [r4, r3, lsl #3]
0006f162  ldr.w   r3, [r4, #0xa4]
0006f166  adds    r2, r3, #1
0006f168  ldr.w   r3, [pc, #0x60]
0006f16c  str.w   r2, [r4, #0xa4]
0006f170  add     r3, pc ; -> 0x000f38a4  t_duck_turnaround
0006f172  b       #0x6f102
0006f174  movs    r3, #0x80
0006f176  str     r3, [r5, #0x1c]
0006f178  ldr.w   r3, [r4, #0xa4]
0006f17c  movw    r2, #0x11da
0006f180  ldr.w   r1, [pc, #0x4c]
0006f184  adds    r3, #1
0006f186  str.w   r2, [r4, r3, lsl #3]
0006f18a  ldr.w   r3, [r4, #0xa4]
0006f18e  add     r1, pc ; -> 0x0006c77d  t_d_wait_nonattack
0006f190  adds    r2, r3, #1
0006f192  str.w   r2, [r4, #0xa4]
0006f196  b       #0x6f136
0006f198  mov     r0, r5
0006f19a  bl      #0x6c6b0 ; -> is_he_attacking
0006f19e  ldr     r0, [r5, #0x5c]
0006f1a0  cbnz    r0, #0x6f1be
0006f1a2  ldr     r3, [pc, #0x30]
0006f1a4  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f1a6  ldr     r2, [r3]
0006f1a8  ldr.w   r3, [r4, #0xa4]
0006f1ac  lsls    r3, r3, #3
0006f1ae  adds    r3, r3, r4
0006f1b0  str     r2, [r3, #4]
0006f1b2  ldr.w   r3, [r4, #0xa4]
0006f1b6  adds    r3, #1
0006f1b8  str.w   r0, [r4, r3, lsl #3]
0006f1bc  b       #0x6f0e8
0006f1be  ldr.w   r2, [r4, #0xa4]
0006f1c2  b       #0x6f11c
0006f1c4  blx     r0
0006f1c6  movs    r0, r1
0006f1c8  cmp     sl, sl
0006f1ca  movs    r0, r1
0006f1cc  bx      r6
0006f1ce  movs    r0, r1
0006f1d0  bpl     #0x6f1aa
