========================================================================
ZSt26__uninitialized_fill_n_auxIPN6Mayhem4StatEmS1_EvT_T0_RKT1_St12__false_type  0x0009a8b8  36 bytes   Mayhem.mm
========================================================================

0009a8b8  push    {r4, r5, r6, r7, lr}
0009a8ba  add     r7, sp, #0xc
0009a8bc  mov     r5, r1
0009a8be  mov     r6, r2
0009a8c0  cbz     r1, #0x9a8d8
0009a8c2  mov     r4, r0
0009a8c4  cbz     r4, #0x9a8ce
0009a8c6  mov     r0, r4
0009a8c8  mov     r1, r6
0009a8ca  bl      #0x8ad3c ; -> ZN6Mayhem4StatC1ERKS0_
0009a8ce  adds.w  r5, r5, #-1
0009a8d2  beq     #0x9a8d8
0009a8d4  adds    r4, #8
0009a8d6  b       #0x9a8c4
0009a8d8  pop     {r4, r5, r6, r7, pc}
0009a8da  nop     
