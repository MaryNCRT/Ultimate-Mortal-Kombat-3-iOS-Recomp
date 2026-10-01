========================================================================
-[FBRequest handleResponseData  0x00085f8c  152 bytes   FBRequest.m
========================================================================

00085f8c  push    {r4, r5, r6, r7, lr}
00085f8e  add     r7, sp, #0xc
00085f90  str     r8, [sp, #-0x4]!
00085f94  sub     sp, #4
00085f96  ldr     r1, [pc, #0x74]
00085f98  mov     r5, r0
00085f9a  mov     r0, r2
00085f9c  add     r1, pc ; -> 0x000fca90  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x118
00085f9e  mov     r4, r2
00085fa0  ldr     r1, [r1]
00085fa2  blx     #0xddbfc ; -> objc_msgSend
00085fa6  ldr     r1, [pc, #0x68]
00085fa8  add     r3, sp, #4
00085faa  movs    r2, #0
00085fac  add     r1, pc ; -> 0x000fce48  
00085fae  str     r2, [r3, #-0x4]!
00085fb2  ldr     r1, [r1]
00085fb4  mov     r2, r4
00085fb6  mov     r0, r5
00085fb8  blx     #0xddbfc ; -> objc_msgSend
00085fbc  ldr     r2, [sp]
00085fbe  mov     r6, r0
00085fc0  cbz     r2, #0x85fd8
00085fc2  ldr     r1, [pc, #0x50]
00085fc4  mov     r0, r5
00085fc6  add     r1, pc ; -> 0x000fce44  
00085fc8  ldr     r1, [r1]
00085fca  blx     #0xddbfc ; -> objc_msgSend
00085fce  sub.w   sp, r7, #0x10
00085fd2  ldr     r8, [sp], #4
00085fd6  pop     {r4, r5, r6, r7, pc}
00085fd8  ldr     r1, [pc, #0x3c]
00085fda  ldr     r4, [pc, #0x40]
00085fdc  add     r1, pc ; -> 0x000fce40  
00085fde  add     r4, pc ; -> 0x000f59c4  OBJC_IVAR_$_FBRequest._delegate
00085fe0  ldr.w   r8, [r1]
00085fe4  ldr     r1, [pc, #0x38]
00085fe6  ldr     r3, [r4]
00085fe8  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00085fea  mov     r2, r8
00085fec  ldr     r0, [r5, r3]
00085fee  ldr     r1, [r1]
00085ff0  blx     #0xddbfc ; -> objc_msgSend
00085ff4  tst.w   r0, #0xff
00085ff8  beq     #0x85fce
00085ffa  ldr     r3, [r4]
00085ffc  mov     r1, r8
00085ffe  mov     r2, r5
00086000  ldr     r0, [r5, r3]
00086002  mov     r3, r6
00086004  blx     #0xddbfc ; -> objc_msgSend
00086008  b       #0x85fce
0008600a  nop     
0008600c  ldr     r0, [r6, #0x2c]
0008600e  movs    r7, r0
00086010  ldr     r0, [r3, #0x68]
00086012  movs    r7, r0
00086014  ldr     r2, [r7, #0x64]
00086016  movs    r7, r0
00086018  ldr     r0, [r4, #0x64]
0008601a  movs    r7, r0
0008601c  vld1.8  {d16[0]}, [r2], r6
00086020  ldr     r4, [r4, #0x48]
00086022  movs    r7, r0
