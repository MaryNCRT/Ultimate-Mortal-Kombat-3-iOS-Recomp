========================================================================
ZNK4midp6String6equalsEPKc  0x0009da40  56 bytes   JString.cpp
========================================================================

0009da40  push    {r4, r5, r7, lr}
0009da42  add     r7, sp, #8
0009da44  mov     r5, r0
0009da46  cbz     r1, #0x9da70
0009da48  ldr     r3, [pc, #0x28]
0009da4a  mov.w   r2, #0x600
0009da4e  movs    r0, #0
0009da50  add     r3, pc ; -> 0x000f3444  0x0
0009da52  ldr     r3, [r3]
0009da54  ldr     r3, [r3]
0009da56  blx     #0xdd1d0 ; -> CFStringCreateWithCStringNoCopy
0009da5a  mov     r4, r0
0009da5c  mov     r1, r4
0009da5e  mov     r0, r5
0009da60  bl      #0x9da00 ; -> ZNK4midp6String6equalsEPK10__CFString
0009da64  mov     r5, r0
0009da66  mov     r0, r4
0009da68  blx     #0xdd14c ; -> CFRelease
0009da6c  mov     r0, r5
0009da6e  pop     {r4, r5, r7, pc}
0009da70  mov     r0, r1
0009da72  b       #0x9da6e
0009da74  ldr     r0, [r6, r7]
0009da76  movs    r5, r0
