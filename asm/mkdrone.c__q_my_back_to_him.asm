========================================================================
q_my_back_to_him  0x0006f1d8  24 bytes   mkdrone.c
========================================================================

0006f1d8  push    {r4, r7, lr}
0006f1da  add     r7, sp, #4
0006f1dc  mov     r4, r0
0006f1de  bl      #0x551f0 ; -> am_i_facing_him
0006f1e2  ldr     r3, [r4, #0x5c]
0006f1e4  rsbs.w  r3, r3, #1
0006f1e8  it      lo
0006f1ea  movlo   r3, #0
0006f1ec  str     r3, [r4, #0x5c]
0006f1ee  pop     {r4, r7, pc}
