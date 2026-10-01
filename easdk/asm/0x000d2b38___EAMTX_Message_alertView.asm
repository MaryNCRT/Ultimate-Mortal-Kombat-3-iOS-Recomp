========================================================================
-[EAMTX_Message alertView  0x000d2b38  680 bytes   EAMTX_Message.mm
========================================================================

000d2b38  push    {r4, r5, r6, r7, lr}
000d2b3a  add     r7, sp, #0xc
000d2b3c  push.w  {r8, sl, fp}
000d2b40  sub     sp, #8
000d2b42  ldr     r1, [pc, #0x210]
000d2b44  mov     r6, r0
000d2b46  mov     r0, r2
000d2b48  add     r1, pc ; -> 0x000fd7fc  
000d2b4a  mov     r2, r3
000d2b4c  ldr     r1, [r1]
000d2b4e  blx     #0xddbfc ; -> objc_msgSend
000d2b52  ldr     r3, [pc, #0x204]
000d2b54  add     r3, pc ; -> 0x000f3344  bRequiredToShowAlert
000d2b56  ldr     r3, [r3]
000d2b58  ldrb    r5, [r3]
000d2b5a  mov     r4, r0
000d2b5c  cmp     r5, #0
000d2b5e  bne.w   #0xd2d1c
000d2b62  ldr     r3, [pc, #0x1f8]
000d2b64  add     r3, pc ; -> 0x000fa2dc  OBJC_IVAR_$_EAMTX_Message.mBut2Title
000d2b66  ldr     r2, [r3]
000d2b68  ldr     r2, [r6, r2]
000d2b6a  cmp     r2, #0
000d2b6c  beq.w   #0xd2d32
000d2b70  ldr.w   r8, [pc, #0x1ec]
000d2b74  add     r8, pc ; -> 0x000fa2cc  OBJC_IVAR_$_EAMTX_Message.mURL
000d2b76  ldr.w   r3, [r8]
000d2b7a  ldr     r3, [r6, r3]
000d2b7c  cmp     r3, #0
000d2b7e  beq.w   #0xd2d32
000d2b82  ldr.w   r1, [pc, #0x1e0]
000d2b86  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000d2b88  ldr     r1, [r1]
000d2b8a  blx     #0xddbfc ; -> objc_msgSend
000d2b8e  tst.w   r0, #0xff
000d2b92  beq.w   #0xd2d32
000d2b96  ldr     r1, [pc, #0x1d0]
000d2b98  ldr.w   r0, [pc, #0x1d0]
000d2b9c  ldr     r4, [pc, #0x1d0]
000d2b9e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d2ba0  add     r0, pc ; -> 0x000fdb5c  
000d2ba2  ldr.w   sl, [r1]
000d2ba6  ldr     r1, [pc, #0x1cc]
000d2ba8  ldr.w   fp, [r0]
000d2bac  mov     r0, r6
000d2bae  add     r1, pc ; -> 0x000fd79c  
000d2bb0  add     r4, pc ; -> 0x0017e5c4  
000d2bb2  ldr     r1, [r1]
000d2bb4  blx     #0xddbfc ; -> objc_msgSend
000d2bb8  ldr     r1, [pc, #0x1bc]
000d2bba  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d2bbc  ldr     r1, [r1]
000d2bbe  blx     #0xddbfc ; -> objc_msgSend
000d2bc2  mov     r2, r4
000d2bc4  mov     r1, sl
000d2bc6  mov     r3, r0
000d2bc8  mov     r0, fp
000d2bca  blx     #0xddbfc ; -> objc_msgSend
000d2bce  ldr     r1, [pc, #0x1ac]
000d2bd0  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d2bd2  ldr     r1, [r1]
000d2bd4  mov     r4, r0
000d2bd6  ldr     r0, [pc, #0x1a8]
000d2bd8  add     r0, pc ; -> 0x000fdbb4  
000d2bda  ldr     r0, [r0]
000d2bdc  blx     #0xddbfc ; -> objc_msgSend
000d2be0  mov     r3, r5
000d2be2  movs    r1, #0x12
000d2be4  mov     r2, r4
000d2be6  str     r5, [sp]
000d2be8  str     r0, [sp, #4]
000d2bea  movw    r0, #0x7545
000d2bee  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000d2bf2  ldr.w   r3, [r8]
000d2bf6  ldr     r0, [r6, r3]
000d2bf8  bl      #0xc1c5c ; -> Z11MTX_OpenURLP8NSString
000d2bfc  b       #0xd2c6e
000d2bfe  ldr     r1, [pc, #0x184]
000d2c00  mov     r0, r4
000d2c02  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000d2c04  ldr     r1, [r1]
000d2c06  blx     #0xddbfc ; -> objc_msgSend
000d2c0a  tst.w   r0, #0xff
000d2c0e  beq.w   #0xd2d40
000d2c12  ldr     r1, [pc, #0x174]
000d2c14  ldr.w   r0, [pc, #0x174]
000d2c18  ldr     r4, [pc, #0x174]
000d2c1a  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d2c1c  add     r0, pc ; -> 0x000fdb5c  
000d2c1e  ldr     r5, [r1]
000d2c20  ldr     r1, [pc, #0x170]
000d2c22  ldr.w   r8, [r0]
000d2c26  mov     r0, r6
000d2c28  add     r1, pc ; -> 0x000fd79c  
000d2c2a  add     r4, pc ; -> 0x0017e5c4  
000d2c2c  ldr     r1, [r1]
000d2c2e  blx     #0xddbfc ; -> objc_msgSend
000d2c32  ldr     r1, [pc, #0x164]
000d2c34  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d2c36  ldr     r1, [r1]
000d2c38  blx     #0xddbfc ; -> objc_msgSend
000d2c3c  mov     r2, r4
000d2c3e  mov     r1, r5
000d2c40  movs    r5, #0
000d2c42  mov     r3, r0
000d2c44  mov     r0, r8
000d2c46  blx     #0xddbfc ; -> objc_msgSend
000d2c4a  ldr     r1, [pc, #0x150]
000d2c4c  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d2c4e  ldr     r1, [r1]
000d2c50  mov     r4, r0
000d2c52  ldr     r0, [pc, #0x14c]
000d2c54  add     r0, pc ; -> 0x000fdbb4  
000d2c56  ldr     r0, [r0]
000d2c58  blx     #0xddbfc ; -> objc_msgSend
000d2c5c  movs    r1, #0x12
000d2c5e  mov     r2, r4
000d2c60  mov     r3, r5
000d2c62  str     r5, [sp]
000d2c64  str     r0, [sp, #4]
000d2c66  movw    r0, #0x7544
000d2c6a  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000d2c6e  mov     r8, r5
000d2c70  b       #0xd2cec
000d2c72  ldr     r1, [pc, #0x130]
000d2c74  mov     r0, r4
000d2c76  add     r1, pc ; -> 0x000fcb08  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x190
000d2c78  ldr     r1, [r1]
000d2c7a  blx     #0xddbfc ; -> objc_msgSend
000d2c7e  tst.w   r0, #0xff
000d2c82  beq     #0xd2d4c
000d2c84  ldr     r3, [pc, #0x120]
000d2c86  add     r3, pc ; -> 0x000f3324  mtxUserInfo
000d2c88  ldr     r3, [r3]
000d2c8a  ldr     r3, [r3]
000d2c8c  cmp     r3, #0
000d2c8e  beq     #0xd2d4c
000d2c90  ldr     r1, [pc, #0x118]
000d2c92  ldr     r0, [pc, #0x11c]
000d2c94  ldr     r4, [pc, #0x11c]
000d2c96  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d2c98  add     r0, pc ; -> 0x000fdb5c  
000d2c9a  ldr     r5, [r1]
000d2c9c  ldr     r1, [pc, #0x118]
000d2c9e  ldr.w   r8, [r0]
000d2ca2  mov     r0, r6
000d2ca4  add     r1, pc ; -> 0x000fd79c  
000d2ca6  add     r4, pc ; -> 0x0017e5c4  
000d2ca8  ldr     r1, [r1]
000d2caa  blx     #0xddbfc ; -> objc_msgSend
000d2cae  ldr     r1, [pc, #0x10c]
000d2cb0  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000d2cb2  ldr     r1, [r1]
000d2cb4  blx     #0xddbfc ; -> objc_msgSend
000d2cb8  mov     r2, r4
000d2cba  mov     r1, r5
000d2cbc  mov     r3, r0
000d2cbe  mov     r0, r8
000d2cc0  blx     #0xddbfc ; -> objc_msgSend
000d2cc4  ldr     r1, [pc, #0xf8]
000d2cc6  mov.w   r8, #1
000d2cca  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000d2ccc  ldr     r1, [r1]
000d2cce  mov     r4, r0
000d2cd0  ldr     r0, [pc, #0xf0]
000d2cd2  add     r0, pc ; -> 0x000fdbb4  
000d2cd4  ldr     r0, [r0]
000d2cd6  blx     #0xddbfc ; -> objc_msgSend
000d2cda  movs    r3, #0
000d2cdc  movs    r1, #0x12
000d2cde  mov     r2, r4
000d2ce0  str     r3, [sp]
000d2ce2  str     r0, [sp, #4]
000d2ce4  movw    r0, #0x7546
000d2ce8  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
000d2cec  ldr     r1, [pc, #0xd8]
000d2cee  ldr     r4, [pc, #0xdc]
000d2cf0  add     r1, pc ; -> 0x000fd7f8  'v\x07\x0f'
000d2cf2  add     r4, pc ; -> 0x000fa2e4  OBJC_IVAR_$_EAMTX_Message.mDelegate
000d2cf4  ldr     r5, [r1]
000d2cf6  ldr     r1, [pc, #0xd8]
000d2cf8  ldr     r3, [r4]
000d2cfa  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000d2cfc  mov     r2, r5
000d2cfe  ldr     r0, [r6, r3]
000d2d00  ldr     r1, [r1]
000d2d02  blx     #0xddbfc ; -> objc_msgSend
000d2d06  tst.w   r0, #0xff
000d2d0a  beq     #0xd2d1c
000d2d0c  ldr     r3, [r4]
000d2d0e  mov     r1, r5
000d2d10  mov     r2, r6
000d2d12  ldr     r0, [r6, r3]
000d2d14  sxtb.w  r3, r8
000d2d18  blx     #0xddbfc ; -> objc_msgSend
000d2d1c  ldr     r1, [pc, #0xb4]
000d2d1e  mov     r0, r6
000d2d20  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d2d22  ldr     r1, [r1]
000d2d24  blx     #0xddbfc ; -> objc_msgSend
000d2d28  sub.w   sp, r7, #0x18
000d2d2c  pop.w   {r8, sl, fp}
000d2d30  pop     {r4, r5, r6, r7, pc}
000d2d32  ldr     r3, [pc, #0xa4]
000d2d34  add     r3, pc ; -> 0x000fa2d8  OBJC_IVAR_$_EAMTX_Message.mBut1Title
000d2d36  ldr     r2, [r3]
000d2d38  ldr     r2, [r6, r2]
000d2d3a  cmp     r2, #0
000d2d3c  bne.w   #0xd2bfe
000d2d40  ldr     r3, [pc, #0x98]
000d2d42  add     r3, pc ; -> 0x000fa2e0  OBJC_IVAR_$_EAMTX_Message.mBut3Title
000d2d44  ldr     r2, [r3]
000d2d46  ldr     r2, [r6, r2]
000d2d48  cmp     r2, #0
000d2d4a  bne     #0xd2c72
000d2d4c  mov.w   r8, #0
000d2d50  b       #0xd2cec
000d2d52  nop     
000d2d54  add     r4, sp, #0x2c0
000d2d56  movs    r2, r0
000d2d58  lsls    r4, r5, #0x1f
000d2d5a  movs    r2, r0
000d2d5c  strb    r4, [r6, #0x1d]
000d2d5e  movs    r2, r0
000d2d60  strb    r4, [r2, #0x1d]
000d2d62  movs    r2, r0
000d2d64  ldr     r7, [sp, #0x1f8]
000d2d66  movs    r2, r0
000d2d68  ldr     r6, [sp, #0x3f8]
000d2d6a  movs    r2, r0
000d2d6c  add     r7, sp, #0x2e0
000d2d6e  movs    r2, r0
000d2d70  rev     r0, r2
000d2d72  movs    r2, r1
000d2d74  add     r3, sp, #0x3a8
000d2d76  movs    r2, r0
000d2d78  ldr     r7, [sp, #0xa8]
000d2d7a  movs    r2, r0
000d2d7c  ldr     r7, [sp, #0x3d0]
000d2d7e  movs    r2, r0
000d2d80  add     r7, sp, #0x360
000d2d82  movs    r2, r0
000d2d84  ldr     r7, [sp, #8]
000d2d86  movs    r2, r0
000d2d88  ldr     r6, [sp, #0x208]
000d2d8a  movs    r2, r0
000d2d8c  add     r7, sp, #0xf0
000d2d8e  movs    r2, r0
000d2d90  cbnz    r6, #0xd2db8
000d2d92  movs    r2, r1
000d2d94  add     r3, sp, #0x1c0
000d2d96  movs    r2, r0
000d2d98  ldr     r6, [sp, #0x2c0]
000d2d9a  movs    r2, r0
000d2d9c  ldr     r7, [sp, #0x1e0]
000d2d9e  movs    r2, r0
000d2da0  add     r7, sp, #0x170
000d2da2  movs    r2, r0
000d2da4  ldr     r6, [sp, #0x238]
000d2da6  movs    r2, r0
000d2da8  lsls    r2, r3, #0x1a
000d2daa  movs    r2, r0
000d2dac  ldr     r6, [sp, #0x18]
000d2dae  movs    r2, r0
000d2db0  add     r6, sp, #0x300
000d2db2  movs    r2, r0
000d2db4  cbnz    r2, #0xd2dbe
000d2db6  movs    r2, r1
000d2db8  add     r2, sp, #0x3d0
000d2dba  movs    r2, r0
000d2dbc  ldr     r6, [sp, #0xd0]
000d2dbe  movs    r2, r0
000d2dc0  ldr     r6, [sp, #0x3e8]
000d2dc2  movs    r2, r0
000d2dc4  add     r6, sp, #0x378
000d2dc6  movs    r2, r0
000d2dc8  add     r3, sp, #0x10
000d2dca  movs    r2, r0
000d2dcc  strb    r6, [r5, #0x17]
000d2dce  movs    r2, r0
000d2dd0  ldr     r7, [sp, #0x248]
000d2dd2  movs    r2, r0
000d2dd4  ldr     r4, [sp, #0x160]
000d2dd6  movs    r2, r0
000d2dd8  strb    r0, [r4, #0x16]
000d2dda  movs    r2, r0
000d2ddc  strb    r2, [r3, #0x16]
000d2dde  movs    r2, r0
