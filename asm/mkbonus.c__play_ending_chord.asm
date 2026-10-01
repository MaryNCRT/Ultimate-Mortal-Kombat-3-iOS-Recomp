========================================================================
play_ending_chord  0x0007cbfc  16 bytes   mkbonus.c
========================================================================

0007cbfc  push    {r7, lr}
0007cbfe  add     r7, sp, #0
0007cc00  movs    r3, #0x99
0007cc02  str     r3, [r0, #0x28]
0007cc04  bl      #0x57ad0 ; -> send_code_a3
0007cc08  pop     {r7, pc}
0007cc0a  nop     
