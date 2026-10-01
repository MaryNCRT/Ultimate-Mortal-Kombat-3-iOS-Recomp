========================================================================
-[FBSession apiSecureURL]  0x00086cfc  12 bytes   FBSession.m
========================================================================

00086cfc  ldr     r0, [pc, #4]
00086cfe  add     r0, pc ; -> 0x0017da04  kAPIRestSecureURL
00086d00  ldr     r0, [r0]
00086d02  bx      lr
00086d04  ldr     r2, [r0, #0x50]
00086d06  movs    r7, r1
