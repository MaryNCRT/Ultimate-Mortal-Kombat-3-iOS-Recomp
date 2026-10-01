========================================================================
ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiPFbPKS3_SB_EEvT_SE_T0_T1_  0x0009aa00  204 bytes   Mayhem.mm
========================================================================

0009aa00  push    {r4, r5, r6, r7, lr}
0009aa02  add     r7, sp, #0xc
0009aa04  push.w  {r8, sl, fp}
0009aa08  sub     sp, #0xc
0009aa0a  mov     r8, r3
0009aa0c  rsb     r3, r0, r1
0009aa10  mov     fp, r2
0009aa12  asrs    r3, r3, #2
0009aa14  cmp     r3, #0x10
0009aa16  mov     r5, r0
0009aa18  mov     r6, r1
0009aa1a  str     r0, [sp, #4]
0009aa1c  ble     #0x9aac2
0009aa1e  cmp     r2, #0
0009aa20  beq     #0x9aaac
0009aa22  str     r1, [sp, #8]
0009aa24  b       #0x9aa66
0009aa26  ldr     r0, [r5, r4]
0009aa28  ldr     r1, [r6, #-0x4]
0009aa2c  blx     r8
0009aa2e  cmp     r0, #0
0009aa30  beq     #0x9aa90
0009aa32  ldr.w   sl, [sp]
0009aa36  ldr.w   r2, [sl]
0009aa3a  ldr     r1, [sp, #8]
0009aa3c  mov     r3, r8
0009aa3e  mov     r0, r5
0009aa40  bl      #0x9a5d4 ; -> ZSt21__unguarded_partitionIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEES4_PFbPKS3_SB_EET_SE_SE_T0_T1_
0009aa44  mov     r2, fp
0009aa46  mov     r3, r8
0009aa48  ldr     r1, [sp, #8]
0009aa4a  mov     r4, r0
0009aa4c  bl      #0x9aa00 ; -> ZSt16__introsort_loopIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiPFbPKS3_SB_EEvT_SE_T0_T1_
0009aa50  ldr     r2, [sp, #4]
0009aa52  rsb     r3, r2, r4
0009aa56  asrs    r3, r3, #2
0009aa58  cmp     r3, #0x10
0009aa5a  ble     #0x9aac2
0009aa5c  str     r4, [sp, #8]
0009aa5e  mov     r6, r4
0009aa60  cmp.w   fp, #0
0009aa64  beq     #0x9aaac
0009aa66  asrs    r3, r3, #1
0009aa68  add.w   fp, fp, #-1
0009aa6c  lsls    r4, r3, #2
0009aa6e  add.w   r2, r5, r4
0009aa72  str     r2, [sp]
0009aa74  ldr     r0, [r5]
0009aa76  ldr     r1, [r5, r4]
0009aa78  sub.w   sl, r6, #4
0009aa7c  blx     r8
0009aa7e  cmp     r0, #0
0009aa80  bne     #0x9aa26
0009aa82  ldr     r0, [r5]
0009aa84  ldr     r1, [r6, #-0x4]
0009aa88  blx     r8
0009aa8a  cbz     r0, #0x9aa9e
0009aa8c  mov     sl, r5
0009aa8e  b       #0x9aa36
0009aa90  ldr     r0, [r5]
0009aa92  ldr     r1, [r6, #-0x4]
0009aa96  blx     r8
0009aa98  cmp     r0, #0
0009aa9a  bne     #0x9aa36
0009aa9c  b       #0x9aa8c
0009aa9e  ldr     r0, [r5, r4]
0009aaa0  ldr     r1, [r6, #-0x4]
0009aaa4  blx     r8
0009aaa6  cmp     r0, #0
0009aaa8  bne     #0x9aa36
0009aaaa  b       #0x9aa32
0009aaac  mov     r0, r5
0009aaae  mov     r1, r6
0009aab0  mov     r2, r6
0009aab2  mov     r3, r8
0009aab4  bl      #0x9a77c ; -> ZSt13__heap_selectIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_SE_T0_
0009aab8  mov     r0, r5
0009aaba  mov     r1, r6
0009aabc  mov     r2, r8
0009aabe  bl      #0x9a9b0 ; -> ZSt9sort_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEPFbPKS3_SB_EEvT_SE_T0_
0009aac2  sub.w   sp, r7, #0x18
0009aac6  pop.w   {r8, sl, fp}
0009aaca  pop     {r4, r5, r6, r7, pc}
