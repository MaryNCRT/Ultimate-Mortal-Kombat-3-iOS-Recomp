========================================================================
-[DMGImageLoader dealloc]  0x000d34a8  84 bytes   DMGImageLoader.mm
========================================================================

000d34a8  push    {r4, r7, lr}
000d34aa  add     r7, sp, #4
000d34ac  sub     sp, #8
000d34ae  ldr     r3, [pc, #0x38]
000d34b0  movs    r2, #1
000d34b2  ldr     r1, [pc, #0x38]
000d34b4  add     r3, pc ; -> 0x000fa708  OBJC_IVAR_$_DMGImageLoader.exitLoader
000d34b6  mov     r4, r0
000d34b8  ldr     r3, [r3]
000d34ba  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d34bc  ldr     r1, [r1]
000d34be  strb    r2, [r0, r3]
000d34c0  ldr     r3, [pc, #0x2c]
000d34c2  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d34c4  ldr     r3, [r3]
000d34c6  ldr     r0, [r0, r3]
000d34c8  blx     #0xddbfc ; -> objc_msgSend
000d34cc  ldr     r3, [pc, #0x24]
000d34ce  ldr     r1, [pc, #0x28]
000d34d0  mov     r0, sp
000d34d2  add     r3, pc ; -> 0x000fddd0  
000d34d4  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d34d6  ldr     r3, [r3]
000d34d8  ldr     r1, [r1]
000d34da  str     r4, [sp]
000d34dc  str     r3, [sp, #4]
000d34de  blx     #0xddc08 ; -> objc_msgSendSuper2
000d34e2  sub.w   sp, r7, #4
000d34e6  pop     {r4, r7, pc}
000d34e8  strb    r0, [r2, #9]
000d34ea  movs    r2, r0
000d34ec  str     r4, [sp, #0x2f8]
000d34ee  movs    r2, r0
000d34f0  strb    r6, [r5, #8]
000d34f2  movs    r2, r0
000d34f4  add     r0, sp, #0x3e8
000d34f6  movs    r2, r0
000d34f8  str     r4, [sp, #0x320]
000d34fa  movs    r2, r0
