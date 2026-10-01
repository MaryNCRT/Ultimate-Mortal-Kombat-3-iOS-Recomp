========================================================================
-[FBLoginButton sessionDidLogout  0x00084844  20 bytes   FBLoginButton.m
========================================================================

00084844  push    {r7, lr}
00084846  add     r7, sp, #0
00084848  ldr     r1, [pc, #8]
0008484a  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
0008484c  ldr     r1, [r1]
0008484e  blx     #0xddbfc ; -> objc_msgSend
00084852  pop     {r7, pc}
00084854  strh    r2, [r3, #0x28]
00084856  movs    r7, r0
