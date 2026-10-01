========================================================================
-[FBLoginButton sizeThatFits  0x00084dd4  64 bytes   FBLoginButton.m
========================================================================

00084dd4  sub     sp, #4
00084dd6  push    {r4, r7, lr}
00084dd8  add     r7, sp, #4
00084dda  str     r3, [sp, #0xc]
00084ddc  ldr     r3, [pc, #0x28]
00084dde  mov     r4, r0
00084de0  add     r3, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
00084de2  ldr     r3, [r3]
00084de4  ldr     r0, [r1, r3]
00084de6  ldr     r1, [pc, #0x24]
00084de8  add     r1, pc ; -> 0x000fcd74  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3fc
00084dea  ldr     r1, [r1]
00084dec  blx     #0xddbfc ; -> objc_msgSend
00084df0  ldr     r2, [pc, #0x1c]
00084df2  add     r2, pc ; -> 0x000fc9d4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x5c
00084df4  ldr     r2, [r2]
00084df6  mov     r1, r0
00084df8  mov     r0, r4
00084dfa  blx     #0xddc14 ; -> objc_msgSend_stret
00084dfe  mov     r0, r4
00084e00  pop.w   {r4, r7, lr}
00084e04  add     sp, #4
00084e06  bx      lr
00084e08  lsls    r0, r1, #0x18
00084e0a  movs    r7, r0
00084e0c  ldrb    r0, [r1, #0x1e]
00084e0e  movs    r7, r0
00084e10  ldrb    r6, [r3, #0xf]
00084e12  movs    r7, r0
