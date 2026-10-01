========================================================================
ZN6Mayhem18GetUserListRequest3runEv  0x00095150  32 bytes   Mayhem.mm
========================================================================

00095150  push    {r4, r7, lr}
00095152  add     r7, sp, #4
00095154  ldr     r2, [r0, #0x64]
00095156  ldr     r3, [r0, #0x60]
00095158  mov     r4, r0
0009515a  rsb     r3, r3, r2
0009515e  lsrs    r3, r3, #3
00095160  beq     #0x95166
00095162  bl      #0x940dc ; -> ZN6Mayhem18GetUserListRequest15IndirectRequestEv
00095166  mov     r0, r4
00095168  bl      #0x946a4 ; -> ZN6Mayhem18GetUserListRequest13DirectRequestEv
0009516c  pop     {r4, r7, pc}
0009516e  nop     
