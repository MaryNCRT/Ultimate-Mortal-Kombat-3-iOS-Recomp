========================================================================
-[FBSession sessionKey]  0x00086d3c  16 bytes   FBSession.m
========================================================================

00086d3c  ldr     r3, [pc, #8]
00086d3e  add     r3, pc ; -> 0x000f5d18  OBJC_IVAR_$_FBSession._sessionKey
00086d40  ldr     r3, [r3]
00086d42  ldr     r0, [r0, r3]
00086d44  bx      lr
00086d46  nop     
00086d48  vaddl.s16 q8, d6, d6
