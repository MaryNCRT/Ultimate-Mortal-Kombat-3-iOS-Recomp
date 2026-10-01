========================================================================
EASOC_MayhemIsReady  0x0007ebf0  20 bytes   EASDK_Handler.mm
========================================================================

0007ebf0  ldr     r0, [pc, #0xc]
0007ebf2  add     r0, pc ; -> 0x0017589c  mhState
0007ebf4  ldr     r0, [r0]
0007ebf6  cmp     r0, #3
0007ebf8  ite     ne
0007ebfa  movne   r0, #0
0007ebfc  moveq   r0, #1
0007ebfe  bx      lr
0007ec00  ldr     r6, [r4, #0x48]
0007ec02  movs    r7, r1
