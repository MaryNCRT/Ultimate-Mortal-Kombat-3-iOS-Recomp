========================================================================
EASOC_MayhemReset  0x0007ebd4  28 bytes   EASDK_Handler.mm
========================================================================

0007ebd4  ldr     r3, [pc, #0x10]
0007ebd6  movs    r2, #0
0007ebd8  add     r3, pc ; -> 0x0017589c  mhState
0007ebda  str     r2, [r3]
0007ebdc  ldr     r3, [pc, #0xc]
0007ebde  adds    r2, #5
0007ebe0  add     r3, pc ; -> 0x00175884  mayhemRetries
0007ebe2  str     r2, [r3]
0007ebe4  bx      lr
0007ebe6  nop     
0007ebe8  ldr     r0, [r0, #0x4c]
0007ebea  movs    r7, r1
0007ebec  ldr     r0, [r4, #0x48]
0007ebee  movs    r7, r1
