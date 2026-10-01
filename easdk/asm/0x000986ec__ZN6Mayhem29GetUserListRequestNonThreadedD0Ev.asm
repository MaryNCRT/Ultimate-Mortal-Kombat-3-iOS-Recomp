========================================================================
ZN6Mayhem29GetUserListRequestNonThreadedD0Ev  0x000986ec  44 bytes   Mayhem.mm
========================================================================

000986ec  push    {r4, r7, lr}
000986ee  add     r7, sp, #4
000986f0  ldr     r3, [pc, #0x1c]
000986f2  mov     r4, r0
000986f4  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
000986f6  adds    r3, #8
000986f8  str     r3, [r0]
000986fa  ldr     r3, [pc, #0x18]
000986fc  add     r3, pc ; -> 0x0017dac0  ZTVN6Mayhem29GetUserListRequestNonThreadedE
000986fe  adds    r3, #0x1c
00098700  str     r3, [r0, #0x10]
00098702  bl      #0x984fc ; -> ZN6Mayhem18GetUserListRequestD2Ev
00098706  mov     r0, r4
00098708  blx     #0xdd5a8 ; -> ZdlPv
0009870c  pop     {r4, r7, pc}
0009870e  nop     
00098710  strh    r0, [r1, r7]
00098712  movs    r6, r1
00098714  strh    r0, [r0, r7]
00098716  movs    r6, r1
