========================================================================
-[FBSession apiKey]  0x00086d7c  16 bytes   FBSession.m
========================================================================

00086d7c  ldr     r3, [pc, #8]
00086d7e  add     r3, pc ; -> 0x000f5d08  OBJC_IVAR_$_FBSession._apiKey
00086d80  ldr     r3, [r3]
00086d82  ldr     r0, [r0, r3]
00086d84  bx      lr
00086d86  nop     
00086d88  vaddl.s8 q0, d6, d6
