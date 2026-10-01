========================================================================
ZSt4fillIPN6Mayhem4UserES1_EvT_S3_RKT0_  0x0009a64c  32 bytes   Mayhem.mm
========================================================================

0009a64c  push    {r4, r5, r6, r7, lr}
0009a64e  add     r7, sp, #0xc
0009a650  cmp     r0, r1
0009a652  mov     r4, r0
0009a654  mov     r6, r1
0009a656  mov     r5, r2
0009a658  beq     #0x9a668
0009a65a  mov     r0, r4
0009a65c  mov     r1, r5
0009a65e  adds    r4, #8
0009a660  bl      #0x8ac80 ; -> ZN6Mayhem4UseraSERKS0_
0009a664  cmp     r6, r4
0009a666  bne     #0x9a65a
0009a668  pop     {r4, r5, r6, r7, pc}
0009a66a  nop     
