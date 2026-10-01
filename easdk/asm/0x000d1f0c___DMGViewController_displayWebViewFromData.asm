========================================================================
-[DMGViewController displayWebViewFromData  0x000d1f0c  384 bytes   DMGViewController.mm
========================================================================

000d1f0c  push    {r4, r5, r6, r7, lr}
000d1f0e  add     r7, sp, #0xc
000d1f10  push.w  {r8, sl, fp}
000d1f14  sub     sp, #0x18
000d1f16  ldr     r4, [pc, #0x120]
000d1f18  mov     r5, r0
000d1f1a  mov     fp, r2
000d1f1c  add     r4, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d1f1e  mov     sl, r3
000d1f20  ldr     r0, [r4]
000d1f22  ldr     r0, [r5, r0]
000d1f24  cbz     r0, #0xd1f44
000d1f26  ldr     r1, [pc, #0x114]
000d1f28  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d1f2a  ldr     r1, [r1]
000d1f2c  blx     #0xddbfc ; -> objc_msgSend
000d1f30  ldr     r1, [pc, #0x10c]
000d1f32  ldr     r3, [r4]
000d1f34  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1f36  ldr     r0, [r5, r3]
000d1f38  ldr     r1, [r1]
000d1f3a  blx     #0xddbfc ; -> objc_msgSend
000d1f3e  ldr     r3, [r4]
000d1f40  movs    r2, #0
000d1f42  str     r2, [r5, r3]
000d1f44  ldr     r0, [pc, #0xfc]
000d1f46  ldr     r1, [pc, #0x100]
000d1f48  ldr.w   r8, [pc, #0x100]
000d1f4c  add     r0, pc ; -> 0x000fdbd4  
000d1f4e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d1f50  add     r8, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d1f52  ldr     r1, [r1]
000d1f54  ldr     r0, [r0]
000d1f56  ldr.w   r4, [r8]
000d1f5a  blx     #0xddbfc ; -> objc_msgSend
000d1f5e  ldr     r3, [pc, #0xf0]
000d1f60  ldr     r1, [pc, #0xf0]
000d1f62  add     r3, pc ; -> 0x000f32f4  DMG_WEBVIEW_YPOS
000d1f64  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000d1f66  ldr     r3, [r3]
000d1f68  ldr.w   ip, [r1]
000d1f6c  mov     lr, r0
000d1f6e  ldr     r0, [r3]
000d1f70  ldr     r3, [pc, #0xe4]
000d1f72  add     r3, pc ; -> 0x000f32f8  DMG_WEBVIEW_WIDTH
000d1f74  str     r0, [sp, #0xc]
000d1f76  ldr     r3, [r3]
000d1f78  add     r0, sp, #0x10
000d1f7a  ldr     r1, [r3]
000d1f7c  ldr     r3, [pc, #0xdc]
000d1f7e  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d1f80  str     r1, [sp, #0x10]
000d1f82  ldr     r3, [r3]
000d1f84  ldr     r2, [r3]
000d1f86  ldr     r3, [pc, #0xd8]
000d1f88  add     r3, pc ; -> 0x000f3300  DMG_WEBVIEW_XPOS
000d1f8a  str     r2, [sp, #0x14]
000d1f8c  ldr     r3, [r3]
000d1f8e  ldm     r0, {r0, r1}
000d1f90  add     r2, sp, #8
000d1f92  ldr     r3, [r3]
000d1f94  stm.w   sp, {r0, r1}
000d1f98  mov     r1, ip
000d1f9a  mov     r0, lr
000d1f9c  str     r3, [sp, #8]
000d1f9e  ldm     r2, {r2, r3}
000d1fa0  blx     #0xddbfc ; -> objc_msgSend
000d1fa4  ldr     r1, [pc, #0xbc]
000d1fa6  mov     r2, r5
000d1fa8  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000d1faa  ldr     r1, [r1]
000d1fac  str     r0, [r5, r4]
000d1fae  ldr.w   r3, [r8]
000d1fb2  ldr     r0, [r5, r3]
000d1fb4  blx     #0xddbfc ; -> objc_msgSend
000d1fb8  ldr     r0, [pc, #0xac]
000d1fba  ldr     r1, [pc, #0xb0]
000d1fbc  add     r0, pc ; -> 0x000fdbc4  
000d1fbe  add     r1, pc ; -> 0x000fda30  
000d1fc0  ldr     r0, [r0]
000d1fc2  ldr     r1, [r1]
000d1fc4  blx     #0xddbfc ; -> objc_msgSend
000d1fc8  ldr     r1, [pc, #0xa4]
000d1fca  ldr.w   r3, [r8]
000d1fce  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
000d1fd0  ldr     r1, [r1]
000d1fd2  mov     r2, r0
000d1fd4  ldr     r0, [r5, r3]
000d1fd6  blx     #0xddbfc ; -> objc_msgSend
000d1fda  ldr     r1, [pc, #0x98]
000d1fdc  ldr.w   r0, [r8]
000d1fe0  mov     r2, sl
000d1fe2  add     r1, pc ; -> 0x000fda2c  
000d1fe4  ldr     r6, [r5, r0]
000d1fe6  ldr     r4, [r1]
000d1fe8  ldr     r0, [pc, #0x8c]
000d1fea  ldr     r1, [pc, #0x90]
000d1fec  add     r0, pc ; -> 0x000fdb64  
000d1fee  add     r1, pc ; -> 0x000fca48  '\x1c\x10\x0e'
000d1ff0  ldr     r0, [r0]
000d1ff2  ldr     r1, [r1]
000d1ff4  blx     #0xddbfc ; -> objc_msgSend
000d1ff8  mov     r2, fp
000d1ffa  mov     r1, r4
000d1ffc  mov     r3, r0
000d1ffe  mov     r0, r6
000d2000  blx     #0xddbfc ; -> objc_msgSend
000d2004  ldr     r1, [pc, #0x78]
000d2006  mov     r0, r5
000d2008  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d200a  ldr     r1, [r1]
000d200c  blx     #0xddbfc ; -> objc_msgSend
000d2010  ldr     r1, [pc, #0x70]
000d2012  ldr.w   r3, [r8]
000d2016  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d2018  ldr     r2, [r5, r3]
000d201a  ldr     r1, [r1]
000d201c  blx     #0xddbfc ; -> objc_msgSend
000d2020  ldr     r1, [pc, #0x64]
000d2022  mov     r0, r5
000d2024  add     r1, pc ; -> 0x000fda64  'a \x0f'
000d2026  ldr     r1, [r1]
000d2028  blx     #0xddbfc ; -> objc_msgSend
000d202c  sub.w   sp, r7, #0x18
000d2030  pop.w   {r8, sl, fp}
000d2034  pop     {r4, r5, r6, r7, pc}
000d2036  nop     
000d2038  strh    r0, [r0, #0x1c]
000d203a  movs    r2, r0
000d203c  add     r5, sp, #0x310
000d203e  movs    r2, r0
000d2040  add     r2, sp, #0x110
000d2042  movs    r2, r0
000d2044  pop     {r2, r7}
000d2046  movs    r2, r0
000d2048  add     r2, sp, #0xc8
000d204a  movs    r2, r0
000d204c  strh    r4, [r1, #0x1a]
000d204e  movs    r2, r0
000d2050  asrs    r6, r1, #0xe
000d2052  movs    r2, r0
000d2054  add     r5, sp, #0x1b0
000d2056  movs    r2, r0
000d2058  asrs    r2, r0, #0xe
000d205a  movs    r2, r0
000d205c  asrs    r2, r7, #0xd
000d205e  movs    r2, r0
000d2060  asrs    r4, r6, #0xd
000d2062  movs    r2, r0
000d2064  add     r4, sp, #0x330
000d2066  movs    r2, r0
000d2068  pop     {r2}
000d206a  movs    r2, r0
000d206c  rev16   r6, r5
000d206e  movs    r2, r0
000d2070  add     r4, sp, #0x3d8
000d2072  movs    r2, r0
000d2074  rev16   r6, r0
000d2076  movs    r2, r0
000d2078  cbnz    r4, #0xd20d8
000d207a  movs    r2, r0
000d207c  add     r2, sp, #0x158
000d207e  movs    r2, r0
000d2080  add     r3, sp, #0xa0
000d2082  movs    r2, r0
000d2084  add     r3, sp, #0xa8
000d2086  movs    r2, r0
000d2088  rev     r4, r7
000d208a  movs    r2, r0
