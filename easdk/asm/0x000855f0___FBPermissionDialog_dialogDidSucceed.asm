========================================================================
-[FBPermissionDialog dialogDidSucceed  0x000855f0  112 bytes   FBPermissionDialog.m
========================================================================

000855f0  push    {r4, r5, r7, lr}
000855f2  add     r7, sp, #8
000855f4  sub     sp, #8
000855f6  ldr     r3, [pc, #0x50]
000855f8  ldr     r1, [pc, #0x50]
000855fa  mov     r5, r2
000855fc  add     r3, pc ; -> 0x000f5674  OBJC_IVAR_$_FBPermissionDialog._permission
000855fe  ldr     r2, [pc, #0x50]
00085600  ldr     r3, [r3]
00085602  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00085604  mov     r4, r0
00085606  add     r2, pc ; -> 0x0017eab4  
00085608  ldr     r0, [r0, r3]
0008560a  ldr     r1, [r1]
0008560c  blx     #0xddbfc ; -> objc_msgSend
00085610  tst.w   r0, #0xff
00085614  beq     #0x85634
00085616  ldr     r3, [pc, #0x3c]
00085618  ldr     r1, [pc, #0x3c]
0008561a  mov     r0, sp
0008561c  add     r3, pc ; -> 0x000fdd44  
0008561e  add     r1, pc ; -> 0x000fcc68  'L6\x0e'
00085620  ldr     r3, [r3]
00085622  ldr     r1, [r1]
00085624  mov     r2, r5
00085626  str     r4, [sp]
00085628  str     r3, [sp, #4]
0008562a  blx     #0xddc08 ; -> objc_msgSendSuper2
0008562e  sub.w   sp, r7, #8
00085632  pop     {r4, r5, r7, pc}
00085634  ldr     r1, [pc, #0x24]
00085636  movs    r2, #1
00085638  mov     r0, r4
0008563a  add     r1, pc ; -> 0x000fcce0  "('\x0e"
0008563c  mov     r3, r2
0008563e  ldr     r1, [r1]
00085640  blx     #0xddbfc ; -> objc_msgSend
00085644  b       #0x8562e
00085646  nop     
00085648  lsls    r4, r6, #1
0008564a  movs    r7, r0
0008564c  strb    r2, [r0, #0x14]
0008564e  movs    r7, r0
00085650  str     r4, [sp, #0x2a8]
00085652  movs    r7, r1
00085654  strh    r4, [r4, #0x38]
00085656  movs    r7, r0
00085658  strb    r6, [r0, #0x19]
0008565a  movs    r7, r0
0008565c  strb    r2, [r4, #0x1a]
0008565e  movs    r7, r0
