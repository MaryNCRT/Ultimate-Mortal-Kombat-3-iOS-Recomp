========================================================================
-[FBLoginButton layoutSubviews]  0x00084d84  80 bytes   FBLoginButton.m
========================================================================

00084d84  push    {r4, r5, r7, lr}
00084d86  add     r7, sp, #8
00084d88  sub     sp, #0x18
00084d8a  ldr     r2, [pc, #0x3c]
00084d8c  mov     r4, r0
00084d8e  mov     r1, r4
00084d90  add     r2, pc ; -> 0x000fcd70  'L2\x0e'
00084d92  add     r0, sp, #8
00084d94  ldr     r2, [r2]
00084d96  blx     #0xddc14 ; -> objc_msgSend_stret
00084d9a  ldr     r3, [pc, #0x30]
00084d9c  ldr     r1, [pc, #0x30]
00084d9e  add     r5, sp, #8
00084da0  add     r3, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
00084da2  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
00084da4  ldr     r0, [r3]
00084da6  ldr.w   ip, [r1]
00084daa  ldr.w   lr, [r4, r0]
00084dae  add     r0, sp, #0x10
00084db0  ldm     r0, {r0, r1}
00084db2  stm.w   sp, {r0, r1}
00084db6  mov     r0, lr
00084db8  ldm.w   r5, {r2, r3}
00084dbc  mov     r1, ip
00084dbe  blx     #0xddbfc ; -> objc_msgSend
00084dc2  sub.w   sp, r7, #8
00084dc6  pop     {r4, r5, r7, pc}
00084dc8  ldrb    r4, [r3, #0x1f]
00084dca  movs    r7, r0
00084dcc  lsls    r0, r1, #0x19
00084dce  movs    r7, r0
00084dd0  ldrb    r2, [r5, #0x1e]
00084dd2  movs    r7, r0
