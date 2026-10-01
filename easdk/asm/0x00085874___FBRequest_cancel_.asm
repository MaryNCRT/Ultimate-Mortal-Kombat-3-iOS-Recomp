========================================================================
-[FBRequest cancel]  0x00085874  120 bytes   FBRequest.m
========================================================================

00085874  push    {r4, r5, r6, r7, lr}
00085876  add     r7, sp, #0xc
00085878  ldr     r4, [pc, #0x58]
0008587a  mov     r5, r0
0008587c  add     r4, pc ; -> 0x000f59dc  OBJC_IVAR_$_FBRequest._connection
0008587e  ldr     r0, [r4]
00085880  ldr     r0, [r5, r0]
00085882  cbz     r0, #0x858c2
00085884  ldr     r1, [pc, #0x50]
00085886  add     r1, pc ; -> 0x000fcc9c  'p$\x0e'
00085888  ldr     r1, [r1]
0008588a  blx     #0xddbfc ; -> objc_msgSend
0008588e  ldr     r1, [pc, #0x4c]
00085890  ldr     r3, [r4]
00085892  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00085894  ldr     r0, [r5, r3]
00085896  ldr     r1, [r1]
00085898  blx     #0xddbfc ; -> objc_msgSend
0008589c  ldr     r1, [pc, #0x40]
0008589e  ldr     r3, [r4]
000858a0  ldr     r4, [pc, #0x40]
000858a2  add     r1, pc ; -> 0x000fce04  'e5\x0e'
000858a4  movs    r2, #0
000858a6  add     r4, pc ; -> 0x000f59c4  OBJC_IVAR_$_FBRequest._delegate
000858a8  ldr     r6, [r1]
000858aa  ldr     r1, [pc, #0x3c]
000858ac  str     r2, [r5, r3]
000858ae  ldr     r3, [r4]
000858b0  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000858b2  mov     r2, r6
000858b4  ldr     r1, [r1]
000858b6  ldr     r0, [r5, r3]
000858b8  blx     #0xddbfc ; -> objc_msgSend
000858bc  tst.w   r0, #0xff
000858c0  bne     #0x858c4
000858c2  pop     {r4, r5, r6, r7, pc}
000858c4  ldr     r3, [r4]
000858c6  mov     r1, r6
000858c8  mov     r2, r5
000858ca  ldr     r0, [r5, r3]
000858cc  blx     #0xddbfc ; -> objc_msgSend
000858d0  b       #0x858c2
000858d2  nop     
000858d4  lsls    r4, r3, #5
000858d6  movs    r7, r0
000858d8  strb    r2, [r2, #0x10]
000858da  movs    r7, r0
000858dc  strb    r6, [r4, #3]
000858de  movs    r7, r0
000858e0  strb    r6, [r3, #0x15]
000858e2  movs    r7, r0
000858e4  lsls    r2, r3, #4
000858e6  movs    r7, r0
000858e8  strb    r4, [r3, #0xf]
000858ea  movs    r7, r0
