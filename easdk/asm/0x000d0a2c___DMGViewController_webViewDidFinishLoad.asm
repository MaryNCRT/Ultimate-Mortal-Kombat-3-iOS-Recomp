========================================================================
-[DMGViewController webViewDidFinishLoad  0x000d0a2c  200 bytes   DMGViewController.mm
========================================================================

000d0a2c  push    {r4, r5, r6, r7, lr}
000d0a2e  add     r7, sp, #0xc
000d0a30  push.w  {r8, sl, fp}
000d0a34  ldr     r1, [pc, #0x90]
000d0a36  mov     r5, r0
000d0a38  ldr     r0, [pc, #0x90]
000d0a3a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0a3c  ldr     r4, [pc, #0x90]
000d0a3e  add     r0, pc ; -> 0x000fdb5c  
000d0a40  ldr.w   sl, [r1]
000d0a44  ldr.w   fp, [r0]
000d0a48  ldr     r1, [pc, #0x88]
000d0a4a  ldr     r0, [pc, #0x8c]
000d0a4c  add     r4, pc ; -> 0x001827a4  
000d0a4e  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d0a50  add     r0, pc ; -> 0x000fdbb4  
000d0a52  ldr     r6, [r1]
000d0a54  ldr.w   r8, [r0]
000d0a58  mov     r1, r6
000d0a5a  mov     r0, r8
000d0a5c  blx     #0xddbfc ; -> objc_msgSend
000d0a60  mov     r1, sl
000d0a62  mov     r2, r4
000d0a64  mov     r3, r0
000d0a66  mov     r0, fp
000d0a68  blx     #0xddbfc ; -> objc_msgSend
000d0a6c  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0a70  ldr     r3, [pc, #0x68]
000d0a72  ldr     r1, [pc, #0x6c]
000d0a74  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0a76  add     r1, pc ; -> 0x000fda34  ']\x14\x0f'
000d0a78  ldr     r3, [r3]
000d0a7a  ldr     r1, [r1]
000d0a7c  ldr     r0, [r5, r3]
000d0a7e  blx     #0xddbfc ; -> objc_msgSend
000d0a82  tst.w   r0, #0xff
000d0a86  bne     #0xd0aa6
000d0a88  ldr     r3, [pc, #0x58]
000d0a8a  ldr     r1, [pc, #0x5c]
000d0a8c  add     r3, pc ; -> 0x000fa2c8  OBJC_IVAR_$_DMGViewController.indicator
000d0a8e  add     r1, pc ; -> 0x000fcc50  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2d8
000d0a90  ldr     r3, [r3]
000d0a92  ldr     r1, [r1]
000d0a94  ldr     r0, [r5, r3]
000d0a96  blx     #0xddbfc ; -> objc_msgSend
000d0a9a  ldr     r1, [pc, #0x50]
000d0a9c  mov     r0, r5
000d0a9e  add     r1, pc ; -> 0x000fda38  'H \x0f'
000d0aa0  ldr     r1, [r1]
000d0aa2  blx     #0xddbfc ; -> objc_msgSend
000d0aa6  mov     r1, r6
000d0aa8  mov     r0, r8
000d0aaa  blx     #0xddbfc ; -> objc_msgSend
000d0aae  ldr     r4, [pc, #0x40]
000d0ab0  mov     r1, sl
000d0ab2  add     r4, pc ; -> 0x001827b4  
000d0ab4  mov     r2, r4
000d0ab6  mov     r3, r0
000d0ab8  mov     r0, fp
000d0aba  blx     #0xddbfc ; -> objc_msgSend
000d0abe  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0ac2  pop.w   {r8, sl, fp}
000d0ac6  pop     {r4, r5, r6, r7, pc}
000d0ac8  stm     r0!, {r1, r5, r6}
000d0aca  movs    r2, r0
000d0acc  bne     #0xd0b04
000d0ace  movs    r2, r0
000d0ad0  adds    r4, r2, #5
000d0ad2  movs    r3, r1
000d0ad4  stm     r1!, {r1, r2, r4, r5, r6}
000d0ad6  movs    r2, r0
000d0ad8  bne     #0xd0b9c
000d0ada  movs    r2, r0
000d0adc  ldr     r0, [sp, #0xb0]
000d0ade  movs    r2, r0
000d0ae0  ldm     r7, {r1, r3, r4, r5, r7}
000d0ae2  movs    r2, r0
000d0ae4  ldr     r0, [sp, #0xe0]
000d0ae6  movs    r2, r0
000d0ae8  stm     r1!, {r1, r2, r3, r4, r5, r7}
000d0aea  movs    r2, r0
000d0aec  ldm     r7, {r1, r2, r4, r7}
000d0aee  movs    r2, r0
000d0af0  adds    r6, r7, #3
000d0af2  movs    r3, r1
