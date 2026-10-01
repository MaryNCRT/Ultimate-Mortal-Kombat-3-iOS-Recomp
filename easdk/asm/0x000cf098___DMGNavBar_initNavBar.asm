========================================================================
-[DMGNavBar initNavBar  0x000cf098  1996 bytes   DMGNavBar.mm
========================================================================

000cf098  push    {r4, r5, r6, r7, lr}
000cf09a  add     r7, sp, #0xc
000cf09c  push.w  {r8, sl, fp}
000cf0a0  vpush   {d8, d9, d10, d11, d12}
000cf0a4  sub     sp, #0x120
000cf0a6  vmov.f32 s12, #5.000000e-01
000cf0aa  ldr     r3, [pc, #0x2b0]
000cf0ac  ldr     r4, [pc, #0x2b0]
000cf0ae  vldr    s10, [pc, #0x2a8]
000cf0b2  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cf0b4  add     r4, pc ; -> 0x000f9f24  OBJC_IVAR_$_DMGNavBar.parentController
000cf0b6  ldr     r3, [r3]
000cf0b8  vldr    s24, [r3]
000cf0bc  vsub.f32 d7, d12, d5
000cf0c0  ldr     r3, [r4]
000cf0c2  vmul.f32 d8, d7, d6
000cf0c6  vmov.f32 s12, #5.000000e+00
000cf0ca  ldr     r1, [pc, #0x298]
000cf0cc  str     r2, [sp, #0xc]
000cf0ce  str     r2, [r0, r3]
000cf0d0  add     r1, pc ; -> 0x000fdaf4  '+\x14\x0f'
000cf0d2  ldr     r3, [r4]
000cf0d4  ldr     r1, [r1]
000cf0d6  mov     r6, r0
000cf0d8  vadd.f32 d7, d8, d5
000cf0dc  ldr     r0, [r0, r3]
000cf0de  vadd.f32 d11, d7, d6
000cf0e2  str     r1, [sp, #0x10]
000cf0e4  blx     #0xddbfc ; -> objc_msgSend
000cf0e8  cmp     r0, #0
000cf0ea  beq.w   #0xcf764
000cf0ee  ldr     r3, [r4]
000cf0f0  ldr     r1, [sp, #0x10]
000cf0f2  ldr     r0, [r6, r3]
000cf0f4  blx     #0xddbfc ; -> objc_msgSend
000cf0f8  ldr     r1, [pc, #0x26c]
000cf0fa  ldr.w   r2, [pc, #0x270]
000cf0fe  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000cf100  add     r2, pc ; -> 0x00180d04  
000cf102  ldr     r5, [r1]
000cf104  mov     r1, r5
000cf106  blx     #0xddbfc ; -> objc_msgSend
000cf10a  tst.w   r0, #0xff
000cf10e  bne     #0xcf146
000cf110  ldr     r3, [r4]
000cf112  ldr     r1, [sp, #0x10]
000cf114  ldr     r0, [r6, r3]
000cf116  blx     #0xddbfc ; -> objc_msgSend
000cf11a  ldr     r2, [pc, #0x254]
000cf11c  mov     r1, r5
000cf11e  add     r2, pc ; -> 0x00180d24  
000cf120  blx     #0xddbfc ; -> objc_msgSend
000cf124  tst.w   r0, #0xff
000cf128  bne     #0xcf146
000cf12a  ldr     r3, [r4]
000cf12c  ldr     r1, [sp, #0x10]
000cf12e  ldr     r0, [r6, r3]
000cf130  blx     #0xddbfc ; -> objc_msgSend
000cf134  ldr     r2, [pc, #0x23c]
000cf136  mov     r1, r5
000cf138  add     r2, pc ; -> 0x00180d64  
000cf13a  blx     #0xddbfc ; -> objc_msgSend
000cf13e  tst.w   r0, #0xff
000cf142  beq.w   #0xcf764
000cf146  ldr     r1, [pc, #0x230]
000cf148  ldr.w   r0, [pc, #0x230]
000cf14c  ldr     r4, [pc, #0x230]
000cf14e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cf150  add     r0, pc ; -> 0x000fdb5c  
000cf152  ldr.w   fp, [r1]
000cf156  ldr     r1, [pc, #0x22c]
000cf158  add     r4, pc ; -> 0x000f9f24  OBJC_IVAR_$_DMGNavBar.parentController
000cf15a  ldr     r0, [r0]
000cf15c  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000cf15e  ldr     r3, [r4]
000cf160  ldr     r5, [r1]
000cf162  ldr     r2, [pc, #0x224]
000cf164  str     r0, [sp, #0x14]
000cf166  ldr     r0, [r6, r3]
000cf168  mov     r1, r5
000cf16a  add     r2, pc ; -> 0x00182af4  
000cf16c  blx     #0xddbfc ; -> objc_msgSend
000cf170  ldr     r3, [r4]
000cf172  ldr     r2, [pc, #0x218]
000cf174  mov     r1, r5
000cf176  ldr.w   sl, [pc, #0x218]
000cf17a  add     r2, pc ; -> 0x00182b04  
000cf17c  ldr     r5, [pc, #0x214]
000cf17e  add     sl, pc ; -> 0x00182ae4  
000cf180  mov     r8, r0
000cf182  ldr     r0, [r6, r3]
000cf184  blx     #0xddbfc ; -> objc_msgSend
000cf188  mov     r3, r8
000cf18a  mov     r2, sl
000cf18c  mov     r1, fp
000cf18e  str     r0, [sp]
000cf190  ldr     r0, [sp, #0x14]
000cf192  blx     #0xddbfc ; -> objc_msgSend
000cf196  ldr     r2, [pc, #0x200]
000cf198  ldr     r1, [pc, #0x200]
000cf19a  add     r2, pc ; -> 0x000fdafc  ']&\x0f'
000cf19c  add     r1, pc ; -> 0x000fcc8c  'N,\x0e'
000cf19e  ldr.w   sl, [r2]
000cf1a2  ldr     r1, [r1]
000cf1a4  mov.w   r2, #0x41800000
000cf1a8  str     r0, [sp, #0x48]
000cf1aa  ldr     r0, [pc, #0x1f4]
000cf1ac  add     r0, pc ; -> 0x000fdba0  
000cf1ae  ldr     r0, [r0]
000cf1b0  blx     #0xddbfc ; -> objc_msgSend
000cf1b4  vmov.f32 s14, #5.000000e+00
000cf1b8  ldr     r2, [pc, #0x1e8]
000cf1ba  ldr     r1, [sp, #0x48]
000cf1bc  add     r2, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cf1be  ldr.w   r8, [r2]
000cf1c2  movs    r2, #0
000cf1c4  vldr    s12, [r8]
000cf1c8  str     r2, [sp, #8]
000cf1ca  vsub.f32 d7, d6, d7
000cf1ce  mov     r2, sl
000cf1d0  vsub.f32 d7, d7, d11
000cf1d4  vmov    r4, s14
000cf1d8  stm.w   sp, {r4, r5}
000cf1dc  mov     r3, r0
000cf1de  add     r0, sp, #0x50
000cf1e0  blx     #0xddc14 ; -> objc_msgSend_stret
000cf1e4  vmov.f32 s12, #5.000000e-01
000cf1e8  vldr    s18, [sp, #0x50]
000cf1ec  vldr    s14, [r8]
000cf1f0  vsub.f32 d7, d7, d9
000cf1f4  vmul.f32 d10, d7, d6
000cf1f8  vadd.f32 d8, d9, d10
000cf1fc  ldr     r3, [pc, #0x1a8]
000cf1fe  str     r6, [sp, #0x118]
000cf200  ldr     r1, [pc, #0x1a8]
000cf202  add     r3, pc ; -> 0x000fddc0  
000cf204  ldr     r5, [pc, #0x18c]
000cf206  ldr     r3, [r3]
000cf208  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000cf20a  add     r0, sp, #0x110
000cf20c  ldr.w   fp, [r1]
000cf210  str     r3, [sp, #0x11c]
000cf212  ldr     r3, [pc, #0x19c]
000cf214  str     r5, [sp, #0x114]
000cf216  add     r2, sp, #0x108
000cf218  add     r3, pc ; -> 0x000f3358  DMG_MAIN_SCREEN_WIDTH
000cf21a  movs    r4, #0
000cf21c  ldr     r6, [r3]
000cf21e  str     r4, [sp, #0x108]
000cf220  str     r4, [sp, #0x10c]
000cf222  ldr     r3, [r6]
000cf224  str     r3, [sp, #0x110]
000cf226  ldm     r0, {r0, r1}
000cf228  stm.w   sp, {r0, r1}
000cf22c  add     r0, sp, #0x118
000cf22e  ldm     r2, {r2, r3}
000cf230  mov     r1, fp
000cf232  blx     #0xddc08 ; -> objc_msgSendSuper2
000cf236  mov     r8, r0
000cf238  cmp     r0, #0
000cf23a  beq.w   #0xcf7b4
000cf23e  ldr     r0, [pc, #0x174]
000cf240  ldr.w   r1, [pc, #0x174]
000cf244  add     r0, pc ; -> 0x000fdbc8  
000cf246  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cf248  ldr     r0, [r0]
000cf24a  ldr     r1, [r1]
000cf24c  str     r0, [sp, #0x18]
000cf24e  str     r1, [sp, #0x1c]
000cf250  blx     #0xddbfc ; -> objc_msgSend
000cf254  ldr     r3, [r6]
000cf256  str     r5, [sp, #0x104]
000cf258  add     r2, sp, #0xf8
000cf25a  str     r4, [sp, #0xf8]
000cf25c  str     r3, [sp, #0x100]
000cf25e  str     r4, [sp, #0xfc]
000cf260  mov     ip, r0
000cf262  add     r0, sp, #0x100
000cf264  ldm     r0, {r0, r1}
000cf266  stm.w   sp, {r0, r1}
000cf26a  mov     r0, ip
000cf26c  ldm     r2, {r2, r3}
000cf26e  mov     r1, fp
000cf270  blx     #0xddbfc ; -> objc_msgSend
000cf274  ldr     r1, [pc, #0x144]
000cf276  ldr     r2, [pc, #0x148]
000cf278  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
000cf27a  add     r2, pc ; -> 0x00182b14  
000cf27c  ldr     r6, [r1]
000cf27e  mov     r1, r6
000cf280  mov     r4, r0
000cf282  ldr     r0, [pc, #0x140]
000cf284  add     r0, pc ; -> 0x000fdba8  
000cf286  ldr.w   sl, [r0]
000cf28a  mov     r0, sl
000cf28c  blx     #0xddbfc ; -> objc_msgSend
000cf290  ldr     r1, [pc, #0x134]
000cf292  add     r1, pc ; -> 0x000fcd9c  
000cf294  ldr     r1, [r1]
000cf296  str     r1, [sp, #0x20]
000cf298  mov     r2, r0
000cf29a  mov     r0, r4
000cf29c  blx     #0xddbfc ; -> objc_msgSend
000cf2a0  ldr     r1, [pc, #0x128]
000cf2a2  mov     r2, r4
000cf2a4  mov     r0, r8
000cf2a6  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000cf2a8  ldr     r1, [r1]
000cf2aa  str     r1, [sp, #0x24]
000cf2ac  blx     #0xddbfc ; -> objc_msgSend
000cf2b0  ldr     r1, [pc, #0x11c]
000cf2b2  mov     r0, r4
000cf2b4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cf2b6  ldr     r1, [r1]
000cf2b8  str     r1, [sp, #0x28]
000cf2ba  blx     #0xddbfc ; -> objc_msgSend
000cf2be  ldr     r0, [pc, #0x114]
000cf2c0  ldr     r1, [sp, #0x1c]
000cf2c2  add     r0, pc ; -> 0x000fdbcc  
000cf2c4  ldr     r0, [r0]
000cf2c6  blx     #0xddbfc ; -> objc_msgSend
000cf2ca  ldr     r3, [pc, #0x10c]
000cf2cc  add     r2, sp, #0xe8
000cf2ce  str     r3, [sp, #0xe8]
000cf2d0  ldr     r3, [pc, #0x108]
000cf2d2  str     r3, [sp, #0xec]
000cf2d4  mov.w   r3, #0x42000000
000cf2d8  str     r3, [sp, #0xf0]
000cf2da  str     r3, [sp, #0xf4]
000cf2dc  mov     ip, r0
000cf2de  add     r0, sp, #0xf0
000cf2e0  ldm     r0, {r0, r1}
000cf2e2  stm.w   sp, {r0, r1}
000cf2e6  mov     r0, ip
000cf2e8  ldm     r2, {r2, r3}
000cf2ea  mov     r1, fp
000cf2ec  blx     #0xddbfc ; -> objc_msgSend
000cf2f0  ldr     r1, [pc, #0xec]
000cf2f2  ldr     r2, [pc, #0xf0]
000cf2f4  add     r1, pc ; -> 0x000fda58  
000cf2f6  add     r2, pc ; -> 0x001828e4  
000cf2f8  ldr     r5, [r1]
000cf2fa  mov     r1, r6
000cf2fc  mov     r4, r0
000cf2fe  mov     r0, sl
000cf300  blx     #0xddbfc ; -> objc_msgSend
000cf304  mov     r1, r5
000cf306  movs    r3, #0
000cf308  mov     r2, r0
000cf30a  mov     r0, r4
000cf30c  blx     #0xddbfc ; -> objc_msgSend
000cf310  ldr     r2, [pc, #0xd4]
000cf312  mov     r1, r6
000cf314  mov     r0, sl
000cf316  add     r2, pc ; -> 0x001828f4  
000cf318  blx     #0xddbfc ; -> objc_msgSend
000cf31c  mov     r1, r5
000cf31e  movs    r3, #1
000cf320  mov     r2, r0
000cf322  mov     r0, r4
000cf324  blx     #0xddbfc ; -> objc_msgSend
000cf328  ldr     r1, [pc, #0xc0]
000cf32a  ldr     r0, [sp, #0xc]
000cf32c  add     r1, pc ; -> 0x000fcc98  'j2\x0e'
000cf32e  ldr     r5, [r1]
000cf330  ldr     r1, [pc, #0xbc]
000cf332  add     r1, pc ; -> 0x000fdaf0  
000cf334  ldr     r1, [r1]
000cf336  blx     #0xddbfc ; -> objc_msgSend
000cf33a  ldr     r3, [pc, #0xb8]
000cf33c  movs    r1, #0x40
000cf33e  str     r1, [sp]
000cf340  add     r3, pc ; -> 0x000fda54  'U \x0f'
000cf342  mov     r1, r5
000cf344  ldr     r3, [r3]
000cf346  ldr     r5, [pc, #0xb0]
000cf348  mov     r2, r0
000cf34a  mov     r0, r4
000cf34c  blx     #0xddbfc ; -> objc_msgSend
000cf350  mov     r2, r4
000cf352  mov     r0, r8
000cf354  ldr     r1, [sp, #0x24]
000cf356  b       #0xcf3fc
000cf358  movs    r0, r0
000cf35a  tst     r0, r3
000cf35c  cmp     r2, r4
000cf35e  movs    r2, r0
000cf360  add     r6, sp, #0x1b0
000cf362  movs    r2, r0
000cf364  bic.w   r0, r0, r2
000cf368  blt     #0xcf430
000cf36a  movs    r2, r0
000cf36c  adds    r0, r0, #0
000cf36e  movs    r3, r1
000cf370  adds    r2, r0, #0
000cf372  movs    r3, r1
000cf374  adds    r0, r5, #0
000cf376  movs    r3, r1
000cf378  bls     #0xcf418
000cf37a  movs    r2, r0
000cf37c  and.w   r0, r8, r2
000cf380  add     r5, sp, #0x320
000cf382  movs    r2, r0
000cf384  stmdb   r4!, {r1}
000cf388  subs    r1, #0x86
000cf38a  movs    r3, r1
000cf38c  subs    r1, #0x86
000cf38e  movs    r3, r1
000cf390  subs    r1, #0x62
000cf392  movs    r3, r1
000cf394  movs    r0, r0
000cf396  tst     r0, r6
000cf398  ldrd    r0, r0, [lr, #-0x8]
000cf39c  bge     #0xcf378
000cf39e  movs    r2, r0
000cf3a0  ldrd    r0, r0, [r0, #8]!
000cf3a4  sbcs    r0, r3
000cf3a6  movs    r2, r0
000cf3a8  subs.w  r0, sl, r2
000cf3ac  bge     #0xcf340
000cf3ae  movs    r2, r0
000cf3b0  asrs    r4, r7
000cf3b2  movs    r2, r0
