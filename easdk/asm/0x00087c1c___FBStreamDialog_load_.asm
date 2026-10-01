========================================================================
-[FBStreamDialog load]  0x00087c1c  380 bytes   FBStreamDialog.m
========================================================================

00087c1c  push    {r4, r5, r6, r7, lr}
00087c1e  add     r7, sp, #0xc
00087c20  push.w  {r8, sl, fp}
00087c24  sub     sp, #0x58
00087c26  ldr     r1, [pc, #0x108]
00087c28  mov     r4, r0
00087c2a  ldr     r0, [pc, #0x108]
00087c2c  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
00087c2e  ldr     r2, [pc, #0x108]
00087c30  ldr     r1, [r1]
00087c32  add     r0, pc ; -> 0x000fdb44  
00087c34  ldr     r3, [pc, #0x104]
00087c36  ldr     r0, [r0]
00087c38  str     r1, [sp, #0x4c]
00087c3a  add     r2, pc ; -> 0x0017e9c4  
00087c3c  movs    r1, #0
00087c3e  add     r3, pc ; -> 0x0017ea74  
00087c40  str     r1, [sp]
00087c42  ldr     r1, [sp, #0x4c]
00087c44  str     r0, [sp, #0x48]
00087c46  blx     #0xddbfc ; -> objc_msgSend
00087c4a  ldr     r3, [pc, #0xf4]
00087c4c  ldr     r1, [pc, #0xf4]
00087c4e  ldr     r6, [pc, #0xf8]
00087c50  add     r3, pc ; -> 0x000f342c  OBJC_IVAR_$_FBDialog._session
00087c52  add     r1, pc ; -> 0x000fcdd4  
00087c54  ldr     r5, [r3]
00087c56  ldr     r1, [r1]
00087c58  add     r6, pc ; -> 0x0017e984  
00087c5a  ldr.w   r8, [pc, #0xf0]
00087c5e  ldr     r3, [r5]
00087c60  ldr.w   sl, [pc, #0xec]
00087c64  add     r8, pc ; -> 0x0017ed44  
00087c66  ldr.w   fp, [pc, #0xec]
00087c6a  add     sl, pc ; -> 0x0017ed54  
00087c6c  add     fp, pc ; -> 0x0017ed64  
00087c6e  str     r0, [sp, #0x50]
00087c70  ldr     r0, [r4, r3]
00087c72  blx     #0xddbfc ; -> objc_msgSend
00087c76  ldr     r3, [pc, #0xe0]
00087c78  ldr     r1, [pc, #0xe0]
00087c7a  add     r3, pc ; -> 0x0017e9e4  
00087c7c  str     r3, [sp, #0x44]
00087c7e  ldr     r3, [r5]
00087c80  add     r1, pc ; -> 0x000fcdfc  'L<\x0e'
00087c82  ldr     r5, [pc, #0xdc]
00087c84  ldr     r1, [r1]
00087c86  add     r5, pc ; -> 0x0017e764  
00087c88  str     r0, [sp, #0x54]
00087c8a  ldr     r0, [r4, r3]
00087c8c  blx     #0xddbfc ; -> objc_msgSend
00087c90  ldr     r3, [pc, #0xd0]
00087c92  ldr.w   lr, [pc, #0xd4]
00087c96  ldr.w   ip, [pc, #0xd4]
00087c9a  add     r3, pc ; -> 0x0017e804  
00087c9c  str     r3, [sp, #0x1c]
00087c9e  ldr     r3, [pc, #0xd0]
00087ca0  ldr     r1, [pc, #0xd0]
00087ca2  ldr     r2, [pc, #0xd4]
00087ca4  add     r3, pc ; -> 0x000f5e9c  OBJC_IVAR_$_FBStreamDialog._attachment
00087ca6  str     r5, [sp, #8]
00087ca8  str     r6, [sp, #4]
00087caa  add     lr, pc ; -> 0x0017ed14  
00087cac  add     ip, pc ; -> 0x0017ea94  
00087cae  str.w   lr, [sp, #0xc]
00087cb2  str.w   ip, [sp, #0x10]
00087cb6  add     r1, pc ; -> 0x0017ed24  
00087cb8  add     r2, pc ; -> 0x0017eaa4  
00087cba  str     r1, [sp, #0x14]
00087cbc  str     r2, [sp, #0x18]
00087cbe  ldr.w   sb, [pc, #0xbc]
00087cc2  ldr     r1, [sp, #0x4c]
00087cc4  ldr     r2, [sp, #0x54]
00087cc6  add     sb, pc ; -> 0x0017ed34  
00087cc8  movs    r5, #0
00087cca  str     r0, [sp]
00087ccc  ldr     r3, [r3]
00087cce  str.w   sb, [sp, #0x24]
00087cd2  ldr     r0, [sp, #0x48]
00087cd4  ldr     r3, [r4, r3]
00087cd6  str     r3, [sp, #0x20]
00087cd8  ldr     r3, [pc, #0xa4]
00087cda  add     r3, pc ; -> 0x000f5e98  OBJC_IVAR_$_FBStreamDialog._actionLinks
00087cdc  ldr     r3, [r3]
00087cde  str.w   r8, [sp, #0x2c]
00087ce2  ldr     r3, [r4, r3]
00087ce4  str     r3, [sp, #0x28]
00087ce6  ldr     r3, [pc, #0x9c]
00087ce8  add     r3, pc ; -> 0x000f5e94  OBJC_IVAR_$_FBStreamDialog._targetId
00087cea  ldr     r3, [r3]
00087cec  str.w   sl, [sp, #0x34]
00087cf0  ldr     r3, [r4, r3]
00087cf2  str     r3, [sp, #0x30]
00087cf4  ldr     r3, [pc, #0x90]
00087cf6  add     r3, pc ; -> 0x000f5e90  OBJC_IVAR_$_FBStreamDialog._userMessagePrompt
00087cf8  ldr     r3, [r3]
00087cfa  str     r5, [sp, #0x40]
00087cfc  str.w   fp, [sp, #0x3c]
00087d00  ldr     r3, [r4, r3]
00087d02  str     r3, [sp, #0x38]
00087d04  ldr     r3, [sp, #0x44]
00087d06  blx     #0xddbfc ; -> objc_msgSend
00087d0a  ldr     r1, [pc, #0x80]
00087d0c  ldr     r2, [pc, #0x80]
00087d0e  ldr     r5, [sp, #0x50]
00087d10  ldr     r3, [pc, #0x80]
00087d12  add     r1, pc ; -> 0x000fcdd8  ',D\x0e'
00087d14  add     r2, pc ; -> 0x0017da08  kStreamURL
00087d16  add     r3, pc ; -> 0x0017e7a4  
00087d18  ldr     r1, [r1]
00087d1a  ldr     r2, [r2]
00087d1c  str     r5, [sp]
00087d1e  str     r0, [sp, #4]
00087d20  mov     r0, r4
00087d22  blx     #0xddbfc ; -> objc_msgSend
00087d26  sub.w   sp, r7, #0x18
00087d2a  pop.w   {r8, sl, fp}
00087d2e  pop     {r4, r5, r6, r7, pc}
00087d30  ldr     r5, [pc, #0x330]
00087d32  movs    r7, r0
00087d34  ldrsh   r6, [r1, r4]
00087d36  movs    r7, r0
00087d38  ldr     r6, [r0, #0x58]
00087d3a  movs    r7, r1
00087d3c  ldr     r2, [r6, #0x60]
00087d3e  movs    r7, r1
