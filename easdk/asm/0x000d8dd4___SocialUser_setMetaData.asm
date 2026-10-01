========================================================================
-[SocialUser setMetaData  0x000d8dd4  40 bytes   SocialUser.m
========================================================================

000d8dd4  push    {r7, lr}
000d8dd6  add     r7, sp, #0
000d8dd8  sub     sp, #8
000d8dda  mov     r3, r2
000d8ddc  ldr     r2, [pc, #0x18]
000d8dde  mov.w   ip, #0
000d8de2  add     r2, pc ; -> 0x000fbd5c  OBJC_IVAR_$_SocialUser.metaData
000d8de4  ldr     r2, [r2]
000d8de6  str.w   ip, [sp]
000d8dea  str.w   ip, [sp, #4]
000d8dee  blx     #0xddc20 ; -> objc_setProperty
000d8df2  sub.w   sp, r7, #0
000d8df6  pop     {r7, pc}
000d8df8  cmp     r7, #0x76
000d8dfa  movs    r2, r0
