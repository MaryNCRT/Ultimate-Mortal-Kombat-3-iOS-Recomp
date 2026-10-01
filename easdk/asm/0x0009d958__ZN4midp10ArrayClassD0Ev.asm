========================================================================
ZN4midp10ArrayClassD0Ev  0x0009d958  32 bytes   JArray.cpp
========================================================================

0009d958  push    {r4, r7, lr}
0009d95a  add     r7, sp, #4
0009d95c  ldr     r3, [pc, #0x14]
0009d95e  mov     r4, r0
0009d960  add     r3, pc ; -> 0x0017ddb0  ZTVN4midp10ArrayClassE
0009d962  adds    r3, #8
0009d964  str     r3, [r0]
0009d966  bl      #0x9e26c ; -> ZN4midp5ClassD2Ev
0009d96a  mov     r0, r4
0009d96c  blx     #0xdd5a8 ; -> ZdlPv
0009d970  pop     {r4, r7, pc}
0009d972  nop     
0009d974  lsls    r4, r1, #0x11
0009d976  movs    r6, r1
