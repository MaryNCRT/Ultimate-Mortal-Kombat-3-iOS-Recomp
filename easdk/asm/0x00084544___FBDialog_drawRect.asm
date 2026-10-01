========================================================================
-[FBDialog drawRect  0x00084544  388 bytes   FBDialog.m
========================================================================

00084544  sub     sp, #8
00084546  push    {r4, r5, r6, r7, lr}
00084548  add     r7, sp, #0xc
0008454a  push.w  {r8, sl, fp}
0008454e  vpush   {d8, d9, d10, d11}
00084552  sub     sp, #0x60
00084554  mov     r6, r0
00084556  add     r0, sp, #0xa0
00084558  vmov.f32 s16, #1.000000e+01
0008455c  stm.w   r0, {r2, r3}
00084560  mov.w   r3, #-0x41000000
00084564  str     r3, [sp, #4]
00084566  str     r3, [sp, #8]
00084568  ldr     r3, [sp, #0xac]
0008456a  vldr    s20, [sp, #0xa4]
0008456e  vldr    s18, [sp, #0xa0]
00084572  vldr    s22, [sp, #0xa8]
00084576  str     r3, [sp]
00084578  ldm.w   r0, {r1, r2, r3}
0008457c  add     r0, sp, #0x50
0008457e  blx     #0xdd3bc ; -> CGRectOffset
00084582  ldr     r1, [pc, #0x120]
00084584  ldr     r3, [pc, #0x120]
00084586  add     r0, sp, #0x58
00084588  add     r1, pc ; -> 0x000fcc70  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2f8
0008458a  vstr    s16, [sp, #0xc]
0008458e  ldr.w   r8, [r1]
00084592  add     r3, pc ; -> 0x001758d8  kBorderGray
00084594  str     r3, [sp, #8]
00084596  ldm     r0, {r0, r1}
00084598  add     r4, sp, #0x50
0008459a  add     r5, sp, #0x48
0008459c  stm.w   sp, {r0, r1}
000845a0  mov     r1, r8
000845a2  ldm.w   r4, {r2, r3}
000845a6  mov     r0, r6
000845a8  blx     #0xddbfc ; -> objc_msgSend
000845ac  vadd.f32 d7, d9, d8
000845b0  vmov    r0, s14
000845b4  blx     #0xdd764 ; -> ceilf
000845b8  vadd.f32 d7, d10, d8
000845bc  add     r4, sp, #0x40
000845be  mov     fp, r0
000845c0  vmov    r0, s14
000845c4  blx     #0xdd764 ; -> ceilf
000845c8  vmov.f32 s14, #2.000000e+01
000845cc  ldr     r3, [pc, #0xdc]
000845ce  ldr     r2, [pc, #0xe0]
000845d0  add     r3, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
000845d2  add     r2, pc ; -> 0x000fc9bc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x44
000845d4  ldr     r3, [r3]
000845d6  ldr.w   sl, [r2]
000845da  ldr     r1, [r6, r3]
000845dc  mov     r2, sl
000845de  vsub.f32 d9, d11, d7
000845e2  vmov    s20, r0
000845e6  add     r0, sp, #0x20
000845e8  blx     #0xddc14 ; -> objc_msgSend_stret
000845ec  ldr     r3, [pc, #0xc4]
000845ee  vldr    s16, [sp, #0x2c]
000845f2  vstr    s18, [sp, #0x48]
000845f6  vstr    s16, [sp, #0x4c]
000845fa  add     r3, pc ; -> 0x001758e8  kFacebookBlue
000845fc  str     r3, [sp, #8]
000845fe  movs    r3, #0
00084600  str     r3, [sp, #0xc]
00084602  ldm.w   r5, {r0, r1}
00084606  vstr    s20, [sp, #0x44]
0008460a  str.w   fp, [sp, #0x40]
0008460e  stm.w   sp, {r0, r1}
00084612  mov     r0, r6
00084614  ldm.w   r4, {r2, r3}
00084618  mov     r1, r8
0008461a  blx     #0xddbfc ; -> objc_msgSend
0008461e  ldr     r1, [pc, #0x98]
00084620  ldr     r3, [pc, #0x98]
00084622  add     r1, pc ; -> 0x000fcc6c  'F)\x0e'
00084624  add     r3, pc ; -> 0x001758f8  kBorderBlue
00084626  ldr.w   r8, [r1]
0008462a  str     r3, [sp, #8]
0008462c  ldm.w   r5, {r0, r1}
00084630  stm.w   sp, {r0, r1}
00084634  mov     r0, r6
00084636  ldm.w   r4, {r2, r3}
0008463a  mov     r1, r8
0008463c  blx     #0xddbfc ; -> objc_msgSend
00084640  ldr     r3, [pc, #0x7c]
00084642  add     r0, sp, #0x10
00084644  mov     r2, sl
00084646  add     r3, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
00084648  ldr     r3, [r3]
0008464a  ldr     r1, [r6, r3]
0008464c  blx     #0xddc14 ; -> objc_msgSend_stret
00084650  vmov.f32 s12, #1.000000e+00
00084654  ldr     r3, [pc, #0x6c]
00084656  add     r0, sp, #0x38
00084658  vldr    s14, [sp, #0x1c]
0008465c  vstr    s18, [sp, #0x38]
00084660  add     r3, pc ; -> 0x00175908  kBorderBlack
00084662  str     r3, [sp, #8]
00084664  add     r2, sp, #0x30
00084666  str.w   fp, [sp, #0x30]
0008466a  vadd.f32 d7, d7, d6
0008466e  vstr    s14, [sp, #0x3c]
00084672  ldm     r0, {r0, r1}
00084674  vadd.f32 d7, d10, d8
00084678  vstr    s14, [sp, #0x34]
0008467c  stm.w   sp, {r0, r1}
00084680  mov     r0, r6
00084682  ldm     r2, {r2, r3}
00084684  mov     r1, r8
00084686  blx     #0xddbfc ; -> objc_msgSend
0008468a  sub.w   sp, r7, #0x38
0008468e  vpop    {d8, d9, d10, d11}
00084692  sub.w   sp, r7, #0x18
00084696  pop.w   {r8, sl, fp}
0008469a  pop.w   {r4, r5, r6, r7, lr}
0008469e  add     sp, #8
000846a0  bx      lr
000846a2  nop     
000846a4  strh    r4, [r4, #0x36]
000846a6  movs    r7, r0
000846a8  asrs    r2, r0, #0xd
000846aa  movs    r7, r1
000846ac  lsrs    r0, r0, #0x10
000846ae  movs    r7, r0
000846b0  strh    r6, [r4, #0x1e]
000846b2  movs    r7, r0
000846b4  asrs    r2, r5, #0xb
000846b6  movs    r7, r1
000846b8  strh    r6, [r0, #0x32]
000846ba  movs    r7, r0
000846bc  asrs    r0, r2, #0xb
000846be  movs    r7, r1
000846c0  lsrs    r6, r7, #0xd
000846c2  movs    r7, r0
000846c4  asrs    r4, r4, #0xa
000846c6  movs    r7, r1
