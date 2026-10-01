========================================================================
-[Social_Info savePrevFBUid  0x000d6c70  220 bytes   Social_Info.mm
========================================================================

000d6c70  push    {r4, r5, r6, r7, lr}
000d6c72  add     r7, sp, #0xc
000d6c74  push.w  {r8, sl}
000d6c78  sub     sp, #4
000d6c7a  ldr     r0, [pc, #0xa0]
000d6c7c  ldr     r1, [pc, #0xa0]
000d6c7e  mov     r4, r2
000d6c80  add     r0, pc ; -> 0x000fdb5c  
000d6c82  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6c84  ldr.w   r8, [r0]
000d6c88  ldr     r6, [r1]
000d6c8a  ldr     r2, [pc, #0x98]
000d6c8c  mov     r3, r4
000d6c8e  mov     r0, r8
000d6c90  add     r2, pc ; -> 0x00181ca4  
000d6c92  mov     r1, r6
000d6c94  blx     #0xddbfc ; -> objc_msgSend
000d6c98  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6c9c  ldr     r0, [pc, #0x88]
000d6c9e  ldr     r1, [pc, #0x8c]
000d6ca0  mov     r2, r4
000d6ca2  add     r0, pc ; -> 0x000fdb88  
000d6ca4  add     r1, pc ; -> 0x000fcadc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x164
000d6ca6  ldr     r0, [r0]
000d6ca8  ldr     r1, [r1]
000d6caa  blx     #0xddbfc ; -> objc_msgSend
000d6cae  ldr     r1, [pc, #0x80]
000d6cb0  ldr     r4, [pc, #0x80]
000d6cb2  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d6cb4  add     r4, pc ; -> 0x00181c94  
000d6cb6  ldr     r1, [r1]
000d6cb8  mov     r5, r0
000d6cba  ldr     r0, [pc, #0x7c]
000d6cbc  add     r0, pc ; -> 0x000fdc2c  
000d6cbe  ldr     r0, [r0]
000d6cc0  blx     #0xddbfc ; -> objc_msgSend
000d6cc4  mov     sl, r0
000d6cc6  blx     #0xdd41c ; -> NSTemporaryDirectory
000d6cca  mov     r2, r4
000d6ccc  mov     r1, r6
000d6cce  mov     r3, r0
000d6cd0  mov     r0, r8
000d6cd2  blx     #0xddbfc ; -> objc_msgSend
000d6cd6  mov     r4, r0
000d6cd8  cbz     r5, #0xd6d10
000d6cda  ldr     r1, [pc, #0x60]
000d6cdc  mov     r0, r5
000d6cde  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d6ce0  ldr     r1, [r1]
000d6ce2  blx     #0xddbfc ; -> objc_msgSend
000d6ce6  cbz     r0, #0xd6d10
000d6ce8  ldr     r1, [pc, #0x54]
000d6cea  movs    r3, #0
000d6cec  mov     r0, sl
000d6cee  add     r1, pc ; -> 0x000fd218  
000d6cf0  str     r3, [sp]
000d6cf2  ldr     r1, [r1]
000d6cf4  mov     r2, r4
000d6cf6  mov     r3, r5
000d6cf8  blx     #0xddbfc ; -> objc_msgSend
000d6cfc  tst.w   r0, #0xff
000d6d00  beq     #0xd6d08
000d6d02  ldr     r0, [pc, #0x40]
000d6d04  add     r0, pc ; -> 0x00181cb4  
000d6d06  b       #0xd6d0c
000d6d08  ldr     r0, [pc, #0x3c]
000d6d0a  add     r0, pc ; -> 0x00181cc4  
000d6d0c  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6d10  sub.w   sp, r7, #0x14
000d6d14  pop.w   {r8, sl}
000d6d18  pop     {r4, r5, r6, r7, pc}
000d6d1a  nop     
000d6d1c  ldr     r0, [r3, #0x6c]
000d6d1e  movs    r2, r0
000d6d20  ldrsh   r2, [r3, r0]
000d6d22  movs    r2, r0
000d6d24  add     sp, #0x40
000d6d26  movs    r2, r1
000d6d28  ldr     r2, [r4, #0x6c]
000d6d2a  movs    r2, r0
000d6d2c  ldrsh   r4, [r6, r0]
000d6d2e  movs    r2, r0
000d6d30  str     r2, [r2, #0x34]
000d6d32  movs    r2, r0
000d6d34  add     r7, sp, #0x370
000d6d36  movs    r2, r1
000d6d38  ldr     r4, [r5, #0x74]
000d6d3a  movs    r2, r0
000d6d3c  ldrb    r6, [r2, r6]
000d6d3e  movs    r2, r0
000d6d40  str     r6, [r4, #0x50]
000d6d42  movs    r2, r0
000d6d44  add     r7, sp, #0x2b0
000d6d46  movs    r2, r1
000d6d48  add     r7, sp, #0x2d8
000d6d4a  movs    r2, r1
