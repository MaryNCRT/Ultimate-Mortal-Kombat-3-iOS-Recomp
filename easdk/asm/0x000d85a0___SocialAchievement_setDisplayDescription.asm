========================================================================
-[SocialAchievement setDisplayDescription  0x000d85a0  44 bytes   SocialAchievement.m
========================================================================

000d85a0  push    {r7, lr}
000d85a2  add     r7, sp, #0
000d85a4  sub     sp, #8
000d85a6  mov     r3, r2
000d85a8  ldr     r2, [pc, #0x1c]
000d85aa  mov.w   ip, #0
000d85ae  add     r2, pc ; -> 0x000fb940  OBJC_IVAR_$_SocialAchievement.displayDescription
000d85b0  ldr     r2, [r2]
000d85b2  str.w   ip, [sp]
000d85b6  add.w   ip, ip, #1
000d85ba  str.w   ip, [sp, #4]
000d85be  blx     #0xddc20 ; -> objc_setProperty
000d85c2  sub.w   sp, r7, #0
000d85c6  pop     {r7, pc}
000d85c8  adds    r3, #0x8e
000d85ca  movs    r2, r0
