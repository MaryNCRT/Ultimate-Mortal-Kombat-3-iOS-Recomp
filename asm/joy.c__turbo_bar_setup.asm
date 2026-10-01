========================================================================
turbo_bar_setup  0x0002f3e4  44 bytes   joy.c
========================================================================

0002f3e4  ldr     r2, [pc, #0x24]
0002f3e6  ldr.w   ip, [r0]
0002f3ea  add     r2, pc ; -> 0x0016564c  bt_jump+0x28
0002f3ec  ldr.w   r3, [ip, #8]
0002f3f0  ldr     r2, [r2]
0002f3f2  lsls    r1, r3, #2
0002f3f4  add.w   r3, r2, #0x378
0002f3f8  add     r3, r1
0002f3fa  str     r3, [r0, #0x30]
0002f3fc  ldr.w   r3, [ip, #8]
0002f400  add.w   r2, r2, #0x388
0002f404  lsls    r3, r3, #2
0002f406  adds    r3, r3, r2
0002f408  str     r3, [r0, #0x34]
0002f40a  bx      lr
0002f40c  str     r6, [r3, #0x24]
0002f40e  movs    r3, r2
