========================================================================
fillEventsCounterDefaults  0x000b6be0  252 bytes   EAMTX_Main.mm
========================================================================

000b6be0  push    {r4, r5, r6, r7, lr}
000b6be2  add     r7, sp, #0xc
000b6be4  push.w  {r8, sl, fp}
000b6be8  sub     sp, #0x14
000b6bea  ldr     r0, [pc, #0xb8]
000b6bec  ldr     r1, [pc, #0xb8]
000b6bee  mov.w   r8, #0
000b6bf2  add     r0, pc ; -> 0x000fdbf4  
000b6bf4  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000b6bf6  ldr     r0, [r0]
000b6bf8  ldr     r1, [r1]
000b6bfa  blx     #0xddbfc ; -> objc_msgSend
000b6bfe  ldr     r1, [pc, #0xac]
000b6c00  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000b6c02  ldr     r1, [r1]
000b6c04  blx     #0xddbfc ; -> objc_msgSend
000b6c08  ldr     r1, [pc, #0xa4]
000b6c0a  add     r1, pc ; -> 0x000fd64c  
000b6c0c  ldr     r1, [r1]
000b6c0e  mov     r2, r0
000b6c10  ldr     r0, [pc, #0xa0]
000b6c12  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b6c14  ldr     r0, [r0]
000b6c16  blx     #0xddbfc ; -> objc_msgSend
000b6c1a  ldr     r1, [pc, #0x9c]
000b6c1c  ldr     r0, [pc, #0x9c]
000b6c1e  ldr     r3, [pc, #0xa0]
000b6c20  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b6c22  add     r0, pc ; -> 0x000fdb5c  
000b6c24  ldr     r1, [r1]
000b6c26  ldr     r0, [r0]
000b6c28  str     r3, [sp]
000b6c2a  str     r1, [sp, #4]
000b6c2c  ldr     r1, [pc, #0x94]
000b6c2e  str     r0, [sp, #0x10]
000b6c30  add     r1, pc ; -> 0x000fd66c  
000b6c32  ldr     r1, [r1]
000b6c34  str     r1, [sp, #8]
000b6c36  ldr     r1, [pc, #0x90]
000b6c38  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000b6c3a  ldr     r1, [r1]
000b6c3c  str     r1, [sp, #0xc]
000b6c3e  ldr     r1, [pc, #0x8c]
000b6c40  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6c42  ldr.w   fp, [r1]
000b6c46  ldr     r1, [pc, #0x88]
000b6c48  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000b6c4a  ldr.w   sl, [r1]
000b6c4e  b       #0xb6c88
000b6c50  ldr     r0, [pc, #0x80]
000b6c52  ldr     r1, [sp, #8]
000b6c54  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000b6c56  ldr     r0, [r0]
000b6c58  blx     #0xddbfc ; -> objc_msgSend
000b6c5c  ldr     r2, [pc, #0x78]
000b6c5e  movs    r3, #0
000b6c60  mov     r1, fp
000b6c62  add     r2, pc ; -> 0x0017e5c4  
000b6c64  mov     r6, r0
000b6c66  ldr     r0, [sp, #0x10]
000b6c68  blx     #0xddbfc ; -> objc_msgSend
000b6c6c  mov     r2, r8
000b6c6e  mov     r1, sl
000b6c70  add.w   r8, r8, #1
000b6c74  mov     r4, r0
000b6c76  ldr     r0, [r5]
000b6c78  blx     #0xddbfc ; -> objc_msgSend
000b6c7c  ldr     r1, [sp, #0xc]
000b6c7e  mov     r2, r4
000b6c80  mov     r3, r0
000b6c82  mov     r0, r6
000b6c84  blx     #0xddbfc ; -> objc_msgSend
000b6c88  ldr     r5, [sp]
000b6c8a  ldr     r1, [sp, #4]
000b6c8c  add     r5, pc
000b6c8e  ldr     r0, [r5]
000b6c90  blx     #0xddbfc ; -> objc_msgSend
000b6c94  cmp     r0, r8
000b6c96  bhi     #0xb6c50
000b6c98  sub.w   sp, r7, #0x18
000b6c9c  pop.w   {r8, sl, fp}
000b6ca0  pop     {r4, r5, r6, r7, pc}
000b6ca2  nop     
000b6ca4  ldr     r6, [r7, #0x7c]
000b6ca6  movs    r4, r0
000b6ca8  ldrb    r4, [r1, r6]
000b6caa  movs    r4, r0
000b6cac  ldrb    r4, [r7, r5]
000b6cae  movs    r4, r0
000b6cb0  ldr     r6, [r7, #0x20]
000b6cb2  movs    r4, r0
000b6cb4  strb    r2, [r2, r3]
000b6cb6  movs    r5, r5
000b6cb8  ldrsh   r4, [r3, r1]
000b6cba  movs    r4, r0
000b6cbc  ldr     r6, [r6, #0x70]
000b6cbe  movs    r4, r0
000b6cc0  strb    r0, [r2, r2]
000b6cc2  movs    r5, r5
000b6cc4  ldr     r0, [r7, #0x20]
000b6cc6  movs    r4, r0
000b6cc8  ldrsh   r4, [r3, r2]
000b6cca  movs    r4, r0
000b6ccc  ldrsh   r4, [r3, r1]
000b6cce  movs    r4, r0
000b6cd0  ldrsh   r0, [r6, r0]
000b6cd2  movs    r4, r0
000b6cd4  strb    r0, [r2, r2]
000b6cd6  movs    r5, r5
000b6cd8  ldrb    r6, [r3, #5]
000b6cda  movs    r4, r1
