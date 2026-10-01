========================================================================
punch_strike_check  0x0002f7d8  24 bytes   joy.c
========================================================================

0002f7d8  push    {r4, r7, lr}
0002f7da  add     r7, sp, #4
0002f7dc  mov     r4, r0
0002f7de  bl      #0x594c8 ; -> strike_check_a0
0002f7e2  ldr     r3, [r4, #0x5c]
0002f7e4  cbz     r3, #0x2f7ec
0002f7e6  mov.w   r3, #-1
0002f7ea  str     r3, [r4, #0x48]
0002f7ec  pop     {r4, r7, pc}
0002f7ee  nop     
