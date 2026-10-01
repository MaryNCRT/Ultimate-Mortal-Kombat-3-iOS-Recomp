========================================================================
-[FBRequest urlForMethod  0x000862f8  76 bytes   FBRequest.m
========================================================================

000862f8  push    {r4, r7, lr}
000862fa  add     r7, sp, #4
000862fc  ldr     r1, [pc, #0x30]
000862fe  mov     r4, r0
00086300  mov     r0, r2
00086302  ldr     r2, [pc, #0x30]
00086304  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
00086306  add     r2, pc ; -> 0x0017ebc4  
00086308  ldr     r1, [r1]
0008630a  blx     #0xddbfc ; -> objc_msgSend
0008630e  tst.w   r0, #0xff
00086312  beq     #0x8631a
00086314  ldr     r0, [pc, #0x20]
00086316  add     r0, pc ; -> 0x0017ebd4  
00086318  pop     {r4, r7, pc}
0008631a  ldr     r3, [pc, #0x20]
0008631c  ldr     r1, [pc, #0x20]
0008631e  add     r3, pc ; -> 0x000f59c0  OBJC_IVAR_$_FBRequest._session
00086320  add     r1, pc ; -> 0x000fce98  
00086322  ldr     r0, [r3]
00086324  ldr     r1, [r1]
00086326  ldr     r0, [r4, r0]
00086328  blx     #0xddbfc ; -> objc_msgSend
0008632c  b       #0x86318
0008632e  nop     
00086330  ldr     r0, [r0]
00086332  movs    r7, r0
00086334  ldrh    r2, [r7, #4]
00086336  movs    r7, r1
00086338  ldrh    r2, [r7, #4]
0008633a  movs    r7, r1
