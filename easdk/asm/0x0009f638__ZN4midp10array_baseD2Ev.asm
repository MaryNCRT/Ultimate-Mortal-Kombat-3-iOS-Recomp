========================================================================
ZN4midp10array_baseD2Ev  0x0009f638  24 bytes   LocaleManager.mm
========================================================================

0009f638  push    {r7, lr}
0009f63a  add     r7, sp, #0
0009f63c  ldr     r3, [pc, #0xc]
0009f63e  add     r3, pc ; -> 0x000f343c  ZTVN4midp10array_baseE
0009f640  ldr     r3, [r3]
0009f642  adds    r3, #8
0009f644  str     r3, [r0]
0009f646  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009f64a  pop     {r7, pc}
0009f64c  subs    r5, #0xfa
0009f64e  movs    r5, r0
