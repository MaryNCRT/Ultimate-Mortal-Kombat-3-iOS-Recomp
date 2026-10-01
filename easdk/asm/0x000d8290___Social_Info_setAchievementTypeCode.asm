========================================================================
-[Social_Info setAchievementTypeCode  0x000d8290  44 bytes   Social_Info.mm
========================================================================

000d8290  push    {r7, lr}
000d8292  add     r7, sp, #0
000d8294  sub     sp, #8
000d8296  mov     r3, r2
000d8298  ldr     r2, [pc, #0x1c]
000d829a  mov.w   ip, #0
000d829e  add     r2, pc ; -> 0x000fae94  OBJC_IVAR_$_Social_Info.achievementTypeCode
000d82a0  ldr     r2, [r2]
000d82a2  str.w   ip, [sp]
000d82a6  add.w   ip, ip, #1
000d82aa  str.w   ip, [sp, #4]
000d82ae  blx     #0xddc20 ; -> objc_setProperty
000d82b2  sub.w   sp, r7, #0
000d82b6  pop     {r7, pc}
000d82b8  cmp     r3, #0xf2
000d82ba  movs    r2, r0
