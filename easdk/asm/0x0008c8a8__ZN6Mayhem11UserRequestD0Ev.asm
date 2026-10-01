========================================================================
ZN6Mayhem11UserRequestD0Ev  0x0008c8a8  48 bytes   Mayhem.mm
========================================================================

0008c8a8  push    {r4, r7, lr}
0008c8aa  add     r7, sp, #4
0008c8ac  ldr     r3, [pc, #0x20]
0008c8ae  mov     r4, r0
0008c8b0  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008c8b2  adds    r3, #8
0008c8b4  str     r3, [r0]
0008c8b6  ldr     r3, [pc, #0x1c]
0008c8b8  add     r3, pc ; -> 0x0017dbe4  ZTVN6Mayhem11UserRequestE
0008c8ba  adds    r3, #0x28
0008c8bc  str     r3, [r0, #8]
0008c8be  add.w   r0, r0, #8
0008c8c2  bl      #0x8c670 ; -> ZN6Mayhem7RequestD2Ev
0008c8c6  mov     r0, r4
0008c8c8  blx     #0xdd5a8 ; -> ZdlPv
0008c8cc  pop     {r4, r7, pc}
0008c8ce  nop     
0008c8d0  asrs    r0, r6, #0xc
0008c8d2  movs    r7, r1
0008c8d4  asrs    r0, r5, #0xc
0008c8d6  movs    r7, r1
