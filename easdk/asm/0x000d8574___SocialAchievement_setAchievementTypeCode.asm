========================================================================
-[SocialAchievement setAchievementTypeCode  0x000d8574  44 bytes   SocialAchievement.m
========================================================================

000d8574  push    {r7, lr}
000d8576  add     r7, sp, #0
000d8578  sub     sp, #8
000d857a  mov     r3, r2
000d857c  ldr     r2, [pc, #0x1c]
000d857e  mov.w   ip, #0
000d8582  add     r2, pc ; -> 0x000fb944  OBJC_IVAR_$_SocialAchievement.achievementTypeCode
000d8584  ldr     r2, [r2]
000d8586  str.w   ip, [sp]
000d858a  add.w   ip, ip, #1
000d858e  str.w   ip, [sp, #4]
000d8592  blx     #0xddc20 ; -> objc_setProperty
000d8596  sub.w   sp, r7, #0
000d859a  pop     {r7, pc}
000d859c  adds    r3, #0xbe
000d859e  movs    r2, r0
