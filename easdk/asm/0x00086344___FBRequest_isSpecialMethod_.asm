========================================================================
-[FBRequest isSpecialMethod]  0x00086344  92 bytes   FBRequest.m
========================================================================

00086344  push    {r4, r5, r7, lr}
00086346  add     r7, sp, #8
00086348  ldr     r3, [pc, #0x40]
0008634a  ldr     r1, [pc, #0x44]
0008634c  ldr     r2, [pc, #0x44]
0008634e  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00086350  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00086352  ldr     r3, [r3]
00086354  ldr     r4, [r1]
00086356  mov     r5, r0
00086358  add     r2, pc ; -> 0x0017ea44  
0008635a  ldr     r0, [r0, r3]
0008635c  mov     r1, r4
0008635e  blx     #0xddbfc ; -> objc_msgSend
00086362  tst.w   r0, #0xff
00086366  beq     #0x8636e
00086368  movs    r0, #1
0008636a  sxtb    r0, r0
0008636c  pop     {r4, r5, r7, pc}
0008636e  ldr     r3, [pc, #0x28]
00086370  ldr     r2, [pc, #0x28]
00086372  mov     r1, r4
00086374  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00086376  add     r2, pc ; -> 0x0017ebe4  
00086378  ldr     r0, [r3]
0008637a  ldr     r0, [r5, r0]
0008637c  blx     #0xddbfc ; -> objc_msgSend
00086380  tst.w   r0, #0xff
00086384  ite     eq
00086386  moveq   r0, #0
00086388  movne   r0, #1
0008638a  b       #0x8636a
