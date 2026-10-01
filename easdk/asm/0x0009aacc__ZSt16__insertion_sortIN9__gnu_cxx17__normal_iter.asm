========================================================================
ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_  0x0009aacc  112 bytes   Mayhem.mm
========================================================================

0009aacc  push    {r4, r5, r6, r7, lr}
0009aace  add     r7, sp, #0xc
0009aad0  push.w  {r8, sl, fp}
0009aad4  sub     sp, #4
0009aad6  cmp     r0, r1
0009aad8  mov     fp, r1
0009aada  str     r2, [sp]
0009aadc  mov     sl, r0
0009aade  beq     #0x9ab30
0009aae0  add.w   r0, r0, #4
0009aae4  cmp     r1, r0
0009aae6  beq     #0x9ab30
0009aae8  adds    r5, r0, #4
0009aaea  b       #0x9ab0a
0009aaec  rsb     r2, sl, r8
0009aaf0  bic     r2, r2, #3
0009aaf4  rsb     r0, r2, r5
0009aaf8  mov     r1, sl
0009aafa  blx     #0xddba8 ; -> memmove
0009aafe  adds    r5, #4
0009ab00  cmp     r6, fp
0009ab02  str.w   r4, [sl]
0009ab06  beq     #0x9ab30
0009ab08  mov     r0, r6
0009ab0a  ldr     r4, [r0]
0009ab0c  ldr.w   r1, [sl]
0009ab10  ldr     r3, [sp]
0009ab12  mov     r6, r5
0009ab14  mov     r0, r4
0009ab16  sub.w   r8, r5, #4
0009ab1a  blx     r3
0009ab1c  cmp     r0, #0
0009ab1e  bne     #0x9aaec
0009ab20  mov     r0, r8
0009ab22  mov     r1, r4
0009ab24  ldr     r2, [sp]
0009ab26  bl      #0x9a61c ; -> ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEES4_PFbPKS3_SB_EEvT_T0_T1_
0009ab2a  adds    r5, #4
0009ab2c  cmp     r6, fp
0009ab2e  bne     #0x9ab08
0009ab30  sub.w   sp, r7, #0x18
0009ab34  pop.w   {r8, sl, fp}
0009ab38  pop     {r4, r5, r6, r7, pc}
0009ab3a  nop     
