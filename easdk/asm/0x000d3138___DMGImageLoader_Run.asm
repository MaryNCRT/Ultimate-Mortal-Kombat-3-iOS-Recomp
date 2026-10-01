========================================================================
-[DMGImageLoader Run  0x000d3138  292 bytes   DMGImageLoader.mm
========================================================================

000d3138  push    {r4, r5, r6, r7, lr}
000d313a  add     r7, sp, #0xc
000d313c  push.w  {r8, sl, fp}
000d3140  ldr     r3, [pc, #0xd4]
000d3142  mov     fp, r2
000d3144  mov     r5, r0
000d3146  add     r3, pc ; -> 0x000fa70c  OBJC_IVAR_$_DMGImageLoader.requestStarted
000d3148  ldr     r2, [r3]
000d314a  ldrsb   r4, [r0, r2]
000d314c  cmp     r4, #0
000d314e  bne     #0xd31d6
000d3150  ldr     r3, [pc, #0xc8]
000d3152  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d3154  ldr     r0, [r3]
000d3156  ldr     r0, [r5, r0]
000d3158  cmp     r0, #0
000d315a  beq     #0xd3206
000d315c  ldr     r1, [pc, #0xc0]
000d315e  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000d3160  ldr.w   r8, [r1]
000d3164  mov     r1, r8
000d3166  blx     #0xddbfc ; -> objc_msgSend
000d316a  ldr     r1, [pc, #0xb8]
000d316c  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d316e  ldr     r1, [r1]
000d3170  blx     #0xddbfc ; -> objc_msgSend
000d3174  cmp     r0, #0
000d3176  beq     #0xd3206
000d3178  ldr     r3, [pc, #0xac]
000d317a  add     r3, pc ; -> 0x000fa6fc  OBJC_IVAR_$_DMGImageLoader.fileName
000d317c  ldr.w   sl, [r3]
000d3180  ldr.w   r2, [r5, sl]
000d3184  cbz     r2, #0xd318e
000d3186  ldr     r3, [pc, #0xa4]
000d3188  add     r3, pc ; -> 0x000fa700  OBJC_IVAR_$_DMGImageLoader.prevFileName
000d318a  ldr     r3, [r3]
000d318c  str     r2, [r5, r3]
000d318e  ldr     r6, [pc, #0xa0]
000d3190  mov     r1, r8
000d3192  add     r6, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d3194  ldr     r3, [r6]
000d3196  ldr     r0, [r5, r3]
000d3198  blx     #0xddbfc ; -> objc_msgSend
000d319c  ldr     r1, [pc, #0x94]
000d319e  mov     r2, r4
000d31a0  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000d31a2  ldr     r1, [r1]
000d31a4  blx     #0xddbfc ; -> objc_msgSend
000d31a8  ldr     r3, [pc, #0x8c]
000d31aa  ldr     r1, [pc, #0x90]
000d31ac  add     r3, pc ; -> 0x000fa704  OBJC_IVAR_$_DMGImageLoader.imgURL
000d31ae  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d31b0  ldr     r1, [r1]
000d31b2  str.w   r0, [r5, sl]
000d31b6  ldr     r4, [r3]
000d31b8  ldr     r3, [r6]
000d31ba  ldr     r0, [r5, r3]
000d31bc  ldr     r3, [pc, #0x80]
000d31be  add     r3, pc ; -> 0x000fa6fc  OBJC_IVAR_$_DMGImageLoader.fileName
000d31c0  ldr     r3, [r3]
000d31c2  ldr     r2, [r5, r3]
000d31c4  blx     #0xddbfc ; -> objc_msgSend
000d31c8  ldr     r1, [pc, #0x78]
000d31ca  add     r1, pc ; -> 0x000fd8bc  
000d31cc  ldr     r1, [r1]
000d31ce  str     r0, [r5, r4]
000d31d0  mov     r0, r5
000d31d2  blx     #0xddbfc ; -> objc_msgSend
000d31d6  ldr     r3, [pc, #0x70]
000d31d8  add     r3, pc ; -> 0x000fa708  OBJC_IVAR_$_DMGImageLoader.exitLoader
000d31da  ldr     r3, [r3]
000d31dc  ldrsb   r3, [r5, r3]
000d31de  cbz     r3, #0xd3212
000d31e0  ldr     r1, [pc, #0x68]
000d31e2  ldr     r4, [pc, #0x6c]
000d31e4  mov     r0, fp
000d31e6  add     r1, pc ; -> 0x000fc9b0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x38
000d31e8  add     r4, pc ; -> 0x000fa6f8  OBJC_IVAR_$_DMGImageLoader.cacheTimer
000d31ea  ldr     r1, [r1]
000d31ec  blx     #0xddbfc ; -> objc_msgSend
000d31f0  ldr     r1, [pc, #0x60]
000d31f2  ldr     r3, [r4]
000d31f4  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d31f6  ldr     r0, [r5, r3]
000d31f8  ldr     r1, [r1]
000d31fa  blx     #0xddbfc ; -> objc_msgSend
000d31fe  ldr     r3, [r4]
000d3200  movs    r2, #0
000d3202  str     r2, [r5, r3]
000d3204  b       #0xd3212
000d3206  ldr     r3, [pc, #0x50]
000d3208  movs    r2, #1
000d320a  add     r3, pc ; -> 0x000fa718  OBJC_IVAR_$_DMGImageLoader.imgLoadingFinished
000d320c  ldr     r3, [r3]
000d320e  strb    r2, [r5, r3]
000d3210  b       #0xd31d6
000d3212  pop.w   {r8, sl, fp}
000d3216  pop     {r4, r5, r6, r7, pc}
000d3218  strb    r2, [r0, #0x17]
000d321a  movs    r2, r0
000d321c  strb    r6, [r3, #0x16]
000d321e  movs    r2, r0
000d3220  ldr     r5, [sp, #0x38]
000d3222  movs    r2, r0
000d3224  ldr     r1, [sp, #0x40]
000d3226  movs    r2, r0
000d3228  strb    r6, [r7, #0x15]
000d322a  movs    r2, r0
000d322c  strb    r4, [r6, #0x15]
000d322e  movs    r2, r0
000d3230  strb    r6, [r3, #0x15]
000d3232  movs    r2, r0
000d3234  ldr     r0, [sp, #0x360]
000d3236  movs    r2, r0
000d3238  strb    r4, [r2, #0x15]
000d323a  movs    r2, r0
000d323c  ldr     r1, [sp, #0xf8]
000d323e  movs    r2, r0
000d3240  strb    r2, [r7, #0x14]
000d3242  movs    r2, r0
000d3244  adr     r6, #0x3b8
000d3246  movs    r2, r0
000d3248  strb    r4, [r5, #0x14]
000d324a  movs    r2, r0
000d324c  str     r7, [sp, #0x318]
000d324e  movs    r2, r0
000d3250  strb    r4, [r1, #0x14]
000d3252  movs    r2, r0
000d3254  str     r7, [sp, #0x210]
000d3256  movs    r2, r0
000d3258  strb    r2, [r1, #0x14]
000d325a  movs    r2, r0
