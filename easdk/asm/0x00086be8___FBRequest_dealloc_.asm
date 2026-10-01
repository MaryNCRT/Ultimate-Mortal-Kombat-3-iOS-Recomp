========================================================================
-[FBRequest dealloc]  0x00086be8  200 bytes   FBRequest.m
========================================================================

00086be8  push    {r4, r5, r7, lr}
00086bea  add     r7, sp, #8
00086bec  sub     sp, #8
00086bee  ldr     r4, [pc, #0x94]
00086bf0  ldr     r1, [pc, #0x94]
00086bf2  mov     r5, r0
00086bf4  add     r4, pc ; -> 0x000f59dc  OBJC_IVAR_$_FBRequest._connection
00086bf6  add     r1, pc ; -> 0x000fcc9c  'p$\x0e'
00086bf8  ldr     r3, [r4]
00086bfa  ldr     r1, [r1]
00086bfc  ldr     r0, [r0, r3]
00086bfe  blx     #0xddbfc ; -> objc_msgSend
00086c02  ldr     r1, [pc, #0x88]
00086c04  ldr     r3, [r4]
00086c06  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
00086c08  ldr     r4, [r1]
00086c0a  ldr     r0, [r5, r3]
00086c0c  mov     r1, r4
00086c0e  blx     #0xddbfc ; -> objc_msgSend
00086c12  ldr     r3, [pc, #0x7c]
00086c14  mov     r1, r4
00086c16  add     r3, pc ; -> 0x000f59e0  OBJC_IVAR_$_FBRequest._responseText
00086c18  ldr     r3, [r3]
00086c1a  ldr     r0, [r5, r3]
00086c1c  blx     #0xddbfc ; -> objc_msgSend
00086c20  ldr     r3, [pc, #0x70]
00086c22  mov     r1, r4
00086c24  add     r3, pc ; -> 0x000f59c8  OBJC_IVAR_$_FBRequest._url
00086c26  ldr     r3, [r3]
00086c28  ldr     r0, [r5, r3]
00086c2a  blx     #0xddbfc ; -> objc_msgSend
00086c2e  ldr     r3, [pc, #0x68]
00086c30  mov     r1, r4
00086c32  add     r3, pc ; -> 0x000f59cc  OBJC_IVAR_$_FBRequest._method
00086c34  ldr     r3, [r3]
00086c36  ldr     r0, [r5, r3]
00086c38  blx     #0xddbfc ; -> objc_msgSend
00086c3c  ldr     r3, [pc, #0x5c]
00086c3e  mov     r1, r4
00086c40  add     r3, pc ; -> 0x000f59d0  OBJC_IVAR_$_FBRequest._params
00086c42  ldr     r3, [r3]
00086c44  ldr     r0, [r5, r3]
00086c46  blx     #0xddbfc ; -> objc_msgSend
00086c4a  ldr     r3, [pc, #0x54]
00086c4c  mov     r1, r4
00086c4e  add     r3, pc ; -> 0x000f59bc  OBJC_IVAR_$_FBRequest._userInfo
00086c50  ldr     r3, [r3]
00086c52  ldr     r0, [r5, r3]
00086c54  blx     #0xddbfc ; -> objc_msgSend
00086c58  ldr     r3, [pc, #0x48]
00086c5a  mov     r1, r4
00086c5c  add     r3, pc ; -> 0x000f59d8  OBJC_IVAR_$_FBRequest._timestamp
00086c5e  ldr     r3, [r3]
00086c60  ldr     r0, [r5, r3]
00086c62  blx     #0xddbfc ; -> objc_msgSend
00086c66  ldr     r3, [pc, #0x40]
00086c68  ldr     r1, [pc, #0x40]
00086c6a  mov     r0, sp
00086c6c  add     r3, pc ; -> 0x000fdd48  
00086c6e  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
00086c70  ldr     r3, [r3]
00086c72  ldr     r1, [r1]
00086c74  str     r5, [sp]
00086c76  str     r3, [sp, #4]
00086c78  blx     #0xddc08 ; -> objc_msgSendSuper2
00086c7c  sub.w   sp, r7, #8
00086c80  pop     {r4, r5, r7, pc}
00086c82  nop     
00086c84  stcl    p0, c0, [r4, #0x18]!
00086c88  str     r2, [r4, #8]
00086c8a  movs    r7, r0
00086c8c  ldrb    r2, [r6, r5]
00086c8e  movs    r7, r0
00086c90  stcl    p0, c0, [r6, #0x18]
00086c94  stc     p0, c0, [r0, #0x18]!
00086c98  ldc     p0, c0, [r6, #0x18]
00086c9c  stc     p0, c0, [ip, #0x18]
00086ca0  stcl    p0, c0, [sl, #-0x18]!
00086ca4  ldcl    p0, c0, [r8, #-0x18]!
00086ca8  strb    r0, [r3, #3]
00086caa  movs    r7, r0
00086cac  ldrb    r6, [r5, r4]
00086cae  movs    r7, r0
