========================================================================
ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEES4_PFbPKS3_SB_EEvT_T0_T1_  0x0009a61c  48 bytes   Mayhem.mm
========================================================================

0009a61c  push    {r4, r5, r6, r7, lr}
0009a61e  add     r7, sp, #0xc
0009a620  push.w  {r8, sl}
0009a624  subs    r4, r0, #4
0009a626  mov     sl, r1
0009a628  mov     r8, r2
0009a62a  mov     r5, r0
0009a62c  b       #0x9a634
0009a62e  ldr     r3, [r4, #4]
0009a630  str     r3, [r5]
0009a632  mov     r5, r6
0009a634  mov     r6, r4
0009a636  mov     r0, sl
0009a638  ldr     r1, [r4], #-4
0009a63c  blx     r8
0009a63e  cmp     r0, #0
0009a640  bne     #0x9a62e
0009a642  str.w   sl, [r5]
0009a646  pop.w   {r8, sl}
0009a64a  pop     {r4, r5, r6, r7, pc}
