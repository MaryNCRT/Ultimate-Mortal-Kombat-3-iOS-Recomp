========================================================================
-[FBDialog removeObservers]  0x00082eec  140 bytes   FBDialog.m
========================================================================

00082eec  push    {r4, r5, r6, r7, lr}
00082eee  add     r7, sp, #0xc
00082ef0  push.w  {r8, sl}
00082ef4  sub     sp, #4
00082ef6  ldr     r1, [pc, #0x68]
00082ef8  mov     r8, r0
00082efa  ldr     r0, [pc, #0x68]
00082efc  add     r1, pc ; -> 0x000fca30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xb8
00082efe  mov.w   sl, #0
00082f02  add     r0, pc ; -> 0x000fdb68  
00082f04  ldr     r5, [r1]
00082f06  ldr     r6, [r0]
00082f08  mov     r1, r5
00082f0a  mov     r0, r6
00082f0c  blx     #0xddbfc ; -> objc_msgSend
00082f10  ldr     r1, [pc, #0x54]
00082f12  ldr     r3, [pc, #0x58]
00082f14  mov     r2, r8
00082f16  add     r1, pc ; -> 0x000fccf8  'P-\x0e'
00082f18  add     r3, pc ; -> 0x0017e814  
00082f1a  ldr     r4, [r1]
00082f1c  str.w   sl, [sp]
00082f20  mov     r1, r4
00082f22  blx     #0xddbfc ; -> objc_msgSend
00082f26  mov     r1, r5
00082f28  mov     r0, r6
00082f2a  blx     #0xddbfc ; -> objc_msgSend
00082f2e  ldr     r3, [pc, #0x40]
00082f30  mov     r2, r8
00082f32  mov     r1, r4
00082f34  add     r3, pc ; -> 0x0017e824  
00082f36  str.w   sl, [sp]
00082f3a  blx     #0xddbfc ; -> objc_msgSend
00082f3e  mov     r1, r5
00082f40  mov     r0, r6
00082f42  blx     #0xddbfc ; -> objc_msgSend
00082f46  ldr     r3, [pc, #0x2c]
00082f48  mov     r1, r4
00082f4a  mov     r2, r8
00082f4c  add     r3, pc ; -> 0x0017e834  
00082f4e  str.w   sl, [sp]
00082f52  blx     #0xddbfc ; -> objc_msgSend
00082f56  sub.w   sp, r7, #0x14
00082f5a  pop.w   {r8, sl}
00082f5e  pop     {r4, r5, r6, r7, pc}
00082f60  ldr     r3, [sp, #0xc0]
00082f62  movs    r7, r0
00082f64  add     r4, sp, #0x188
00082f66  movs    r7, r0
00082f68  ldr     r5, [sp, #0x378]
00082f6a  movs    r7, r0
