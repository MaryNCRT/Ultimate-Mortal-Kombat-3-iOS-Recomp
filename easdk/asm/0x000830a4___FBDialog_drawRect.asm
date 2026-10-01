========================================================================
-[FBDialog drawRect  0x000830a4  164 bytes   FBDialog.m
========================================================================

000830a4  sub     sp, #8
000830a6  push    {r4, r5, r6, r7, lr}
000830a8  add     r7, sp, #0xc
000830aa  str     r8, [sp, #-0x4]!
000830ae  vpush   {d8}
000830b2  sub     sp, #0x10
000830b4  mov     r8, r0
000830b6  add     r0, sp, #0x30
000830b8  ldr     r5, [sp, #0x40]
000830ba  stm.w   r0, {r2, r3}
000830be  vldr    s16, [sp, #0x44]
000830c2  blx     #0xdd488 ; -> UIGraphicsGetCurrentContext
000830c6  mov     r4, r0
000830c8  blx     #0xdd23c ; -> CGColorSpaceCreateDeviceRGB
000830cc  mov     r6, r0
000830ce  cbz     r5, #0x830fe
000830d0  mov     r0, r4
000830d2  blx     #0xdd2e4 ; -> CGContextSaveGState
000830d6  mov     r0, r4
000830d8  mov     r1, r5
000830da  blx     #0xdd2fc ; -> CGContextSetFillColor
000830de  vcmp.f32 s16, #0
000830e2  vmrs    apsr_nzcv, fpscr
000830e6  bne     #0x8311c
000830e8  ldr     r3, [sp, #0x3c]
000830ea  add     r0, sp, #0x30
000830ec  str     r3, [sp]
000830ee  ldm.w   r0, {r1, r2, r3}
000830f2  mov     r0, r4
000830f4  blx     #0xdd2b4 ; -> CGContextFillRect
000830f8  mov     r0, r4
000830fa  blx     #0xdd2d8 ; -> CGContextRestoreGState
000830fe  mov     r0, r6
00083100  blx     #0xdd248 ; -> CGColorSpaceRelease
00083104  sub.w   sp, r7, #0x18
00083108  vpop    {d8}
0008310c  sub.w   sp, r7, #0x10
00083110  ldr     r8, [sp], #4
00083114  pop.w   {r4, r5, r6, r7, lr}
00083118  add     sp, #8
0008311a  bx      lr
0008311c  ldr     r1, [pc, #0x24]
0008311e  add     r0, sp, #0x34
00083120  vstr    s16, [sp, #0xc]
00083124  add     r1, pc ; -> 0x000fcd5c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e4
00083126  ldr     r3, [sp, #0x30]
00083128  ldr.w   ip, [r1]
0008312c  ldm     r0, {r0, r1, r2}
0008312e  stm.w   sp, {r0, r1, r2}
00083132  mov     r0, r8
00083134  mov     r1, ip
00083136  mov     r2, r4
00083138  blx     #0xddbfc ; -> objc_msgSend
0008313c  mov     r0, r4
0008313e  blx     #0xdd2a8 ; -> CGContextFillPath
00083142  b       #0x830f8
00083144  ldr     r4, [sp, #0xd0]
00083146  movs    r7, r0
