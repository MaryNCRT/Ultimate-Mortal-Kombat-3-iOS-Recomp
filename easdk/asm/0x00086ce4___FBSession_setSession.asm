========================================================================
+[FBSession setSession  0x00086ce4  12 bytes   FBSession.m
========================================================================

00086ce4  ldr     r3, [pc, #4]
00086ce6  add     r3, pc ; -> 0x006bc128  sharedSession
00086ce8  str     r2, [r3]
00086cea  bx      lr
00086cec  strb    r6, [r7, r0]
00086cee  lsls    r3, r4, #1
