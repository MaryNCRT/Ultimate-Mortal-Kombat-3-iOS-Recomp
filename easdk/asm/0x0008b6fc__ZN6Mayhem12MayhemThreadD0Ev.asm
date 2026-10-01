========================================================================
ZN6Mayhem12MayhemThreadD0Ev  0x0008b6fc  32 bytes   Mayhem.mm
========================================================================

0008b6fc  push    {r4, r7, lr}
0008b6fe  add     r7, sp, #4
0008b700  ldr     r3, [pc, #0x14]
0008b702  mov     r4, r0
0008b704  add     r3, pc ; -> 0x0017dc70  ZTVN6Mayhem12MayhemThreadE
0008b706  adds    r3, #8
0008b708  str     r3, [r0]
0008b70a  bl      #0x9e380 ; -> ZN4midp16ReferenceCountedD2Ev
0008b70e  mov     r0, r4
0008b710  blx     #0xdd5a8 ; -> ZdlPv
0008b714  pop     {r4, r7, pc}
0008b716  nop     
0008b718  movs    r5, #0x68
0008b71a  movs    r7, r1
