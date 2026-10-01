========================================================================
ZN6Mayhem29GetStatListRequestNonThreadedC1EPNS_5TokenERKSsiS4_ii  0x00099738  40 bytes   Mayhem.mm
========================================================================

00099738  push    {r7, lr}
0009973a  add     r7, sp, #0
0009973c  sub     sp, #0xc
0009973e  ldr.w   ip, [sp, #0x14]
00099742  str.w   ip, [sp]
00099746  ldr.w   ip, [sp, #0x18]
0009974a  str.w   ip, [sp, #4]
0009974e  ldr.w   ip, [sp, #0x1c]
00099752  str.w   ip, [sp, #8]
00099756  bl      #0x99668 ; -> ZN6Mayhem29GetStatListRequestNonThreadedC2EPNS_5TokenERKSsiS4_ii
0009975a  sub.w   sp, r7, #0
0009975e  pop     {r7, pc}
