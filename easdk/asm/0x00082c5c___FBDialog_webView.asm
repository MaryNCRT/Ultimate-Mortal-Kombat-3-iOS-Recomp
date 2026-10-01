========================================================================
-[FBDialog webView  0x00082c5c  328 bytes   FBDialog.m
========================================================================

00082c5c  push    {r4, r5, r6, r7, lr}
00082c5e  add     r7, sp, #0xc
00082c60  push.w  {r8, sl, fp}
00082c64  ldr     r1, [pc, #0xfc]
00082c66  mov     r6, r0
00082c68  mov     r0, r3
00082c6a  add     r1, pc ; -> 0x000fcc5c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e4
00082c6c  mov     fp, r3
00082c6e  ldr.w   r8, [r1]
00082c72  mov     r1, r8
00082c74  blx     #0xddbfc ; -> objc_msgSend
00082c78  ldr     r1, [pc, #0xec]
00082c7a  add     r1, pc ; -> 0x000fcc58  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e0
00082c7c  ldr     r1, [r1]
00082c7e  mov     r5, r0
00082c80  blx     #0xddbfc ; -> objc_msgSend
00082c84  ldr     r1, [pc, #0xe4]
00082c86  ldr     r2, [pc, #0xe8]
00082c88  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00082c8a  add     r2, pc ; -> 0x0017e7f4  
00082c8c  ldr     r4, [r1]
00082c8e  mov     r1, r4
00082c90  blx     #0xddbfc ; -> objc_msgSend
00082c94  tst.w   r0, #0xff
00082c98  beq     #0x82cca
00082c9a  ldr     r1, [pc, #0xd8]
00082c9c  mov     r0, r5
00082c9e  add     r1, pc ; -> 0x000fcc54  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2dc
00082ca0  ldr     r1, [r1]
00082ca2  blx     #0xddbfc ; -> objc_msgSend
00082ca6  ldr     r2, [pc, #0xd0]
00082ca8  mov     r1, r4
00082caa  add     r2, pc ; -> 0x0017e804  
00082cac  blx     #0xddbfc ; -> objc_msgSend
00082cb0  uxtb    r4, r0
00082cb2  cbnz    r4, #0x82cec
00082cb4  ldr     r1, [pc, #0xc4]
00082cb6  mov     r0, r6
00082cb8  mov     r2, r5
00082cba  add     r1, pc ; -> 0x000fcc68  'L6\x0e'
00082cbc  ldr     r1, [r1]
00082cbe  blx     #0xddbfc ; -> objc_msgSend
00082cc2  sxtb    r0, r4
00082cc4  pop.w   {r8, sl, fp}
00082cc8  pop     {r4, r5, r6, r7, pc}
00082cca  ldr     r3, [pc, #0xb4]
00082ccc  ldr     r1, [pc, #0xb4]
00082cce  mov     r2, r5
00082cd0  add     r3, pc ; -> 0x000f51c4  OBJC_IVAR_$_FBDialog._loadingURL
00082cd2  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
00082cd4  ldr     r3, [r3]
00082cd6  ldr     r1, [r1]
00082cd8  ldr     r0, [r6, r3]
00082cda  blx     #0xddbfc ; -> objc_msgSend
00082cde  tst.w   r0, #0xff
00082ce2  bne     #0x82ce8
00082ce4  ldr     r3, [sp, #0x20]
00082ce6  cbz     r3, #0x82d00
00082ce8  movs    r4, #1
00082cea  b       #0x82cc2
00082cec  ldr     r1, [pc, #0x98]
00082cee  mov     r0, r6
00082cf0  movs    r2, #0
00082cf2  add     r1, pc ; -> 0x000fcce0  "('\x0e"
00082cf4  movs    r3, #1
00082cf6  ldr     r1, [r1]
00082cf8  blx     #0xddbfc ; -> objc_msgSend
00082cfc  movs    r4, #0
00082cfe  b       #0x82cc2
00082d00  ldr     r1, [pc, #0x88]
00082d02  ldr     r4, [pc, #0x8c]
00082d04  add     r1, pc ; -> 0x000fcc60  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2e8
00082d06  add     r4, pc ; -> 0x000f51bc  OBJC_IVAR_$_FBDialog._delegate
00082d08  ldr.w   sl, [r1]
00082d0c  ldr     r1, [pc, #0x84]
00082d0e  ldr     r3, [r4]
00082d10  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00082d12  mov     r2, sl
00082d14  ldr     r0, [r6, r3]
00082d16  ldr     r1, [r1]
00082d18  blx     #0xddbfc ; -> objc_msgSend
00082d1c  tst.w   r0, #0xff
00082d20  beq     #0x82d36
00082d22  ldr     r3, [r4]
00082d24  mov     r1, sl
00082d26  mov     r2, r6
00082d28  ldr     r0, [r6, r3]
00082d2a  mov     r3, r5
00082d2c  blx     #0xddbfc ; -> objc_msgSend
00082d30  uxtb    r4, r0
00082d32  cmp     r4, #0
00082d34  beq     #0x82cc2
00082d36  ldr     r0, [pc, #0x60]
00082d38  ldr     r1, [pc, #0x60]
00082d3a  add     r0, pc ; -> 0x000fdb80  
00082d3c  add     r1, pc ; -> 0x000fcb00  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x188
00082d3e  ldr     r0, [r0]
00082d40  ldr     r1, [r1]
00082d42  blx     #0xddbfc ; -> objc_msgSend
00082d46  ldr     r1, [pc, #0x58]
00082d48  add     r1, pc ; -> 0x000fcbac  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x234
00082d4a  ldr     r4, [r1]
00082d4c  mov     r1, r8
00082d4e  mov     r5, r0
00082d50  mov     r0, fp
00082d52  blx     #0xddbfc ; -> objc_msgSend
00082d56  mov     r1, r4
00082d58  movs    r4, #0
00082d5a  mov     r2, r0
00082d5c  mov     r0, r5
00082d5e  blx     #0xddbfc ; -> objc_msgSend
00082d62  b       #0x82cc2
00082d64  ldr     r7, [sp, #0x3b8]
00082d66  movs    r7, r0
00082d68  ldr     r7, [sp, #0x368]
00082d6a  movs    r7, r0
00082d6c  ldr     r6, [sp, #0x1f0]
00082d6e  movs    r7, r0
00082d70  cbnz    r6, #0x82dcc
00082d72  movs    r7, r1
00082d74  ldr     r7, [sp, #0x2c8]
00082d76  movs    r7, r0
00082d78  cbnz    r6, #0x82dd0
00082d7a  movs    r7, r1
00082d7c  ldr     r7, [sp, #0x2a8]
00082d7e  movs    r7, r0
00082d80  movs    r4, #0xf0
00082d82  movs    r7, r0
00082d84  ldr     r7, [sp, #0x238]
00082d86  movs    r7, r0
00082d88  ldr     r7, [sp, #0x3a8]
00082d8a  movs    r7, r0
00082d8c  ldr     r7, [sp, #0x160]
00082d8e  movs    r7, r0
00082d90  movs    r4, #0xb2
00082d92  movs    r7, r0
00082d94  ldr     r7, [sp, #0x1f0]
00082d96  movs    r7, r0
00082d98  add     r6, sp, #0x108
00082d9a  movs    r7, r0
00082d9c  ldr     r5, [sp, #0x300]
00082d9e  movs    r7, r0
00082da0  ldr     r6, [sp, #0x180]
00082da2  movs    r7, r0
