========================================================================
ZN6Mayhem15PostStatRequestC1EPNS_5TokenERKSsS4_iiPKv  0x0008dc34  40 bytes   Mayhem.mm
========================================================================

0008dc34  push    {r7, lr}
0008dc36  add     r7, sp, #0
0008dc38  sub     sp, #0xc
0008dc3a  ldr.w   ip, [sp, #0x14]
0008dc3e  str.w   ip, [sp]
0008dc42  ldr.w   ip, [sp, #0x18]
0008dc46  str.w   ip, [sp, #4]
0008dc4a  ldr.w   ip, [sp, #0x1c]
0008dc4e  str.w   ip, [sp, #8]
0008dc52  bl      #0x8d9f4 ; -> ZN6Mayhem15PostStatRequestC2EPNS_5TokenERKSsS4_iiPKv
0008dc56  sub.w   sp, r7, #0
0008dc5a  pop     {r7, pc}
