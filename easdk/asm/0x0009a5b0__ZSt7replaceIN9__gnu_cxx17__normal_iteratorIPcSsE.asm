========================================================================
ZSt7replaceIN9__gnu_cxx17__normal_iteratorIPcSsEEcEvT_S4_RKT0_S7_  0x0009a5b0  36 bytes   Mayhem.mm
========================================================================

0009a5b0  push    {lr}
0009a5b2  cmp     r0, r1
0009a5b4  beq     #0x9a5d0
0009a5b6  ldrsb.w lr, [r0]
0009a5ba  ldrsb.w ip, [r2]
0009a5be  cmp     lr, ip
0009a5c0  itt     eq
0009a5c2  ldrbeq.w ip, [r3]
0009a5c6  strbeq.w ip, [r0]
0009a5ca  adds    r0, #1
0009a5cc  cmp     r0, r1
0009a5ce  bne     #0x9a5b6
0009a5d0  pop     {pc}
0009a5d2  nop     
