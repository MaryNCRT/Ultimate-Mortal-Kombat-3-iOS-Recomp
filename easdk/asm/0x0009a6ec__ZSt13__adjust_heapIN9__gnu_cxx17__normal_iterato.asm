========================================================================
ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_  0x0009a6ec  144 bytes   Mayhem.mm
========================================================================

0009a6ec  push    {r4, r5, r6, r7, lr}
0009a6ee  add     r7, sp, #0xc
0009a6f0  push.w  {r8, sl, fp}
0009a6f4  sub     sp, #0xc
0009a6f6  str     r3, [sp, #8]
0009a6f8  add.w   r3, r1, #1
0009a6fc  mov     ip, r1
0009a6fe  lsls    r4, r3, #1
0009a700  cmp     r4, r2
0009a702  mov     fp, r2
0009a704  mov     r5, r0
0009a706  itt     ge
0009a708  movge   r2, r4
0009a70a  movge   r1, r1
0009a70c  bge     #0x9a754
0009a70e  mov     r2, r4
0009a710  mov     sl, ip
0009a712  b       #0x9a72a
0009a714  mov     r4, r6
0009a716  ldr.w   r3, [r8]
0009a71a  str.w   r3, [r5, sl, lsl #2]
0009a71e  adds    r3, r4, #1
0009a720  mov     sl, r4
0009a722  lsls    r2, r3, #1
0009a724  cmp     fp, r2
0009a726  ble     #0x9a750
0009a728  mov     r4, r2
0009a72a  subs    r6, r4, #1
0009a72c  ldr.w   r0, [r5, r2, lsl #2]
0009a730  lsls    r3, r6, #2
0009a732  add.w   r8, r5, r3
0009a736  ldr     r1, [r5, r3]
0009a738  str.w   ip, [sp, #4]
0009a73c  ldr     r3, [sp, #0x2c]
0009a73e  blx     r3
0009a740  ldr.w   ip, [sp, #4]
0009a744  cmp     r0, #0
0009a746  bne     #0x9a714
0009a748  lsls    r3, r4, #2
0009a74a  add.w   r8, r5, r3
0009a74e  b       #0x9a716
0009a750  mov     r1, r4
0009a752  mov     r4, r2
0009a754  cmp     r2, fp
0009a756  bne     #0x9a764
0009a758  subs    r2, r4, #1
0009a75a  ldr.w   r3, [r5, r2, lsl #2]
0009a75e  str.w   r3, [r5, r1, lsl #2]
0009a762  mov     r1, r2
0009a764  ldr     r3, [sp, #0x2c]
0009a766  mov     r0, r5
0009a768  mov     r2, ip
0009a76a  str     r3, [sp]
0009a76c  ldr     r3, [sp, #8]
0009a76e  bl      #0x9a68c ; -> ZSt11__push_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_
0009a772  sub.w   sp, r7, #0x18
0009a776  pop.w   {r8, sl, fp}
0009a77a  pop     {r4, r5, r6, r7, pc}
