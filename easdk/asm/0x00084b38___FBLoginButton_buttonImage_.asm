========================================================================
-[FBLoginButton buttonImage]  0x00084b38  160 bytes   FBLoginButton.m
========================================================================

00084b38  push    {r4, r7, lr}
00084b3a  add     r7, sp, #4
00084b3c  ldr     r3, [pc, #0x68]
00084b3e  ldr     r1, [pc, #0x6c]
00084b40  mov     r4, r0
00084b42  add     r3, pc ; -> 0x000f53e8  OBJC_IVAR_$_FBLoginButton._session
00084b44  add     r1, pc ; -> 0x000fcda4  
00084b46  ldr     r3, [r3]
00084b48  ldr     r1, [r1]
00084b4a  ldr     r0, [r0, r3]
00084b4c  blx     #0xddbfc ; -> objc_msgSend
00084b50  uxtb    r2, r0
00084b52  cbnz    r2, #0x84b74
00084b54  ldr     r3, [pc, #0x58]
00084b56  add     r3, pc ; -> 0x000f53e4  OBJC_IVAR_$_FBLoginButton._style
00084b58  ldr     r0, [r3]
00084b5a  ldr     r0, [r4, r0]
00084b5c  cbnz    r0, #0x84b8a
00084b5e  ldr     r0, [pc, #0x54]
00084b60  ldr     r1, [pc, #0x54]
00084b62  ldr     r2, [pc, #0x58]
00084b64  add     r0, pc ; -> 0x000fdba8  
00084b66  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084b68  ldr     r0, [r0]
00084b6a  add     r2, pc ; -> 0x0017e954  
00084b6c  ldr     r1, [r1]
00084b6e  blx     #0xddbfc ; -> objc_msgSend
00084b72  pop     {r4, r7, pc}
00084b74  ldr     r0, [pc, #0x48]
00084b76  ldr     r1, [pc, #0x4c]
00084b78  ldr     r2, [pc, #0x4c]
00084b7a  add     r0, pc ; -> 0x000fdba8  
00084b7c  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084b7e  add     r2, pc ; -> 0x0017e944  
00084b80  ldr     r1, [r1]
00084b82  ldr     r0, [r0]
00084b84  blx     #0xddbfc ; -> objc_msgSend
00084b88  b       #0x84b72
00084b8a  cmp     r0, #1
00084b8c  it      ne
00084b8e  movne   r0, r2
00084b90  bne     #0x84b72
00084b92  ldr     r0, [pc, #0x38]
00084b94  ldr     r1, [pc, #0x38]
00084b96  ldr     r2, [pc, #0x3c]
00084b98  add     r0, pc ; -> 0x000fdba8  
00084b9a  add     r1, pc ; -> 0x000fccb8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x340
00084b9c  add     r2, pc ; -> 0x0017e964  
00084b9e  ldr     r1, [r1]
00084ba0  ldr     r0, [r0]
00084ba2  blx     #0xddbfc ; -> objc_msgSend
00084ba6  b       #0x84b72
00084ba8  lsrs    r2, r4, #2
00084baa  movs    r7, r0
00084bac  strh    r4, [r3, #0x12]
00084bae  movs    r7, r0
00084bb0  lsrs    r2, r1, #2
00084bb2  movs    r7, r0
00084bb4  str     r0, [sp, #0x100]
00084bb6  movs    r7, r0
00084bb8  strh    r6, [r1, #0xa]
00084bba  movs    r7, r0
00084bbc  ldr     r5, [sp, #0x398]
00084bbe  movs    r7, r1
00084bc0  str     r0, [sp, #0xa8]
00084bc2  movs    r7, r0
00084bc4  strh    r0, [r7, #8]
00084bc6  movs    r7, r0
00084bc8  ldr     r5, [sp, #0x308]
00084bca  movs    r7, r1
00084bcc  str     r0, [sp, #0x30]
00084bce  movs    r7, r0
00084bd0  strh    r2, [r3, #8]
00084bd2  movs    r7, r0
00084bd4  ldr     r5, [sp, #0x310]
00084bd6  movs    r7, r1
