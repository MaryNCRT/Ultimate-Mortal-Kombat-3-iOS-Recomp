========================================================================
-[FBLoginButton initWithFrame  0x00084d08  124 bytes   FBLoginButton.m
========================================================================

00084d08  sub     sp, #8
00084d0a  push    {r4, r5, r7, lr}
00084d0c  add     r7, sp, #8
00084d0e  sub     sp, #0x10
00084d10  add     r1, sp, #0x20
00084d12  add     r5, sp, #0x20
00084d14  stm.w   r1, {r2, r3}
00084d18  ldr     r3, [pc, #0x58]
00084d1a  ldr     r1, [pc, #0x5c]
00084d1c  str     r0, [sp, #8]
00084d1e  add     r3, pc ; -> 0x000fdd3c  
00084d20  add     r1, pc ; -> 0x000fccd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x35c
00084d22  ldr     r3, [r3]
00084d24  add     r0, sp, #0x28
00084d26  ldr.w   ip, [r1]
00084d2a  str     r3, [sp, #0xc]
00084d2c  ldm     r0, {r0, r1}
00084d2e  stm.w   sp, {r0, r1}
00084d32  add     r0, sp, #8
00084d34  ldm.w   r5, {r2, r3}
00084d38  mov     r1, ip
00084d3a  blx     #0xddc08 ; -> objc_msgSendSuper2
00084d3e  mov     r4, r0
00084d40  cbz     r0, #0x84d58
00084d42  ldr     r1, [pc, #0x38]
00084d44  add     r5, sp, #0x20
00084d46  add     r1, pc ; -> 0x000fcd80  
00084d48  ldr     r1, [r1]
00084d4a  blx     #0xddbfc ; -> objc_msgSend
00084d4e  ldm.w   r5, {r0, r1, r2, r3}
00084d52  blx     #0xdd3b0 ; -> CGRectIsEmpty
00084d56  cbnz    r0, #0x84d66
00084d58  mov     r0, r4
00084d5a  sub.w   sp, r7, #8
00084d5e  pop.w   {r4, r5, r7, lr}
00084d62  add     sp, #8
00084d64  bx      lr
00084d66  ldr     r1, [pc, #0x18]
00084d68  mov     r0, r4
00084d6a  add     r1, pc ; -> 0x000fcc20  '`2\x0e'
00084d6c  ldr     r1, [r1]
00084d6e  blx     #0xddbfc ; -> objc_msgSend
00084d72  b       #0x84d58
00084d74  str     r0, [sp, #0x68]
00084d76  movs    r7, r0
00084d78  ldrb    r0, [r6, #0x1e]
00084d7a  movs    r7, r0
00084d7c  strh    r6, [r6]
00084d7e  movs    r7, r0
00084d80  ldrb    r2, [r6, #0x1a]
00084d82  movs    r7, r0
