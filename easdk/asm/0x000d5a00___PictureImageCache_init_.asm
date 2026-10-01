========================================================================
-[PictureImageCache init]  0x000d5a00  124 bytes   PictureImageCache.m
========================================================================

000d5a00  push    {r4, r5, r6, r7, lr}
000d5a02  add     r7, sp, #0xc
000d5a04  str     r8, [sp, #-0x4]!
000d5a08  sub     sp, #8
000d5a0a  ldr     r1, [pc, #0x58]
000d5a0c  ldr     r3, [pc, #0x58]
000d5a0e  str     r0, [sp]
000d5a10  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d5a12  add     r3, pc ; -> 0x000fdde0  
000d5a14  ldr     r6, [r1]
000d5a16  ldr     r3, [r3]
000d5a18  mov     r0, sp
000d5a1a  mov     r1, r6
000d5a1c  str     r3, [sp, #4]
000d5a1e  blx     #0xddc08 ; -> objc_msgSendSuper2
000d5a22  mov     r4, r0
000d5a24  cbz     r0, #0xd5a58
000d5a26  ldr     r0, [pc, #0x44]
000d5a28  ldr     r1, [pc, #0x44]
000d5a2a  ldr     r5, [pc, #0x48]
000d5a2c  add     r0, pc ; -> 0x000fdd04  
000d5a2e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d5a30  add     r5, pc ; -> 0x000fae5c  OBJC_IVAR_$_PictureImageCache.operationQueue
000d5a32  ldr     r1, [r1]
000d5a34  ldr     r0, [r0]
000d5a36  ldr.w   r8, [r5]
000d5a3a  blx     #0xddbfc ; -> objc_msgSend
000d5a3e  mov     r1, r6
000d5a40  blx     #0xddbfc ; -> objc_msgSend
000d5a44  ldr     r1, [pc, #0x30]
000d5a46  movs    r2, #1
000d5a48  add     r1, pc ; -> 0x000fd9fc  ']\x1e\x0f'
000d5a4a  ldr     r1, [r1]
000d5a4c  str.w   r0, [r4, r8]
000d5a50  ldr     r3, [r5]
000d5a52  ldr     r0, [r4, r3]
000d5a54  blx     #0xddbfc ; -> objc_msgSend
000d5a58  mov     r0, r4
000d5a5a  sub.w   sp, r7, #0x10
000d5a5e  ldr     r8, [sp], #4
000d5a62  pop     {r4, r5, r6, r7, pc}
000d5a64  ldr     r4, [r5, #0x74]
000d5a66  movs    r2, r0
000d5a68  strh    r2, [r1, #0x1e]
000d5a6a  movs    r2, r0
000d5a6c  strh    r4, [r2, #0x16]
000d5a6e  movs    r2, r0
000d5a70  ldr     r2, [r2, #0x74]
000d5a72  movs    r2, r0
000d5a74  strb    r0, [r5, r0]
000d5a76  movs    r2, r0
000d5a78  ldrb    r0, [r6, #0x1e]
000d5a7a  movs    r2, r0
