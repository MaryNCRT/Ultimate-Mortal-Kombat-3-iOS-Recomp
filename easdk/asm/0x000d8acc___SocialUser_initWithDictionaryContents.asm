========================================================================
-[SocialUser initWithDictionaryContents  0x000d8acc  496 bytes   SocialUser.m
========================================================================

000d8acc  push    {r4, r5, r6, r7, lr}
000d8ace  add     r7, sp, #0xc
000d8ad0  push.w  {r8, sl}
000d8ad4  sub     sp, #8
000d8ad6  ldr     r3, [pc, #0x170]
000d8ad8  ldr     r1, [pc, #0x170]
000d8ada  str     r0, [sp]
000d8adc  add     r3, pc ; -> 0x000fddf0  
000d8ade  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d8ae0  ldr     r3, [r3]
000d8ae2  ldr     r1, [r1]
000d8ae4  mov     r0, sp
000d8ae6  mov     r6, r2
000d8ae8  str     r3, [sp, #4]
000d8aea  blx     #0xddc08 ; -> objc_msgSendSuper2
000d8aee  mov     r5, r0
000d8af0  cmp     r0, #0
000d8af2  beq.w   #0xd8c3c
000d8af6  ldr     r1, [pc, #0x158]
000d8af8  movs    r2, #0
000d8afa  mov     r0, r6
000d8afc  add     r1, pc ; -> 0x00181f84  
000d8afe  bl      #0xd8a8c ; -> getObject
000d8b02  ldr.w   r1, [pc, #0x150]
000d8b06  ldr     r4, [pc, #0x150]
000d8b08  add     r1, pc ; -> 0x000fd2d8  
000d8b0a  add     r4, pc ; -> 0x00181f94  
000d8b0c  ldr     r1, [r1]
000d8b0e  mov     r2, r0
000d8b10  mov     r0, r5
000d8b12  blx     #0xddbfc ; -> objc_msgSend
000d8b16  ldr     r0, [pc, #0x144]
000d8b18  ldr     r1, [pc, #0x144]
000d8b1a  movs    r2, #0
000d8b1c  add     r0, pc ; -> 0x000fdb48  
000d8b1e  add     r1, pc ; -> 0x000fd878  'P\x11\x0f'
000d8b20  ldr     r0, [r0]
000d8b22  ldr     r1, [r1]
000d8b24  blx     #0xddbfc ; -> objc_msgSend
000d8b28  mov     r1, r4
000d8b2a  ldr     r4, [pc, #0x138]
000d8b2c  add     r4, pc ; -> 0x0017ef54  
000d8b2e  mov     r2, r0
000d8b30  mov     r0, r6
000d8b32  bl      #0xd8a8c ; -> getObject
000d8b36  ldr     r1, [pc, #0x130]
000d8b38  add     r1, pc ; -> 0x000fd874  'C\x11\x0f'
000d8b3a  ldr     r1, [r1]
000d8b3c  blx     #0xddbfc ; -> objc_msgSend
000d8b40  ldr     r1, [pc, #0x128]
000d8b42  add     r1, pc ; -> 0x000fd2d4  
000d8b44  ldr     r1, [r1]
000d8b46  mov     r2, r0
000d8b48  mov     r0, r5
000d8b4a  blx     #0xddbfc ; -> objc_msgSend
000d8b4e  ldr     r1, [pc, #0x120]
000d8b50  movs    r2, #0
000d8b52  mov     r0, r6
000d8b54  add     r1, pc ; -> 0x00181fa4  
000d8b56  bl      #0xd8a8c ; -> getObject
000d8b5a  ldr     r1, [pc, #0x118]
000d8b5c  add     r1, pc ; -> 0x000fd2d0  
000d8b5e  ldr     r1, [r1]
000d8b60  mov     r2, r0
000d8b62  mov     r0, r5
000d8b64  blx     #0xddbfc ; -> objc_msgSend
000d8b68  ldr     r1, [pc, #0x10c]
000d8b6a  movs    r2, #0
000d8b6c  mov     r0, r6
000d8b6e  add     r1, pc ; -> 0x0017eef4  
000d8b70  bl      #0xd8a8c ; -> getObject
000d8b74  ldr     r1, [pc, #0x104]
000d8b76  add     r1, pc ; -> 0x000fd2cc  
000d8b78  ldr     r1, [r1]
000d8b7a  mov     r2, r0
000d8b7c  mov     r0, r5
000d8b7e  blx     #0xddbfc ; -> objc_msgSend
000d8b82  ldr     r1, [pc, #0xfc]
000d8b84  movs    r2, #0
000d8b86  mov     r0, r6
000d8b88  add     r1, pc ; -> 0x0017ef74  
000d8b8a  bl      #0xd8a8c ; -> getObject
000d8b8e  ldr     r1, [pc, #0xf4]
000d8b90  add     r1, pc ; -> 0x000fd2c8  
000d8b92  ldr     r1, [r1]
000d8b94  mov     r2, r0
000d8b96  mov     r0, r5
000d8b98  blx     #0xddbfc ; -> objc_msgSend
000d8b9c  ldr     r1, [pc, #0xe8]
000d8b9e  ldr     r0, [pc, #0xec]
000d8ba0  ldr     r2, [pc, #0xec]
000d8ba2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d8ba4  add     r0, pc ; -> 0x000fdb5c  
000d8ba6  ldr.w   r8, [r1]
000d8baa  ldr     r1, [pc, #0xe8]
000d8bac  ldr.w   sl, [r0]
000d8bb0  add     r2, pc ; -> 0x0017e974  
000d8bb2  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000d8bb4  mov     r0, r6
000d8bb6  ldr     r1, [r1]
000d8bb8  blx     #0xddbfc ; -> objc_msgSend
000d8bbc  mov     r2, r4
000d8bbe  mov     r1, r8
000d8bc0  mov     r3, r0
000d8bc2  mov     r0, sl
000d8bc4  blx     #0xddbfc ; -> objc_msgSend
000d8bc8  ldr     r1, [pc, #0xcc]
000d8bca  add     r1, pc ; -> 0x000fd2c4  
000d8bcc  ldr     r1, [r1]
000d8bce  mov     r2, r0
000d8bd0  mov     r0, r5
000d8bd2  blx     #0xddbfc ; -> objc_msgSend
000d8bd6  ldr     r1, [pc, #0xc4]
000d8bd8  ldr     r2, [pc, #0xc4]
000d8bda  mov     r0, r6
000d8bdc  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000d8bde  add     r2, pc ; -> 0x00181fb4  
000d8be0  ldr     r1, [r1]
000d8be2  blx     #0xddbfc ; -> objc_msgSend
000d8be6  mov     r4, r0
000d8be8  cbz     r0, #0xd8c18
000d8bea  ldr     r1, [pc, #0xb8]
000d8bec  ldr     r2, [pc, #0xb8]
000d8bee  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000d8bf0  add     r2, pc ; -> 0x00181fc4  
000d8bf2  ldr     r6, [r1]
000d8bf4  mov     r1, r6
000d8bf6  blx     #0xddbfc ; -> objc_msgSend
000d8bfa  tst.w   r0, #0xff
000d8bfe  beq     #0xd8c28
000d8c00  ldr     r1, [pc, #0xa8]
000d8c02  movs    r2, #0
000d8c04  mov     r0, r5
000d8c06  add     r1, pc ; -> 0x000fd2b0  
000d8c08  ldr     r1, [r1]
000d8c0a  b       #0xd8c22
000d8c0c  ldr     r1, [pc, #0xa0]
000d8c0e  movs    r2, #1
000d8c10  mov     r0, r5
000d8c12  add     r1, pc ; -> 0x000fd2b0  
000d8c14  ldr     r1, [r1]
000d8c16  b       #0xd8c22
000d8c18  ldr     r1, [pc, #0x98]
000d8c1a  movs    r2, #2
000d8c1c  mov     r0, r5
000d8c1e  add     r1, pc ; -> 0x000fd2b0  
000d8c20  ldr     r1, [r1]
000d8c22  blx     #0xddbfc ; -> objc_msgSend
000d8c26  b       #0xd8c3c
000d8c28  ldr     r2, [pc, #0x8c]
000d8c2a  mov     r0, r4
000d8c2c  mov     r1, r6
000d8c2e  add     r2, pc ; -> 0x00181fd4  
000d8c30  blx     #0xddbfc ; -> objc_msgSend
000d8c34  tst.w   r0, #0xff
000d8c38  beq     #0xd8c18
000d8c3a  b       #0xd8c0c
000d8c3c  mov     r0, r5
000d8c3e  sub.w   sp, r7, #0x14
000d8c42  pop.w   {r8, sl}
000d8c46  pop     {r4, r5, r6, r7, pc}
000d8c48  strh    r0, [r2, r4]
000d8c4a  movs    r2, r0
000d8c4c  subs    r6, #0x9e
000d8c4e  movs    r2, r0
000d8c50  str     r4, [sp, #0x210]
000d8c52  movs    r2, r1
000d8c54  blxns   sb
000d8c56  movs    r2, r0
000d8c58  str     r4, [sp, #0x218]
000d8c5a  movs    r2, r1
000d8c5c  str     r0, [r5, r0]
000d8c5e  movs    r2, r0
000d8c60  ldr     r5, [pc, #0x158]
000d8c62  movs    r2, r0
000d8c64  str     r4, [r4, #0x40]
000d8c66  movs    r2, r1
000d8c68  ldr     r5, [pc, #0xe0]
000d8c6a  movs    r2, r0
000d8c6c  blxns   r1
000d8c6e  movs    r2, r0
000d8c70  str     r4, [sp, #0x130]
000d8c72  movs    r2, r1
000d8c74  bx      lr
000d8c76  movs    r2, r0
000d8c78  str     r2, [r0, #0x38]
000d8c7a  movs    r2, r1
000d8c7c  bx      sl
000d8c7e  movs    r2, r0
000d8c80  str     r0, [r5, #0x3c]
000d8c82  movs    r2, r1
000d8c84  bxns    r6
000d8c86  movs    r2, r0
000d8c88  subs    r6, #0xfa
000d8c8a  movs    r2, r0
000d8c8c  ldr     r7, [pc, #0x2d0]
000d8c8e  movs    r2, r0
000d8c90  ldrb    r0, [r0, r7]
000d8c92  movs    r2, r1
000d8c94  subs    r7, #0x3a
000d8c96  movs    r2, r0
000d8c98  mov     lr, lr
000d8c9a  movs    r2, r0
000d8c9c  subs    r6, #0xf4
000d8c9e  movs    r2, r0
000d8ca0  str     r3, [sp, #0x348]
000d8ca2  movs    r2, r1
000d8ca4  eors    r2, r6
000d8ca6  movs    r2, r0
000d8ca8  str     r3, [sp, #0x340]
000d8caa  movs    r2, r1
000d8cac  mov     lr, r4
000d8cae  movs    r2, r0
000d8cb0  mov     sl, r3
000d8cb2  movs    r2, r0
000d8cb4  mov     lr, r1
000d8cb6  movs    r2, r0
000d8cb8  str     r3, [sp, #0x288]
000d8cba  movs    r2, r1
