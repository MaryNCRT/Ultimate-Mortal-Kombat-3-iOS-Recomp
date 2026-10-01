========================================================================
ZN6Mayhem25GetUserRequestNonThreadedD2Ev  0x0008e238  36 bytes   Mayhem.mm
========================================================================

0008e238  push    {r7, lr}
0008e23a  add     r7, sp, #0
0008e23c  ldr     r3, [pc, #0x14]
0008e23e  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
0008e240  adds    r3, #8
0008e242  str     r3, [r0]
0008e244  ldr     r3, [pc, #0x10]
0008e246  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
0008e248  adds    r3, #0x28
0008e24a  str     r3, [r0, #8]
0008e24c  bl      #0x8e0bc ; -> ZN6Mayhem14GetUserRequestD2Ev
0008e250  pop     {r7, pc}
0008e252  nop     
0008e254  vld4.8  {d0, d1, d2, d3}, [sl], lr
0008e258  vld4.8  {d0, d1, d2, d3}, [r2], lr
