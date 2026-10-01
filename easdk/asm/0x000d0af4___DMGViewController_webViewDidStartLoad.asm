========================================================================
-[DMGViewController webViewDidStartLoad  0x000d0af4  100 bytes   DMGViewController.mm
========================================================================

000d0af4  push    {r4, r5, r6, r7, lr}
000d0af6  add     r7, sp, #0xc
000d0af8  str     r8, [sp, #-0x4]!
000d0afc  ldr     r1, [pc, #0x40]
000d0afe  mov     r8, r0
000d0b00  ldr     r0, [pc, #0x40]
000d0b02  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0b04  ldr     r4, [pc, #0x40]
000d0b06  add     r0, pc ; -> 0x000fdb5c  
000d0b08  ldr     r5, [r1]
000d0b0a  ldr     r6, [r0]
000d0b0c  ldr     r1, [pc, #0x3c]
000d0b0e  ldr     r0, [pc, #0x40]
000d0b10  add     r4, pc ; -> 0x001827c4  
000d0b12  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d0b14  add     r0, pc ; -> 0x000fdbb4  
000d0b16  ldr     r1, [r1]
000d0b18  ldr     r0, [r0]
000d0b1a  blx     #0xddbfc ; -> objc_msgSend
000d0b1e  mov     r2, r4
000d0b20  mov     r1, r5
000d0b22  mov     r3, r0
000d0b24  mov     r0, r6
000d0b26  blx     #0xddbfc ; -> objc_msgSend
000d0b2a  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0b2e  ldr     r3, [pc, #0x24]
000d0b30  movs    r2, #1
000d0b32  add     r3, pc ; -> 0x000fa2b4  OBJC_IVAR_$_DMGViewController.webLoadingStarted
000d0b34  ldr     r3, [r3]
000d0b36  strb.w  r2, [r8, r3]
000d0b3a  ldr     r8, [sp], #4
000d0b3e  pop     {r4, r5, r6, r7, pc}
000d0b40  itte    ls
000d0b42  movs    r2, r0
000d0b44  bls     #0xd0bec
000d0b46  movs    r2, r0
000d0b48  adds    r0, r6, #2
000d0b4a  movs    r3, r1
000d0b4c  stm     r0!, {r1, r4, r5, r7}
000d0b4e  movs    r2, r0
000d0b50  beq     #0xd0a8c
000d0b52  movs    r2, r0
000d0b54  str     r7, [sp, #0x1f8]
000d0b56  movs    r2, r0
