========================================================================
ZN4midp6ObjectC2Ev  0x0009e29c  24 bytes   Object.cpp
========================================================================

0009e29c  push    {r4, r7, lr}
0009e29e  add     r7, sp, #4
0009e2a0  mov     r4, r0
0009e2a2  bl      #0x9e2cc ; -> ZN4midp16ReferenceCountedC2Ev
0009e2a6  ldr     r3, [pc, #8]
0009e2a8  add     r3, pc ; -> 0x0017dea8  ZTVN4midp6ObjectE
0009e2aa  adds    r3, #8
0009e2ac  str     r3, [r4]
0009e2ae  pop     {r4, r7, pc}
