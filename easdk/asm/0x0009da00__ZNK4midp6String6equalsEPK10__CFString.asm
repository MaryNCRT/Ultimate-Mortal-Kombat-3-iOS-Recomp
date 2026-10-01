========================================================================
ZNK4midp6String6equalsEPK10__CFString  0x0009da00  64 bytes   JString.cpp
========================================================================

0009da00  push    {r4, r5, r6, r7, lr}
0009da02  add     r7, sp, #0xc
0009da04  ldr     r6, [r0, #8]
0009da06  mov     r4, r1
0009da08  cmp     r6, r1
0009da0a  beq     #0x9da24
0009da0c  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009da10  mov     r5, r0
0009da12  cbz     r4, #0x9da28
0009da14  mov     r0, r4
0009da16  blx     #0xdd200 ; -> CFStringGetLength
0009da1a  cmp     r0, r5
0009da1c  beq     #0x9da22
0009da1e  movs    r0, #0
0009da20  pop     {r4, r5, r6, r7, pc}
0009da22  cbnz    r0, #0x9da2c
0009da24  movs    r0, #1
0009da26  b       #0x9da20
0009da28  mov     r0, r4
0009da2a  b       #0x9da1a
0009da2c  mov     r0, r6
0009da2e  mov     r1, r4
0009da30  movs    r2, #0
0009da32  blx     #0xdd194 ; -> CFStringCompare
0009da36  rsbs.w  r0, r0, #1
0009da3a  it      lo
0009da3c  movlo   r0, #0
0009da3e  b       #0x9da20
