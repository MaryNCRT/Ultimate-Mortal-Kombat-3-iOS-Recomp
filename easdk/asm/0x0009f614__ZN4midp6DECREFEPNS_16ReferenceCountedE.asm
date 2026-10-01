========================================================================
ZN4midp6DECREFEPNS_16ReferenceCountedE  0x0009f614  32 bytes   LocaleManager.mm
========================================================================

0009f614  push    {r4, r7, lr}
0009f616  add     r7, sp, #4
0009f618  mov     r4, r0
0009f61a  cbz     r0, #0x9f624
0009f61c  ldr     r3, [r0]
0009f61e  ldr     r3, [r3, #8]
0009f620  blx     r3
0009f622  cbnz    r0, #0x9f628
0009f624  movs    r0, #0
0009f626  pop     {r4, r7, pc}
0009f628  ldr     r3, [r4]
0009f62a  mov     r0, r4
0009f62c  ldr     r3, [r3, #4]
0009f62e  blx     r3
0009f630  movs    r0, #1
0009f632  b       #0x9f626
