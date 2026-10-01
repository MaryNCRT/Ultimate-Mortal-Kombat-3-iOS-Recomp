========================================================================
-[FBLoginButton setStyle  0x000846ec  32 bytes   FBLoginButton.m
========================================================================

000846ec  push    {r7, lr}
000846ee  add     r7, sp, #0
000846f0  ldr     r3, [pc, #0x10]
000846f2  ldr     r1, [pc, #0x14]
000846f4  add     r3, pc ; -> 0x000f53e4  OBJC_IVAR_$_FBLoginButton._style
000846f6  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
000846f8  ldr     r3, [r3]
000846fa  ldr     r1, [r1]
000846fc  str     r2, [r0, r3]
000846fe  blx     #0xddbfc ; -> objc_msgSend
00084702  pop     {r7, pc}
00084704  lsrs    r4, r5, #0x13
00084706  movs    r7, r0
00084708  strh    r6, [r5, #0x32]
0008470a  movs    r7, r0
