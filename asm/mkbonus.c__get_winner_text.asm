========================================================================
get_winner_text  0x0007cbe0  28 bytes   mkbonus.c
========================================================================

0007cbe0  push    {r4, r7, lr}
0007cbe2  add     r7, sp, #4
0007cbe4  mov     r4, r0
0007cbe6  bl      #0x7cb80 ; -> get_winner_ochar
0007cbea  ldr     r3, [pc, #0xc]
0007cbec  ldr     r2, [r4, #0x1c]
0007cbee  add     r3, pc ; -> 0x00174d54  ochar_winner_text
0007cbf0  ldr.w   r3, [r3, r2, lsl #2]
0007cbf4  str     r3, [r4, #0x3c]
0007cbf6  pop     {r4, r7, pc}
0007cbf8  strh    r2, [r4, #0xa]
0007cbfa  movs    r7, r1
