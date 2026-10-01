========================================================================
-[Social_Info setChallengesMayhemIds  0x000d8194  40 bytes   Social_Info.mm
========================================================================

000d8194  push    {r7, lr}
000d8196  add     r7, sp, #0
000d8198  sub     sp, #8
000d819a  mov     r3, r2
000d819c  ldr     r2, [pc, #0x18]
000d819e  mov.w   ip, #0
000d81a2  add     r2, pc ; -> 0x000faecc  OBJC_IVAR_$_Social_Info.challengesMayhemIds
000d81a4  ldr     r2, [r2]
000d81a6  str.w   ip, [sp]
000d81aa  str.w   ip, [sp, #4]
000d81ae  blx     #0xddc20 ; -> objc_setProperty
000d81b2  sub.w   sp, r7, #0
000d81b6  pop     {r7, pc}
000d81b8  cmp     r5, #0x26
000d81ba  movs    r2, r0
