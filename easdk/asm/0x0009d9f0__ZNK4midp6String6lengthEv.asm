========================================================================
ZNK4midp6String6lengthEv  0x0009d9f0  16 bytes   JString.cpp
========================================================================

0009d9f0  push    {r7, lr}
0009d9f2  add     r7, sp, #0
0009d9f4  ldr     r0, [r0, #8]
0009d9f6  cbz     r0, #0x9d9fc
0009d9f8  blx     #0xdd200 ; -> CFStringGetLength
0009d9fc  pop     {r7, pc}
0009d9fe  nop     
