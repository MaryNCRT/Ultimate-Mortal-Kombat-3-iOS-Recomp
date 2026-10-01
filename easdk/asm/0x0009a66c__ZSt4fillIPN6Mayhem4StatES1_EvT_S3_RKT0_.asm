========================================================================
ZSt4fillIPN6Mayhem4StatES1_EvT_S3_RKT0_  0x0009a66c  32 bytes   Mayhem.mm
========================================================================

0009a66c  push    {r4, r5, r6, r7, lr}
0009a66e  add     r7, sp, #0xc
0009a670  cmp     r0, r1
0009a672  mov     r4, r0
0009a674  mov     r6, r1
0009a676  mov     r5, r2
0009a678  beq     #0x9a688
0009a67a  mov     r0, r4
0009a67c  mov     r1, r5
0009a67e  adds    r4, #8
0009a680  bl      #0x8ad6c ; -> ZN6Mayhem4StataSERKS0_
0009a684  cmp     r6, r4
0009a686  bne     #0x9a67a
0009a688  pop     {r4, r5, r6, r7, pc}
0009a68a  nop     
