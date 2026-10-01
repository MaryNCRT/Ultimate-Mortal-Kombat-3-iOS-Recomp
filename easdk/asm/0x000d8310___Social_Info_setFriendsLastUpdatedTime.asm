========================================================================
-[Social_Info setFriendsLastUpdatedTime  0x000d8310  40 bytes   Social_Info.mm
========================================================================

000d8310  push    {r7, lr}
000d8312  add     r7, sp, #0
000d8314  sub     sp, #8
000d8316  mov     r3, r2
000d8318  ldr     r2, [pc, #0x18]
000d831a  mov.w   ip, #0
000d831e  add     r2, pc ; -> 0x000fae74  OBJC_IVAR_$_Social_Info.friendsLastUpdatedTime
000d8320  ldr     r2, [r2]
000d8322  str.w   ip, [sp]
000d8326  str.w   ip, [sp, #4]
000d832a  blx     #0xddc20 ; -> objc_setProperty
000d832e  sub.w   sp, r7, #0
000d8332  pop     {r7, pc}
000d8334  cmp     r3, #0x52
000d8336  movs    r2, r0
