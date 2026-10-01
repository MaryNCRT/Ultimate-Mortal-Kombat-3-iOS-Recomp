========================================================================
-[FBLoginButton awakeFromNib]  0x00084878  20 bytes   FBLoginButton.m
========================================================================

00084878  push    {r7, lr}
0008487a  add     r7, sp, #0
0008487c  ldr     r1, [pc, #8]
0008487e  add     r1, pc ; -> 0x000fcd80  
00084880  ldr     r1, [r1]
00084882  blx     #0xddbfc ; -> objc_msgSend
00084886  pop     {r7, pc}
00084888  strh    r6, [r7, #0x26]
0008488a  movs    r7, r0
