========================================================================
-[FBSession requestTimerReady]  0x00086e2c  36 bytes   FBSession.m
========================================================================

00086e2c  push    {r7, lr}
00086e2e  add     r7, sp, #0
00086e30  ldr     r3, [pc, #0x14]
00086e32  ldr     r1, [pc, #0x18]
00086e34  movs    r2, #0
00086e36  add     r3, pc ; -> 0x000f5d30  OBJC_IVAR_$_FBSession._requestTimer
00086e38  add     r1, pc ; -> 0x000fced0  '\x07@\x0e'
00086e3a  ldr     r3, [r3]
00086e3c  ldr     r1, [r1]
00086e3e  str     r2, [r0, r3]
00086e40  blx     #0xddbfc ; -> objc_msgSend
00086e44  pop     {r7, pc}
00086e46  nop     
00086e48  cdp     p0, #0xf, c0, c6, c6, #0
00086e4c  str     r4, [r2, #8]
00086e4e  movs    r7, r0
