========================================================================
-[FBLoginButton dealloc]  0x00084c8c  124 bytes   FBLoginButton.m
========================================================================

00084c8c  push    {r4, r5, r7, lr}
00084c8e  add     r7, sp, #8
00084c90  sub     sp, #8
00084c92  ldr     r5, [pc, #0x58]
00084c94  ldr     r1, [pc, #0x58]
00084c96  mov     r4, r0
00084c98  add     r5, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
00084c9a  add     r1, pc ; -> 0x000fcd78  'T2\x0e'
00084c9c  ldr     r3, [r5]
00084c9e  ldr     r1, [r1]
00084ca0  ldr     r0, [r0, r3]
00084ca2  blx     #0xddbfc ; -> objc_msgSend
00084ca6  ldr     r1, [pc, #0x4c]
00084ca8  mov     r2, r4
00084caa  add     r1, pc ; -> 0x000fcd7c  'lz\x0e'
00084cac  ldr     r1, [r1]
00084cae  blx     #0xddbfc ; -> objc_msgSend
00084cb2  ldr     r1, [pc, #0x44]
00084cb4  ldr     r3, [r5]
00084cb6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00084cb8  ldr     r5, [r1]
00084cba  ldr     r0, [r4, r3]
00084cbc  mov     r1, r5
00084cbe  blx     #0xddbfc ; -> objc_msgSend
00084cc2  ldr     r3, [pc, #0x38]
00084cc4  mov     r1, r5
00084cc6  add     r3, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
00084cc8  ldr     r3, [r3]
00084cca  ldr     r0, [r4, r3]
00084ccc  blx     #0xddbfc ; -> objc_msgSend
00084cd0  ldr     r3, [pc, #0x2c]
00084cd2  ldr     r1, [pc, #0x30]
00084cd4  mov     r0, sp
00084cd6  add     r3, pc ; -> 0x000fdd3c  
00084cd8  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
00084cda  ldr     r3, [r3]
00084cdc  ldr     r1, [r1]
00084cde  str     r4, [sp]
00084ce0  str     r3, [sp, #4]
00084ce2  blx     #0xddc08 ; -> objc_msgSendSuper2
00084ce6  sub.w   sp, r7, #8
00084cea  pop     {r4, r5, r7, pc}
00084cec  lsls    r4, r1, #0x1d
00084cee  movs    r7, r0
00084cf0  strh    r2, [r3, #6]
00084cf2  movs    r7, r0
00084cf4  strh    r6, [r1, #6]
00084cf6  movs    r7, r0
00084cf8  ldrb    r2, [r0, #0x13]
00084cfa  movs    r7, r0
00084cfc  lsls    r2, r4, #0x1c
00084cfe  movs    r7, r0
00084d00  str     r0, [sp, #0x188]
00084d02  movs    r7, r0
00084d04  ldrb    r4, [r0, #0x13]
00084d06  movs    r7, r0
