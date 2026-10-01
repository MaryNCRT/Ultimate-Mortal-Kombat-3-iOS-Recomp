========================================================================
-[Social_Info setAchievementsUserId  0x000d8338  40 bytes   Social_Info.mm
========================================================================

000d8338  push    {r7, lr}
000d833a  add     r7, sp, #0
000d833c  sub     sp, #8
000d833e  mov     r3, r2
000d8340  ldr     r2, [pc, #0x18]
000d8342  mov.w   ip, #0
000d8346  add     r2, pc ; -> 0x000faed0  OBJC_IVAR_$_Social_Info.achievementsUserId
000d8348  ldr     r2, [r2]
000d834a  str.w   ip, [sp]
000d834e  str.w   ip, [sp, #4]
000d8352  blx     #0xddc20 ; -> objc_setProperty
000d8356  sub.w   sp, r7, #0
000d835a  pop     {r7, pc}
000d835c  cmp     r3, #0x86
000d835e  movs    r2, r0
