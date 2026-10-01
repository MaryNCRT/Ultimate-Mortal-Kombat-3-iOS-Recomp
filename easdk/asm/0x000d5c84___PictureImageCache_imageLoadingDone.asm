========================================================================
-[PictureImageCache imageLoadingDone  0x000d5c84  236 bytes   PictureImageCache.m
========================================================================

000d5c84  push    {r4, r5, r6, r7, lr}
000d5c86  add     r7, sp, #0xc
000d5c88  push.w  {r8, sl}
000d5c8c  sub     sp, #4
000d5c8e  ldr     r1, [pc, #0xac]
000d5c90  mov     r4, r2
000d5c92  ldr     r2, [pc, #0xac]
000d5c94  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d5c96  mov     sl, r0
000d5c98  ldr     r5, [r1]
000d5c9a  add     r2, pc ; -> 0x00182654  
000d5c9c  mov     r0, r4
000d5c9e  mov     r1, r5
000d5ca0  blx     #0xddbfc ; -> objc_msgSend
000d5ca4  ldr     r2, [pc, #0x9c]
000d5ca6  mov     r1, r5
000d5ca8  add     r2, pc ; -> 0x00182664  
000d5caa  mov     r6, r0
000d5cac  mov     r0, r4
000d5cae  blx     #0xddbfc ; -> objc_msgSend
000d5cb2  blx     #0xdd3f8 ; -> NSSelectorFromString
000d5cb6  ldr     r1, [pc, #0x90]
000d5cb8  movs    r3, #0
000d5cba  str     r3, [sp]
000d5cbc  add     r1, pc ; -> 0x000fca38  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc0
000d5cbe  mov     r3, r4
000d5cc0  ldr     r1, [r1]
000d5cc2  mov     r2, r0
000d5cc4  mov     r0, r6
000d5cc6  blx     #0xddbfc ; -> objc_msgSend
000d5cca  ldr     r2, [pc, #0x80]
000d5ccc  mov     r1, r5
000d5cce  mov     r0, r4
000d5cd0  add     r2, pc ; -> 0x000f32ec  OperationImageKey
000d5cd2  ldr     r2, [r2]
000d5cd4  ldr     r2, [r2]
000d5cd6  blx     #0xddbfc ; -> objc_msgSend
000d5cda  ldr     r1, [pc, #0x74]
000d5cdc  blx     #0xdd494 ; -> UIImageJPEGRepresentation
000d5ce0  ldr     r1, [pc, #0x70]
000d5ce2  add     r1, pc ; -> 0x000fd9f8  
000d5ce4  ldr     r1, [r1]
000d5ce6  mov     r8, r0
000d5ce8  mov     r0, sl
000d5cea  blx     #0xddbfc ; -> objc_msgSend
000d5cee  ldr     r2, [pc, #0x68]
000d5cf0  mov     r1, r5
000d5cf2  add     r2, pc ; -> 0x00182674  
000d5cf4  mov     r6, r0
000d5cf6  mov     r0, r4
000d5cf8  blx     #0xddbfc ; -> objc_msgSend
000d5cfc  ldr     r1, [pc, #0x5c]
000d5cfe  ldr     r2, [pc, #0x60]
000d5d00  add     r1, pc ; -> 0x000fcba4  ']\x1f\x0e'
000d5d02  add     r2, pc ; -> 0x00182644  
000d5d04  ldr     r4, [r1]
000d5d06  ldr     r1, [pc, #0x5c]
000d5d08  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d5d0a  ldr     r1, [r1]
000d5d0c  mov     r3, r0
000d5d0e  ldr     r0, [pc, #0x58]
000d5d10  add     r0, pc ; -> 0x000fdb5c  
000d5d12  ldr     r0, [r0]
000d5d14  blx     #0xddbfc ; -> objc_msgSend
000d5d18  mov     r1, r4
000d5d1a  mov     r2, r0
000d5d1c  mov     r0, r6
000d5d1e  blx     #0xddbfc ; -> objc_msgSend
000d5d22  ldr     r1, [pc, #0x48]
000d5d24  movs    r3, #1
000d5d26  add     r1, pc ; -> 0x000fcb5c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x1e4
000d5d28  ldr     r1, [r1]
000d5d2a  mov     r2, r0
000d5d2c  mov     r0, r8
000d5d2e  blx     #0xddbfc ; -> objc_msgSend
000d5d32  sub.w   sp, r7, #0x14
000d5d36  pop.w   {r8, sl}
000d5d3a  pop     {r4, r5, r6, r7, pc}
000d5d3c  ldr     r4, [r7, #0x60]
000d5d3e  movs    r2, r0
000d5d40  ldm     r1, {r1, r2, r4, r5, r7}
000d5d42  movs    r2, r1
000d5d44  ldm     r1!, {r3, r4, r5, r7}
000d5d46  movs    r2, r1
000d5d48  ldr     r0, [r7, #0x54]
000d5d4a  movs    r2, r0
000d5d4c  bvs     #0xd5d80
000d5d4e  movs    r1, r0
000d5d50  ldm     r4!, {r0, r2, r3, r6, r7}
000d5d52  subs    r7, #0x4c
000d5d54  ldrb    r2, [r2, #0x14]
000d5d56  movs    r2, r0
000d5d58  ldm     r1, {r1, r2, r3, r4, r5, r6}
000d5d5a  movs    r2, r1
000d5d5c  ldr     r0, [r4, #0x68]
000d5d5e  movs    r2, r0
000d5d60  ldm     r1, {r1, r2, r3, r4, r5}
000d5d62  movs    r2, r1
000d5d64  ldr     r4, [r2, #0x58]
000d5d66  movs    r2, r0
000d5d68  ldrb    r0, [r1, #0x19]
000d5d6a  movs    r2, r0
000d5d6c  ldr     r2, [r6, #0x60]
000d5d6e  movs    r2, r0
