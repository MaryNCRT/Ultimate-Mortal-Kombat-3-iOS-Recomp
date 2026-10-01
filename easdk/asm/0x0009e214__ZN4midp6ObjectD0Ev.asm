========================================================================
ZN4midp6ObjectD0Ev  0x0009e214  32 bytes   Object.cpp
========================================================================

0009e214  push    {r4, r7, lr}
0009e216  add     r7, sp, #4
0009e218  ldr     r3, [pc, #0x14]
0009e21a  mov     r4, r0
0009e21c  add     r3, pc ; -> 0x0017dea8  ZTVN4midp6ObjectE
0009e21e  adds    r3, #8
0009e220  str     r3, [r0]
0009e222  bl      #0x9e380 ; -> ZN4midp16ReferenceCountedD2Ev
0009e226  mov     r0, r4
0009e228  blx     #0xdd5a8 ; -> ZdlPv
0009e22c  pop     {r4, r7, pc}
0009e22e  nop     
0009e230  stc2    p0, c0, [r8], {0xd}
