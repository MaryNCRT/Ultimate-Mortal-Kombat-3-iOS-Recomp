========================================================================
-[FBPermissionDialog redirectToLoginDelayed]  0x00085708  56 bytes   FBPermissionDialog.m
========================================================================

00085708  push    {r7, lr}
0008570a  add     r7, sp, #0
0008570c  sub     sp, #8
0008570e  ldr     r3, [pc, #0x24]
00085710  movs    r2, #0
00085712  ldr     r1, [pc, #0x24]
00085714  add     r3, pc ; -> 0x000f5678  OBJC_IVAR_$_FBPermissionDialog._redirectTimer
00085716  ldr     r3, [r3]
00085718  add     r1, pc ; -> 0x000fcc24  'xC\x0e'
0008571a  ldr     r1, [r1]
0008571c  str     r2, [r0, r3]
0008571e  ldr     r3, [pc, #0x1c]
00085720  str     r0, [sp]
00085722  mov     r0, sp
00085724  add     r3, pc ; -> 0x000fdd44  
00085726  ldr     r3, [r3]
00085728  str     r3, [sp, #4]
0008572a  blx     #0xddc08 ; -> objc_msgSendSuper2
0008572e  sub.w   sp, r7, #0
00085732  pop     {r7, pc}
00085734  vhadd.u32 d16, d0, d6
00085738  strb    r0, [r1, #0x14]
0008573a  movs    r7, r0
0008573c  strh    r4, [r3, #0x30]
0008573e  movs    r7, r0
