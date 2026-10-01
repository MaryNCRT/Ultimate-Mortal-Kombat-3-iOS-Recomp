========================================================================
ZN6Mayhem29GetUserListRequestNonThreadedD2Ev  0x00098718  36 bytes   Mayhem.mm
========================================================================

00098718  push    {r7, lr}
0009871a  add     r7, sp, #0
0009871c  ldr     r3, [pc, #0x14]
0009871e  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
00098720  adds    r3, #8
00098722  str     r3, [r0]
00098724  ldr     r3, [pc, #0x10]
00098726  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
00098728  adds    r3, #0x1c
0009872a  str     r3, [r0, #0x10]
0009872c  bl      #0x984fc ; -> ZN6Mayhem18GetUserListRequestD2Ev
00098730  pop     {r7, pc}
00098732  nop     
00098734  strh    r6, [r3, r6]
00098736  movs    r6, r1
00098738  strh    r6, [r2, r6]
0009873a  movs    r6, r1
