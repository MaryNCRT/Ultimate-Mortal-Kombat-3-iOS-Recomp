========================================================================
-[DMGViewController loadLocalPage]  0x000d0d4c  424 bytes   DMGViewController.mm
========================================================================

000d0d4c  push    {r4, r5, r6, r7, lr}
000d0d4e  add     r7, sp, #0xc
000d0d50  push.w  {r8, sl, fp}
000d0d54  sub     sp, #0xc
000d0d56  ldr     r3, [pc, #0x144]
000d0d58  movs    r2, #1
000d0d5a  ldr     r1, [pc, #0x144]
000d0d5c  add     r3, pc ; -> 0x000fa2b0  OBJC_IVAR_$_DMGViewController.showingLocalData
000d0d5e  mov     r6, r0
000d0d60  ldr     r3, [r3]
000d0d62  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d0d64  ldr     r1, [r1]
000d0d66  strb    r2, [r0, r3]
000d0d68  ldr     r3, [pc, #0x138]
000d0d6a  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0d6c  ldr     r3, [r3]
000d0d6e  ldr     r0, [r0, r3]
000d0d70  blx     #0xddbfc ; -> objc_msgSend
000d0d74  cmp     r0, #1
000d0d76  beq     #0xd0d8e
000d0d78  ldr     r3, [pc, #0x12c]
000d0d7a  vldr    s14, [pc, #0x11c]
000d0d7e  add     r3, pc ; -> 0x000f32fc  DMG_WEBVIEW_HEIGHT
000d0d80  ldr     r3, [r3]
000d0d82  vldr    s12, [r3]
000d0d86  vadd.f32 d7, d6, d7
000d0d8a  vstr    s14, [r3]
000d0d8e  ldr     r3, [pc, #0x11c]
000d0d90  add     r3, pc ; -> 0x000f3304  mCachedHTMLData
000d0d92  ldr.w   sl, [r3]
000d0d96  ldr.w   r0, [sl]
000d0d9a  cbz     r0, #0xd0daa
000d0d9c  ldr     r1, [pc, #0x110]
000d0d9e  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d0da0  ldr     r1, [r1]
000d0da2  blx     #0xddbfc ; -> objc_msgSend
000d0da6  cmp     r0, #0
000d0da8  bne     #0xd0e4c
000d0daa  ldr     r0, [pc, #0x108]
000d0dac  ldr     r1, [pc, #0x108]
000d0dae  add     r0, pc ; -> 0x000fdb60  
000d0db0  add     r1, pc ; -> 0x000fca1c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xa4
000d0db2  ldr     r0, [r0]
000d0db4  ldr     r1, [r1]
000d0db6  str     r0, [sp, #4]
000d0db8  str     r1, [sp, #8]
000d0dba  blx     #0xddbfc ; -> objc_msgSend
000d0dbe  ldr     r1, [pc, #0xfc]
000d0dc0  add     r1, pc ; -> 0x000fcba8  '}\x1f\x0e'
000d0dc2  ldr.w   fp, [r1]
000d0dc6  mov     r1, fp
000d0dc8  blx     #0xddbfc ; -> objc_msgSend
000d0dcc  ldr     r1, [pc, #0xf0]
000d0dce  ldr     r3, [pc, #0xf4]
000d0dd0  ldr     r2, [pc, #0xf4]
000d0dd2  add     r1, pc ; -> 0x000fcba4  ']\x1f\x0e'
000d0dd4  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0dd6  ldr     r4, [r1]
000d0dd8  ldr     r1, [pc, #0xf0]
000d0dda  ldr     r3, [r3]
000d0ddc  add     r2, pc ; -> 0x001827e4  
000d0dde  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d0de0  ldr     r1, [r1]
000d0de2  mov     r5, r0
000d0de4  ldr     r0, [r6, r3]
000d0de6  blx     #0xddbfc ; -> objc_msgSend
000d0dea  mov     r1, r4
000d0dec  mov     r2, r0
000d0dee  mov     r0, r5
000d0df0  blx     #0xddbfc ; -> objc_msgSend
000d0df4  ldr     r1, [pc, #0xd8]
000d0df6  movs    r3, #0
000d0df8  str     r3, [sp]
000d0dfa  add     r1, pc ; -> 0x000fca24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xac
000d0dfc  adds    r3, #4
000d0dfe  ldr     r1, [r1]
000d0e00  mov     sl, r0
000d0e02  ldr     r0, [pc, #0xd0]
000d0e04  mov     r2, sl
000d0e06  add     r0, pc ; -> 0x000fdb5c  
000d0e08  ldr.w   r8, [r0]
000d0e0c  mov     r0, r8
000d0e0e  blx     #0xddbfc ; -> objc_msgSend
000d0e12  ldr     r1, [pc, #0xc4]
000d0e14  add     r1, pc ; -> 0x000fda80  '/ \x0f'
000d0e16  ldr     r4, [r1]
000d0e18  ldr     r1, [sp, #8]
000d0e1a  mov     r5, r0
000d0e1c  ldr     r0, [sp, #4]
000d0e1e  blx     #0xddbfc ; -> objc_msgSend
000d0e22  mov     r1, fp
000d0e24  blx     #0xddbfc ; -> objc_msgSend
000d0e28  mov     r1, r4
000d0e2a  mov     r2, r5
000d0e2c  mov     r3, r0
000d0e2e  mov     r0, r6
000d0e30  blx     #0xddbfc ; -> objc_msgSend
000d0e34  ldr     r1, [pc, #0xa4]
000d0e36  ldr     r2, [pc, #0xa8]
000d0e38  mov     r3, sl
000d0e3a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0e3c  add     r2, pc ; -> 0x001827f4  
000d0e3e  ldr     r1, [r1]
000d0e40  mov     r0, r8
000d0e42  blx     #0xddbfc ; -> objc_msgSend
000d0e46  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0e4a  b       #0xd0e8c
000d0e4c  ldr     r0, [pc, #0x94]
000d0e4e  ldr     r1, [pc, #0x98]
000d0e50  ldr     r4, [pc, #0x98]
000d0e52  add     r0, pc ; -> 0x000fdb5c  
000d0e54  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0e56  ldr.w   r8, [r0]
000d0e5a  ldr     r5, [r1]
000d0e5c  blx     #0xdd41c ; -> NSTemporaryDirectory
000d0e60  add     r4, pc ; -> 0x00182804  
000d0e62  mov     r1, r5
000d0e64  mov     r2, r4
000d0e66  mov     r3, r0
000d0e68  mov     r0, r8
000d0e6a  blx     #0xddbfc ; -> objc_msgSend
000d0e6e  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0e72  ldr     r1, [pc, #0x7c]
000d0e74  ldr.w   r5, [sl]
000d0e78  add     r1, pc ; -> 0x000fda80  '/ \x0f'
000d0e7a  ldr     r4, [r1]
000d0e7c  blx     #0xdd41c ; -> NSTemporaryDirectory
000d0e80  mov     r2, r5
000d0e82  mov     r1, r4
000d0e84  mov     r3, r0
000d0e86  mov     r0, r6
000d0e88  blx     #0xddbfc ; -> objc_msgSend
000d0e8c  sub.w   sp, r7, #0x18
000d0e90  pop.w   {r8, sl, fp}
000d0e94  pop     {r4, r5, r6, r7, pc}
000d0e96  nop     
000d0e98  movs    r0, r0
000d0e9a  rsbs    r0, r1, #0
000d0e9c  str     r5, [sp, #0x140]
000d0e9e  movs    r2, r0
000d0ea0  ldm     r5, {r1, r2, r5}
000d0ea2  movs    r2, r0
000d0ea4  str     r5, [sp, #0xd8]
000d0ea6  movs    r2, r0
000d0ea8  movs    r5, #0x7a
000d0eaa  movs    r2, r0
000d0eac  movs    r5, #0x70
000d0eae  movs    r2, r0
000d0eb0  pop     {r1, r2, r4, r6, r7}
000d0eb2  movs    r2, r0
000d0eb4  ldm     r5, {r1, r2, r3, r5, r7}
000d0eb6  movs    r2, r0
000d0eb8  pop     {r3, r5, r6}
000d0eba  movs    r2, r0
000d0ebc  pop     {r2, r5, r6, r7, pc}
000d0ebe  movs    r2, r0
000d0ec0  pop     {r1, r2, r3, r6, r7, pc}
000d0ec2  movs    r2, r0
000d0ec4  str     r4, [sp, #0x330]
000d0ec6  movs    r2, r0
000d0ec8  subs    r4, r0, r0
000d0eca  movs    r3, r1
000d0ecc  ldm     r4!, {r1, r5, r7}
000d0ece  movs    r2, r0
000d0ed0  pop     {r1, r2, r5}
000d0ed2  movs    r2, r0
000d0ed4  ldm     r5!, {r1, r4, r6}
000d0ed6  movs    r2, r0
000d0ed8  ldm     r4!, {r3, r5, r6}
000d0eda  movs    r2, r0
000d0edc  pop     {r1, r5, r6}
000d0ede  movs    r2, r0
000d0ee0  adds    r4, r6, r6
000d0ee2  movs    r3, r1
000d0ee4  ldm     r5!, {r1, r2}
000d0ee6  movs    r2, r0
000d0ee8  pop     {r3, r6}
000d0eea  movs    r2, r0
000d0eec  adds    r0, r4, r6
000d0eee  movs    r3, r1
000d0ef0  ldm     r4!, {r2}
000d0ef2  movs    r2, r0
