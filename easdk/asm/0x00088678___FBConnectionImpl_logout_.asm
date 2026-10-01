========================================================================
-[FBConnectionImpl logout]  0x00088678  32 bytes   FBConnection.mm
========================================================================

00088678  push    {r7, lr}
0008867a  add     r7, sp, #0
0008867c  ldr     r0, [pc, #0x10]
0008867e  ldr     r1, [pc, #0x14]
00088680  add     r0, pc ; -> 0x00379bc8  session
00088682  add     r1, pc ; -> 0x000fcd90  
00088684  ldr     r0, [r0]
00088686  ldr     r1, [r1]
00088688  blx     #0xddbfc ; -> objc_msgSend
0008868c  pop     {r7, pc}
0008868e  nop     
00088690  asrs    r4, r0, #0x15
00088692  movs    r7, r5
00088694  bx      r1
00088696  movs    r7, r0
