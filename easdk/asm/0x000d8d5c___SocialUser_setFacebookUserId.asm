========================================================================
-[SocialUser setFacebookUserId  0x000d8d5c  40 bytes   SocialUser.m
========================================================================

000d8d5c  push    {r7, lr}
000d8d5e  add     r7, sp, #0
000d8d60  sub     sp, #8
000d8d62  mov     r3, r2
000d8d64  ldr     r2, [pc, #0x18]
000d8d66  mov.w   ip, #0
000d8d6a  add     r2, pc ; -> 0x000fbd68  OBJC_IVAR_$_SocialUser.facebookUserId
000d8d6c  ldr     r2, [r2]
000d8d6e  str.w   ip, [sp]
000d8d72  str.w   ip, [sp, #4]
000d8d76  blx     #0xddc20 ; -> objc_setProperty
000d8d7a  sub.w   sp, r7, #0
000d8d7e  pop     {r7, pc}
000d8d80  cmp     r7, #0xfa
000d8d82  movs    r2, r0
