========================================================================
-[SocialAchievement setAchievementTypeURI  0x000d85cc  44 bytes   SocialAchievement.m
========================================================================

000d85cc  push    {r7, lr}
000d85ce  add     r7, sp, #0
000d85d0  sub     sp, #8
000d85d2  mov     r3, r2
000d85d4  ldr     r2, [pc, #0x1c]
000d85d6  mov.w   ip, #0
000d85da  add     r2, pc ; -> 0x000fb93c  OBJC_IVAR_$_SocialAchievement.achievementTypeURI
000d85dc  ldr     r2, [r2]
000d85de  str.w   ip, [sp]
000d85e2  add.w   ip, ip, #1
000d85e6  str.w   ip, [sp, #4]
000d85ea  blx     #0xddc20 ; -> objc_setProperty
000d85ee  sub.w   sp, r7, #0
000d85f2  pop     {r7, pc}
000d85f4  adds    r3, #0x5e
000d85f6  movs    r2, r0
