========================================================================
ZN8FBFriendC1ExRKSsS1_  0x00088d54  24 bytes   FBConnection.mm
========================================================================

00088d54  push    {r7, lr}
00088d56  add     r7, sp, #0
00088d58  sub     sp, #4
00088d5a  ldr.w   ip, [sp, #0xc]
00088d5e  str.w   ip, [sp]
00088d62  bl      #0x88c70 ; -> ZN8FBFriendC2ExRKSsS1_
00088d66  sub.w   sp, r7, #0
00088d6a  pop     {r7, pc}
