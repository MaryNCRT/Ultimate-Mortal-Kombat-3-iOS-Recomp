========================================================================
-[Social_Info setFriendsLBQ  0x000d82e8  40 bytes   Social_Info.mm
========================================================================

000d82e8  push    {r7, lr}
000d82ea  add     r7, sp, #0
000d82ec  sub     sp, #8
000d82ee  mov     r3, r2
000d82f0  ldr     r2, [pc, #0x18]
000d82f2  mov.w   ip, #0
000d82f6  add     r2, pc ; -> 0x000fae64  OBJC_IVAR_$_Social_Info.friendsLBQ
000d82f8  ldr     r2, [r2]
000d82fa  str.w   ip, [sp]
000d82fe  str.w   ip, [sp, #4]
000d8302  blx     #0xddc20 ; -> objc_setProperty
000d8306  sub.w   sp, r7, #0
000d830a  pop     {r7, pc}
000d830c  cmp     r3, #0x6a
000d830e  movs    r2, r0
