========================================================================
ZN6Mayhem11UserRequestD2Ev  0x0008c8d8  36 bytes   Mayhem.mm
========================================================================

0008c8d8  push    {r7, lr}
0008c8da  add     r7, sp, #0
0008c8dc  ldr     r3, [pc, #0x14]
0008c8de  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008c8e0  adds    r3, #8
0008c8e2  str     r3, [r0]
0008c8e4  ldr     r3, [pc, #0x10]
0008c8e6  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008c8e8  adds    r3, #0x28
0008c8ea  str     r3, [r0, #8]!
0008c8ee  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008c8f2  pop     {r7, pc}
0008c8f4  asrs    r2, r0, #0xc
0008c8f6  movs    r7, r1
0008c8f8  asrs    r2, r7, #0xb
0008c8fa  movs    r7, r1
