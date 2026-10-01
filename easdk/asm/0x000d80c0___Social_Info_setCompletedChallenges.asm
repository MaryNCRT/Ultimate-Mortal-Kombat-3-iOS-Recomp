========================================================================
-[Social_Info setCompletedChallenges  0x000d80c0  40 bytes   Social_Info.mm
========================================================================

000d80c0  push    {r7, lr}
000d80c2  add     r7, sp, #0
000d80c4  sub     sp, #8
000d80c6  mov     r3, r2
000d80c8  ldr     r2, [pc, #0x18]
000d80ca  mov.w   ip, #0
000d80ce  add     r2, pc ; -> 0x000fae80  OBJC_IVAR_$_Social_Info.completedChallenges
000d80d0  ldr     r2, [r2]
000d80d2  str.w   ip, [sp]
000d80d6  str.w   ip, [sp, #4]
000d80da  blx     #0xddc20 ; -> objc_setProperty
000d80de  sub.w   sp, r7, #0
000d80e2  pop     {r7, pc}
000d80e4  cmp     r5, #0xae
000d80e6  movs    r2, r0
