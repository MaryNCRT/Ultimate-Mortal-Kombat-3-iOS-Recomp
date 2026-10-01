========================================================================
-[DMGCatButton renderAtPoint  0x000ce1d4  668 bytes   DMGCatButton.m
========================================================================

000ce1d4  push    {r4, r5, r6, r7, lr}
000ce1d6  add     r7, sp, #0xc
000ce1d8  push.w  {r8, sl, fp}
000ce1dc  vpush   {d8, d9, d10, d11, d12}
000ce1e0  sub     sp, #0x40
000ce1e2  ldr     r1, [pc, #0x22c]
000ce1e4  mov     r5, r0
000ce1e6  ldr.w   fp, [sp, #0x88]
000ce1ea  add     r1, pc ; -> 0x000fdb2c  
000ce1ec  vmov    s24, r3
000ce1f0  ldr     r1, [r1]
000ce1f2  vmov    s22, r2
000ce1f6  blx     #0xddbfc ; -> objc_msgSend
000ce1fa  tst.w   r0, #0xff
000ce1fe  beq     #0xce214
000ce200  ldr     r3, [pc, #0x210]
000ce202  ldr     r1, [pc, #0x214]
000ce204  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce206  add     r1, pc ; -> 0x000fcd9c  
000ce208  ldr     r3, [r3]
000ce20a  ldr     r1, [r1]
000ce20c  ldr     r0, [r5, r3]
000ce20e  ldr     r3, [pc, #0x20c]
000ce210  add     r3, pc ; -> 0x000f9a18  OBJC_IVAR_$_DMGCatButton.m_SelImg
000ce212  b       #0xce226
000ce214  ldr     r3, [pc, #0x208]
000ce216  ldr     r1, [pc, #0x20c]
000ce218  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce21a  add     r1, pc ; -> 0x000fcd9c  
000ce21c  ldr     r3, [r3]
000ce21e  ldr     r1, [r1]
000ce220  ldr     r0, [r5, r3]
000ce222  ldr     r3, [pc, #0x204]
000ce224  add     r3, pc ; -> 0x000f9a1c  OBJC_IVAR_$_DMGCatButton.m_RegImg
000ce226  ldr     r3, [r3]
000ce228  ldr.w   r8, [pc, #0x200]
000ce22c  ldr     r2, [r5, r3]
000ce22e  blx     #0xddbfc ; -> objc_msgSend
000ce232  ldr     r1, [pc, #0x1fc]
000ce234  add     r8, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce236  add     r1, pc ; -> 0x000fcd74  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3fc
000ce238  ldr.w   r3, [r8]
000ce23c  ldr     r4, [r1]
000ce23e  ldr     r0, [r5, r3]
000ce240  mov     r1, r4
000ce242  blx     #0xddbfc ; -> objc_msgSend
000ce246  cmp     r0, #0
000ce248  beq     #0xce330
000ce24a  ldr     r3, [pc, #0x1e8]
000ce24c  mov     r1, r4
000ce24e  vmov.f64 d9, #5.000000e-01
000ce252  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000ce254  ldr     r3, [r3]
000ce256  vldr    s16, [r3]
000ce25a  ldr.w   r3, [r8]
000ce25e  ldr     r0, [r5, r3]
000ce260  blx     #0xddbfc ; -> objc_msgSend
000ce264  ldr     r2, [pc, #0x1d0]
000ce266  add     r2, pc ; -> 0x000fc9d4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x5c
000ce268  ldr     r6, [r2]
000ce26a  mov     r2, r6
000ce26c  mov     r1, r0
000ce26e  add     r0, sp, #8
000ce270  blx     #0xddc14 ; -> objc_msgSend_stret
000ce274  add     r2, sp, #8
000ce276  ldm     r2, {r2, r3}
000ce278  vmov    s10, r2
000ce27c  vsub.f32 d6, d8, d5
000ce280  vcvt.f64.f32 d7, s22
000ce284  ldr     r3, [pc, #0x1b4]
000ce286  mov     r1, r4
000ce288  add     r3, pc ; -> 0x000f330c  DMG_BUTTON_HEIGHT
000ce28a  ldr     r3, [r3]
000ce28c  vcvt.f64.f32 d6, s12
000ce290  vldr    s16, [r3]
000ce294  ldr.w   r3, [r8]
000ce298  ldr     r0, [r5, r3]
000ce29a  vmla.f64 d7, d6, d9
000ce29e  vcvt.f32.f64 s20, d7
000ce2a2  blx     #0xddbfc ; -> objc_msgSend
000ce2a6  mov     r2, r6
000ce2a8  mov     r1, r0
000ce2aa  add     r0, sp, #8
000ce2ac  blx     #0xddc14 ; -> objc_msgSend_stret
000ce2b0  add     r2, sp, #8
000ce2b2  ldm     r2, {r2, r3}
000ce2b4  vmov    s10, r3
000ce2b8  vsub.f32 d6, d8, d5
000ce2bc  vcvt.f64.f32 d7, s24
000ce2c0  ldr.w   r3, [r8]
000ce2c4  mov     r1, r4
000ce2c6  ldr     r0, [r5, r3]
000ce2c8  vcvt.f64.f32 d6, s12
000ce2cc  vmla.f64 d7, d6, d9
000ce2d0  vmov.f64 d6, #2.000000e+00
000ce2d4  vadd.f64 d7, d7, d6
000ce2d8  vcvt.f32.f64 s16, d7
000ce2dc  blx     #0xddbfc ; -> objc_msgSend
000ce2e0  mov     r2, r6
000ce2e2  mov     r1, r0
000ce2e4  add     r0, sp, #8
000ce2e6  blx     #0xddc14 ; -> objc_msgSend_stret
000ce2ea  ldr.w   r3, [r8]
000ce2ee  mov     r1, r4
000ce2f0  ldr.w   sl, [sp, #8]
000ce2f4  ldr     r0, [r5, r3]
000ce2f6  blx     #0xddbfc ; -> objc_msgSend
000ce2fa  mov     r2, r6
000ce2fc  mov     r1, r0
000ce2fe  add     r0, sp, #8
000ce300  blx     #0xddc14 ; -> objc_msgSend_stret
000ce304  ldr.w   r0, [r8]
000ce308  ldr     r1, [pc, #0x134]
000ce30a  ldr     r3, [sp, #0xc]
000ce30c  str.w   sl, [sp, #0x38]
000ce310  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000ce312  ldr.w   lr, [r5, r0]
000ce316  add     r0, sp, #0x38
000ce318  str     r3, [sp, #0x3c]
000ce31a  ldr.w   ip, [r1]
000ce31e  ldm     r0, {r0, r1}
000ce320  add     r2, sp, #0x30
000ce322  vstr    s16, [sp, #0x34]
000ce326  vstr    s20, [sp, #0x30]
000ce32a  stm.w   sp, {r0, r1}
000ce32e  b       #0xce37c
000ce330  vmov.f32 s10, #2.000000e+00
000ce334  ldr     r3, [pc, #0x10c]
000ce336  ldr     r1, [pc, #0x110]
000ce338  add     r2, sp, #0x20
000ce33a  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000ce33c  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000ce33e  ldr     r3, [r3]
000ce340  vldr    s14, [r3]
000ce344  ldr     r3, [pc, #0x104]
000ce346  ldr.w   ip, [r1]
000ce34a  vsub.f32 d6, d7, d5
000ce34e  add     r3, pc ; -> 0x000f330c  DMG_BUTTON_HEIGHT
000ce350  vstr    s12, [sp, #0x28]
000ce354  ldr     r3, [r3]
000ce356  vldr    s14, [r3]
000ce35a  ldr     r3, [pc, #0xf4]
000ce35c  vsub.f32 d7, d7, d5
000ce360  vstr    s14, [sp, #0x2c]
000ce364  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce366  vstr    s24, [sp, #0x24]
000ce36a  ldr     r0, [r3]
000ce36c  vstr    s22, [sp, #0x20]
000ce370  ldr.w   lr, [r5, r0]
000ce374  add     r0, sp, #0x28
000ce376  ldm     r0, {r0, r1}
000ce378  stm.w   sp, {r0, r1}
000ce37c  mov     r0, lr
000ce37e  mov     r1, ip
000ce380  ldm     r2, {r2, r3}
000ce382  blx     #0xddbfc ; -> objc_msgSend
000ce386  ldr     r1, [pc, #0xcc]
000ce388  ldr     r3, [pc, #0xcc]
000ce38a  mov     r0, fp
000ce38c  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000ce38e  add     r3, pc ; -> 0x000f9a10  OBJC_IVAR_$_DMGCatButton.myImgView
000ce390  ldr     r6, [r1]
000ce392  ldr     r3, [r3]
000ce394  ldr     r4, [pc, #0xc4]
000ce396  mov     r1, r6
000ce398  ldr     r2, [r5, r3]
000ce39a  blx     #0xddbfc ; -> objc_msgSend
000ce39e  ldr     r3, [pc, #0xc0]
000ce3a0  vmov.f32 s12, #2.400000e+01
000ce3a4  add     r4, pc ; -> 0x000f9a0c  OBJC_IVAR_$_DMGCatButton.myTitleLabel
000ce3a6  add     r3, pc ; -> 0x000f330c  DMG_BUTTON_HEIGHT
000ce3a8  ldr     r0, [r4]
000ce3aa  ldr     r3, [r3]
000ce3ac  vldr    s14, [r3]
000ce3b0  ldr     r3, [pc, #0xb0]
000ce3b2  ldr     r1, [pc, #0xb4]
000ce3b4  ldr     r2, [pc, #0xb4]
000ce3b6  add     r3, pc ; -> 0x000f3310  DMG_BUTTON_WIDTH
000ce3b8  vsub.f32 d7, d7, d6
000ce3bc  ldr     r3, [r3]
000ce3be  vmov.f32 s12, #1.000000e+00
000ce3c2  ldr.w   lr, [r5, r0]
000ce3c6  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000ce3c8  ldr     r3, [r3]
000ce3ca  add     r0, sp, #0x18
000ce3cc  str     r2, [sp, #0x1c]
000ce3ce  ldr.w   ip, [r1]
000ce3d2  str     r3, [sp, #0x18]
000ce3d4  ldm     r0, {r0, r1}
000ce3d6  add     r2, sp, #0x10
000ce3d8  vsub.f32 d7, d7, d6
000ce3dc  vstr    s22, [sp, #0x10]
000ce3e0  stm.w   sp, {r0, r1}
000ce3e4  vstr    s14, [sp, #0x14]
000ce3e8  mov     r0, lr
000ce3ea  ldm     r2, {r2, r3}
000ce3ec  mov     r1, ip
000ce3ee  blx     #0xddbfc ; -> objc_msgSend
000ce3f2  ldr     r0, [r4]
000ce3f4  mov     r1, r6
000ce3f6  ldr     r2, [r5, r0]
000ce3f8  mov     r0, fp
000ce3fa  blx     #0xddbfc ; -> objc_msgSend
000ce3fe  sub.w   sp, r7, #0x40
000ce402  vpop    {d8, d9, d10, d11, d12}
000ce406  sub.w   sp, r7, #0x18
000ce40a  pop.w   {r8, sl, fp}
000ce40e  pop     {r4, r5, r6, r7, pc}
000ce410  ldrsh.w r0, [lr, r2]
