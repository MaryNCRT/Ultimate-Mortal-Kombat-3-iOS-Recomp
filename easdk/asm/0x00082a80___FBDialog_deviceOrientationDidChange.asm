========================================================================
-[FBDialog deviceOrientationDidChange  0x00082a80  256 bytes   FBDialog.m
========================================================================

00082a80  push    {r4, r5, r6, r7, lr}
00082a82  add     r7, sp, #0xc
00082a84  str     r8, [sp, #-0x4]!
00082a88  vpush   {d8}
00082a8c  ldr     r1, [pc, #0xc0]
00082a8e  mov     r4, r0
00082a90  ldr     r0, [pc, #0xc0]
00082a92  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00082a94  add     r0, pc ; -> 0x000fdb80  
00082a96  ldr     r5, [r1]
00082a98  ldr     r6, [r0]
00082a9a  mov     r1, r5
00082a9c  mov     r0, r6
00082a9e  blx     #0xddbfc ; -> objc_msgSend
00082aa2  ldr     r1, [pc, #0xb4]
00082aa4  add     r1, pc ; -> 0x000fcd58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3e0
00082aa6  ldr     r1, [r1]
00082aa8  blx     #0xddbfc ; -> objc_msgSend
00082aac  ldr     r3, [pc, #0xac]
00082aae  add     r3, pc ; -> 0x000f51e0  OBJC_IVAR_$_FBDialog._showingKeyboard
00082ab0  ldr     r2, [r3]
00082ab2  ldrsb.w r8, [r4, r2]
00082ab6  mov     ip, r0
00082ab8  cmp.w   r8, #0
00082abc  beq     #0x82ad0
00082abe  sub.w   sp, r7, #0x18
00082ac2  vpop    {d8}
00082ac6  sub.w   sp, r7, #0x10
00082aca  ldr     r8, [sp], #4
00082ace  pop     {r4, r5, r6, r7, pc}
00082ad0  ldr     r1, [pc, #0x8c]
00082ad2  mov     r0, r4
00082ad4  mov     r2, ip
00082ad6  add     r1, pc ; -> 0x000fcc34  '!)\x0e'
00082ad8  ldr     r1, [r1]
00082ada  blx     #0xddbfc ; -> objc_msgSend
00082ade  tst.w   r0, #0xff
00082ae2  beq     #0x82abe
00082ae4  ldr     r1, [pc, #0x7c]
00082ae6  mov     r0, r4
00082ae8  add     r1, pc ; -> 0x000fcc44  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2cc
00082aea  ldr     r1, [r1]
00082aec  blx     #0xddbfc ; -> objc_msgSend
00082af0  mov     r1, r5
00082af2  mov     r0, r6
00082af4  blx     #0xddbfc ; -> objc_msgSend
00082af8  ldr     r1, [pc, #0x6c]
00082afa  add     r1, pc ; -> 0x000fcc2c  't+\x0e'
00082afc  ldr     r1, [r1]
00082afe  blx     #0xddbfc ; -> objc_msgSend
00082b02  mov     r2, r8
00082b04  mov     r3, r8
00082b06  vmov    d8, r0, r1
00082b0a  ldr     r0, [pc, #0x60]
00082b0c  ldr     r1, [pc, #0x60]
00082b0e  add     r0, pc ; -> 0x000fdbb8  
00082b10  add     r1, pc ; -> 0x000fcd3c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c4
00082b12  ldr     r5, [r0]
00082b14  ldr     r1, [r1]
00082b16  mov     r0, r5
00082b18  blx     #0xddbfc ; -> objc_msgSend
00082b1c  vcvt.f32.f64 s14, d8
00082b20  ldr     r1, [pc, #0x50]
00082b22  mov     r0, r5
00082b24  add     r1, pc ; -> 0x000fcd38  'k.\x0e'
00082b26  ldr     r1, [r1]
00082b28  vcvt.f64.f32 d7, s14
00082b2c  vmov    r2, r3, d7
00082b30  blx     #0xddbfc ; -> objc_msgSend
00082b34  ldr     r1, [pc, #0x40]
00082b36  mov     r0, r4
00082b38  movs    r2, #1
00082b3a  add     r1, pc ; -> 0x000fcc30  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2b8
00082b3c  ldr     r1, [r1]
00082b3e  blx     #0xddbfc ; -> objc_msgSend
00082b42  ldr     r1, [pc, #0x38]
00082b44  mov     r0, r5
00082b46  add     r1, pc ; -> 0x000fcd28  "'.\x0e"
00082b48  ldr     r1, [r1]
00082b4a  blx     #0xddbfc ; -> objc_msgSend
00082b4e  b       #0x82abe
00082b50  adr     r0, #0x1a8
00082b52  movs    r7, r0
00082b54  sub     sp, #0x1a0
00082b56  movs    r7, r0
00082b58  adr     r2, #0x2c0
00082b5a  movs    r7, r0
00082b5c  movs    r7, #0x2e
00082b5e  movs    r7, r0
00082b60  adr     r1, #0x168
00082b62  movs    r7, r0
00082b64  adr     r1, #0x160
00082b66  movs    r7, r0
00082b68  adr     r1, #0xb8
00082b6a  movs    r7, r0
00082b6c  sub     sp, #0x98
00082b6e  movs    r7, r0
00082b70  adr     r2, #0xa0
00082b72  movs    r7, r0
00082b74  adr     r2, #0x40
00082b76  movs    r7, r0
00082b78  adr     r0, #0x3c8
00082b7a  movs    r7, r0
00082b7c  adr     r1, #0x378
00082b7e  movs    r7, r0
