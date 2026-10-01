========================================================================
-[FBLoginButton updateImage]  0x00084a20  120 bytes   FBLoginButton.m
========================================================================

00084a20  push    {r4, r7, lr}
00084a22  add     r7, sp, #4
00084a24  ldr     r1, [pc, #0x54]
00084a26  mov     r4, r0
00084a28  add     r1, pc ; -> 0x000fcd94  
00084a2a  ldr     r1, [r1]
00084a2c  blx     #0xddbfc ; -> objc_msgSend
00084a30  tst.w   r0, #0xff
00084a34  beq     #0x84a58
00084a36  ldr     r1, [pc, #0x48]
00084a38  mov     r0, r4
00084a3a  add     r1, pc ; -> 0x000fcda0  
00084a3c  ldr     r1, [r1]
00084a3e  blx     #0xddbfc ; -> objc_msgSend
00084a42  ldr     r3, [pc, #0x40]
00084a44  ldr     r1, [pc, #0x40]
00084a46  add     r3, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
00084a48  add     r1, pc ; -> 0x000fcd9c  
00084a4a  ldr     r1, [r1]
00084a4c  mov     r2, r0
00084a4e  ldr     r0, [r3]
00084a50  ldr     r0, [r4, r0]
00084a52  blx     #0xddbfc ; -> objc_msgSend
00084a56  pop     {r4, r7, pc}
00084a58  ldr     r1, [pc, #0x30]
00084a5a  mov     r0, r4
00084a5c  add     r1, pc ; -> 0x000fcd98  
00084a5e  ldr     r1, [r1]
00084a60  blx     #0xddbfc ; -> objc_msgSend
00084a64  ldr     r3, [pc, #0x28]
00084a66  ldr     r1, [pc, #0x2c]
00084a68  add     r3, pc ; -> 0x000f53ec  OBJC_IVAR_$_FBLoginButton._imageView
00084a6a  add     r1, pc ; -> 0x000fcd9c  
00084a6c  ldr     r1, [r1]
00084a6e  mov     r2, r0
00084a70  ldr     r0, [r3]
00084a72  ldr     r0, [r4, r0]
00084a74  blx     #0xddbfc ; -> objc_msgSend
00084a78  b       #0x84a56
00084a7a  nop     
00084a7c  strh    r0, [r5, #0x1a]
00084a7e  movs    r7, r0
00084a80  strh    r2, [r4, #0x1a]
00084a82  movs    r7, r0
00084a84  lsrs    r2, r4, #6
00084a86  movs    r7, r0
00084a88  strh    r0, [r2, #0x1a]
00084a8a  movs    r7, r0
00084a8c  strh    r0, [r7, #0x18]
00084a8e  movs    r7, r0
00084a90  lsrs    r0, r0, #6
00084a92  movs    r7, r0
00084a94  strh    r6, [r5, #0x18]
00084a96  movs    r7, r0
