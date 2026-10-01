========================================================================
-[Social_Info setChallengeId  0x000d82bc  44 bytes   Social_Info.mm
========================================================================

000d82bc  push    {r7, lr}
000d82be  add     r7, sp, #0
000d82c0  sub     sp, #8
000d82c2  mov     r3, r2
000d82c4  ldr     r2, [pc, #0x1c]
000d82c6  mov.w   ip, #0
000d82ca  add     r2, pc ; -> 0x000fae84  OBJC_IVAR_$_Social_Info.challengeId
000d82cc  ldr     r2, [r2]
000d82ce  str.w   ip, [sp]
000d82d2  add.w   ip, ip, #1
000d82d6  str.w   ip, [sp, #4]
000d82da  blx     #0xddc20 ; -> objc_setProperty
000d82de  sub.w   sp, r7, #0
000d82e2  pop     {r7, pc}
000d82e4  cmp     r3, #0xb6
000d82e6  movs    r2, r0
