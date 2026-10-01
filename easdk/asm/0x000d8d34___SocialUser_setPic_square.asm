========================================================================
-[SocialUser setPic_square  0x000d8d34  40 bytes   SocialUser.m
========================================================================

000d8d34  push    {r7, lr}
000d8d36  add     r7, sp, #0
000d8d38  sub     sp, #8
000d8d3a  mov     r3, r2
000d8d3c  ldr     r2, [pc, #0x18]
000d8d3e  mov.w   ip, #0
000d8d42  add     r2, pc ; -> 0x000fbd6c  OBJC_IVAR_$_SocialUser.pic_square
000d8d44  ldr     r2, [r2]
000d8d46  str.w   ip, [sp]
000d8d4a  str.w   ip, [sp, #4]
000d8d4e  blx     #0xddc20 ; -> objc_setProperty
000d8d52  sub.w   sp, r7, #0
000d8d56  pop     {r7, pc}
000d8d58  adds    r0, #0x26
000d8d5a  movs    r2, r0
