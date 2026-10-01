========================================================================
-[DMGViewController webView  0x000d0b58  168 bytes   DMGViewController.mm
========================================================================

000d0b58  push    {r4, r5, r6, r7, lr}
000d0b5a  add     r7, sp, #0xc
000d0b5c  push.w  {r8, sl}
000d0b60  ldr     r1, [pc, #0x74]
000d0b62  mov     r5, r0
000d0b64  ldr     r0, [pc, #0x74]
000d0b66  ldr     r2, [pc, #0x78]
000d0b68  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0b6a  add     r0, pc ; -> 0x000fdb5c  
000d0b6c  add     r2, pc ; -> 0x001827d4  
000d0b6e  ldr     r1, [r1]
000d0b70  ldr     r0, [r0]
000d0b72  blx     #0xddbfc ; -> objc_msgSend
000d0b76  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0b7a  ldr     r1, [pc, #0x68]
000d0b7c  ldr     r6, [pc, #0x68]
000d0b7e  ldr     r2, [pc, #0x6c]
000d0b80  add     r1, pc ; -> 0x000fda70  '# \x0f'
000d0b82  add     r6, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0b84  ldr.w   sl, [r1]
000d0b88  ldr     r1, [pc, #0x64]
000d0b8a  ldr     r3, [r6]
000d0b8c  add     r2, pc ; -> 0x00182724  
000d0b8e  add     r1, pc ; -> 0x000fda84  '5\x15\x0f'
000d0b90  ldr     r4, [r1]
000d0b92  ldr     r0, [r5, r3]
000d0b94  mov     r1, r4
000d0b96  blx     #0xddbfc ; -> objc_msgSend
000d0b9a  ldr     r3, [r6]
000d0b9c  ldr     r2, [pc, #0x54]
000d0b9e  mov     r1, r4
000d0ba0  add     r2, pc ; -> 0x00182734  
000d0ba2  mov     r8, r0
000d0ba4  ldr     r0, [r5, r3]
000d0ba6  blx     #0xddbfc ; -> objc_msgSend
000d0baa  mov     r1, sl
000d0bac  mov     r2, r8
000d0bae  mov     r3, r0
000d0bb0  mov     r0, r5
000d0bb2  blx     #0xddbfc ; -> objc_msgSend
000d0bb6  ldr     r1, [pc, #0x40]
000d0bb8  mov     r0, r5
000d0bba  add     r1, pc ; -> 0x000fda6c  'p \x0f'
000d0bbc  ldr     r1, [r1]
000d0bbe  blx     #0xddbfc ; -> objc_msgSend
000d0bc2  ldr     r1, [pc, #0x38]
000d0bc4  ldr     r0, [r6]
000d0bc6  add     r1, pc ; -> 0x000fd8e4  '\x7f\x15\x0f'
000d0bc8  ldr     r0, [r5, r0]
000d0bca  ldr     r1, [r1]
000d0bcc  blx     #0xddbfc ; -> objc_msgSend
000d0bd0  pop.w   {r8, sl}
000d0bd4  pop     {r4, r5, r6, r7, pc}
000d0bd6  nop     
000d0bd8  ite     lo
000d0bda  movs    r2, r0
000d0bdc  ldmhs   r7, {r1, r2, r3, r5, r6, r7}
000d0bde  movs    r2, r0
000d0be0  adds    r4, r4, #1
000d0be2  movs    r3, r1
000d0be4  ldm     r6, {r2, r3, r5, r6, r7}
000d0be6  movs    r2, r0
000d0be8  str     r7, [sp, #0x78]
000d0bea  movs    r2, r0
000d0bec  subs    r4, r2, r6
000d0bee  movs    r3, r1
000d0bf0  ldm     r6, {r1, r4, r5, r6, r7}
000d0bf2  movs    r2, r0
000d0bf4  subs    r0, r2, r6
000d0bf6  movs    r3, r1
000d0bf8  ldm     r6!, {r1, r2, r3, r5, r7}
000d0bfa  movs    r2, r0
000d0bfc  ldm     r5!, {r1, r3, r4}
000d0bfe  movs    r2, r0
