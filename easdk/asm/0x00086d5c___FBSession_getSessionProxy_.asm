========================================================================
-[FBSession getSessionProxy]  0x00086d5c  16 bytes   FBSession.m
========================================================================

00086d5c  ldr     r3, [pc, #8]
00086d5e  add     r3, pc ; -> 0x000f5d10  OBJC_IVAR_$_FBSession._getSessionProxy
00086d60  ldr     r3, [r3]
00086d62  ldr     r0, [r0, r3]
00086d64  bx      lr
00086d66  nop     
00086d68  vaddl.s32 q0, d14, d6
