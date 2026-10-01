========================================================================
ZN6Mayhem29GetStatListRequestNonThreadedD0Ev  0x0009935c  32 bytes   Mayhem.mm
========================================================================

0009935c  push    {r4, r7, lr}
0009935e  add     r7, sp, #4
00099360  ldr     r3, [pc, #0x14]
00099362  mov     r4, r0
00099364  add     r3, pc ; -> 0x0017da48  ZTVN6Mayhem29GetStatListRequestNonThreadedE
00099366  adds    r3, #8
00099368  str     r3, [r0]
0009936a  bl      #0x98f50 ; -> ZN6Mayhem18GetStatListRequestD2Ev
0009936e  mov     r0, r4
00099370  blx     #0xdd5a8 ; -> ZdlPv
00099374  pop     {r4, r7, pc}
00099376  nop     
00099378  mov     r8, ip
0009937a  movs    r6, r1
