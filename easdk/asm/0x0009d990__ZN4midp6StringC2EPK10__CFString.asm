========================================================================
ZN4midp6StringC2EPK10__CFString  0x0009d990  40 bytes   JString.cpp
========================================================================

0009d990  push    {r4, r5, r7, lr}
0009d992  add     r7, sp, #8
0009d994  mov     r4, r0
0009d996  mov     r5, r1
0009d998  bl      #0x9e29c ; -> ZN4midp6ObjectC2Ev
0009d99c  ldr     r3, [pc, #0x14]
0009d99e  add     r3, pc ; -> 0x0017ddfc  ZTVN4midp6StringE
0009d9a0  adds    r3, #8
0009d9a2  str     r3, [r4]
0009d9a4  movs    r3, #0
0009d9a6  str     r3, [r4, #8]
0009d9a8  strb    r3, [r4, #0xc]
0009d9aa  str     r3, [r4, #0x10]
0009d9ac  cbz     r5, #0x9d9b0
0009d9ae  str     r5, [r4, #8]
0009d9b0  pop     {r4, r5, r7, pc}
0009d9b2  nop     
0009d9b4  lsls    r2, r3, #0x11
0009d9b6  movs    r6, r1
