========================================================================
-[FBLoginDialog request  0x00084e70  64 bytes   FBLoginDialog.m
========================================================================

00084e70  push    {r4, r5, r6, r7, lr}
00084e72  add     r7, sp, #0xc
00084e74  ldr     r5, [pc, #0x2c]
00084e76  ldr     r1, [pc, #0x30]
00084e78  mov     r6, r3
00084e7a  add     r5, pc ; -> 0x000f5520  OBJC_IVAR_$_FBLoginDialog._getSessionRequest
00084e7c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00084e7e  ldr     r3, [r5]
00084e80  mov     r4, r0
00084e82  ldr     r1, [r1]
00084e84  ldr     r0, [r0, r3]
00084e86  blx     #0xddbfc ; -> objc_msgSend
00084e8a  ldr     r1, [pc, #0x20]
00084e8c  ldr     r3, [r5]
00084e8e  movs    r2, #0
00084e90  add     r1, pc ; -> 0x000fcc40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2c8
00084e92  mov     r0, r4
00084e94  str     r2, [r4, r3]
00084e96  ldr     r1, [r1]
00084e98  mov     r2, r6
00084e9a  movs    r3, #1
00084e9c  blx     #0xddbfc ; -> objc_msgSend
00084ea0  pop     {r4, r5, r6, r7, pc}
00084ea2  nop     
00084ea4  lsls    r2, r4, #0x1a
00084ea6  movs    r7, r0
00084ea8  ldrb    r4, [r7, #0xb]
00084eaa  movs    r7, r0
00084eac  ldrb    r4, [r5, #0x16]
00084eae  movs    r7, r0
