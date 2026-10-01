========================================================================
-[SocialUser setChallengeId  0x000d8dac  40 bytes   SocialUser.m
========================================================================

000d8dac  push    {r7, lr}
000d8dae  add     r7, sp, #0
000d8db0  sub     sp, #8
000d8db2  mov     r3, r2
000d8db4  ldr     r2, [pc, #0x18]
000d8db6  mov.w   ip, #0
000d8dba  add     r2, pc ; -> 0x000fbd60  OBJC_IVAR_$_SocialUser.challengeId
000d8dbc  ldr     r2, [r2]
000d8dbe  str.w   ip, [sp]
000d8dc2  str.w   ip, [sp, #4]
000d8dc6  blx     #0xddc20 ; -> objc_setProperty
000d8dca  sub.w   sp, r7, #0
000d8dce  pop     {r7, pc}
000d8dd0  cmp     r7, #0xa2
000d8dd2  movs    r2, r0
