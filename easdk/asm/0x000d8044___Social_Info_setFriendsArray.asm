========================================================================
-[Social_Info setFriendsArray  0x000d8044  40 bytes   Social_Info.mm
========================================================================

000d8044  push    {r7, lr}
000d8046  add     r7, sp, #0
000d8048  sub     sp, #8
000d804a  mov     r3, r2
000d804c  ldr     r2, [pc, #0x18]
000d804e  mov.w   ip, #0
000d8052  add     r2, pc ; -> 0x000fae78  OBJC_IVAR_$_Social_Info.friendsArray
000d8054  ldr     r2, [r2]
000d8056  str.w   ip, [sp]
000d805a  str.w   ip, [sp, #4]
000d805e  blx     #0xddc20 ; -> objc_setProperty
000d8062  sub.w   sp, r7, #0
000d8066  pop     {r7, pc}
000d8068  cmp     r6, #0x22
000d806a  movs    r2, r0
