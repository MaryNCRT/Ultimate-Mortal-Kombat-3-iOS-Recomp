========================================================================
ZN4midp10array_baseD0Ev  0x0009d894  32 bytes   JArray.cpp
========================================================================

0009d894  push    {r4, r7, lr}
0009d896  add     r7, sp, #4
0009d898  ldr     r3, [pc, #0x14]
0009d89a  mov     r4, r0
0009d89c  add     r3, pc ; -> 0x0017dd7c  ZTVN4midp10array_baseE
0009d89e  adds    r3, #8
0009d8a0  str     r3, [r0]
0009d8a2  bl      #0x9e234 ; -> ZN4midp6ObjectD2Ev
0009d8a6  mov     r0, r4
0009d8a8  blx     #0xdd5a8 ; -> ZdlPv
0009d8ac  pop     {r4, r7, pc}
0009d8ae  nop     
0009d8b0  lsls    r4, r3, #0x13
0009d8b2  movs    r6, r1
