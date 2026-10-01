========================================================================
-[Social_Info setFriendId  0x000d8238  44 bytes   Social_Info.mm
========================================================================

000d8238  push    {r7, lr}
000d823a  add     r7, sp, #0
000d823c  sub     sp, #8
000d823e  mov     r3, r2
000d8240  ldr     r2, [pc, #0x1c]
000d8242  mov.w   ip, #0
000d8246  add     r2, pc ; -> 0x000fae8c  OBJC_IVAR_$_Social_Info.friendId
000d8248  ldr     r2, [r2]
000d824a  str.w   ip, [sp]
000d824e  add.w   ip, ip, #1
000d8252  str.w   ip, [sp, #4]
000d8256  blx     #0xddc20 ; -> objc_setProperty
000d825a  sub.w   sp, r7, #0
000d825e  pop     {r7, pc}
000d8260  cmp     r4, #0x42
000d8262  movs    r2, r0
