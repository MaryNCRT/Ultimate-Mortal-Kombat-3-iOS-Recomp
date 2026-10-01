========================================================================
-[DMGViewController displayWebView  0x000d1bcc  832 bytes   DMGViewController.mm
========================================================================

000d1bcc  push    {r4, r5, r6, r7, lr}
000d1bce  add     r7, sp, #0xc
000d1bd0  push.w  {r8, sl, fp}
000d1bd4  sub     sp, #0x4c
000d1bd6  ldr     r1, [pc, #0x2a4]
000d1bd8  mov     r5, r0
000d1bda  ldr     r0, [pc, #0x2a4]
000d1bdc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d1bde  mov     r8, r2
000d1be0  ldr.w   sl, [r1]
000d1be4  add     r0, pc ; -> 0x000fdc54  
000d1be6  ldr     r0, [r0]
000d1be8  mov     r1, sl
000d1bea  blx     #0xddbfc ; -> objc_msgSend
000d1bee  ldr     r1, [pc, #0x294]
000d1bf0  mov     r2, r8
000d1bf2  add     r1, pc ; -> 0x000fda28  'w!\x0f'
000d1bf4  ldr     r4, [r1]
000d1bf6  ldr     r1, [pc, #0x290]
000d1bf8  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000d1bfa  ldr     r1, [r1]
000d1bfc  mov     r6, r0
000d1bfe  ldr     r0, [pc, #0x28c]
000d1c00  add     r0, pc ; -> 0x000fdb64  
000d1c02  ldr     r0, [r0]
000d1c04  blx     #0xddbfc ; -> objc_msgSend
000d1c08  mov     r1, r4
000d1c0a  ldr     r4, [pc, #0x284]
000d1c0c  add     r4, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d1c0e  mov     r2, r0
000d1c10  mov     r0, r6
000d1c12  blx     #0xddbfc ; -> objc_msgSend
000d1c16  mov     r8, r0
000d1c18  ldr     r0, [r4]
000d1c1a  ldr     r0, [r5, r0]
000d1c1c  cbz     r0, #0xd1c3c
000d1c1e  ldr     r1, [pc, #0x274]
000d1c20  add     r1, pc ; -> 0x000fccf0  '<-\x0e'
000d1c22  ldr     r1, [r1]
000d1c24  blx     #0xddbfc ; -> objc_msgSend
000d1c28  ldr     r1, [pc, #0x26c]
000d1c2a  ldr     r3, [r4]
000d1c2c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1c2e  ldr     r0, [r5, r3]
000d1c30  ldr     r1, [r1]
000d1c32  blx     #0xddbfc ; -> objc_msgSend
000d1c36  ldr     r3, [r4]
000d1c38  movs    r2, #0
000d1c3a  str     r2, [r5, r3]
000d1c3c  ldr     r0, [pc, #0x25c]
000d1c3e  ldr     r4, [pc, #0x260]
000d1c40  mov     r1, sl
000d1c42  add     r0, pc ; -> 0x000fdbd4  
000d1c44  add     r4, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d1c46  ldr     r0, [r0]
000d1c48  ldr     r6, [r4]
000d1c4a  blx     #0xddbfc ; -> objc_msgSend
000d1c4e  ldr     r3, [pc, #0x254]
000d1c50  ldr     r1, [pc, #0x254]
000d1c52  add     r3, pc ; -> 0x000f32f4  DMG_WEBVIEW_YPOS
000d1c54  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000d1c56  ldr     r3, [r3]
000d1c58  ldr.w   ip, [r1]
000d1c5c  str     r3, [sp, #0x14]
000d1c5e  mov     lr, r0
000d1c60  ldr     r0, [r3]
000d1c62  ldr     r3, [pc, #0x248]
000d1c64  add     r3, pc ; -> 0x000f32f8  DMG_WEBVIEW_WIDTH
000d1c66  str     r0, [sp, #0x40]
000d1c68  ldr     r3, [r3]
000d1c6a  add     r0, sp, #0x44
000d1c6c  str     r3, [sp, #0x10]
000d1c6e  ldr     r1, [r3]
000d1c70  ldr     r3, [pc, #0x23c]
000d1c72  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d1c74  str     r1, [sp, #0x44]
000d1c76  ldr     r3, [r3]
000d1c78  str     r3, [sp, #0xc]
000d1c7a  ldr     r2, [r3]
000d1c7c  ldr     r3, [pc, #0x234]
000d1c7e  add     r3, pc ; -> 0x000f3300  DMG_WEBVIEW_XPOS
000d1c80  str     r2, [sp, #0x48]
000d1c82  ldr     r3, [r3]
000d1c84  add     r2, sp, #0x3c
000d1c86  str     r3, [sp, #8]
000d1c88  ldr.w   sb, [r3]
000d1c8c  ldm     r0, {r0, r1}
000d1c8e  str.w   sb, [sp, #0x3c]
000d1c92  stm.w   sp, {r0, r1}
000d1c96  mov     r1, ip
000d1c98  mov     r0, lr
000d1c9a  ldm     r2, {r2, r3}
000d1c9c  blx     #0xddbfc ; -> objc_msgSend
000d1ca0  ldr     r1, [pc, #0x214]
000d1ca2  mov     r2, r5
000d1ca4  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000d1ca6  ldr     r1, [r1]
000d1ca8  str     r0, [r5, r6]
000d1caa  ldr     r3, [r4]
000d1cac  ldr     r0, [r5, r3]
000d1cae  blx     #0xddbfc ; -> objc_msgSend
000d1cb2  ldr     r0, [pc, #0x208]
000d1cb4  ldr     r1, [pc, #0x208]
000d1cb6  add     r0, pc ; -> 0x000fdbc4  
000d1cb8  add     r1, pc ; -> 0x000fda30  
000d1cba  ldr     r0, [r0]
000d1cbc  ldr     r1, [r1]
000d1cbe  blx     #0xddbfc ; -> objc_msgSend
000d1cc2  ldr     r1, [pc, #0x200]
000d1cc4  ldr     r3, [r4]
000d1cc6  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
000d1cc8  ldr     r1, [r1]
000d1cca  mov     r2, r0
000d1ccc  ldr     r0, [r5, r3]
000d1cce  blx     #0xddbfc ; -> objc_msgSend
000d1cd2  ldr     r1, [pc, #0x1f4]
000d1cd4  ldr     r3, [r4]
000d1cd6  mov     r2, r8
000d1cd8  add     r1, pc ; -> 0x000fcbd0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x258
000d1cda  ldr     r0, [r5, r3]
000d1cdc  ldr     r1, [r1]
000d1cde  blx     #0xddbfc ; -> objc_msgSend
000d1ce2  ldr     r1, [pc, #0x1e8]
000d1ce4  mov     r0, r5
000d1ce6  add     r1, pc ; -> 0x000fcb34  't\x1e\x0e'
000d1ce8  ldr.w   fp, [r1]
000d1cec  mov     r1, fp
000d1cee  blx     #0xddbfc ; -> objc_msgSend
000d1cf2  ldr     r1, [pc, #0x1dc]
000d1cf4  ldr     r3, [r4]
000d1cf6  ldr     r4, [pc, #0x1dc]
000d1cf8  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
000d1cfa  ldr     r1, [r1]
000d1cfc  ldr     r2, [r5, r3]
000d1cfe  add     r4, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1d00  str     r1, [sp, #0x18]
000d1d02  blx     #0xddbfc ; -> objc_msgSend
000d1d06  ldr     r1, [pc, #0x1d0]
000d1d08  mov     r0, r8
000d1d0a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d1d0c  ldr     r6, [r1]
000d1d0e  mov     r1, r6
000d1d10  blx     #0xddbfc ; -> objc_msgSend
000d1d14  ldr     r0, [r4]
000d1d16  ldr     r0, [r5, r0]
000d1d18  cbz     r0, #0xd1d34
000d1d1a  ldr     r1, [pc, #0x1c0]
000d1d1c  add     r1, pc ; -> 0x000fcc50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2d8
000d1d1e  ldr     r1, [r1]
000d1d20  blx     #0xddbfc ; -> objc_msgSend
000d1d24  ldr     r3, [r4]
000d1d26  mov     r1, r6
000d1d28  ldr     r0, [r5, r3]
000d1d2a  blx     #0xddbfc ; -> objc_msgSend
000d1d2e  ldr     r3, [r4]
000d1d30  movs    r2, #0
000d1d32  str     r2, [r5, r3]
000d1d34  ldr     r0, [pc, #0x1a8]
000d1d36  ldr     r4, [pc, #0x1ac]
000d1d38  mov     r1, sl
000d1d3a  add     r0, pc ; -> 0x000fdbd8  
000d1d3c  add     r4, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1d3e  ldr     r0, [r0]
000d1d40  ldr     r6, [r4]
000d1d42  blx     #0xddbfc ; -> objc_msgSend
000d1d46  ldr     r1, [pc, #0x1a0]
000d1d48  movs    r2, #0
000d1d4a  add     r1, pc ; -> 0x000fcc74  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2fc
000d1d4c  ldr     r1, [r1]
000d1d4e  blx     #0xddbfc ; -> objc_msgSend
000d1d52  ldr     r1, [pc, #0x198]
000d1d54  movs    r2, #0x2d
000d1d56  add     r1, pc ; -> 0x000fccc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x348
000d1d58  ldr     r1, [r1]
000d1d5a  str     r0, [r5, r6]
000d1d5c  ldr     r3, [r4]
000d1d5e  ldr     r0, [r5, r3]
000d1d60  blx     #0xddbfc ; -> objc_msgSend
000d1d64  ldr     r3, [pc, #0x188]
000d1d66  add     r3, pc ; -> 0x000fa2b8  OBJC_IVAR_$_DMGViewController.landscapeMode
000d1d68  ldr     r3, [r3]
000d1d6a  ldrsb   r3, [r5, r3]
000d1d6c  cbz     r3, #0xd1dd0
000d1d6e  vmov.f32 s6, #5.000000e-01
000d1d72  ldr     r0, [r4]
000d1d74  ldr     r1, [pc, #0x17c]
000d1d76  vldr    s10, [pc, #0x100]
000d1d7a  ldr     r3, [sp, #0x10]
000d1d7c  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000d1d7e  ldr.w   lr, [r5, r0]
000d1d82  add     r0, sp, #0x34
000d1d84  vldr    s14, [r3]
000d1d88  vsub.f32 d7, d7, d5
000d1d8c  vmul.f32 d6, d7, d3
000d1d90  ldr.w   ip, [r1]
000d1d94  vstr    s10, [sp, #0x34]
000d1d98  vstr    s10, [sp, #0x38]
000d1d9c  ldm     r0, {r0, r1}
000d1d9e  ldr     r3, [sp, #0x14]
000d1da0  vldr    s14, [r3]
000d1da4  ldr     r3, [sp, #0xc]
000d1da6  vadd.f32 d4, d6, d7
000d1daa  vldr    s14, [r3]
000d1dae  ldr     r3, [sp, #8]
000d1db0  vsub.f32 d7, d7, d5
000d1db4  vmul.f32 d6, d7, d3
000d1db8  add     r2, sp, #0x2c
000d1dba  vldr    s14, [r3]
000d1dbe  vadd.f32 d7, d6, d7
000d1dc2  vstr    s8, [sp, #0x30]
000d1dc6  vstr    s14, [sp, #0x2c]
000d1dca  stm.w   sp, {r0, r1}
000d1dce  b       #0xd1e34
000d1dd0  ldr     r3, [pc, #0x124]
000d1dd2  vmov.f32 s6, #5.000000e-01
000d1dd6  ldr     r1, [pc, #0x124]
000d1dd8  add     r3, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1dda  vldr    s10, [pc, #0x9c]
000d1dde  ldr     r0, [r3]
000d1de0  add     r1, pc ; -> 0x000fcd50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3d8
000d1de2  ldr     r3, [sp, #0xc]
000d1de4  ldr.w   ip, [r1]
000d1de8  ldr.w   lr, [r5, r0]
000d1dec  add     r0, sp, #0x24
000d1dee  vldr    s14, [r3]
000d1df2  vstr    s10, [sp, #0x24]
000d1df6  vsub.f32 d7, d7, d5
000d1dfa  vstr    s10, [sp, #0x28]
000d1dfe  ldm     r0, {r0, r1}
000d1e00  vmul.f32 d6, d7, d3
000d1e04  ldr     r3, [sp, #0x14]
000d1e06  add     r2, sp, #0x1c
000d1e08  vldr    s14, [r3]
000d1e0c  ldr     r3, [sp, #0x10]
000d1e0e  vadd.f32 d4, d6, d7
000d1e12  vldr    s14, [r3]
000d1e16  vsub.f32 d7, d7, d5
000d1e1a  vmul.f32 d6, d7, d3
000d1e1e  ldr     r3, [sp, #8]
000d1e20  vstr    s8, [sp, #0x20]
000d1e24  vldr    s14, [r3]
000d1e28  stm.w   sp, {r0, r1}
000d1e2c  vadd.f32 d7, d6, d7
000d1e30  vstr    s14, [sp, #0x1c]
000d1e34  ldr     r4, [pc, #0xc8]
000d1e36  mov     r0, lr
000d1e38  mov     r1, ip
000d1e3a  ldm     r2, {r2, r3}
000d1e3c  add     r4, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d1e3e  blx     #0xddbfc ; -> objc_msgSend
000d1e42  mov     r1, fp
000d1e44  mov     r0, r5
000d1e46  blx     #0xddbfc ; -> objc_msgSend
000d1e4a  ldr     r3, [r4]
000d1e4c  ldr     r1, [sp, #0x18]
000d1e4e  ldr     r2, [r5, r3]
000d1e50  blx     #0xddbfc ; -> objc_msgSend
000d1e54  ldr     r1, [pc, #0xac]
000d1e56  ldr     r3, [r4]
000d1e58  add     r1, pc ; -> 0x000fcc1c  'b+\x0e'
000d1e5a  ldr     r0, [r5, r3]
000d1e5c  ldr     r1, [r1]
000d1e5e  blx     #0xddbfc ; -> objc_msgSend
000d1e62  ldr     r1, [pc, #0xa4]
000d1e64  mov     r0, r5
000d1e66  add     r1, pc ; -> 0x000fda64  'a \x0f'
000d1e68  ldr     r1, [r1]
000d1e6a  blx     #0xddbfc ; -> objc_msgSend
000d1e6e  sub.w   sp, r7, #0x18
000d1e72  pop.w   {r8, sl, fp}
000d1e76  pop     {r4, r5, r6, r7, pc}
000d1e78  movs    r0, r0
000d1e7a  rsbs    r0, r6, #0
000d1e7c  add     r5, sp, #0x290
000d1e7e  movs    r2, r0
000d1e80  stm     r0!, {r2, r3, r5, r6}
000d1e82  movs    r2, r0
000d1e84  bkpt    #0x32
000d1e86  movs    r2, r0
000d1e88  add     r7, sp, #0x2d0
000d1e8a  movs    r2, r0
000d1e8c  hint    #6
000d1e8e  movs    r2, r0
000d1e90  strh    r0, [r2, #0x34]
000d1e92  movs    r2, r0
000d1e94  sub     sp, #0x130
000d1e96  movs    r2, r0
000d1e98  add     r5, sp, #0x130
000d1e9a  movs    r2, r0
000d1e9c  itee    hi
000d1e9e  movs    r2, r0
000d1ea0  strhls  r0, [r3, #0x32]
000d1ea2  movs    r2, r0
000d1ea4  asrs    r6, r3, #0x1a
000d1ea6  movs    r2, r0
000d1ea8  add     sp, #0x1f0
000d1eaa  movs    r2, r0
000d1eac  asrs    r0, r2, #0x1a
000d1eae  movs    r2, r0
000d1eb0  asrs    r6, r0, #0x1a
000d1eb2  movs    r2, r0
000d1eb4  asrs    r6, r7, #0x19
000d1eb6  movs    r2, r0
000d1eb8  add     r7, sp, #0x340
000d1eba  movs    r2, r0
000d1ebc  itet    eq
000d1ebe  movs    r2, r0
000d1ec0  popne   {r2, r4, r5, r6, pc}
000d1ec2  movs    r2, r0
000d1ec4  add     r7, sp, #0x3f8
000d1ec6  movs    r2, r0
000d1ec8  add     r6, sp, #0x3d0
000d1eca  movs    r2, r0
000d1ecc  add     r6, sp, #0x128
000d1ece  movs    r2, r0
000d1ed0  add     r6, sp, #0x120
000d1ed2  movs    r2, r0
000d1ed4  strh    r6, [r0, #0x2e]
000d1ed6  movs    r2, r0
000d1ed8  add     r4, sp, #0x1b8
000d1eda  movs    r2, r0
000d1edc  add     r7, sp, #0xc0
000d1ede  movs    r2, r0
000d1ee0  bkpt    #0x9a
000d1ee2  movs    r2, r0
000d1ee4  strh    r0, [r1, #0x2c]
000d1ee6  movs    r2, r0
000d1ee8  add     r7, sp, #0x98
000d1eea  movs    r2, r0
000d1eec  add     r7, sp, #0x198
000d1eee  movs    r2, r0
000d1ef0  strh    r6, [r1, #0x2a]
000d1ef2  movs    r2, r0
000d1ef4  add     r7, sp, #0x340
000d1ef6  movs    r2, r0
000d1ef8  strh    r4, [r5, #0x26]
000d1efa  movs    r2, r0
000d1efc  add     r7, sp, #0x1b0
000d1efe  movs    r2, r0
000d1f00  strh    r0, [r1, #0x24]
000d1f02  movs    r2, r0
000d1f04  add     r5, sp, #0x300
000d1f06  movs    r2, r0
000d1f08  cbnz    r2, #0xd1f8a
000d1f0a  movs    r2, r0
