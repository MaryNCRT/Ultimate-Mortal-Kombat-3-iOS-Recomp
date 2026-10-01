========================================================================
ZNK4midp6String6equalsEPKNS_6ObjectE  0x0009de24  24 bytes   JString.cpp
========================================================================

0009de24  push    {r7, lr}
0009de26  add     r7, sp, #0
0009de28  movs    r2, #0
0009de2a  ldr     r1, [r1, #8]
0009de2c  ldr     r0, [r0, #8]
0009de2e  blx     #0xdd194 ; -> CFStringCompare
0009de32  rsbs.w  r0, r0, #1
0009de36  it      lo
0009de38  movlo   r0, #0
0009de3a  pop     {r7, pc}
