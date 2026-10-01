========================================================================
-[FBDialog addRoundedRectToPath  0x0008258c  388 bytes   FBDialog.m
========================================================================

0008258c  sub     sp, #4
0008258e  push    {r4, r5, r6, r7, lr}
00082590  add     r7, sp, #0xc
00082592  vpush   {d8, d9, d10, d11}
00082596  sub     sp, #0x1c
00082598  mov     r4, r2
0008259a  mov     r0, r2
0008259c  str     r3, [sp, #0x50]
0008259e  vldr    s20, [sp, #0x60]
000825a2  blx     #0xdd26c ; -> CGContextBeginPath
000825a6  mov     r0, r4
000825a8  blx     #0xdd2e4 ; -> CGContextSaveGState
000825ac  vcmp.f32 s20, #0
000825b0  vmrs    apsr_nzcv, fpscr
000825b4  bne     #0x82606
000825b6  add     r5, sp, #0x50
000825b8  add     r6, sp, #0x50
000825ba  ldm.w   r5, {r0, r1, r2, r3}
000825be  blx     #0xdd380 ; -> CGRectGetMinX
000825c2  mov     r5, r0
000825c4  ldm.w   r6, {r0, r1, r2, r3}
000825c8  blx     #0xdd38c ; -> CGRectGetMinY
000825cc  mov     r1, r5
000825ce  mov     r2, r0
000825d0  mov     r0, r4
000825d2  blx     #0xdd338 ; -> CGContextTranslateCTM
000825d6  ldr     r3, [sp, #0x5c]
000825d8  add     r0, sp, #0x50
000825da  str     r3, [sp]
000825dc  ldm.w   r0, {r1, r2, r3}
000825e0  mov     r0, r4
000825e2  blx     #0xdd260 ; -> CGContextAddRect
000825e6  mov     r0, r4
000825e8  blx     #0xdd284 ; -> CGContextClosePath
000825ec  mov     r0, r4
000825ee  blx     #0xdd2d8 ; -> CGContextRestoreGState
000825f2  sub.w   sp, r7, #0x2c
000825f6  vpop    {d8, d9, d10, d11}
000825fa  sub.w   sp, r7, #0xc
000825fe  pop.w   {r4, r5, r6, r7, lr}
00082602  add     sp, #4
00082604  bx      lr
00082606  vmov.f32 s18, #5.000000e-01
0008260a  ldr     r3, [sp, #0x5c]
0008260c  add     r6, sp, #0x50
0008260e  add     r0, sp, #0xc
00082610  add     r5, sp, #0xc
00082612  str     r3, [sp]
00082614  vstr    s18, [sp, #4]
00082618  vstr    s18, [sp, #8]
0008261c  ldm.w   r6, {r1, r2, r3}
00082620  blx     #0xdd3a4 ; -> CGRectInset
00082624  ldr     r3, [sp, #0x18]
00082626  vstr    s18, [sp, #4]
0008262a  vstr    s18, [sp, #8]
0008262e  add     r0, sp, #0x50
00082630  str     r3, [sp]
00082632  ldm.w   r5, {r1, r2, r3}
00082636  add     r5, sp, #0x50
00082638  blx     #0xdd3bc ; -> CGRectOffset
0008263c  ldm.w   r5, {r0, r1, r2, r3}
00082640  blx     #0xdd380 ; -> CGRectGetMinX
00082644  add     r6, sp, #0x50
00082646  add     r5, sp, #0x50
00082648  vmov    s16, r0
0008264c  ldm.w   r6, {r0, r1, r2, r3}
00082650  blx     #0xdd38c ; -> CGRectGetMinY
00082654  vsub.f32 d6, d8, d9
00082658  vmov    r1, s12
0008265c  add     r6, sp, #0x50
0008265e  vmov    s14, r0
00082662  mov     r0, r4
00082664  vsub.f32 d7, d7, d9
00082668  vmov    r2, s14
0008266c  blx     #0xdd338 ; -> CGContextTranslateCTM
00082670  mov     r0, r4
00082672  vmov    r1, s20
00082676  vmov    r2, s20
0008267a  blx     #0xdd2f0 ; -> CGContextScaleCTM
0008267e  ldm.w   r5, {r0, r1, r2, r3}
00082682  blx     #0xdd398 ; -> CGRectGetWidth
00082686  movs    r5, #0
00082688  vmov    s14, r0
0008268c  ldm.w   r6, {r0, r1, r2, r3}
00082690  vdiv.f32 s22, s14, s20
00082694  blx     #0xdd374 ; -> CGRectGetHeight
00082698  mov.w   r6, #0x3f800000
0008269c  vmov    s14, r0
000826a0  mov     r0, r4
000826a2  vdiv.f32 s16, s14, s20
000826a6  vmov    r1, s22
000826aa  vmul.f32 d10, d8, d9
000826ae  vmov    r2, s20
000826b2  blx     #0xdd2c0 ; -> CGContextMoveToPoint
000826b6  vmul.f32 d9, d11, d9
000826ba  mov     r0, r4
000826bc  vmov    r1, s22
000826c0  vmov    r2, s16
000826c4  vmov    r3, s18
000826c8  vstr    s16, [sp]
000826cc  str     r6, [sp, #4]
000826ce  blx     #0xdd254 ; -> CGContextAddArcToPoint
000826d2  movs    r1, #0
000826d4  mov     r0, r4
000826d6  vmov    r2, s16
000826da  mov     r3, r1
000826dc  vstr    s20, [sp]
000826e0  str     r6, [sp, #4]
000826e2  blx     #0xdd254 ; -> CGContextAddArcToPoint
000826e6  mov     r0, r4
000826e8  mov     r1, r5
000826ea  mov     r2, r5
000826ec  vmov    r3, s18
000826f0  str     r5, [sp]
000826f2  str     r6, [sp, #4]
000826f4  blx     #0xdd254 ; -> CGContextAddArcToPoint
000826f8  mov     r0, r4
000826fa  vmov    r1, s22
000826fe  mov     r2, r5
00082700  vmov    r3, s22
00082704  vstr    s20, [sp]
00082708  str     r6, [sp, #4]
0008270a  blx     #0xdd254 ; -> CGContextAddArcToPoint
0008270e  b       #0x825e6
