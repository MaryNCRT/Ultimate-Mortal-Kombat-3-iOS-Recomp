========================================================================
-[SocialUser setMayhemUserId  0x000d8d84  40 bytes   SocialUser.m
========================================================================

000d8d84  push    {r7, lr}
000d8d86  add     r7, sp, #0
000d8d88  sub     sp, #8
000d8d8a  mov     r3, r2
000d8d8c  ldr     r2, [pc, #0x18]
000d8d8e  mov.w   ip, #0
000d8d92  add     r2, pc ; -> 0x000fbd64  OBJC_IVAR_$_SocialUser.mayhemUserId
000d8d94  ldr     r2, [r2]
000d8d96  str.w   ip, [sp]
000d8d9a  str.w   ip, [sp, #4]
000d8d9e  blx     #0xddc20 ; -> objc_setProperty
000d8da2  sub.w   sp, r7, #0
000d8da6  pop     {r7, pc}
000d8da8  cmp     r7, #0xce
000d8daa  movs    r2, r0
