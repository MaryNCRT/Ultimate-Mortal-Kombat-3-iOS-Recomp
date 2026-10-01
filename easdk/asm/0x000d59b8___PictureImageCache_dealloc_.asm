========================================================================
-[PictureImageCache dealloc]  0x000d59b8  72 bytes   PictureImageCache.m
========================================================================

000d59b8  push    {r4, r7, lr}
000d59ba  add     r7, sp, #4
000d59bc  sub     sp, #8
000d59be  ldr     r3, [pc, #0x30]
000d59c0  ldr     r1, [pc, #0x30]
000d59c2  mov     r4, r0
000d59c4  add     r3, pc ; -> 0x000fae5c  OBJC_IVAR_$_PictureImageCache.operationQueue
000d59c6  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d59c8  ldr     r3, [r3]
000d59ca  ldr     r1, [r1]
000d59cc  ldr     r0, [r0, r3]
000d59ce  blx     #0xddbfc ; -> objc_msgSend
000d59d2  ldr     r3, [pc, #0x24]
000d59d4  ldr     r1, [pc, #0x24]
000d59d6  mov     r0, sp
000d59d8  add     r3, pc ; -> 0x000fdde0  
000d59da  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d59dc  ldr     r3, [r3]
000d59de  ldr     r1, [r1]
000d59e0  str     r4, [sp]
000d59e2  str     r3, [sp, #4]
000d59e4  blx     #0xddc08 ; -> objc_msgSendSuper2
000d59e8  sub.w   sp, r7, #4
000d59ec  pop     {r4, r7, pc}
000d59ee  nop     
000d59f0  strb    r4, [r2, r2]
000d59f2  movs    r2, r0
000d59f4  ldr     r2, [r6, #0x78]
000d59f6  movs    r2, r0
000d59f8  strh    r4, [r0, #0x20]
000d59fa  movs    r2, r0
000d59fc  ldr     r2, [r0, #0x7c]
000d59fe  movs    r2, r0
