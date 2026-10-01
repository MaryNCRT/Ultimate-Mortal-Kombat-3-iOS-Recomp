========================================================================
ZN4midp5ClassC2Ev  0x0009e2b4  24 bytes   Object.cpp
========================================================================

0009e2b4  push    {r4, r7, lr}
0009e2b6  add     r7, sp, #4
0009e2b8  mov     r4, r0
0009e2ba  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009e2be  ldr     r3, [pc, #8]
0009e2c0  add     r3, pc ; -> 0x0017de7c  ZTVN4midp5ClassE
0009e2c2  adds    r3, #8
0009e2c4  str     r3, [r4]
0009e2c6  pop     {r4, r7, pc}
