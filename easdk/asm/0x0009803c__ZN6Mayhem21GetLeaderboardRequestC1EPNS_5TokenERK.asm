========================================================================
ZN6Mayhem21GetLeaderboardRequestC1EPNS_5TokenERKSsiS4_ii  0x0009803c  40 bytes   Mayhem.mm
========================================================================

0009803c  push    {r7, lr}
0009803e  add     r7, sp, #0
00098040  sub     sp, #0xc
00098042  ldr.w   ip, [sp, #0x14]
00098046  str.w   ip, [sp]
0009804a  ldr.w   ip, [sp, #0x18]
0009804e  str.w   ip, [sp, #4]
00098052  ldr.w   ip, [sp, #0x1c]
00098056  str.w   ip, [sp, #8]
0009805a  bl      #0x97d3c ; -> ZN6Mayhem21GetLeaderboardRequestC2EPNS_5TokenERKSsiS4_ii
0009805e  sub.w   sp, r7, #0
00098062  pop     {r7, pc}
