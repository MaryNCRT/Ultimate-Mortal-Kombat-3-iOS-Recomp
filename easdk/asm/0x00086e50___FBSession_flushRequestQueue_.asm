========================================================================
-[FBSession flushRequestQueue]  0x00086e50  156 bytes   FBSession.m
========================================================================

00086e50  push    {r4, r5, r6, r7, lr}
00086e52  add     r7, sp, #0xc
00086e54  push.w  {r8, sl, fp}
00086e58  sub     sp, #4
00086e5a  ldr     r1, [pc, #0x78]
00086e5c  ldr     r3, [pc, #0x78]
00086e5e  mov     r5, r0
00086e60  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
00086e62  ldr.w   fp, [r1]
00086e66  ldr     r1, [pc, #0x74]
00086e68  str     r3, [sp]
00086e6a  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
00086e6c  ldr.w   sl, [r1]
00086e70  ldr     r1, [pc, #0x6c]
00086e72  add     r1, pc ; -> 0x000fced8  '\x19@\x0e'
00086e74  ldr.w   r8, [r1]
00086e78  ldr     r1, [pc, #0x68]
00086e7a  add     r1, pc ; -> 0x000fced4  
00086e7c  ldr     r6, [r1]
00086e7e  b       #0x86eaa
00086e80  ldr     r3, [r4]
00086e82  movs    r2, #0
00086e84  mov     r1, sl
00086e86  ldr     r0, [r3, r5]
00086e88  blx     #0xddbfc ; -> objc_msgSend
00086e8c  movs    r3, #0
00086e8e  mov     r1, r8
00086e90  mov     r2, r0
00086e92  mov     r0, r5
00086e94  blx     #0xddbfc ; -> objc_msgSend
00086e98  tst.w   r0, #0xff
00086e9c  beq     #0x86ec6
00086e9e  ldr     r3, [r4]
00086ea0  mov     r1, r6
00086ea2  movs    r2, #0
00086ea4  ldr     r0, [r3, r5]
00086ea6  blx     #0xddbfc ; -> objc_msgSend
00086eaa  ldr     r4, [sp]
00086eac  mov     r1, fp
00086eae  add     r4, pc
00086eb0  ldr     r3, [r4]
00086eb2  ldr     r0, [r3, r5]
00086eb4  blx     #0xddbfc ; -> objc_msgSend
00086eb8  cmp     r0, #0
00086eba  bne     #0x86e80
00086ebc  sub.w   sp, r7, #0x18
00086ec0  pop.w   {r8, sl, fp}
00086ec4  pop     {r4, r5, r6, r7, pc}
00086ec6  ldr     r1, [pc, #0x20]
00086ec8  mov     r0, r5
00086eca  add     r1, pc ; -> 0x000fceec  'N@\x0e'
00086ecc  ldr     r1, [r1]
00086ece  blx     #0xddbfc ; -> objc_msgSend
00086ed2  b       #0x86ebc
00086ed4  ldrb    r4, [r3, r0]
00086ed6  movs    r7, r0
00086ed8  cdp     p0, #7, c0, c2, c6, #0
00086edc  ldrb    r6, [r1, r0]
00086ede  movs    r7, r0
00086ee0  str     r2, [r4, #4]
00086ee2  movs    r7, r0
00086ee4  str     r6, [r2, #4]
00086ee6  movs    r7, r0
00086ee8  str     r6, [r3]
00086eea  movs    r7, r0
