========================================================================
ZN4midp5ClassD0Ev  0x0009e24c  32 bytes   Object.cpp
========================================================================

0009e24c  push    {r4, r7, lr}
0009e24e  add     r7, sp, #4
0009e250  ldr     r3, [pc, #0x14]
0009e252  mov     r4, r0
0009e254  add     r3, pc ; -> 0x0017de7c  ZTVN4midp5ClassE
0009e256  adds    r3, #8
0009e258  str     r3, [r0]
0009e25a  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009e25e  mov     r0, r4
0009e260  blx     #0xdd5a8 ; -> ZdlPv
0009e264  pop     {r4, r7, pc}
0009e266  nop     
0009e268  stc2    p0, c0, [r4], #-0x34
