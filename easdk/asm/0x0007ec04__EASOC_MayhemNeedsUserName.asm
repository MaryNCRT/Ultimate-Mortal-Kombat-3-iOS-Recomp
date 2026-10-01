========================================================================
EASOC_MayhemNeedsUserName  0x0007ec04  20 bytes   EASDK_Handler.mm
========================================================================

0007ec04  ldr     r0, [pc, #0xc]
0007ec06  add     r0, pc ; -> 0x0017589c  mhState
0007ec08  ldr     r0, [r0]
0007ec0a  cmp     r0, #4
0007ec0c  ite     ne
0007ec0e  movne   r0, #0
0007ec10  moveq   r0, #1
0007ec12  bx      lr
0007ec14  ldr     r2, [r2, #0x48]
0007ec16  movs    r7, r1
