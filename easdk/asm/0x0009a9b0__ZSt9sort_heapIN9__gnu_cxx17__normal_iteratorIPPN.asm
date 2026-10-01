========================================================================
ZSt9sort_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_  0x0009a9b0  80 bytes   Mayhem.mm
========================================================================

0009a9b0  push    {r4, r5, r6, r7, lr}
0009a9b2  add     r7, sp, #0xc
0009a9b4  str     r8, [sp, #-0x4]!
0009a9b8  sub     sp, #4
0009a9ba  rsb     r3, r0, r1
0009a9be  mov     r8, r2
0009a9c0  asrs    r3, r3, #2
0009a9c2  cmp     r3, #1
0009a9c4  mov     r5, r0
0009a9c6  ble     #0x9a9f6
0009a9c8  subs    r3, r1, #4
0009a9ca  rsb     r4, r0, r3
0009a9ce  ldr     r2, [r5]
0009a9d0  subs    r6, r1, #4
0009a9d2  ldr     r3, [r1, #-0x4]
0009a9d6  mov     r0, r5
0009a9d8  str     r2, [r1, #-0x4]
0009a9dc  rsb     r2, r5, r6
0009a9e0  movs    r1, #0
0009a9e2  asrs    r2, r2, #2
0009a9e4  str.w   r8, [sp]
0009a9e8  bl      #0x9a6ec ; -> ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_
0009a9ec  asrs    r3, r4, #2
0009a9ee  subs    r4, #4
0009a9f0  cmp     r3, #1
0009a9f2  mov     r1, r6
0009a9f4  bgt     #0x9a9ce
0009a9f6  sub.w   sp, r7, #0x10
0009a9fa  ldr     r8, [sp], #4
0009a9fe  pop     {r4, r5, r6, r7, pc}
