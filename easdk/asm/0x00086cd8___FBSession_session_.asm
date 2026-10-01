========================================================================
+[FBSession session]  0x00086cd8  12 bytes   FBSession.m
========================================================================

00086cd8  ldr     r0, [pc, #4]
00086cda  add     r0, pc ; -> 0x006bc128  sharedSession
00086cdc  ldr     r0, [r0]
00086cde  bx      lr
00086ce0  strb    r2, [r1, r1]
00086ce2  lsls    r3, r4, #1
