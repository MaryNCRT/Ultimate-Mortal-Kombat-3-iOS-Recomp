========================================================================
-[FBRequest connectionDidFinishLoading  0x00085c6c  96 bytes   FBRequest.m
========================================================================

00085c6c  push    {r4, r5, r6, r7, lr}
00085c6e  add     r7, sp, #0xc
00085c70  str     r8, [sp, #-0x4]!
00085c74  ldr     r4, [pc, #0x44]
00085c76  ldr     r1, [pc, #0x48]
00085c78  mov     r5, r0
00085c7a  add     r4, pc ; -> 0x000f59e0  OBJC_IVAR_$_FBRequest._responseText
00085c7c  add     r1, pc ; -> 0x000fce24  
00085c7e  ldr     r3, [r4]
00085c80  ldr     r1, [r1]
00085c82  mov.w   r8, #0
00085c86  ldr     r2, [r0, r3]
00085c88  blx     #0xddbfc ; -> objc_msgSend
00085c8c  ldr     r1, [pc, #0x34]
00085c8e  ldr     r3, [r4]
00085c90  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00085c92  ldr     r6, [r1]
00085c94  ldr     r0, [r5, r3]
00085c96  mov     r1, r6
00085c98  blx     #0xddbfc ; -> objc_msgSend
00085c9c  ldr     r3, [r4]
00085c9e  ldr     r4, [pc, #0x28]
00085ca0  mov     r1, r6
00085ca2  add     r4, pc ; -> 0x000f59dc  OBJC_IVAR_$_FBRequest._connection
00085ca4  str.w   r8, [r5, r3]
00085ca8  ldr     r3, [r4]
00085caa  ldr     r0, [r5, r3]
00085cac  blx     #0xddbfc ; -> objc_msgSend
00085cb0  ldr     r3, [r4]
00085cb2  str.w   r8, [r5, r3]
00085cb6  ldr     r8, [sp], #4
00085cba  pop     {r4, r5, r6, r7, pc}
00085cbc  stc2l   p0, c0, [r2, #-0x18]!
00085cc0  strb    r4, [r4, #6]
00085cc2  movs    r7, r0
00085cc4  ldr     r0, [r5, #0x4c]
00085cc6  movs    r7, r0
00085cc8  ldc2    p0, c0, [r6, #-0x18]!
