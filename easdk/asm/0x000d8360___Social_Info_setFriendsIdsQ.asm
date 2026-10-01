========================================================================
-[Social_Info setFriendsIdsQ  0x000d8360  40 bytes   Social_Info.mm
========================================================================

000d8360  push    {r7, lr}
000d8362  add     r7, sp, #0
000d8364  sub     sp, #8
000d8366  mov     r3, r2
000d8368  ldr     r2, [pc, #0x18]
000d836a  mov.w   ip, #0
000d836e  add     r2, pc ; -> 0x000fae68  OBJC_IVAR_$_Social_Info.friendsIdsQ
000d8370  ldr     r2, [r2]
000d8372  str.w   ip, [sp]
000d8376  str.w   ip, [sp, #4]
000d837a  blx     #0xddc20 ; -> objc_setProperty
000d837e  sub.w   sp, r7, #0
000d8382  pop     {r7, pc}
000d8384  cmp     r2, #0xf6
000d8386  movs    r2, r0
