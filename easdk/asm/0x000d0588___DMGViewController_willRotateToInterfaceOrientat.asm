========================================================================
-[DMGViewController willRotateToInterfaceOrientation  0x000d0588  140 bytes   DMGViewController.mm
========================================================================

000d0588  sub     sp, #4
000d058a  push    {r4, r5, r7, lr}
000d058c  add     r7, sp, #8
000d058e  ldr     r1, [pc, #0x5c]
000d0590  mov     r4, r0
000d0592  str     r3, [sp, #0x10]
000d0594  add     r1, pc ; -> 0x000fda88  
000d0596  mov     r5, r2
000d0598  ldr     r1, [r1]
000d059a  blx     #0xddbfc ; -> objc_msgSend
000d059e  ldr     r3, [pc, #0x50]
000d05a0  add     r3, pc ; -> 0x000fa2a0  OBJC_IVAR_$_DMGViewController.mWebView
000d05a2  ldr     r0, [r3]
000d05a4  ldr     r0, [r4, r0]
000d05a6  cbz     r0, #0xd05e4
000d05a8  subs    r2, r5, #1
000d05aa  cmp     r2, #3
000d05ac  bhi     #0xd05e4
000d05ae  tbb     [pc, r2]
000d05b2  asrs    r3, r0, #8
000d05b4  lsrs    r0, r1, #0x14
000d05b6  movs    r1, r3
000d05b8  ldr     r2, [pc, #0x38]
000d05ba  ldr     r1, [pc, #0x3c]
000d05bc  add     r2, pc ; -> 0x001826c4  
000d05be  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
000d05c0  b       #0xd05de
000d05c2  ldr     r2, [pc, #0x38]
000d05c4  ldr     r1, [pc, #0x38]
000d05c6  add     r2, pc ; -> 0x001826d4  
000d05c8  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
000d05ca  b       #0xd05de
000d05cc  ldr     r2, [pc, #0x34]
000d05ce  ldr     r1, [pc, #0x38]
000d05d0  add     r2, pc ; -> 0x001826e4  
000d05d2  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
000d05d4  b       #0xd05de
000d05d6  ldr     r2, [pc, #0x34]
000d05d8  ldr     r1, [pc, #0x34]
000d05da  add     r2, pc ; -> 0x001826f4  
000d05dc  add     r1, pc ; -> 0x000fcd40  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3c8
000d05de  ldr     r1, [r1]
000d05e0  blx     #0xddbfc ; -> objc_msgSend
000d05e4  pop.w   {r4, r5, r7, lr}
000d05e8  add     sp, #4
000d05ea  bx      lr
000d05ec  bmi     #0xd05d0
000d05ee  movs    r2, r0
000d05f0  ldr     r4, [sp, #0x3f0]
000d05f2  movs    r2, r0
000d05f4  movs    r1, #4
000d05f6  movs    r3, r1
000d05f8  stm     r7!, {r1, r2, r3, r4, r5, r6}
000d05fa  movs    r2, r0
000d05fc  movs    r1, #0xa
000d05fe  movs    r3, r1
000d0600  stm     r7!, {r2, r4, r5, r6}
000d0602  movs    r2, r0
000d0604  movs    r1, #0x10
000d0606  movs    r3, r1
000d0608  stm     r7!, {r1, r3, r5, r6}
000d060a  movs    r2, r0
000d060c  movs    r1, #0x16
000d060e  movs    r3, r1
000d0610  stm     r7!, {r5, r6}
000d0612  movs    r2, r0
