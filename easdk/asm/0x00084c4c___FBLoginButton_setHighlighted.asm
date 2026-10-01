========================================================================
-[FBLoginButton setHighlighted  0x00084c4c  64 bytes   FBLoginButton.m
========================================================================

00084c4c  push    {r4, r7, lr}
00084c4e  add     r7, sp, #4
00084c50  sub     sp, #8
00084c52  ldr     r3, [pc, #0x2c]
00084c54  ldr     r1, [pc, #0x2c]
00084c56  mov     r4, r0
00084c58  add     r3, pc ; -> 0x000fdd3c  
00084c5a  add     r1, pc ; -> 0x000fcd6c  '-1\x0e'
00084c5c  ldr     r3, [r3]
00084c5e  str     r0, [sp]
00084c60  sxtb    r2, r2
00084c62  mov     r0, sp
00084c64  ldr     r1, [r1]
00084c66  str     r3, [sp, #4]
00084c68  blx     #0xddc08 ; -> objc_msgSendSuper2
00084c6c  ldr     r1, [pc, #0x18]
00084c6e  mov     r0, r4
00084c70  add     r1, pc ; -> 0x000fcd68  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3f0
00084c72  ldr     r1, [r1]
00084c74  blx     #0xddbfc ; -> objc_msgSend
00084c78  sub.w   sp, r7, #4
00084c7c  pop     {r4, r7, pc}
00084c7e  nop     
00084c80  str     r0, [sp, #0x380]
00084c82  movs    r7, r0
00084c84  strh    r6, [r1, #8]
00084c86  movs    r7, r0
00084c88  strh    r4, [r6, #6]
00084c8a  movs    r7, r0
