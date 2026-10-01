========================================================================
-[FBDialog sizeToFitOrientation  0x00083ea4  464 bytes   FBDialog.m
========================================================================

00083ea4  push    {r4, r5, r6, r7, lr}
00083ea6  add     r7, sp, #0xc
00083ea8  push.w  {r8, sl}
00083eac  vpush   {d8, d9, d10, d11, d12, d13}
00083eb0  sub     sp, #0x58
00083eb2  sxtb.w  sl, r2
00083eb6  mov     r8, r0
00083eb8  cmp.w   sl, #0
00083ebc  bne.w   #0x83fe4
00083ec0  ldr     r0, [pc, #0x174]
00083ec2  ldr.w   r1, [pc, #0x178]
00083ec6  ldr     r4, [pc, #0x178]
00083ec8  add     r0, pc ; -> 0x000fdb54  
00083eca  add     r1, pc ; -> 0x000fc9e4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x6c
00083ecc  ldr     r0, [r0]
00083ece  ldr     r1, [r1]
00083ed0  blx     #0xddbfc ; -> objc_msgSend
00083ed4  ldr     r2, [pc, #0x16c]
00083ed6  add     r4, pc ; -> 0x000f51dc  OBJC_IVAR_$_FBDialog._orientation
00083ed8  add     r2, pc ; -> 0x000fcd44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3cc
00083eda  ldr     r2, [r2]
00083edc  mov     r1, r0
00083ede  add     r0, sp, #0x48
00083ee0  blx     #0xddc14 ; -> objc_msgSend_stret
00083ee4  vmov.f32 s14, #-2.000000e+01
00083ee8  ldr     r0, [pc, #0x15c]
00083eea  ldr     r1, [pc, #0x160]
00083eec  vldr    s22, [sp, #0x50]
00083ef0  add     r0, pc ; -> 0x000fdb80  
00083ef2  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00083ef4  ldr     r0, [r0]
00083ef6  ldr     r1, [r1]
00083ef8  vldr    s20, [sp, #0x54]
00083efc  ldr     r5, [r4]
00083efe  vadd.f32 d9, d11, d7
00083f02  vadd.f32 d8, d10, d7
00083f06  vldr    s26, [sp, #0x48]
00083f0a  vldr    s24, [sp, #0x4c]
00083f0e  blx     #0xddbfc ; -> objc_msgSend
00083f12  ldr     r1, [pc, #0x13c]
00083f14  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
00083f16  ldr     r1, [r1]
00083f18  blx     #0xddbfc ; -> objc_msgSend
00083f1c  str.w   r0, [r8, r5]
00083f20  ldr     r3, [r4]
00083f22  ldr.w   r3, [r8, r3]
00083f26  subs    r3, #3
00083f28  cmp     r3, #1
00083f2a  bls     #0x8400c
00083f2c  ldr     r1, [pc, #0x124]
00083f2e  add     r0, sp, #0x30
00083f30  ldr     r3, [pc, #0x124]
00083f32  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
00083f34  vstr    s16, [sp, #0x34]
00083f38  vstr    s18, [sp, #0x30]
00083f3c  ldr.w   ip, [r1]
00083f40  ldm     r0, {r0, r1}
00083f42  add     r2, sp, #0x28
00083f44  str     r3, [sp, #0x2c]
00083f46  str     r3, [sp, #0x28]
00083f48  stm.w   sp, {r0, r1}
00083f4c  mov     r0, r8
00083f4e  ldm     r2, {r2, r3}
00083f50  mov     r1, ip
00083f52  blx     #0xddbfc ; -> objc_msgSend
00083f56  vmov.f32 s16, #5.000000e-01
00083f5a  ldr     r1, [pc, #0x100]
00083f5c  add     r1, pc ; -> 0x000fcd4c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d4
00083f5e  ldr     r6, [r1]
00083f60  vmul.f32 d7, d10, d8
00083f64  vmov    r0, s14
00083f68  blx     #0xdd764 ; -> ceilf
00083f6c  vmov    s14, r0
00083f70  vadd.f32 d12, d12, d7
00083f74  vmul.f32 d7, d11, d8
00083f78  vmov    r0, s14
00083f7c  blx     #0xdd764 ; -> ceilf
00083f80  mov     r1, r6
00083f82  vmov    r3, s24
00083f86  vmov    r5, s24
00083f8a  vmov    s14, r0
00083f8e  mov     r0, r8
00083f90  vadd.f32 d13, d13, d7
00083f94  vmov    r2, s26
00083f98  vmov    r4, s26
00083f9c  blx     #0xddbfc ; -> objc_msgSend
00083fa0  cmp.w   sl, #0
00083fa4  beq     #0x83fd2
00083fa6  ldr     r2, [pc, #0xb8]
00083fa8  add     r0, sp, #0x10
00083faa  mov     r1, r8
00083fac  add     r2, pc ; -> 0x000fcd48  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d0
00083fae  add     r4, sp, #0x10
00083fb0  ldr     r2, [r2]
00083fb2  blx     #0xddc14 ; -> objc_msgSend_stret
00083fb6  ldr     r1, [pc, #0xac]
00083fb8  add     r0, sp, #0x18
00083fba  add     r1, pc ; -> 0x000fcd54  '\x12}\x0e'
00083fbc  ldr.w   ip, [r1]
00083fc0  ldm     r0, {r0, r1, r2, r3}
00083fc2  stm.w   sp, {r0, r1, r2, r3}
00083fc6  mov     r0, r8
00083fc8  ldm.w   r4, {r2, r3}
00083fcc  mov     r1, ip
00083fce  blx     #0xddbfc ; -> objc_msgSend
00083fd2  sub.w   sp, r7, #0x44
00083fd6  vpop    {d8, d9, d10, d11, d12, d13}
00083fda  sub.w   sp, r7, #0x14
00083fde  pop.w   {r8, sl}
00083fe2  pop     {r4, r5, r6, r7, pc}
00083fe4  ldr     r2, [pc, #0x80]
00083fe6  ldr     r1, [pc, #0x84]
00083fe8  add     r2, pc ; -> 0x000f3090  0x0
00083fea  add     r1, pc ; -> 0x000fcd54  '\x12}\x0e'
00083fec  ldr.w   ip, [r2]
00083ff0  ldr.w   lr, [r1]
00083ff4  add.w   r0, ip, #8
00083ff8  ldm     r0, {r0, r1, r2, r3}
00083ffa  stm.w   sp, {r0, r1, r2, r3}
00083ffe  ldm.w   ip, {r2, r3}
00084002  mov     r0, r8
00084004  mov     r1, lr
00084006  blx     #0xddbfc ; -> objc_msgSend
0008400a  b       #0x83ec0
0008400c  ldr     r1, [pc, #0x60]
0008400e  add     r0, sp, #0x40
00084010  vstr    s18, [sp, #0x44]
00084014  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
00084016  vstr    s16, [sp, #0x40]
0008401a  ldr     r3, [pc, #0x3c]
0008401c  ldr.w   ip, [r1]
00084020  ldm     r0, {r0, r1}
00084022  add     r2, sp, #0x38
00084024  str     r3, [sp, #0x3c]
00084026  str     r3, [sp, #0x38]
00084028  stm.w   sp, {r0, r1}
0008402c  mov     r0, r8
0008402e  ldm     r2, {r2, r3}
00084030  mov     r1, ip
00084032  blx     #0xddbfc ; -> objc_msgSend
00084036  b       #0x83f56
00084038  ldr     r4, [sp, #0x220]
0008403a  movs    r7, r0
0008403c  ldrh    r6, [r2, #0x18]
0008403e  movs    r7, r0
00084040  asrs    r2, r0, #0xc
00084042  movs    r7, r0
00084044  ldrh    r0, [r5, #0x32]
00084046  movs    r7, r0
00084048  ldr     r4, [sp, #0x230]
0008404a  movs    r7, r0
0008404c  ldrh    r2, [r1, #0x20]
0008404e  movs    r7, r0
00084050  ldrh    r0, [r0, #0x32]
00084052  movs    r7, r0
00084054  ldrh    r2, [r3, #0x30]
00084056  movs    r7, r0
00084058  movs    r0, r0
0008405a  asrs    r0, r4
0008405c  ldrh    r4, [r5, #0x2e]
0008405e  movs    r7, r0
00084060  ldrh    r0, [r3, #0x2c]
00084062  movs    r7, r0
00084064  ldrh    r6, [r2, #0x2c]
00084066  movs    r7, r0
