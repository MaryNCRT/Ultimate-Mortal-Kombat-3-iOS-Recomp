========================================================================
do_winner_text  0x0007cc38  20 bytes   mkbonus.c
========================================================================

0007cc38  push    {r7, lr}
0007cc3a  add     r7, sp, #0
0007cc3c  movs    r1, #2
0007cc3e  ldr     r2, [r0, #0x3c]
0007cc40  movs    r3, #0
0007cc42  movs    r0, #3
0007cc44  bl      #0x31a28 ; -> MKEvent_Add
0007cc48  pop     {r7, pc}
0007cc4a  nop     
