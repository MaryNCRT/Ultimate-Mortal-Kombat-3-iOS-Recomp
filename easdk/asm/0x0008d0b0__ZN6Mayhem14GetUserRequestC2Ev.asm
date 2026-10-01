========================================================================
ZN6Mayhem14GetUserRequestC2Ev  0x0008d0b0  72 bytes   Mayhem.mm
========================================================================

0008d0b0  push    {r4, r7, lr}
0008d0b2  add     r7, sp, #4
0008d0b4  mov     r4, r0
0008d0b6  bl      #0x8d014 ; -> ZN6Mayhem11UserRequestC2Ev
0008d0ba  ldr     r3, [pc, #0x2c]
0008d0bc  mov.w   r2, #-1
0008d0c0  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008d0c2  adds    r3, #8
0008d0c4  str     r3, [r4]
0008d0c6  ldr     r3, [pc, #0x24]
0008d0c8  add     r3, pc ; -> 0x0017dba8  ZTVN6Mayhem14GetUserRequestE
0008d0ca  adds    r3, #0x28
0008d0cc  str     r3, [r4, #8]
0008d0ce  ldr     r3, [pc, #0x20]
0008d0d0  add     r3, pc ; -> 0x000f3370  0x0
0008d0d2  ldr     r3, [r3]
0008d0d4  adds    r3, #0xc
0008d0d6  str     r3, [r4, #0x58]
0008d0d8  mov.w   r3, #-1
0008d0dc  str     r2, [r4, #0x5c]
0008d0de  str     r3, [r4, #0x60]
0008d0e0  movs    r3, #0
0008d0e2  strb.w  r3, [r4, #0x64]
0008d0e6  pop     {r4, r7, pc}
0008d0e8  lsrs    r4, r4, #0xb
0008d0ea  movs    r7, r1
0008d0ec  lsrs    r4, r3, #0xb
0008d0ee  movs    r7, r1
0008d0f0  str     r4, [r3, #0x28]
0008d0f2  movs    r6, r0
0008d0f4  nop     
0008d0f6  nop     
