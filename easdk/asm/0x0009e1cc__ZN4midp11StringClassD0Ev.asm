========================================================================
ZN4midp11StringClassD0Ev  0x0009e1cc  32 bytes   JString.cpp
========================================================================

0009e1cc  push    {r4, r7, lr}
0009e1ce  add     r7, sp, #4
0009e1d0  ldr     r3, [pc, #0x14]
0009e1d2  mov     r4, r0
0009e1d4  add     r3, pc ; -> 0x0017de2c  ZTVN4midp11StringClassE
0009e1d6  adds    r3, #8
0009e1d8  str     r3, [r0]
0009e1da  bl      #0x9e26c ; -> ZN4midp5ClassD2Ev
0009e1de  mov     r0, r4
0009e1e0  blx     #0xdd5a8 ; -> ZdlPv
0009e1e4  pop     {r4, r7, pc}
0009e1e6  nop     
0009e1e8  mrrc2   p0, #0, r0, r4, c13
