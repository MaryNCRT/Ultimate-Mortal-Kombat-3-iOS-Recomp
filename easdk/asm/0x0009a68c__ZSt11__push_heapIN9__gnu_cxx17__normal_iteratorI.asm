========================================================================
ZSt11__push_heapIN9__gnu_cxx17__normal_iteratorIPPN6Mayhem13UserStatTupleESt6vectorIS4_SaIS4_EEEEiS4_PFbPKS3_SB_EEvT_T0_SF_T1_T2_  0x0009a68c  96 bytes   Mayhem.mm
========================================================================

0009a68c  push    {r4, r5, r6, r7, lr}
0009a68e  add     r7, sp, #0xc
0009a690  push.w  {r8, sl, fp}
0009a694  sub     sp, #4
0009a696  cmp     r1, r2
0009a698  mov     r6, r0
0009a69a  mov     r8, r1
0009a69c  mov     fp, r2
0009a69e  str     r3, [sp]
0009a6a0  ble     #0x9a6d4
0009a6a2  add.w   r3, r1, #-1
0009a6a6  add.w   r3, r3, r3, lsr #31
0009a6aa  asrs    r5, r3, #1
0009a6ac  b       #0x9a6c2
0009a6ae  ldr     r3, [r6, r4]
0009a6b0  cmp     fp, r5
0009a6b2  str.w   r3, [r6, r8, lsl #2]
0009a6b6  bge     #0x9a6dc
0009a6b8  subs    r3, r5, #1
0009a6ba  mov     r8, r5
0009a6bc  add.w   r3, r3, r3, lsr #31
0009a6c0  asrs    r5, r3, #1
0009a6c2  lsls    r4, r5, #2
0009a6c4  ldr     r1, [sp]
0009a6c6  ldr     r0, [r6, r4]
0009a6c8  ldr     r3, [sp, #0x24]
0009a6ca  add.w   sl, r6, r4
0009a6ce  blx     r3
0009a6d0  cmp     r0, #0
0009a6d2  bne     #0x9a6ae
0009a6d4  lsl.w   r1, r8, #2
0009a6d8  add.w   sl, r6, r1
0009a6dc  ldr     r3, [sp]
0009a6de  str.w   r3, [sl]
0009a6e2  sub.w   sp, r7, #0x18
0009a6e6  pop.w   {r8, sl, fp}
0009a6ea  pop     {r4, r5, r6, r7, pc}
