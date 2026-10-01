========================================================================
-[FBDialog keyboardWillHide  0x000832c0  216 bytes   FBDialog.m
========================================================================

000832c0  push    {r4, r5, r6, r7, lr}
000832c2  add     r7, sp, #0xc
000832c4  str     r8, [sp, #-0x4]!
000832c8  sub     sp, #0x3c
000832ca  ldr     r1, [pc, #0xac]
000832cc  mov     r4, r0
000832ce  ldr     r0, [pc, #0xac]
000832d0  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000832d2  add     r0, pc ; -> 0x000fdb80  
000832d4  ldr     r1, [r1]
000832d6  ldr     r0, [r0]
000832d8  blx     #0xddbfc ; -> objc_msgSend
000832dc  ldr     r1, [pc, #0xa0]
000832de  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
000832e0  ldr     r1, [r1]
000832e2  blx     #0xddbfc ; -> objc_msgSend
000832e6  subs    r0, #3
000832e8  cmp     r0, #1
000832ea  bls     #0x83300
000832ec  ldr     r3, [pc, #0x94]
000832ee  movs    r2, #0
000832f0  add     r3, pc ; -> 0x000f51e0  OBJC_IVAR_$_FBDialog._showingKeyboard
000832f2  ldr     r3, [r3]
000832f4  strb    r2, [r4, r3]
000832f6  sub.w   sp, r7, #0x10
000832fa  ldr     r8, [sp], #4
000832fe  pop     {r4, r5, r6, r7, pc}
00083300  ldr.w   r8, [pc, #0x84]
00083304  ldr     r2, [pc, #0x84]
00083306  add     r0, sp, #0x1c
00083308  add     r8, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
0008330a  add     r2, pc ; -> 0x000fc9bc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x44
0008330c  ldr.w   r3, [r8]
00083310  ldr     r5, [r2]
00083312  add     r6, sp, #0x1c
00083314  ldr     r1, [r4, r3]
00083316  mov     r2, r5
00083318  blx     #0xddc14 ; -> objc_msgSend_stret
0008331c  ldr     r3, [pc, #0x70]
0008331e  add     r0, sp, #0xc
00083320  mov     r2, r5
00083322  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
00083324  add     r5, sp, #0x2c
00083326  ldr     r3, [r3]
00083328  ldr     r1, [r4, r3]
0008332a  blx     #0xddc14 ; -> objc_msgSend_stret
0008332e  vmov.f32 s12, #2.000000e+01
00083332  ldr     r3, [sp, #0x28]
00083334  vldr    s14, [sp, #0x18]
00083338  add     r0, sp, #0x2c
0008333a  str     r3, [sp]
0008333c  vstr    s12, [sp, #4]
00083340  vadd.f32 d7, d7, d6
00083344  vstr    s14, [sp, #8]
00083348  ldm.w   r6, {r1, r2, r3}
0008334c  blx     #0xdd3a4 ; -> CGRectInset
00083350  ldr.w   r0, [r8]
00083354  ldr     r1, [pc, #0x3c]
00083356  ldr.w   lr, [r4, r0]
0008335a  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
0008335c  add     r0, sp, #0x34
0008335e  ldr.w   ip, [r1]
00083362  ldm     r0, {r0, r1}
00083364  stm.w   sp, {r0, r1}
00083368  mov     r0, lr
0008336a  ldm.w   r5, {r2, r3}
0008336e  mov     r1, ip
00083370  blx     #0xddbfc ; -> objc_msgSend
00083374  b       #0x832ec
00083376  nop     
00083378  ldr     r0, [sp, #0xb0]
0008337a  movs    r7, r0
0008337c  add     r0, sp, #0x2a8
0008337e  movs    r7, r0
00083380  ldr     r2, [sp, #0x1d8]
00083382  movs    r7, r0
00083384  subs    r4, r5, #3
00083386  movs    r7, r0
00083388  subs    r4, r7, #2
0008338a  movs    r7, r0
0008338c  str     r6, [sp, #0x2b8]
0008338e  movs    r7, r0
00083390  subs    r6, r5, #2
00083392  movs    r7, r0
00083394  ldr     r1, [sp, #0x3c8]
00083396  movs    r7, r0
