========================================================================
-[FBLoginButton accessibilityTraits]  0x00084bd8  116 bytes   FBLoginButton.m
========================================================================

00084bd8  push    {r4, r5, r7, lr}
00084bda  add     r7, sp, #8
00084bdc  sub     sp, #8
00084bde  ldr     r5, [pc, #0x54]
00084be0  add     r5, pc ; -> 0x006bc120  traitImage
00084be2  ldr     r3, [r5]
00084be4  cbz     r3, #0x84c1c
00084be6  ldr     r4, [pc, #0x50]
00084be8  add     r4, pc ; -> 0x006bc124  traitButton
00084bea  ldr     r3, [r4]
00084bec  cbz     r3, #0x84c1c
00084bee  ldr     r3, [pc, #0x4c]
00084bf0  ldr     r1, [pc, #0x4c]
00084bf2  str     r0, [sp]
00084bf4  add     r3, pc ; -> 0x000fdd3c  
00084bf6  add     r1, pc ; -> 0x000fcd64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ec
00084bf8  ldr     r3, [r3]
00084bfa  ldr     r1, [r1]
00084bfc  mov     r0, sp
00084bfe  str     r3, [sp, #4]
00084c00  blx     #0xddc08 ; -> objc_msgSendSuper2
00084c04  ldr     r3, [r4]
00084c06  ldr     r2, [r5]
00084c08  ldm.w   r3, {r4, r5}
00084c0c  ldm     r2, {r2, r3}
00084c0e  orrs    r2, r4
00084c10  orrs    r3, r5
00084c12  orrs    r0, r2
00084c14  orrs    r1, r3
00084c16  sub.w   sp, r7, #8
00084c1a  pop     {r4, r5, r7, pc}
00084c1c  ldr     r3, [pc, #0x24]
00084c1e  ldr     r1, [pc, #0x28]
00084c20  str     r0, [sp]
00084c22  add     r3, pc ; -> 0x000fdd3c  
00084c24  add     r1, pc ; -> 0x000fcd64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ec
00084c26  ldr     r3, [r3]
00084c28  mov     r0, sp
00084c2a  ldr     r1, [r1]
00084c2c  str     r3, [sp, #4]
00084c2e  blx     #0xddc08 ; -> objc_msgSendSuper2
00084c32  b       #0x84c16
00084c34  strb    r4, [r7, #0x14]
00084c36  lsls    r3, r4, #1
00084c38  strb    r0, [r7, #0x14]
00084c3a  lsls    r3, r4, #1
00084c3c  str     r1, [sp, #0x110]
00084c3e  movs    r7, r0
00084c40  strh    r2, [r5, #0xa]
00084c42  movs    r7, r0
00084c44  str     r1, [sp, #0x58]
00084c46  movs    r7, r0
00084c48  strh    r4, [r7, #8]
00084c4a  movs    r7, r0
