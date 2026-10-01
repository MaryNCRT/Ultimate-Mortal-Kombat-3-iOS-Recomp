========================================================================
ZN4midp6StringC2Ev  0x0009d9c4  32 bytes   JString.cpp
========================================================================

0009d9c4  push    {r4, r7, lr}
0009d9c6  add     r7, sp, #4
0009d9c8  mov     r4, r0
0009d9ca  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009d9ce  ldr     r3, [pc, #0x10]
0009d9d0  add     r3, pc ; -> 0x0017ddfc  ZTVN4midp6StringE
0009d9d2  adds    r3, #8
0009d9d4  str     r3, [r4]
0009d9d6  movs    r3, #0
0009d9d8  str     r3, [r4, #8]
0009d9da  strb    r3, [r4, #0xc]
0009d9dc  str     r3, [r4, #0x10]
0009d9de  pop     {r4, r7, pc}
0009d9e0  lsls    r0, r5, #0x10
0009d9e2  movs    r6, r1
