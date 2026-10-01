========================================================================
EASOC_FBIsLoggedIn  0x0007ec38  24 bytes   EASDK_Handler.mm
========================================================================

0007ec38  push    {r7, lr}
0007ec3a  add     r7, sp, #0
0007ec3c  ldr     r0, [pc, #0xc]
0007ec3e  add     r0, pc ; -> 0x00175898  conn
0007ec40  ldr     r0, [r0]
0007ec42  cbz     r0, #0x7ec48
0007ec44  bl      #0x88620 ; -> ZN12FBConnection10isLoggedInEv
0007ec48  pop     {r7, pc}
0007ec4a  nop     
0007ec4c  ldr     r6, [r2, #0x44]
0007ec4e  movs    r7, r1
