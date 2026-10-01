========================================================================
-[FBSession apiSecret]  0x00086d6c  16 bytes   FBSession.m
========================================================================

00086d6c  ldr     r3, [pc, #8]
00086d6e  add     r3, pc ; -> 0x000f5d0c  OBJC_IVAR_$_FBSession._apiSecret
00086d70  ldr     r3, [r3]
00086d72  ldr     r0, [r0, r3]
00086d74  bx      lr
00086d76  nop     
00086d78  vaddl.s16 q0, d10, d6
