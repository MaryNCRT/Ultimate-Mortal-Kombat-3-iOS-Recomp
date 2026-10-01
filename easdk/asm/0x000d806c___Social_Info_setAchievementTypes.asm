========================================================================
-[Social_Info setAchievementTypes  0x000d806c  40 bytes   Social_Info.mm
========================================================================

000d806c  push    {r7, lr}
000d806e  add     r7, sp, #0
000d8070  sub     sp, #8
000d8072  mov     r3, r2
000d8074  ldr     r2, [pc, #0x18]
000d8076  mov.w   ip, #0
000d807a  add     r2, pc ; -> 0x000faeb8  OBJC_IVAR_$_Social_Info.achievementTypes
000d807c  ldr     r2, [r2]
000d807e  str.w   ip, [sp]
000d8082  str.w   ip, [sp, #4]
000d8086  blx     #0xddc20 ; -> objc_setProperty
000d808a  sub.w   sp, r7, #0
000d808e  pop     {r7, pc}
000d8090  cmp     r6, #0x3a
000d8092  movs    r2, r0
