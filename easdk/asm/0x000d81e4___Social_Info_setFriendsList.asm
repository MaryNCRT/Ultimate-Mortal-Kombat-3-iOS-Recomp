========================================================================
-[Social_Info setFriendsList  0x000d81e4  40 bytes   Social_Info.mm
========================================================================

000d81e4  push    {r7, lr}
000d81e6  add     r7, sp, #0
000d81e8  sub     sp, #8
000d81ea  mov     r3, r2
000d81ec  ldr     r2, [pc, #0x18]
000d81ee  mov.w   ip, #0
000d81f2  add     r2, pc ; -> 0x000fae98  OBJC_IVAR_$_Social_Info.friendsList
000d81f4  ldr     r2, [r2]
000d81f6  str.w   ip, [sp]
000d81fa  str.w   ip, [sp, #4]
000d81fe  blx     #0xddc20 ; -> objc_setProperty
000d8202  sub.w   sp, r7, #0
000d8206  pop     {r7, pc}
000d8208  cmp     r4, #0xa2
000d820a  movs    r2, r0
