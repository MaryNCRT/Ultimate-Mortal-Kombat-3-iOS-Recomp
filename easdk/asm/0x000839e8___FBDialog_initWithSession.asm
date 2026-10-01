========================================================================
-[FBDialog initWithSession  0x000839e8  1212 bytes   FBDialog.m
========================================================================

000839e8  push    {r4, r5, r6, r7, lr}
000839ea  add     r7, sp, #0xc
000839ec  push.w  {r8, sl, fp}
000839f0  sub     sp, #0x40
000839f2  mov     r6, r2
000839f4  ldr     r2, [pc, #0x3b8]
000839f6  ldr     r1, [pc, #0x3bc]
000839f8  ldr     r3, [pc, #0x3bc]
000839fa  add     r2, pc ; -> 0x000f3390  0x0
000839fc  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
000839fe  ldr     r2, [r2]
00083a00  ldr     r1, [r1]
00083a02  str     r0, [sp, #0x38]
00083a04  add     r3, pc ; -> 0x000fdd38  
00083a06  add.w   r0, r2, #8
00083a0a  ldr     r3, [r3]
00083a0c  str     r1, [sp, #8]
00083a0e  ldm     r0, {r0, r1}
00083a10  str     r3, [sp, #0x3c]
00083a12  ldm     r2, {r2, r3}
00083a14  stm.w   sp, {r0, r1}
00083a18  add     r0, sp, #0x38
00083a1a  ldr     r1, [sp, #8]
00083a1c  blx     #0xddc08 ; -> objc_msgSendSuper2
00083a20  mov     r4, r0
00083a22  cmp     r0, #0
00083a24  beq.w   #0x83d6c
00083a28  ldr     r3, [pc, #0x390]
00083a2a  ldr.w   r1, [pc, #0x394]
00083a2e  mov.w   sl, #0
00083a32  add     r3, pc ; -> 0x000f51bc  OBJC_IVAR_$_FBDialog._delegate
00083a34  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
00083a36  ldr     r3, [r3]
00083a38  ldr     r1, [r1]
00083a3a  str.w   sl, [r0, r3]
00083a3e  ldr     r3, [pc, #0x384]
00083a40  mov     r0, r6
00083a42  str     r1, [sp, #0xc]
00083a44  add     r3, pc ; -> 0x000f51c0  OBJC_IVAR_$_FBDialog._session
00083a46  ldr     r5, [r3]
00083a48  blx     #0xddbfc ; -> objc_msgSend
00083a4c  ldr     r3, [pc, #0x378]
00083a4e  ldr     r1, [pc, #0x37c]
00083a50  add     r3, pc ; -> 0x000f51c4  OBJC_IVAR_$_FBDialog._loadingURL
00083a52  add     r1, pc ; -> 0x000fcccc  '%-\x0e'
00083a54  ldr     r1, [r1]
00083a56  str     r0, [r4, r5]
00083a58  ldr     r3, [r3]
00083a5a  ldr     r0, [pc, #0x374]
00083a5c  str.w   sl, [r4, r3]
00083a60  ldr     r3, [pc, #0x370]
00083a62  add     r0, pc ; -> 0x000fdbc4  
00083a64  add     r3, pc ; -> 0x000f51dc  OBJC_IVAR_$_FBDialog._orientation
00083a66  ldr     r0, [r0]
00083a68  ldr     r3, [r3]
00083a6a  str.w   sl, [r4, r3]
00083a6e  ldr     r3, [pc, #0x368]
00083a70  add     r3, pc ; -> 0x000f51e0  OBJC_IVAR_$_FBDialog._showingKeyboard
00083a72  ldr     r3, [r3]
00083a74  strb.w  sl, [r4, r3]
00083a78  str     r1, [sp, #0x14]
00083a7a  str     r0, [sp, #0x10]
00083a7c  blx     #0xddbfc ; -> objc_msgSend
00083a80  ldr     r1, [pc, #0x358]
00083a82  add     r1, pc ; -> 0x000fccc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x350
00083a84  ldr     r1, [r1]
00083a86  str     r1, [sp, #0x18]
00083a88  mov     r2, r0
00083a8a  mov     r0, r4
00083a8c  blx     #0xddbfc ; -> objc_msgSend
00083a90  ldr     r1, [pc, #0x34c]
00083a92  movs    r2, #1
00083a94  mov     r0, r4
00083a96  add     r1, pc ; -> 0x000fccc4  '\r-\x0e'
00083a98  ldr     r1, [r1]
00083a9a  blx     #0xddbfc ; -> objc_msgSend
00083a9e  ldr     r1, [pc, #0x344]
00083aa0  movs    r2, #0x12
00083aa2  mov     r0, r4
00083aa4  add     r1, pc ; -> 0x000fccc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x348
00083aa6  ldr     r1, [r1]
00083aa8  str     r1, [sp, #0x1c]
00083aaa  blx     #0xddbfc ; -> objc_msgSend
00083aae  ldr     r1, [pc, #0x338]
00083ab0  movs    r2, #3
00083ab2  mov     r0, r4
00083ab4  add     r1, pc ; -> 0x000fccbc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x344
00083ab6  ldr     r1, [r1]
00083ab8  blx     #0xddbfc ; -> objc_msgSend
00083abc  ldr     r0, [pc, #0x32c]
00083abe  ldr     r1, [pc, #0x330]
00083ac0  ldr     r2, [pc, #0x330]
00083ac2  add     r0, pc ; -> 0x000fdba8  
00083ac4  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00083ac6  ldr     r6, [r0]
00083ac8  ldr     r5, [r1]
00083aca  add     r2, pc ; -> 0x0017e8c4  
00083acc  mov     r0, r6
00083ace  mov     r1, r5
00083ad0  blx     #0xddbfc ; -> objc_msgSend
00083ad4  ldr     r2, [pc, #0x320]
00083ad6  mov     r1, r5
00083ad8  ldr     r5, [pc, #0x320]
00083ada  add     r2, pc ; -> 0x0017e8d4  
00083adc  add     r5, pc ; -> 0x000f51d0  OBJC_IVAR_$_FBDialog._iconView
00083ade  mov     r8, r0
00083ae0  mov     r0, r6
00083ae2  blx     #0xddbfc ; -> objc_msgSend
00083ae6  ldr     r1, [pc, #0x318]
00083ae8  ldr     r6, [r5]
00083aea  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00083aec  ldr     r1, [r1]
00083aee  str     r1, [sp, #0x20]
00083af0  str     r0, [sp, #0x2c]
00083af2  ldr     r0, [pc, #0x310]
00083af4  add     r0, pc ; -> 0x000fdbc8  
00083af6  ldr     r0, [r0]
00083af8  blx     #0xddbfc ; -> objc_msgSend
00083afc  ldr     r1, [pc, #0x308]
00083afe  mov     r2, r8
00083b00  ldr.w   r8, [pc, #0x308]
00083b04  add     r1, pc ; -> 0x000fccb4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x33c
00083b06  ldr     r1, [r1]
00083b08  blx     #0xddbfc ; -> objc_msgSend
00083b0c  ldr     r1, [pc, #0x300]
00083b0e  add     r8, pc ; -> 0x000f51d8  OBJC_IVAR_$_FBDialog._closeButton
00083b10  add     r1, pc ; -> 0x000fcb44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1cc
00083b12  ldr     r1, [r1]
00083b14  str     r0, [r4, r6]
00083b16  ldr     r3, [r5]
00083b18  str     r1, [sp, #0x24]
00083b1a  mov     r0, r4
00083b1c  ldr     r2, [r4, r3]
00083b1e  blx     #0xddbfc ; -> objc_msgSend
00083b22  ldr     r1, [pc, #0x2f0]
00083b24  ldr     r3, [pc, #0x2f0]
00083b26  ldr     r2, [pc, #0x2f4]
00083b28  add     r1, pc ; -> 0x000fccb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x338
00083b2a  ldr     r0, [sp, #0x10]
00083b2c  ldr     r1, [r1]
00083b2e  str     r3, [sp]
00083b30  mov.w   r3, #0x3f800000
00083b34  str     r3, [sp, #4]
00083b36  ldr     r3, [pc, #0x2e8]
00083b38  blx     #0xddbfc ; -> objc_msgSend
00083b3c  ldr     r1, [pc, #0x2e4]
00083b3e  mov     r2, sl
00083b40  ldr.w   r5, [r8]
00083b44  add     r1, pc ; -> 0x000fccac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x334
00083b46  ldr     r1, [r1]
00083b48  mov     fp, r0
00083b4a  ldr     r0, [pc, #0x2dc]
00083b4c  add     r0, pc ; -> 0x000fdbcc  
00083b4e  ldr     r0, [r0]
00083b50  blx     #0xddbfc ; -> objc_msgSend
00083b54  ldr     r1, [sp, #0xc]
00083b56  blx     #0xddbfc ; -> objc_msgSend
00083b5a  ldr     r1, [pc, #0x2d0]
00083b5c  add     r1, pc ; -> 0x000fcca8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x330
00083b5e  ldr     r1, [r1]
00083b60  str     r0, [r4, r5]
00083b62  ldr.w   r3, [r8]
00083b66  ldr     r2, [sp, #0x2c]
00083b68  ldr     r0, [r4, r3]
00083b6a  mov     r3, sl
00083b6c  blx     #0xddbfc ; -> objc_msgSend
00083b70  ldr     r1, [pc, #0x2bc]
00083b72  ldr.w   r3, [r8]
00083b76  mov     r2, fp
00083b78  add     r1, pc ; -> 0x000fcca4  'q,\x0e'
00083b7a  ldr     r6, [r1]
00083b7c  ldr     r0, [r4, r3]
00083b7e  mov     r3, sl
00083b80  mov     r1, r6
00083b82  blx     #0xddbfc ; -> objc_msgSend
00083b86  ldr     r1, [pc, #0x2ac]
00083b88  ldr.w   r0, [r8]
00083b8c  add     r1, pc ; -> 0x000fcca0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x328
00083b8e  ldr     r1, [r1]
00083b90  ldr     r5, [r4, r0]
00083b92  ldr     r0, [sp, #0x10]
00083b94  str     r1, [sp, #0x28]
00083b96  blx     #0xddbfc ; -> objc_msgSend
00083b9a  movs    r3, #1
00083b9c  mov     r1, r6
00083b9e  mov     r2, r0
00083ba0  mov     r0, r5
00083ba2  blx     #0xddbfc ; -> objc_msgSend
00083ba6  ldr.w   r3, [r8]
00083baa  ldr     r1, [pc, #0x28c]
00083bac  movs    r2, #0x40
00083bae  ldr     r0, [r4, r3]
00083bb0  ldr     r3, [pc, #0x288]
00083bb2  add     r1, pc ; -> 0x000fcc98  'j2\x0e'
00083bb4  str     r2, [sp]
00083bb6  add     r3, pc ; -> 0x000fcc9c  'p$\x0e'
00083bb8  ldr     r1, [r1]
00083bba  ldr     r3, [r3]
00083bbc  mov     r2, r4
00083bbe  blx     #0xddbfc ; -> objc_msgSend
00083bc2  ldr     r1, [pc, #0x27c]
00083bc4  ldr.w   r3, [r8]
00083bc8  add     r1, pc ; -> 0x000fcc94  'd,\x0e'
00083bca  ldr     r5, [r1]
00083bcc  ldr     r1, [pc, #0x274]
00083bce  ldr     r0, [r4, r3]
00083bd0  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00083bd2  mov     r2, r5
00083bd4  ldr     r1, [r1]
00083bd6  blx     #0xddbfc ; -> objc_msgSend
00083bda  tst.w   r0, #0xff
00083bde  bne.w   #0x83d78
00083be2  ldr     r0, [pc, #0x264]
00083be4  ldr.w   r1, [pc, #0x264]
00083be8  ldr     r2, [pc, #0x264]
00083bea  add     r0, pc ; -> 0x000fdba0  
00083bec  add     r1, pc ; -> 0x000fcc8c  'N,\x0e'
00083bee  ldr     r0, [r0]
00083bf0  ldr     r1, [r1]
00083bf2  str     r0, [sp, #0x30]
00083bf4  str     r1, [sp, #0x34]
00083bf6  blx     #0xddbfc ; -> objc_msgSend
00083bfa  ldr     r3, [pc, #0x258]
00083bfc  ldr     r1, [pc, #0x258]
00083bfe  add     r3, pc ; -> 0x000f51d8  OBJC_IVAR_$_FBDialog._closeButton
00083c00  add     r1, pc ; -> 0x000fcc88  'E,\x0e'
00083c02  ldr     r3, [r3]
00083c04  ldr.w   fp, [r1]
00083c08  mov     r1, fp
00083c0a  mov     r2, r0
00083c0c  ldr     r0, [r4, r3]
00083c0e  blx     #0xddbfc ; -> objc_msgSend
00083c12  ldr     r5, [pc, #0x248]
00083c14  ldr     r1, [pc, #0x248]
00083c16  movs    r2, #1
00083c18  add     r5, pc ; -> 0x000f51d8  OBJC_IVAR_$_FBDialog._closeButton
00083c1a  add     r1, pc ; -> 0x000fcc84  "',\x0e"
00083c1c  ldr     r3, [r5]
00083c1e  ldr     r1, [r1]
00083c20  ldr     r0, [r4, r3]
00083c22  blx     #0xddbfc ; -> objc_msgSend
00083c26  ldr     r3, [r5]
00083c28  ldr     r1, [sp, #0x1c]
00083c2a  movs    r2, #0x21
00083c2c  ldr     r0, [r4, r3]
00083c2e  blx     #0xddbfc ; -> objc_msgSend
00083c32  ldr     r3, [r5]
00083c34  mov     r0, r4
00083c36  ldr     r1, [sp, #0x24]
00083c38  ldr     r5, [pc, #0x228]
00083c3a  ldr     r2, [r4, r3]
00083c3c  blx     #0xddbfc ; -> objc_msgSend
00083c40  ldr     r0, [pc, #0x224]
00083c42  add     r5, pc ; -> 0x000f51d4  OBJC_IVAR_$_FBDialog._titleLabel
00083c44  ldr     r1, [sp, #0x20]
00083c46  add     r0, pc ; -> 0x000fdbd0  
00083c48  ldr     r6, [r5]
00083c4a  ldr     r0, [r0]
00083c4c  blx     #0xddbfc ; -> objc_msgSend
00083c50  ldr     r2, [pc, #0x218]
00083c52  add     r2, pc ; -> 0x000f3390  0x0
00083c54  ldr.w   r8, [r2]
00083c58  add.w   sl, r8, #8
00083c5c  ldm.w   r8, {r2, r3}
00083c60  mov     ip, r0
00083c62  ldm.w   sl, {r0, r1}
00083c66  stm.w   sp, {r0, r1}
00083c6a  mov     r0, ip
00083c6c  ldr     r1, [sp, #8]
00083c6e  blx     #0xddbfc ; -> objc_msgSend
00083c72  ldr     r1, [pc, #0x1fc]
00083c74  ldr     r2, [pc, #0x1fc]
00083c76  add     r1, pc ; -> 0x000fcc80  '\x1e,\x0e'
00083c78  add     r2, pc ; -> 0x0017d9e4  kDefaultTitle
00083c7a  ldr     r1, [r1]
00083c7c  ldr     r2, [r2]
00083c7e  str     r0, [r4, r6]
00083c80  ldr     r3, [r5]
00083c82  ldr     r0, [r4, r3]
00083c84  blx     #0xddbfc ; -> objc_msgSend
00083c88  ldr     r1, [sp, #0x14]
00083c8a  ldr     r0, [sp, #0x10]
00083c8c  blx     #0xddbfc ; -> objc_msgSend
00083c90  ldr     r3, [r5]
00083c92  ldr     r1, [sp, #0x18]
00083c94  mov     r2, r0
00083c96  ldr     r0, [r4, r3]
00083c98  blx     #0xddbfc ; -> objc_msgSend
00083c9c  ldr     r1, [sp, #0x28]
00083c9e  ldr     r0, [sp, #0x10]
00083ca0  blx     #0xddbfc ; -> objc_msgSend
00083ca4  ldr     r1, [pc, #0x1d0]
00083ca6  ldr     r3, [r5]
00083ca8  add     r1, pc ; -> 0x000fcc7c  '\x10,\x0e'
00083caa  ldr     r1, [r1]
00083cac  mov     r2, r0
00083cae  ldr     r0, [r4, r3]
00083cb0  blx     #0xddbfc ; -> objc_msgSend
00083cb4  ldr     r1, [sp, #0x34]
00083cb6  ldr     r2, [pc, #0x1c4]
00083cb8  ldr     r0, [sp, #0x30]
00083cba  blx     #0xddbfc ; -> objc_msgSend
00083cbe  ldr     r3, [r5]
00083cc0  mov     r1, fp
00083cc2  mov     r2, r0
00083cc4  ldr     r0, [r4, r3]
00083cc6  blx     #0xddbfc ; -> objc_msgSend
00083cca  ldr     r3, [r5]
00083ccc  ldr     r1, [sp, #0x1c]
00083cce  movs    r2, #0x24
00083cd0  ldr     r0, [r4, r3]
00083cd2  blx     #0xddbfc ; -> objc_msgSend
00083cd6  ldr     r3, [r5]
00083cd8  mov     r0, r4
00083cda  ldr     r1, [sp, #0x24]
00083cdc  ldr     r5, [pc, #0x1a0]
00083cde  ldr     r2, [r4, r3]
00083ce0  blx     #0xddbfc ; -> objc_msgSend
00083ce4  ldr     r0, [pc, #0x19c]
00083ce6  add     r5, pc ; -> 0x000f51c8  OBJC_IVAR_$_FBDialog._webView
00083ce8  ldr     r1, [sp, #0x20]
00083cea  add     r0, pc ; -> 0x000fdbd4  
00083cec  ldr     r6, [r5]
00083cee  ldr     r0, [r0]
00083cf0  blx     #0xddbfc ; -> objc_msgSend
00083cf4  ldm.w   r8, {r2, r3}
00083cf8  mov     ip, r0
00083cfa  ldm.w   sl, {r0, r1}
00083cfe  stm.w   sp, {r0, r1}
00083d02  mov     r0, ip
00083d04  ldr     r1, [sp, #8]
00083d06  blx     #0xddbfc ; -> objc_msgSend
00083d0a  ldr     r1, [pc, #0x17c]
00083d0c  mov     r2, r4
00083d0e  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
00083d10  ldr     r1, [r1]
00083d12  str     r0, [r4, r6]
00083d14  ldr     r3, [r5]
00083d16  ldr     r0, [r4, r3]
00083d18  blx     #0xddbfc ; -> objc_msgSend
00083d1c  ldr     r3, [r5]
00083d1e  ldr     r1, [sp, #0x1c]
00083d20  movs    r2, #0x12
00083d22  ldr     r0, [r4, r3]
00083d24  blx     #0xddbfc ; -> objc_msgSend
00083d28  ldr     r3, [r5]
00083d2a  mov     r0, r4
00083d2c  ldr     r1, [sp, #0x24]
00083d2e  ldr     r5, [pc, #0x15c]
00083d30  ldr     r2, [r4, r3]
00083d32  blx     #0xddbfc ; -> objc_msgSend
00083d36  ldr     r0, [pc, #0x158]
00083d38  add     r5, pc ; -> 0x000f51cc  OBJC_IVAR_$_FBDialog._spinner
00083d3a  ldr     r1, [sp, #0x20]
00083d3c  add     r0, pc ; -> 0x000fdbd8  
00083d3e  ldr     r6, [r5]
00083d40  ldr     r0, [r0]
00083d42  blx     #0xddbfc ; -> objc_msgSend
00083d46  ldr     r1, [pc, #0x14c]
00083d48  movs    r2, #0
00083d4a  add     r1, pc ; -> 0x000fcc74  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2fc
00083d4c  ldr     r1, [r1]
00083d4e  blx     #0xddbfc ; -> objc_msgSend
00083d52  movs    r2, #0x2d
00083d54  str     r0, [r4, r6]
00083d56  ldr     r3, [r5]
00083d58  ldr     r1, [sp, #0x1c]
00083d5a  ldr     r0, [r4, r3]
00083d5c  blx     #0xddbfc ; -> objc_msgSend
00083d60  ldr     r3, [r5]
00083d62  mov     r0, r4
00083d64  ldr     r1, [sp, #0x24]
00083d66  ldr     r2, [r4, r3]
00083d68  blx     #0xddbfc ; -> objc_msgSend
00083d6c  mov     r0, r4
00083d6e  sub.w   sp, r7, #0x18
00083d72  pop.w   {r8, sl, fp}
00083d76  pop     {r4, r5, r6, r7, pc}
00083d78  ldr     r0, [pc, #0x11c]
00083d7a  ldr     r1, [pc, #0x120]
00083d7c  ldr     r2, [pc, #0xd0]
00083d7e  add     r0, pc ; -> 0x000fdba0  
00083d80  add     r1, pc ; -> 0x000fcc8c  'N,\x0e'
00083d82  ldr     r0, [r0]
00083d84  ldr     r1, [r1]
00083d86  str     r0, [sp, #0x30]
00083d88  str     r1, [sp, #0x34]
00083d8a  blx     #0xddbfc ; -> objc_msgSend
00083d8e  ldr.w   r3, [r8]
00083d92  mov     r1, r5
00083d94  mov     r6, r0
00083d96  ldr     r0, [r4, r3]
00083d98  blx     #0xddbfc ; -> objc_msgSend
00083d9c  ldr     r1, [pc, #0x100]
00083d9e  mov     r2, r6
00083da0  add     r1, pc ; -> 0x000fcc88  'E,\x0e'
00083da2  ldr.w   fp, [r1]
00083da6  mov     r1, fp
00083da8  blx     #0xddbfc ; -> objc_msgSend
00083dac  b       #0x83c12
00083dae  nop     
00083db0  ldrsb.w r0, [r2, #6]
00083db4  str     r2, [sp, #0x350]
00083db6  movs    r7, r0
00083db8  adr     r3, #0xc0
00083dba  movs    r7, r0
00083dbc  asrs    r6, r0, #0x1e
00083dbe  movs    r7, r0
00083dc0  str     r2, [sp, #0x260]
00083dc2  movs    r7, r0
00083dc4  asrs    r0, r7, #0x1d
00083dc6  movs    r7, r0
00083dc8  asrs    r0, r6, #0x1d
00083dca  movs    r7, r0
00083dcc  str     r2, [sp, #0x1d8]
00083dce  movs    r7, r0
00083dd0  adr     r1, #0x178
00083dd2  movs    r7, r0
00083dd4  asrs    r4, r6, #0x1d
00083dd6  movs    r7, r0
00083dd8  asrs    r4, r5, #0x1d
00083dda  movs    r7, r0
00083ddc  str     r2, [sp, #0x108]
00083dde  movs    r7, r0
00083de0  str     r2, [sp, #0xa8]
00083de2  movs    r7, r0
00083de4  str     r2, [sp, #0x60]
00083de6  movs    r7, r0
00083de8  str     r2, [sp, #0x10]
00083dea  movs    r7, r0
00083dec  adr     r0, #0x388
00083dee  movs    r7, r0
00083df0  str     r1, [sp, #0x3c0]
00083df2  movs    r7, r0
00083df4  add     r5, sp, #0x3d8
00083df6  movs    r7, r1
00083df8  add     r5, sp, #0x3d8
00083dfa  movs    r7, r1
00083dfc  asrs    r0, r6, #0x1b
00083dfe  movs    r7, r0
00083e00  ldrh    r6, [r2, #0x34]
00083e02  movs    r7, r0
00083e04  adr     r0, #0x340
00083e06  movs    r7, r0
00083e08  str     r1, [sp, #0x2b0]
00083e0a  movs    r7, r0
00083e0c  asrs    r6, r0, #0x1b
00083e0e  movs    r7, r0
00083e10  str     r0, [sp, #0xc0]
00083e12  movs    r7, r0
00083e14  str     r1, [sp, #0x210]
00083e16  movs    r7, r0
00083e18  bhi     #0x83dce
00083e1a  subs    r7, #0x58
00083e1c  adr     r7, #0x2a0
00083e1e  subs    r7, #0x27
