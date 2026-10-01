========================================================================
ZN6Mayhem12MayhemThreadC2Ev  0x0008b740  28 bytes   Mayhem.mm
========================================================================

0008b740  push    {r4, r7, lr}
0008b742  add     r7, sp, #4
0008b744  mov     r4, r0
0008b746  bl      #0x9e2cc ; -> ZN4midp16ReferenceCountedC2Ev
0008b74a  ldr     r3, [pc, #0xc]
0008b74c  add     r3, pc ; -> 0x0017dc70  ZTVN6Mayhem12MayhemThreadE
0008b74e  adds    r3, #8
0008b750  str     r3, [r4]
0008b752  movs    r3, #0
0008b754  str     r3, [r4, #8]
0008b756  pop     {r4, r7, pc}
0008b758  movs    r5, #0x20
0008b75a  movs    r7, r1
