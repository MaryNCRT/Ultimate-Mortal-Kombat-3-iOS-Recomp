========================================================================
ZN6Mayhem29GetStatListRequestNonThreadedD2Ev  0x0009937c  24 bytes   Mayhem.mm
========================================================================

0009937c  push    {r7, lr}
0009937e  add     r7, sp, #0
00099380  ldr     r3, [pc, #0xc]
00099382  add     r3, pc ; -> 0x0017da48  ZTVN6Mayhem29GetStatListRequestNonThreadedE
00099384  adds    r3, #8
00099386  str     r3, [r0]
00099388  bl      #0x98f50 ; -> ZN6Mayhem18GetStatListRequestD2Ev
0009938c  pop     {r7, pc}
0009938e  nop     
00099390  mov     sl, r8
00099392  movs    r6, r1
