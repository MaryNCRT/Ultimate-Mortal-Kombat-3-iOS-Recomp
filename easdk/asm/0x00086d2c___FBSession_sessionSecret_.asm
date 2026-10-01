========================================================================
-[FBSession sessionSecret]  0x00086d2c  16 bytes   FBSession.m
========================================================================

00086d2c  ldr     r3, [pc, #8]
00086d2e  add     r3, pc ; -> 0x000f5d1c  OBJC_IVAR_$_FBSession._sessionSecret
00086d30  ldr     r3, [r3]
00086d32  ldr     r0, [r0, r3]
00086d34  bx      lr
00086d36  nop     
00086d38  vaddl.s32 q8, d10, d6
