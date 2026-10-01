========================================================================
ZSt26__uninitialized_fill_n_auxIPN6Mayhem4UserEmS1_EvT_T0_RKT1_St12__false_type  0x0009a894  36 bytes   Mayhem.mm
========================================================================

0009a894  push    {r4, r5, r6, r7, lr}
0009a896  add     r7, sp, #0xc
0009a898  mov     r5, r1
0009a89a  mov     r6, r2
0009a89c  cbz     r1, #0x9a8b4
0009a89e  mov     r4, r0
0009a8a0  cbz     r4, #0x9a8aa
0009a8a2  mov     r0, r4
0009a8a4  mov     r1, r6
0009a8a6  bl      #0x8ac74 ; -> ZN6Mayhem4UserC1ERKS0_
0009a8aa  adds.w  r5, r5, #-1
0009a8ae  beq     #0x9a8b4
0009a8b0  adds    r4, #8
0009a8b2  b       #0x9a8a0
0009a8b4  pop     {r4, r5, r6, r7, pc}
0009a8b6  nop     
