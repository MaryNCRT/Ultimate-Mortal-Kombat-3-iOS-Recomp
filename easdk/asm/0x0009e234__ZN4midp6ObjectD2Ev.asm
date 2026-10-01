========================================================================
ZN4midp6ObjectD2Ev  0x0009e234  24 bytes   Object.cpp
========================================================================

0009e234  push    {r7, lr}
0009e236  add     r7, sp, #0
0009e238  ldr     r3, [pc, #0xc]
0009e23a  add     r3, pc ; -> 0x0017dea8  ZTVN4midp6ObjectE
0009e23c  adds    r3, #8
0009e23e  str     r3, [r0]
0009e240  bl      #0x9e380 ; -> ZN4midp16ReferenceCountedD2Ev
0009e244  pop     {r7, pc}
0009e246  nop     
0009e248  stc2l   p0, c0, [sl], #-0x34
