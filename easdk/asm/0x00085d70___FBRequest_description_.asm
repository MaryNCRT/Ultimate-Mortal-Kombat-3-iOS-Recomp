========================================================================
-[FBRequest description]  0x00085d70  68 bytes   FBRequest.m
========================================================================

00085d70  push    {r7, lr}
00085d72  add     r7, sp, #0
00085d74  ldr     r3, [pc, #0x28]
00085d76  mov     r2, r0
00085d78  ldr     r1, [pc, #0x28]
00085d7a  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00085d7c  ldr     r0, [pc, #0x28]
00085d7e  ldr     r3, [r3]
00085d80  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
00085d82  add     r0, pc ; -> 0x000fdb5c  
00085d84  ldr     r1, [r1]
00085d86  ldr     r3, [r2, r3]
00085d88  ldr     r0, [r0]
00085d8a  cbz     r3, #0x85d96
00085d8c  ldr     r2, [pc, #0x1c]
00085d8e  add     r2, pc ; -> 0x0017eb44  
00085d90  blx     #0xddbfc ; -> objc_msgSend
00085d94  pop     {r7, pc}
00085d96  ldr     r3, [pc, #0x18]
00085d98  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
00085d9a  ldr     r3, [r3]
00085d9c  ldr     r3, [r2, r3]
00085d9e  b       #0x85d8c
00085da0  mcrr2   p0, #0, r0, lr, c6
00085da4  ldr     r4, [r3, #0x50]
00085da6  movs    r7, r0
00085da8  ldrb    r6, [r2, #0x17]
00085daa  movs    r7, r0
00085dac  ldrh    r2, [r6, #0x2c]
00085dae  movs    r7, r1
00085db0  stc2    p0, c0, [ip], #-0x18
