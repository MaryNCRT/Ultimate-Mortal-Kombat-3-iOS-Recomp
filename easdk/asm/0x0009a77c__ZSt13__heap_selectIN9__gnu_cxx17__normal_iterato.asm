========================================================================
ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_SE_T0_  0x0009a77c  148 bytes   Mayhem.mm
========================================================================

0009a77c  push    {r4, r5, r6, r7, lr}
0009a77e  add     r7, sp, #0xc
0009a780  push.w  {r8, sl, fp}
0009a784  sub     sp, #0xc
0009a786  str     r2, [sp, #4]
0009a788  rsb     r2, r0, r1
0009a78c  mov     r5, r0
0009a78e  asr.w   r8, r2, #2
0009a792  cmp.w   r8, #1
0009a796  mov     fp, r1
0009a798  mov     sl, r3
0009a79a  str     r1, [sp, #8]
0009a79c  ble     #0x9a7c8
0009a79e  sub.w   r3, r8, #2
0009a7a2  add.w   r1, r3, r3, lsr #31
0009a7a6  asrs    r4, r1, #1
0009a7a8  lsls    r3, r4, #2
0009a7aa  add.w   r6, r0, r3
0009a7ae  b       #0x9a7b2
0009a7b0  subs    r4, #1
0009a7b2  ldr     r3, [r6], #-4
0009a7b6  mov     r0, r5
0009a7b8  mov     r1, r4
0009a7ba  mov     r2, r8
0009a7bc  str.w   sl, [sp]
0009a7c0  bl      #0x9a6ec ; -> ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_
0009a7c4  cmp     r4, #0
0009a7c6  bne     #0x9a7b0
0009a7c8  ldr     r1, [sp, #4]
0009a7ca  mov     r4, fp
0009a7cc  cmp     fp, r1
0009a7ce  blo     #0x9a7da
0009a7d0  b       #0x9a806
0009a7d2  ldr     r3, [sp, #4]
0009a7d4  adds    r4, #4
0009a7d6  cmp     r4, r3
0009a7d8  bhs     #0x9a806
0009a7da  ldr     r0, [r4]
0009a7dc  ldr     r1, [r5]
0009a7de  blx     sl
0009a7e0  cmp     r0, #0
0009a7e2  beq     #0x9a7d2
0009a7e4  ldr     r2, [r5]
0009a7e6  ldr     r3, [r4]
0009a7e8  mov     r0, r5
0009a7ea  str     r2, [r4]
0009a7ec  ldr     r1, [sp, #8]
0009a7ee  str.w   sl, [sp]
0009a7f2  adds    r4, #4
0009a7f4  rsb     r2, r5, r1
0009a7f8  movs    r1, #0
0009a7fa  asrs    r2, r2, #2
0009a7fc  bl      #0x9a6ec ; -> ZSt13__adjust_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_
0009a800  ldr     r3, [sp, #4]
0009a802  cmp     r4, r3
0009a804  blo     #0x9a7da
0009a806  sub.w   sp, r7, #0x18
0009a80a  pop.w   {r8, sl, fp}
0009a80e  pop     {r4, r5, r6, r7, pc}
