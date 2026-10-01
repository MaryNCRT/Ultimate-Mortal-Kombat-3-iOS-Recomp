========================================================================
-[FBPermissionDialog dealloc]  0x00085660  96 bytes   FBPermissionDialog.m
========================================================================

00085660  push    {r4, r7, lr}
00085662  add     r7, sp, #4
00085664  sub     sp, #8
00085666  ldr     r3, [pc, #0x40]
00085668  ldr     r1, [pc, #0x40]
0008566a  mov     r4, r0
0008566c  add     r3, pc ; -> 0x000f5678  OBJC_IVAR_$_FBPermissionDialog._redirectTimer
0008566e  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
00085670  ldr     r3, [r3]
00085672  ldr     r1, [r1]
00085674  ldr     r0, [r0, r3]
00085676  blx     #0xddbfc ; -> objc_msgSend
0008567a  ldr     r3, [pc, #0x34]
0008567c  ldr     r1, [pc, #0x34]
0008567e  add     r3, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
00085680  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00085682  ldr     r3, [r3]
00085684  ldr     r1, [r1]
00085686  ldr     r0, [r4, r3]
00085688  blx     #0xddbfc ; -> objc_msgSend
0008568c  ldr     r3, [pc, #0x28]
0008568e  ldr     r1, [pc, #0x2c]
00085690  mov     r0, sp
00085692  add     r3, pc ; -> 0x000fdd44  
00085694  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
00085696  ldr     r3, [r3]
00085698  ldr     r1, [r1]
0008569a  str     r4, [sp]
0008569c  str     r3, [sp, #4]
0008569e  blx     #0xddc08 ; -> objc_msgSendSuper2
000856a2  sub.w   sp, r7, #4
000856a6  pop     {r4, r7, pc}
000856a8  movs    r0, r1
000856aa  movs    r7, r0
000856ac  strb    r6, [r7, #0xc]
000856ae  movs    r7, r0
000856b0  vswp    d16, d6
000856b4  strb    r0, [r7, #0xb]
000856b6  movs    r7, r0
000856b8  strh    r6, [r5, #0x34]
000856ba  movs    r7, r0
000856bc  strb    r0, [r1, #0xc]
000856be  movs    r7, r0
