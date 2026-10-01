========================================================================
-[FBDialog strokeLines  0x00083148  244 bytes   FBDialog.m
========================================================================

00083148  sub     sp, #8
0008314a  push    {r4, r5, r7, lr}
0008314c  add     r7, sp, #8
0008314e  vpush   {d8, d9, d10, d11, d12, d13}
00083152  sub     sp, #0x10
00083154  add     r1, sp, #0x50
00083156  vldr    s26, [sp, #0x5c]
0008315a  stm.w   r1, {r2, r3}
0008315e  vldr    s22, [sp, #0x58]
00083162  vldr    s24, [sp, #0x54]
00083166  vldr    s18, [sp, #0x50]
0008316a  blx     #0xdd488 ; -> UIGraphicsGetCurrentContext
0008316e  vmov.f32 s16, #5.000000e-01
00083172  vadd.f32 d11, d9, d11
00083176  vadd.f32 d10, d9, d8
0008317a  vadd.f32 d9, d13, d12
0008317e  mov     r4, r0
00083180  blx     #0xdd23c ; -> CGColorSpaceCreateDeviceRGB
00083184  mov     r5, r0
00083186  mov     r0, r4
00083188  blx     #0xdd2e4 ; -> CGContextSaveGState
0008318c  mov     r0, r4
0008318e  mov     r1, r5
00083190  blx     #0xdd320 ; -> CGContextSetStrokeColorSpace
00083194  mov     r0, r4
00083196  ldr     r1, [sp, #0x60]
00083198  blx     #0xdd314 ; -> CGContextSetStrokeColor
0008319c  mov     r0, r4
0008319e  mov.w   r1, #0x3f800000
000831a2  blx     #0xdd308 ; -> CGContextSetLineWidth
000831a6  mov     r0, r4
000831a8  mov     r1, sp
000831aa  movs    r2, #2
000831ac  vsub.f32 d7, d12, d8
000831b0  vstr    s20, [sp]
000831b4  vstr    s14, [sp, #4]
000831b8  vstr    s14, [sp, #0xc]
000831bc  vstr    s22, [sp, #8]
000831c0  blx     #0xdd32c ; -> CGContextStrokeLineSegments
000831c4  mov     r0, r4
000831c6  mov     r1, sp
000831c8  movs    r2, #2
000831ca  vsub.f32 d7, d9, d8
000831ce  vstr    s20, [sp]
000831d2  vstr    s14, [sp, #4]
000831d6  vstr    s14, [sp, #0xc]
000831da  vsub.f32 d8, d11, d8
000831de  vstr    s16, [sp, #8]
000831e2  blx     #0xdd32c ; -> CGContextStrokeLineSegments
000831e6  mov     r0, r4
000831e8  mov     r1, sp
000831ea  movs    r2, #2
000831ec  vstr    s16, [sp]
000831f0  vstr    s24, [sp, #4]
000831f4  vstr    s16, [sp, #8]
000831f8  vstr    s18, [sp, #0xc]
000831fc  blx     #0xdd32c ; -> CGContextStrokeLineSegments
00083200  mov     r0, r4
00083202  mov     r1, sp
00083204  movs    r2, #2
00083206  vstr    s20, [sp]
0008320a  vstr    s24, [sp, #4]
0008320e  vstr    s20, [sp, #8]
00083212  vstr    s18, [sp, #0xc]
00083216  blx     #0xdd32c ; -> CGContextStrokeLineSegments
0008321a  mov     r0, r4
0008321c  blx     #0xdd2d8 ; -> CGContextRestoreGState
00083220  mov     r0, r5
00083222  blx     #0xdd248 ; -> CGColorSpaceRelease
00083226  sub.w   sp, r7, #0x38
0008322a  vpop    {d8, d9, d10, d11, d12, d13}
0008322e  sub.w   sp, r7, #8
00083232  pop.w   {r4, r5, r7, lr}
00083236  add     sp, #8
00083238  bx      lr
0008323a  nop     
