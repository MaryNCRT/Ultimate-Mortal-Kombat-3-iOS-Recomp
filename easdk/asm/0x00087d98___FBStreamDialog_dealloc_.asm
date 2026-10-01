========================================================================
-[FBStreamDialog dealloc]  0x00087d98  128 bytes   FBStreamDialog.m
========================================================================

00087d98  push    {r4, r5, r7, lr}
00087d9a  add     r7, sp, #8
00087d9c  sub     sp, #8
00087d9e  ldr     r3, [pc, #0x5c]
00087da0  ldr     r1, [pc, #0x5c]
00087da2  mov     r5, r0
00087da4  add     r3, pc ; -> 0x000f5e9c  OBJC_IVAR_$_FBStreamDialog._attachment
00087da6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00087da8  ldr     r3, [r3]
00087daa  ldr     r4, [r1]
00087dac  ldr     r0, [r0, r3]
00087dae  mov     r1, r4
00087db0  blx     #0xddbfc ; -> objc_msgSend
00087db4  ldr     r3, [pc, #0x4c]
00087db6  mov     r1, r4
00087db8  add     r3, pc ; -> 0x000f5e98  OBJC_IVAR_$_FBStreamDialog._actionLinks
00087dba  ldr     r3, [r3]
00087dbc  ldr     r0, [r5, r3]
00087dbe  blx     #0xddbfc ; -> objc_msgSend
00087dc2  ldr     r3, [pc, #0x44]
00087dc4  mov     r1, r4
00087dc6  add     r3, pc ; -> 0x000f5e94  OBJC_IVAR_$_FBStreamDialog._targetId
00087dc8  ldr     r3, [r3]
00087dca  ldr     r0, [r5, r3]
00087dcc  blx     #0xddbfc ; -> objc_msgSend
00087dd0  ldr     r3, [pc, #0x38]
00087dd2  mov     r1, r4
00087dd4  add     r3, pc ; -> 0x000f5e90  OBJC_IVAR_$_FBStreamDialog._userMessagePrompt
00087dd6  ldr     r3, [r3]
00087dd8  ldr     r0, [r5, r3]
00087dda  blx     #0xddbfc ; -> objc_msgSend
00087dde  ldr     r3, [pc, #0x30]
00087de0  ldr     r1, [pc, #0x30]
00087de2  mov     r0, sp
00087de4  add     r3, pc ; -> 0x000fdd50  
00087de6  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
00087de8  ldr     r3, [r3]
00087dea  ldr     r1, [r1]
00087dec  str     r5, [sp]
00087dee  str     r3, [sp, #4]
00087df0  blx     #0xddc08 ; -> objc_msgSendSuper2
00087df4  sub.w   sp, r7, #8
00087df8  pop     {r4, r5, r7, pc}
00087dfa  nop     
00087dfc  b       #0x87fe8
00087dfe  movs    r6, r0
00087e00  ldr     r3, [pc, #0x348]
00087e02  movs    r7, r0
00087e04  b       #0x87fc0
00087e06  movs    r6, r0
00087e08  b       #0x87fa0
00087e0a  movs    r6, r0
00087e0c  b       #0x87f80
00087e0e  movs    r6, r0
00087e10  ldrsh   r0, [r5, r5]
00087e12  movs    r7, r0
00087e14  ldr     r3, [pc, #0x2d8]
00087e16  movs    r7, r0
