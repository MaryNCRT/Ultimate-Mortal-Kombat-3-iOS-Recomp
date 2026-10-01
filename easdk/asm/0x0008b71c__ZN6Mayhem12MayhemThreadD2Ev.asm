========================================================================
ZN6Mayhem12MayhemThreadD2Ev  0x0008b71c  24 bytes   Mayhem.mm
========================================================================

0008b71c  push    {r7, lr}
0008b71e  add     r7, sp, #0
0008b720  ldr     r3, [pc, #0xc]
0008b722  add     r3, pc ; -> 0x0017dc70  ZTVN6Mayhem12MayhemThreadE
0008b724  adds    r3, #8
0008b726  str     r3, [r0]
0008b728  bl      #0x9e380 ; -> ZN4midp16ReferenceCountedD2Ev
0008b72c  pop     {r7, pc}
0008b72e  nop     
0008b730  movs    r5, #0x4a
0008b732  movs    r7, r1
