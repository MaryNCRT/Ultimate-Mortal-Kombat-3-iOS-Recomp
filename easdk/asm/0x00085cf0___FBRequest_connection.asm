========================================================================
-[FBRequest connection  0x00085cf0  128 bytes   FBRequest.m
========================================================================

00085cf0  push    {r4, r5, r6, r7, lr}
00085cf2  add     r7, sp, #0xc
00085cf4  str     r8, [sp, #-0x4]!
00085cf8  ldr     r1, [pc, #0x58]
00085cfa  mov     r5, r0
00085cfc  ldr     r0, [pc, #0x58]
00085cfe  mov     r8, r3
00085d00  ldr     r3, [pc, #0x58]
00085d02  add     r0, pc ; -> 0x000fdbbc  
00085d04  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00085d06  add     r3, pc ; -> 0x000f59e0  OBJC_IVAR_$_FBRequest._responseText
00085d08  ldr     r1, [r1]
00085d0a  ldr     r0, [r0]
00085d0c  ldr     r4, [r3]
00085d0e  blx     #0xddbfc ; -> objc_msgSend
00085d12  ldr     r1, [pc, #0x4c]
00085d14  add     r1, pc ; -> 0x000fc980  '$(\x0e'
00085d16  ldr     r1, [r1]
00085d18  blx     #0xddbfc ; -> objc_msgSend
00085d1c  ldr     r1, [pc, #0x44]
00085d1e  add     r1, pc ; -> 0x000fce28  '\x0cL\x0e'
00085d20  ldr     r6, [r1]
00085d22  ldr     r1, [pc, #0x44]
00085d24  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
00085d26  mov     r2, r6
00085d28  ldr     r1, [r1]
00085d2a  str     r0, [r5, r4]
00085d2c  ldr     r4, [pc, #0x3c]
00085d2e  add     r4, pc ; -> 0x000f59c4  OBJC_IVAR_$_FBRequest._delegate
00085d30  ldr     r3, [r4]
00085d32  ldr     r0, [r5, r3]
00085d34  blx     #0xddbfc ; -> objc_msgSend
00085d38  tst.w   r0, #0xff
00085d3c  beq     #0x85d4c
00085d3e  ldr     r3, [r4]
00085d40  mov     r1, r6
00085d42  mov     r2, r5
00085d44  ldr     r0, [r5, r3]
00085d46  mov     r3, r8
00085d48  blx     #0xddbfc ; -> objc_msgSend
00085d4c  ldr     r8, [sp], #4
00085d50  pop     {r4, r5, r6, r7, pc}
00085d52  nop     
00085d54  ldr     r4, [r7, #0x44]
00085d56  movs    r7, r0
00085d58  ldrb    r6, [r6, #0x1a]
00085d5a  movs    r7, r0
00085d5c  ldc2l   p0, c0, [r6], {6}
00085d60  ldr     r0, [r5, #0x44]
00085d62  movs    r7, r0
00085d64  strb    r6, [r0, #4]
00085d66  movs    r7, r0
00085d68  ldr     r0, [r5, #0x74]
00085d6a  movs    r7, r0
00085d6c  ldc2    p0, c0, [r2], {6}
