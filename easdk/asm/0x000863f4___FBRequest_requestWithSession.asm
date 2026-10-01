========================================================================
+[FBRequest requestWithSession  0x000863f4  64 bytes   FBRequest.m
========================================================================

000863f4  push    {r4, r7, lr}
000863f6  add     r7, sp, #4
000863f8  ldr     r0, [pc, #0x28]
000863fa  ldr     r1, [pc, #0x2c]
000863fc  mov     r4, r2
000863fe  add     r0, pc ; -> 0x000fdbf0  
00086400  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
00086402  ldr     r0, [r0]
00086404  ldr     r1, [r1]
00086406  blx     #0xddbfc ; -> objc_msgSend
0008640a  ldr     r1, [pc, #0x20]
0008640c  mov     r2, r4
0008640e  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
00086410  ldr     r1, [r1]
00086412  blx     #0xddbfc ; -> objc_msgSend
00086416  ldr     r1, [pc, #0x18]
00086418  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0008641a  ldr     r1, [r1]
0008641c  blx     #0xddbfc ; -> objc_msgSend
00086420  pop     {r4, r7, pc}
00086422  nop     
00086424  strb    r6, [r5, #0x1f]
00086426  movs    r7, r0
00086428  str     r0, [r0, #0x58]
0008642a  movs    r7, r0
0008642c  ldr     r6, [r0, #0xc]
0008642e  movs    r7, r0
00086430  str     r4, [r7, #0x60]
00086432  movs    r7, r0
