========================================================================
-[FBLoginButton buttonHighlightedImage]  0x00084a98  160 bytes   FBLoginButton.m
========================================================================

00084a98  push    {r4, r7, lr}
00084a9a  add     r7, sp, #4
00084a9c  ldr     r3, [pc, #0x68]
00084a9e  ldr     r1, [pc, #0x6c]
00084aa0  mov     r4, r0
00084aa2  add     r3, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
00084aa4  add     r1, pc ; -> 0x000fcda4  
00084aa6  ldr     r3, [r3]
00084aa8  ldr     r1, [r1]
00084aaa  ldr     r0, [r0, r3]
00084aac  blx     #0xddbfc ; -> objc_msgSend
00084ab0  uxtb    r2, r0
00084ab2  cbnz    r2, #0x84ad4
00084ab4  ldr     r3, [pc, #0x58]
00084ab6  add     r3, pc ; -> 0x000f53e4  OBJC_IVAR_$_FBLoginButton._style
00084ab8  ldr     r0, [r3]
00084aba  ldr     r0, [r4, r0]
00084abc  cbnz    r0, #0x84aea
00084abe  ldr     r0, [pc, #0x54]
00084ac0  ldr     r1, [pc, #0x54]
00084ac2  ldr     r2, [pc, #0x58]
00084ac4  add     r0, pc ; -> 0x000fdba8  
00084ac6  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084ac8  ldr     r0, [r0]
00084aca  add     r2, pc ; -> 0x0017e924  
00084acc  ldr     r1, [r1]
00084ace  blx     #0xddbfc ; -> objc_msgSend
00084ad2  pop     {r4, r7, pc}
00084ad4  ldr     r0, [pc, #0x48]
00084ad6  ldr     r1, [pc, #0x4c]
00084ad8  ldr     r2, [pc, #0x4c]
00084ada  add     r0, pc ; -> 0x000fdba8  
00084adc  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084ade  add     r2, pc ; -> 0x0017e914  
00084ae0  ldr     r1, [r1]
00084ae2  ldr     r0, [r0]
00084ae4  blx     #0xddbfc ; -> objc_msgSend
00084ae8  b       #0x84ad2
00084aea  cmp     r0, #1
00084aec  it      ne
00084aee  movne   r0, r2
00084af0  bne     #0x84ad2
00084af2  ldr     r0, [pc, #0x38]
00084af4  ldr     r1, [pc, #0x38]
00084af6  ldr     r2, [pc, #0x3c]
00084af8  add     r0, pc ; -> 0x000fdba8  
00084afa  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084afc  add     r2, pc ; -> 0x0017e934  
00084afe  ldr     r1, [r1]
00084b00  ldr     r0, [r0]
00084b02  blx     #0xddbfc ; -> objc_msgSend
00084b06  b       #0x84ad2
00084b08  lsrs    r2, r0, #5
00084b0a  movs    r7, r0
00084b0c  strh    r4, [r7, #0x16]
00084b0e  movs    r7, r0
00084b10  lsrs    r2, r5, #4
00084b12  movs    r7, r0
00084b14  str     r0, [sp, #0x380]
00084b16  movs    r7, r0
00084b18  strh    r6, [r5, #0xe]
00084b1a  movs    r7, r0
00084b1c  ldr     r6, [sp, #0x158]
00084b1e  movs    r7, r1
00084b20  str     r0, [sp, #0x328]
00084b22  movs    r7, r0
00084b24  strh    r0, [r3, #0xe]
00084b26  movs    r7, r0
00084b28  ldr     r6, [sp, #0xc8]
00084b2a  movs    r7, r1
00084b2c  str     r0, [sp, #0x2b0]
00084b2e  movs    r7, r0
00084b30  strh    r2, [r7, #0xc]
00084b32  movs    r7, r0
00084b34  ldr     r6, [sp, #0xd0]
00084b36  movs    r7, r1
