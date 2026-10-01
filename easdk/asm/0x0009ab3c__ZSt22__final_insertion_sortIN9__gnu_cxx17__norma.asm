========================================================================
ZSt22__final_insertion_sortIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_  0x0009ab3c  56 bytes   Mayhem.mm
========================================================================

0009ab3c  push    {r4, r5, r6, r7, lr}
0009ab3e  add     r7, sp, #0xc
0009ab40  rsb     r3, r0, r1
0009ab44  mov     r5, r1
0009ab46  asrs    r3, r3, #2
0009ab48  cmp     r3, #0x10
0009ab4a  mov     r6, r2
0009ab4c  ble     #0x9ab6e
0009ab4e  add.w   r4, r0, #0x40
0009ab52  mov     r1, r4
0009ab54  bl      #0x9aacc ; -> ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_
0009ab58  cmp     r4, r5
0009ab5a  beq     #0x9ab6c
0009ab5c  ldr     r1, [r4]
0009ab5e  mov     r0, r4
0009ab60  mov     r2, r6
0009ab62  adds    r4, #4
0009ab64  bl      #0x9a61c ; -> ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEES4_PFbPKS3_SB_EEvT_T0_T1_
0009ab68  cmp     r4, r5
0009ab6a  bne     #0x9ab5c
0009ab6c  pop     {r4, r5, r6, r7, pc}
0009ab6e  bl      #0x9aacc ; -> ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_
0009ab72  b       #0x9ab6c
