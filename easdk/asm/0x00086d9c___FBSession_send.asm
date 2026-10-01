========================================================================
-[FBSession send  0x00086d9c  24 bytes   FBSession.m
========================================================================

00086d9c  push    {r7, lr}
00086d9e  add     r7, sp, #0
00086da0  ldr     r1, [pc, #0xc]
00086da2  movs    r3, #1
00086da4  add     r1, pc ; -> 0x000fced8  '\x19@\x0e'
00086da6  ldr     r1, [r1]
00086da8  blx     #0xddbfc ; -> objc_msgSend
00086dac  pop     {r7, pc}
00086dae  nop     
00086db0  str     r0, [r6, #0x10]
00086db2  movs    r7, r0
