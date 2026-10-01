========================================================================
-[DMGImageLoader connectionDidFinishLoading  0x000d3334  372 bytes   DMGImageLoader.mm
========================================================================

000d3334  push    {r4, r5, r6, r7, lr}
000d3336  add     r7, sp, #0xc
000d3338  push.w  {r8, sl, fp}
000d333c  sub     sp, #0x10
000d333e  ldr     r1, [pc, #0x114]
000d3340  mov     r5, r0
000d3342  ldr     r0, [pc, #0x114]
000d3344  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d3346  str     r2, [sp, #8]
000d3348  add     r0, pc ; -> 0x000fdc2c  
000d334a  ldr     r1, [r1]
000d334c  ldr     r0, [r0]
000d334e  blx     #0xddbfc ; -> objc_msgSend
000d3352  ldr     r1, [pc, #0x108]
000d3354  ldr     r4, [pc, #0x108]
000d3356  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d3358  add     r4, pc ; -> 0x00182044  
000d335a  ldr     r6, [r1]
000d335c  str     r0, [sp, #0xc]
000d335e  ldr     r0, [pc, #0x104]
000d3360  add     r0, pc ; -> 0x000fdb5c  
000d3362  ldr.w   r8, [r0]
000d3366  blx     #0xdd41c ; -> NSTemporaryDirectory
000d336a  ldr     r2, [pc, #0xfc]
000d336c  mov     r1, r6
000d336e  add     r2, pc ; -> 0x000fa6fc  OBJC_IVAR_$_DMGImageLoader.fileName
000d3370  ldr     r2, [r2]
000d3372  ldr     r2, [r5, r2]
000d3374  str     r2, [sp]
000d3376  mov     r2, r4
000d3378  mov     r3, r0
000d337a  mov     r0, r8
000d337c  blx     #0xddbfc ; -> objc_msgSend
000d3380  ldr     r3, [pc, #0xe8]
000d3382  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d3384  mov     fp, r0
000d3386  ldr     r0, [r3]
000d3388  ldr     r0, [r5, r0]
000d338a  cmp     r0, #0
000d338c  beq     #0xd33fe
000d338e  ldr     r1, [pc, #0xe0]
000d3390  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d3392  ldr     r1, [r1]
000d3394  blx     #0xddbfc ; -> objc_msgSend
000d3398  cmp     r0, #0
000d339a  beq     #0xd33fe
000d339c  ldr     r1, [pc, #0xd4]
000d339e  ldr     r4, [pc, #0xd8]
000d33a0  add     r1, pc ; -> 0x000fcfec  'mY\x0e'
000d33a2  add     r4, pc ; -> 0x00182054  
000d33a4  ldr.w   sl, [r1]
000d33a8  blx     #0xdd41c ; -> NSTemporaryDirectory
000d33ac  mov     r2, r4
000d33ae  mov     r1, r6
000d33b0  movs    r4, #0
000d33b2  mov     r3, r0
000d33b4  mov     r0, r8
000d33b6  blx     #0xddbfc ; -> objc_msgSend
000d33ba  movs    r3, #1
000d33bc  mov     r1, sl
000d33be  str     r4, [sp]
000d33c0  str     r4, [sp, #4]
000d33c2  mov     r2, r0
000d33c4  ldr     r0, [sp, #0xc]
000d33c6  blx     #0xddbfc ; -> objc_msgSend
000d33ca  tst.w   r0, #0xff
000d33ce  beq     #0xd33d8
000d33d0  ldr     r0, [pc, #0xa8]
000d33d2  add     r0, pc ; -> 0x00182064  
000d33d4  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d33d8  ldr     r3, [pc, #0xa4]
000d33da  ldr     r1, [pc, #0xa8]
000d33dc  ldr     r0, [sp, #0xc]
000d33de  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d33e0  add     r1, pc ; -> 0x000fd218  
000d33e2  ldr     r3, [r3]
000d33e4  ldr     r1, [r1]
000d33e6  mov     r2, fp
000d33e8  str     r4, [sp]
000d33ea  ldr     r3, [r5, r3]
000d33ec  blx     #0xddbfc ; -> objc_msgSend
000d33f0  tst.w   r0, #0xff
000d33f4  beq     #0xd33fe
000d33f6  ldr     r0, [pc, #0x90]
000d33f8  add     r0, pc ; -> 0x00182074  
000d33fa  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d33fe  ldr     r3, [pc, #0x8c]
000d3400  ldr     r1, [pc, #0x8c]
000d3402  add     r3, pc ; -> 0x000fa710  OBJC_IVAR_$_DMGImageLoader.loadedData
000d3404  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d3406  ldr     r3, [r3]
000d3408  ldr     r4, [r1]
000d340a  ldr     r0, [r5, r3]
000d340c  mov     r1, r4
000d340e  blx     #0xddbfc ; -> objc_msgSend
000d3412  mov     r1, r4
000d3414  ldr     r0, [sp, #8]
000d3416  blx     #0xddbfc ; -> objc_msgSend
000d341a  ldr     r3, [pc, #0x78]
000d341c  ldr     r4, [pc, #0x78]
000d341e  ldr     r1, [pc, #0x7c]
000d3420  add     r3, pc ; -> 0x000fa6f4  OBJC_IVAR_$_DMGImageLoader.cachedImagesList
000d3422  add     r4, pc ; -> 0x000fa6fc  OBJC_IVAR_$_DMGImageLoader.fileName
000d3424  ldr     r3, [r3]
000d3426  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000d3428  ldr     r1, [r1]
000d342a  ldr     r0, [r5, r3]
000d342c  ldr     r3, [r4]
000d342e  ldr     r2, [r5, r3]
000d3430  blx     #0xddbfc ; -> objc_msgSend
000d3434  ldr     r3, [r4]
000d3436  movs    r2, #0
000d3438  str     r2, [r5, r3]
000d343a  ldr     r3, [pc, #0x64]
000d343c  add     r3, pc ; -> 0x000fa700  OBJC_IVAR_$_DMGImageLoader.prevFileName
000d343e  ldr     r3, [r3]
000d3440  str     r2, [r5, r3]
000d3442  ldr     r3, [pc, #0x60]
000d3444  add     r3, pc ; -> 0x000fa70c  OBJC_IVAR_$_DMGImageLoader.requestStarted
000d3446  ldr     r3, [r3]
000d3448  strb    r2, [r5, r3]
000d344a  sub.w   sp, r7, #0x18
000d344e  pop.w   {r8, sl, fp}
000d3452  pop     {r4, r5, r6, r7, pc}
000d3454  ldr     r4, [sp, #0x300]
000d3456  movs    r2, r0
000d3458  add     r0, sp, #0x380
000d345a  movs    r2, r0
000d345c  str     r7, [sp, #0x118]
000d345e  movs    r2, r0
000d3460  stcl    p0, c0, [r8], #0x28
000d3464  adr     r7, #0x3e0
000d3466  movs    r2, r0
000d3468  strb    r2, [r1, #0xe]
000d346a  movs    r2, r0
000d346c  strb    r2, [r1, #0xe]
000d346e  movs    r2, r0
000d3470  str     r6, [sp, #0x390]
000d3472  movs    r2, r0
000d3474  ldr     r4, [sp, #0x120]
000d3476  movs    r2, r0
000d3478  stc     p0, c0, [lr], #0x28
000d347c  stc     p0, c0, [lr], {0xa}
000d3480  strb    r6, [r5, #0xc]
000d3482  movs    r2, r0
000d3484  ldr     r6, [sp, #0xd0]
000d3486  movs    r2, r0
000d3488  ldcl    p0, c0, [r8], #-0x28
000d348c  strb    r2, [r1, #0xc]
000d348e  movs    r2, r0
000d3490  str     r5, [sp, #0x1d0]
000d3492  movs    r2, r0
000d3494  strb    r0, [r2, #0xb]
000d3496  movs    r2, r0
000d3498  strb    r6, [r2, #0xb]
000d349a  movs    r2, r0
000d349c  ldr     r2, [sp, #0x348]
000d349e  movs    r2, r0
000d34a0  strb    r0, [r0, #0xb]
000d34a2  movs    r2, r0
000d34a4  strb    r4, [r0, #0xb]
000d34a6  movs    r2, r0
