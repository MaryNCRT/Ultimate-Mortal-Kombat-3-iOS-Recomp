========================================================================
-[DMGViewController SaveImage  0x000d0c00  332 bytes   DMGViewController.mm
========================================================================

000d0c00  push    {r4, r5, r6, r7, lr}
000d0c02  add     r7, sp, #0xc
000d0c04  push.w  {r8, sl, fp}
000d0c08  sub     sp, #0xc
000d0c0a  mov     r6, r2
000d0c0c  ldr     r2, [pc, #0x104]
000d0c0e  mov     fp, r3
000d0c10  ldr     r3, [pc, #0x104]
000d0c12  add     r2, pc ; -> 0x000fcdc8  
000d0c14  add     r0, sp, #4
000d0c16  add     r3, pc ; -> 0x00182764  
000d0c18  ldr     r2, [r2]
000d0c1a  mov     r1, r6
000d0c1c  blx     #0xddc14 ; -> objc_msgSend_stret
000d0c20  ldr     r3, [sp, #8]
000d0c22  cmp     r3, #0
000d0c24  beq     #0xd0d0a
000d0c26  ldr     r0, [pc, #0xf4]
000d0c28  ldr     r1, [pc, #0xf4]
000d0c2a  ldr     r4, [pc, #0xf8]
000d0c2c  add     r0, pc ; -> 0x000fdc2c  
000d0c2e  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d0c30  ldr     r0, [r0]
000d0c32  ldr     r1, [r1]
000d0c34  blx     #0xddbfc ; -> objc_msgSend
000d0c38  ldr     r1, [pc, #0xec]
000d0c3a  add     r4, pc ; -> 0x00182044  
000d0c3c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d0c3e  ldr     r5, [r1]
000d0c40  mov     sl, r0
000d0c42  ldr     r0, [pc, #0xe8]
000d0c44  add     r0, pc ; -> 0x000fdb5c  
000d0c46  ldr.w   r8, [r0]
000d0c4a  blx     #0xdd41c ; -> NSTemporaryDirectory
000d0c4e  mov     r2, r4
000d0c50  mov     r1, r5
000d0c52  str.w   fp, [sp]
000d0c56  mov     r3, r0
000d0c58  mov     r0, r8
000d0c5a  blx     #0xddbfc ; -> objc_msgSend
000d0c5e  ldr     r1, [pc, #0xd0]
000d0c60  add     r1, pc ; -> 0x000fcff4  
000d0c62  ldr     r1, [r1]
000d0c64  mov     r2, r0
000d0c66  mov     r0, sl
000d0c68  blx     #0xddbfc ; -> objc_msgSend
000d0c6c  uxtb    r4, r0
000d0c6e  cmp     r4, #0
000d0c70  bne     #0xd0d0a
000d0c72  cmp     r6, #0
000d0c74  beq     #0xd0cf4
000d0c76  ldr     r1, [pc, #0xbc]
000d0c78  mov     r0, r6
000d0c7a  mov     r2, r4
000d0c7c  add     r1, pc ; -> 0x000fcf24  
000d0c7e  ldr     r5, [r1]
000d0c80  mov     r1, r5
000d0c82  blx     #0xddbfc ; -> objc_msgSend
000d0c86  cmp     r0, #0x27
000d0c88  beq     #0xd0c98
000d0c8a  mov     r0, r6
000d0c8c  mov     r1, r5
000d0c8e  mov     r2, r4
000d0c90  blx     #0xddbfc ; -> objc_msgSend
000d0c94  cmp     r0, #0x22
000d0c96  bne     #0xd0ca8
000d0c98  ldr     r1, [pc, #0x9c]
000d0c9a  mov     r0, r6
000d0c9c  movs    r2, #1
000d0c9e  add     r1, pc ; -> 0x000fcdc4  
000d0ca0  ldr     r1, [r1]
000d0ca2  blx     #0xddbfc ; -> objc_msgSend
000d0ca6  mov     r6, r0
000d0ca8  ldr     r1, [pc, #0x90]
000d0caa  mov     r0, r6
000d0cac  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d0cae  ldr     r4, [r1]
000d0cb0  mov     r1, r4
000d0cb2  blx     #0xddbfc ; -> objc_msgSend
000d0cb6  mov     r1, r5
000d0cb8  subs    r2, r0, #1
000d0cba  mov     r0, r6
000d0cbc  blx     #0xddbfc ; -> objc_msgSend
000d0cc0  cmp     r0, #0x27
000d0cc2  beq     #0xd0cda
000d0cc4  mov     r1, r4
000d0cc6  mov     r0, r6
000d0cc8  blx     #0xddbfc ; -> objc_msgSend
000d0ccc  mov     r1, r5
000d0cce  subs    r2, r0, #1
000d0cd0  mov     r0, r6
000d0cd2  blx     #0xddbfc ; -> objc_msgSend
000d0cd6  cmp     r0, #0x22
000d0cd8  bne     #0xd0cf4
000d0cda  ldr     r1, [pc, #0x64]
000d0cdc  mov     r0, r6
000d0cde  add     r1, pc ; -> 0x000fd350  
000d0ce0  ldr     r5, [r1]
000d0ce2  mov     r1, r4
000d0ce4  blx     #0xddbfc ; -> objc_msgSend
000d0ce8  mov     r1, r5
000d0cea  subs    r2, r0, #1
000d0cec  mov     r0, r6
000d0cee  blx     #0xddbfc ; -> objc_msgSend
000d0cf2  mov     r6, r0
000d0cf4  ldr     r0, [pc, #0x4c]
000d0cf6  ldr     r1, [pc, #0x50]
000d0cf8  mov     r2, r6
000d0cfa  add     r0, pc ; -> 0x000f3308  gpImgLoader
000d0cfc  add     r1, pc ; -> 0x000fda0c  
000d0cfe  ldr     r0, [r0]
000d0d00  ldr     r1, [r1]
000d0d02  mov     r3, fp
000d0d04  ldr     r0, [r0]
000d0d06  blx     #0xddbfc ; -> objc_msgSend
000d0d0a  sub.w   sp, r7, #0x18
000d0d0e  pop.w   {r8, sl, fp}
000d0d12  pop     {r4, r5, r6, r7, pc}
000d0d14  stm     r1!, {r1, r4, r5, r7}
000d0d16  movs    r2, r0
000d0d18  subs    r2, r1, r5
000d0d1a  movs    r3, r1
000d0d1c  ldm     r7, {r2, r3, r4, r5, r6, r7}
000d0d1e  movs    r2, r0
000d0d20  stm     r3!, {r1, r2, r4, r6, r7}
000d0d22  movs    r2, r0
000d0d24  asrs    r6, r0, #0x10
000d0d26  movs    r3, r1
000d0d28  bkpt    #0x60
000d0d2a  movs    r2, r0
000d0d2c  ldm     r7!, {r2, r4}
000d0d2e  movs    r2, r0
000d0d30  stm     r3!, {r4, r7}
000d0d32  movs    r2, r0
000d0d34  stm     r2!, {r2, r5, r7}
000d0d36  movs    r2, r0
000d0d38  stm     r1!, {r1, r5}
000d0d3a  movs    r2, r0
000d0d3c  pop     {r3, r6, r7, pc}
000d0d3e  movs    r2, r0
000d0d40  stm     r6!, {r1, r2, r3, r5, r6}
000d0d42  movs    r2, r0
000d0d44  movs    r6, #0xa
000d0d46  movs    r2, r0
000d0d48  ldm     r5!, {r2, r3}
000d0d4a  movs    r2, r0
