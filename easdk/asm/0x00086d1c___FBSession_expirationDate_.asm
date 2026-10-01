========================================================================
-[FBSession expirationDate]  0x00086d1c  16 bytes   FBSession.m
========================================================================

00086d1c  ldr     r3, [pc, #8]
00086d1e  add     r3, pc ; -> 0x000f5d20  OBJC_IVAR_$_FBSession._expirationDate
00086d20  ldr     r3, [r3]
00086d22  ldr     r0, [r0, r3]
00086d24  bx      lr
00086d26  nop     
00086d28  vext.32 d16, d14, d6, #0
