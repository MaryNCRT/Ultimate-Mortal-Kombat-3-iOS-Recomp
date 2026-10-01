========================================================================
-[FBDialog keyboardWillShow  0x00083398  216 bytes   FBDialog.m
========================================================================

00083398  push    {r4, r5, r6, r7, lr}
0008339a  add     r7, sp, #0xc
0008339c  str     r8, [sp, #-0x4]!
000833a0  sub     sp, #0x3c
000833a2  ldr     r1, [pc, #0xac]
000833a4  mov     r4, r0
000833a6  ldr     r0, [pc, #0xac]
000833a8  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
000833aa  add     r0, pc ; -> 0x000fdb80  
000833ac  ldr     r1, [r1]
000833ae  ldr     r0, [r0]
000833b0  blx     #0xddbfc ; -> objc_msgSend
000833b4  ldr     r1, [pc, #0xa0]
000833b6  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
000833b8  ldr     r1, [r1]
000833ba  blx     #0xddbfc ; -> objc_msgSend
000833be  subs    r0, #3
000833c0  cmp     r0, #1
000833c2  bls     #0x833d8
000833c4  ldr     r3, [pc, #0x94]
000833c6  movs    r2, #1
000833c8  add     r3, pc ; -> 0x000f51e0  OBJC_IVAR_$_FBDialog._showingKeyboard
000833ca  ldr     r3, [r3]
000833cc  strb    r2, [r4, r3]
000833ce  sub.w   sp, r7, #0x10
000833d2  ldr     r8, [sp], #4
000833d6  pop     {r4, r5, r6, r7, pc}
000833d8  ldr.w   r8, [pc, #0x84]
000833dc  ldr     r2, [pc, #0x84]
000833de  add     r0, sp, #0x1c
000833e0  add     r8, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
000833e2  add     r2, pc ; -> 0x000fc9bc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x44
000833e4  ldr.w   r3, [r8]
000833e8  ldr     r5, [r2]
000833ea  add     r6, sp, #0x1c
000833ec  ldr     r1, [r4, r3]
000833ee  mov     r2, r5
000833f0  blx     #0xddc14 ; -> objc_msgSend_stret
000833f4  ldr     r3, [pc, #0x70]
000833f6  add     r0, sp, #0xc
000833f8  mov     r2, r5
000833fa  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
000833fc  add     r5, sp, #0x2c
000833fe  ldr     r3, [r3]
00083400  ldr     r1, [r4, r3]
00083402  blx     #0xddc14 ; -> objc_msgSend_stret
00083406  vmov.f32 s12, #-2.000000e+01
0008340a  ldr     r3, [sp, #0x28]
0008340c  vldr    s14, [sp, #0x18]
00083410  add     r0, sp, #0x2c
00083412  str     r3, [sp]
00083414  vstr    s12, [sp, #4]
00083418  vsub.f32 d7, d6, d7
0008341c  vstr    s14, [sp, #8]
00083420  ldm.w   r6, {r1, r2, r3}
00083424  blx     #0xdd3a4 ; -> CGRectInset
00083428  ldr.w   r0, [r8]
0008342c  ldr     r1, [pc, #0x3c]
0008342e  ldr.w   lr, [r4, r0]
00083432  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
00083434  add     r0, sp, #0x34
00083436  ldr.w   ip, [r1]
0008343a  ldm     r0, {r0, r1}
0008343c  stm.w   sp, {r0, r1}
00083440  mov     r0, lr
00083442  ldm.w   r5, {r2, r3}
00083446  mov     r1, ip
00083448  blx     #0xddbfc ; -> objc_msgSend
0008344c  b       #0x833c4
0008344e  nop     
00083450  str     r7, [sp, #0x150]
00083452  movs    r7, r0
00083454  adr     r7, #0x348
00083456  movs    r7, r0
00083458  ldr     r1, [sp, #0x278]
0008345a  movs    r7, r0
0008345c  subs    r4, r2, #0
0008345e  movs    r7, r0
00083460  adds    r4, r4, #7
00083462  movs    r7, r0
00083464  str     r5, [sp, #0x358]
00083466  movs    r7, r0
00083468  adds    r6, r2, #7
0008346a  movs    r7, r0
0008346c  ldr     r1, [sp, #0x68]
0008346e  movs    r7, r0
