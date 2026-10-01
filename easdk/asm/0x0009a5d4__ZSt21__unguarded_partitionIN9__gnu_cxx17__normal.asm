========================================================================
ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEES4_PFbPKS3_SB_EET_SE_SE_T0_T1_  0x0009a5d4  72 bytes   Mayhem.mm
========================================================================

0009a5d4  push    {r4, r5, r6, r7, lr}
0009a5d6  add     r7, sp, #0xc
0009a5d8  push.w  {r8, sl}
0009a5dc  mov     sl, r2
0009a5de  mov     r8, r3
0009a5e0  mov     r6, r1
0009a5e2  mov     r4, r0
0009a5e4  mov     r5, r4
0009a5e6  mov     r1, sl
0009a5e8  ldr     r0, [r4], #4
0009a5ec  blx     r8
0009a5ee  cmp     r0, #0
0009a5f0  bne     #0x9a5e4
0009a5f2  subs    r4, r6, #4
0009a5f4  mov     r6, r4
0009a5f6  mov     r0, sl
0009a5f8  ldr     r1, [r4], #-4
0009a5fc  blx     r8
0009a5fe  cmp     r0, #0
0009a600  bne     #0x9a5f4
0009a602  cmp     r6, r5
0009a604  bls     #0x9a614
0009a606  ldr     r3, [r5]
0009a608  ldr     r2, [r6]
0009a60a  str     r2, [r5], #4
0009a60e  str     r3, [r6]
0009a610  mov     r0, r5
0009a612  b       #0x9a5e2
0009a614  mov     r0, r5
0009a616  pop.w   {r8, sl}
0009a61a  pop     {r4, r5, r6, r7, pc}
