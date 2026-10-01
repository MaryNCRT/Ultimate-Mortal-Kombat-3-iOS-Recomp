========================================================================
ZN4midp10array_base7discardEv  0x0009d858  56 bytes   JArray.cpp
========================================================================

0009d858  push    {r4, r5, r6, r7, lr}
0009d85a  add     r7, sp, #0xc
0009d85c  ldr     r4, [r0, #0xc]
0009d85e  cbz     r4, #0x9d87a
0009d860  movs    r3, #0
0009d862  ldr     r5, [r4, #8]
0009d864  ldrb    r6, [r4, #0x14]
0009d866  str     r3, [r0, #0xc]
0009d868  str     r3, [r0, #8]
0009d86a  ldr     r3, [r4]
0009d86c  mov     r0, r4
0009d86e  ldr     r3, [r3, #8]
0009d870  blx     r3
0009d872  cbnz    r0, #0x9d882
0009d874  movs    r5, #0
0009d876  mov     r0, r5
0009d878  pop     {r4, r5, r6, r7, pc}
0009d87a  str     r4, [r0, #0xc]
0009d87c  str     r4, [r0, #8]
0009d87e  mov     r5, r4
0009d880  b       #0x9d876
0009d882  ldr     r3, [r4]
0009d884  mov     r0, r4
0009d886  ldr     r3, [r3, #4]
0009d888  blx     r3
0009d88a  cmp     r6, #0
0009d88c  bne     #0x9d876
0009d88e  b       #0x9d874
