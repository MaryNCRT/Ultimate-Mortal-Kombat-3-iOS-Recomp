========================================================================
-[FBRequest call  0x00085be8  36 bytes   FBRequest.m
========================================================================

00085be8  push    {r7, lr}
00085bea  add     r7, sp, #0
00085bec  sub     sp, #4
00085bee  ldr     r1, [pc, #0x18]
00085bf0  mov.w   ip, #0
00085bf4  str.w   ip, [sp]
00085bf8  add     r1, pc ; -> 0x000fce20  
00085bfa  ldr     r1, [r1]
00085bfc  blx     #0xddbfc ; -> objc_msgSend
00085c00  sub.w   sp, r7, #0
00085c04  pop     {r7, pc}
00085c06  nop     
00085c08  strb    r4, [r4, #8]
00085c0a  movs    r7, r0
