========================================================================
-[DMGImageLoader addImage  0x000d325c  216 bytes   DMGImageLoader.mm
========================================================================

000d325c  push    {r4, r5, r6, r7, lr}
000d325e  add     r7, sp, #0xc
000d3260  push.w  {r8, sl, fp}
000d3264  sub     sp, #0x10
000d3266  mov     sl, r3
000d3268  ldr     r3, [pc, #0x90]
000d326a  mov     r4, r0
000d326c  mov     r8, r2
000d326e  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d3270  ldr     r5, [r3]
000d3272  ldr     r6, [r0, r5]
000d3274  cmp     r6, #0
000d3276  bne     #0xd32d2
000d3278  ldr     r0, [pc, #0x84]
000d327a  ldr     r1, [pc, #0x88]
000d327c  add     r0, pc ; -> 0x000fdbf4  
000d327e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d3280  ldr     r0, [r0]
000d3282  ldr     r1, [r1]
000d3284  blx     #0xddbfc ; -> objc_msgSend
000d3288  ldr     r1, [pc, #0x7c]
000d328a  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d328c  ldr     r1, [r1]
000d328e  blx     #0xddbfc ; -> objc_msgSend
000d3292  ldr     r3, [pc, #0x78]
000d3294  ldr     r1, [pc, #0x78]
000d3296  ldr     r2, [pc, #0x7c]
000d3298  add     r3, pc ; -> 0x000fd794  
000d329a  add     r1, pc ; -> 0x000fc9b8  '~\x07\x0e'
000d329c  ldr     r3, [r3]
000d329e  ldr     r1, [r1]
000d32a0  str     r0, [r4, r5]
000d32a2  ldr     r5, [pc, #0x74]
000d32a4  ldr     r0, [pc, #0x74]
000d32a6  add     r5, pc ; -> 0x000fa6f8  OBJC_IVAR_$_DMGImageLoader.cacheTimer
000d32a8  add     r0, pc ; -> 0x000fdb58  
000d32aa  ldr.w   fp, [r5]
000d32ae  ldr     r0, [r0]
000d32b0  str     r3, [sp, #4]
000d32b2  movs    r3, #1
000d32b4  str     r3, [sp, #0xc]
000d32b6  ldr     r3, [pc, #0x68]
000d32b8  str     r4, [sp]
000d32ba  str     r6, [sp, #8]
000d32bc  blx     #0xddbfc ; -> objc_msgSend
000d32c0  ldr     r1, [pc, #0x60]
000d32c2  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d32c4  ldr     r1, [r1]
000d32c6  str.w   r0, [r4, fp]
000d32ca  ldr     r3, [r5]
000d32cc  ldr     r0, [r4, r3]
000d32ce  blx     #0xddbfc ; -> objc_msgSend
000d32d2  ldr     r3, [pc, #0x54]
000d32d4  movs    r2, #0
000d32d6  ldr     r1, [pc, #0x54]
000d32d8  add     r3, pc ; -> 0x000fa718  OBJC_IVAR_$_DMGImageLoader.imgLoadingFinished
000d32da  ldr     r3, [r3]
000d32dc  add     r1, pc ; -> 0x000fd5e0  
000d32de  ldr     r1, [r1]
000d32e0  strb    r2, [r4, r3]
000d32e2  ldr     r3, [pc, #0x4c]
000d32e4  mov     r2, r8
000d32e6  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d32e8  ldr     r0, [r3]
000d32ea  mov     r3, sl
000d32ec  ldr     r0, [r4, r0]
000d32ee  blx     #0xddbfc ; -> objc_msgSend
000d32f2  sub.w   sp, r7, #0x18
000d32f6  pop.w   {r8, sl, fp}
000d32fa  pop     {r4, r5, r6, r7, pc}
000d32fc  strb    r2, [r0, #0x12]
000d32fe  movs    r2, r0
000d3300  add     r1, sp, #0x1d0
000d3302  movs    r2, r0
000d3304  str     r7, [sp, #8]
000d3306  movs    r2, r0
000d3308  str     r6, [sp, #0x3c8]
000d330a  movs    r2, r0
000d330c  adr     r4, #0x3e0
000d330e  movs    r2, r0
000d3310  str     r7, [sp, #0x68]
000d3312  movs    r2, r0
000d3314  ldr     r1, [sp, #0x268]
000d3316  ldr     r1, [sp, #0x264]
000d3318  strb    r6, [r1, #0x11]
000d331a  movs    r2, r0
000d331c  add     r0, sp, #0x2b0
000d331e  movs    r2, r0
000d3320  ldr     r1, [sp, #0x264]
000d3322  subs    r7, #0xa9
000d3324  ldr     r2, [sp, #0x28]
000d3326  movs    r2, r0
000d3328  strb    r4, [r7, #0x10]
000d332a  movs    r2, r0
000d332c  adr     r3, #0
000d332e  movs    r2, r0
000d3330  strb    r2, [r1, #0x10]
000d3332  movs    r2, r0
