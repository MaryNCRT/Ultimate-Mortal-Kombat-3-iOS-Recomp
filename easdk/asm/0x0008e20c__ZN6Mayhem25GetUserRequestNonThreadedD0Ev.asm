========================================================================
ZN6Mayhem25GetUserRequestNonThreadedD0Ev  0x0008e20c  44 bytes   Mayhem.mm
========================================================================

0008e20c  push    {r4, r7, lr}
0008e20e  add     r7, sp, #4
0008e210  ldr     r3, [pc, #0x1c]
0008e212  mov     r4, r0
0008e214  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
0008e216  adds    r3, #8
0008e218  str     r3, [r0]
0008e21a  ldr     r3, [pc, #0x18]
0008e21c  add     r3, pc ; -> 0x0017db6c  ZTVN6Mayhem25GetUserRequestNonThreadedE
0008e21e  adds    r3, #0x28
0008e220  str     r3, [r0, #8]
0008e222  bl      #0x8e0bc ; -> ZN6Mayhem14GetUserRequestD2Ev
0008e226  mov     r0, r4
0008e228  blx     #0xdd5a8 ; -> ZdlPv
0008e22c  pop     {r4, r7, pc}
0008e22e  nop     
