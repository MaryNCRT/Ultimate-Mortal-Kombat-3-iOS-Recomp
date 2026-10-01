========================================================================
-[FBLoginButton session  0x00084858  32 bytes   FBLoginButton.m
========================================================================

00084858  sub     sp, #4
0008485a  push    {r7, lr}
0008485c  add     r7, sp, #0
0008485e  ldr     r1, [pc, #0x14]
00084860  str     r3, [sp, #8]
00084862  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
00084864  ldr     r1, [r1]
00084866  blx     #0xddbfc ; -> objc_msgSend
0008486a  pop.w   {r7, lr}
0008486e  add     sp, #4
00084870  bx      lr
00084872  nop     
00084874  strh    r2, [r0, #0x28]
00084876  movs    r7, r0
