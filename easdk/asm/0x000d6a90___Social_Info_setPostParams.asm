========================================================================
-[Social_Info setPostParams  0x000d6a90  340 bytes   Social_Info.mm
========================================================================

000d6a90  push    {r4, r5, r6, r7, lr}
000d6a92  add     r7, sp, #0xc
000d6a94  push.w  {r8, sl, fp}
000d6a98  sub     sp, #0x88
000d6a9a  mov     fp, r0
000d6a9c  str     r2, [sp, #0xc]
000d6a9e  cmp     r2, #0
000d6aa0  beq     #0xd6b84
000d6aa2  ldr     r1, [pc, #0x10c]
000d6aa4  mov     r0, r2
000d6aa6  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000d6aa8  ldr     r1, [r1]
000d6aaa  blx     #0xddbfc ; -> objc_msgSend
000d6aae  cmp     r0, #0
000d6ab0  beq     #0xd6b84
000d6ab2  ldr     r1, [pc, #0x100]
000d6ab4  ldr     r0, [sp, #0xc]
000d6ab6  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000d6ab8  ldr     r1, [r1]
000d6aba  blx     #0xddbfc ; -> objc_msgSend
000d6abe  ldr     r3, [pc, #0xf8]
000d6ac0  ldr     r1, [pc, #0xf8]
000d6ac2  ldr     r2, [pc, #0xfc]
000d6ac4  add     r3, pc ; -> 0x000fae6c  OBJC_IVAR_$_Social_Info.params
000d6ac6  add     r1, pc ; -> 0x000fc998  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x20
000d6ac8  ldr     r3, [r3]
000d6aca  ldr     r1, [r1]
000d6acc  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000d6ace  str.w   r2, [fp, r3]
000d6ad2  movs    r3, #0
000d6ad4  add     r2, sp, #0x68
000d6ad6  str     r3, [sp, #0x68]
000d6ad8  str     r3, [sp, #0x6c]
000d6ada  str     r3, [sp, #0x70]
000d6adc  str     r3, [sp, #0x74]
000d6ade  str     r3, [sp, #0x78]
000d6ae0  str     r3, [sp, #0x7c]
000d6ae2  str     r3, [sp, #0x80]
000d6ae4  str     r3, [sp, #0x84]
000d6ae6  adds    r3, #0x10
000d6ae8  str     r3, [sp]
000d6aea  add     r3, sp, #0x28
000d6aec  str     r1, [sp, #0x10]
000d6aee  str     r0, [sp, #0x1c]
000d6af0  blx     #0xddbfc ; -> objc_msgSend
000d6af4  cmp     r0, #0
000d6af6  beq     #0xd6b84
000d6af8  ldr     r1, [pc, #0xc8]
000d6afa  ldr     r3, [sp, #0x70]
000d6afc  add     r1, pc ; -> 0x000fd658  
000d6afe  ldr     r1, [r1]
000d6b00  ldr     r2, [r3]
000d6b02  str     r0, [sp, #0x20]
000d6b04  str     r1, [sp, #0x14]
000d6b06  ldr     r1, [pc, #0xc0]
000d6b08  str     r2, [sp, #0x24]
000d6b0a  ldr     r2, [pc, #0xc0]
000d6b0c  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d6b0e  ldr     r1, [r1]
000d6b10  str     r2, [sp, #4]
000d6b12  ldr     r2, [pc, #0xbc]
000d6b14  str     r1, [sp, #0x18]
000d6b16  str     r2, [sp, #8]
000d6b18  b       #0xd6b1c
000d6b1a  ldr     r3, [sp, #0x70]
000d6b1c  mov.w   sl, #0
000d6b20  b       #0xd6b24
000d6b22  ldr     r3, [sp, #0x70]
000d6b24  ldr     r3, [r3]
000d6b26  ldr     r2, [sp, #0x24]
000d6b28  cmp     r3, r2
000d6b2a  beq     #0xd6b32
000d6b2c  ldr     r0, [sp, #0x1c]
000d6b2e  blx     #0xddbe4 ; -> objc_enumerationMutation
000d6b32  ldr     r2, [sp, #0x6c]
000d6b34  ldr     r3, [sp, #4]
000d6b36  ldr     r1, [sp, #0x18]
000d6b38  ldr     r0, [sp, #0xc]
000d6b3a  add     r3, pc
000d6b3c  ldr.w   r5, [r2, sl, lsl #2]
000d6b40  ldr.w   r8, [r3]
000d6b44  ldr     r6, [sp, #8]
000d6b46  add.w   sl, sl, #1
000d6b4a  mov     r2, r5
000d6b4c  ldr.w   r4, [fp, r8]
000d6b50  blx     #0xddbfc ; -> objc_msgSend
000d6b54  add     r6, pc
000d6b56  mov     r3, r5
000d6b58  ldr     r1, [sp, #0x14]
000d6b5a  mov     r2, r6
000d6b5c  str     r0, [sp]
000d6b5e  mov     r0, r4
000d6b60  blx     #0xddbfc ; -> objc_msgSend
000d6b64  ldr     r3, [sp, #0x20]
000d6b66  cmp     r3, sl
000d6b68  str.w   r0, [fp, r8]
000d6b6c  bhi     #0xd6b22
000d6b6e  movs    r3, #0x10
000d6b70  ldr     r0, [sp, #0x1c]
000d6b72  str     r3, [sp]
000d6b74  ldr     r1, [sp, #0x10]
000d6b76  add     r2, sp, #0x68
000d6b78  add     r3, sp, #0x28
000d6b7a  blx     #0xddbfc ; -> objc_msgSend
000d6b7e  str     r0, [sp, #0x20]
000d6b80  cmp     r0, #0
000d6b82  bne     #0xd6b1a
000d6b84  ldr     r3, [pc, #0x4c]
000d6b86  ldr     r0, [pc, #0x50]
000d6b88  ldr     r1, [pc, #0x50]
000d6b8a  add     r3, pc ; -> 0x000fae6c  OBJC_IVAR_$_Social_Info.params
000d6b8c  ldr     r2, [pc, #0x50]
000d6b8e  ldr     r3, [r3]
000d6b90  add     r0, pc ; -> 0x000fdb5c  
000d6b92  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d6b94  add     r2, pc ; -> 0x00181c74  
000d6b96  ldr     r1, [r1]
000d6b98  ldr.w   r3, [fp, r3]
000d6b9c  ldr     r0, [r0]
000d6b9e  blx     #0xddbfc ; -> objc_msgSend
000d6ba2  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d6ba6  sub.w   sp, r7, #0x18
000d6baa  pop.w   {r8, sl, fp}
000d6bae  pop     {r4, r5, r6, r7, pc}
000d6bb0  ldrsh   r6, [r2, r7]
000d6bb2  movs    r2, r0
000d6bb4  str     r6, [r6, #0x38]
000d6bb6  movs    r2, r0
000d6bb8  bics    r4, r4
000d6bba  movs    r2, r0
000d6bbc  ldrsh   r6, [r1, r3]
000d6bbe  movs    r2, r0
000d6bc0  ldrb    r4, [r4]
000d6bc2  movs    r2, r1
000d6bc4  ldr     r0, [r3, #0x34]
000d6bc6  movs    r2, r0
000d6bc8  ldrsh   r0, [r4, r7]
000d6bca  movs    r2, r0
000d6bcc  orrs    r6, r5
000d6bce  movs    r2, r0
000d6bd0  cbz     r4, #0xd6bd6
000d6bd2  movs    r2, r1
000d6bd4  cmn     r6, r3
000d6bd6  movs    r2, r0
000d6bd8  ldr     r0, [r1, #0x7c]
000d6bda  movs    r2, r0
000d6bdc  ldrsh   r2, [r1, r4]
000d6bde  movs    r2, r0
000d6be0  sub     sp, #0x170
000d6be2  movs    r2, r1
