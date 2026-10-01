========================================================================
-[Social_Info setPendingChallenges  0x000d80e8  40 bytes   Social_Info.mm
========================================================================

000d80e8  push    {r7, lr}
000d80ea  add     r7, sp, #0
000d80ec  sub     sp, #8
000d80ee  mov     r3, r2
000d80f0  ldr     r2, [pc, #0x18]
000d80f2  mov.w   ip, #0
000d80f6  add     r2, pc ; -> 0x000fae7c  OBJC_IVAR_$_Social_Info.pendingChallenges
000d80f8  ldr     r2, [r2]
000d80fa  str.w   ip, [sp]
000d80fe  str.w   ip, [sp, #4]
000d8102  blx     #0xddc20 ; -> objc_setProperty
000d8106  sub.w   sp, r7, #0
000d810a  pop     {r7, pc}
000d810c  cmp     r5, #0x82
000d810e  movs    r2, r0
