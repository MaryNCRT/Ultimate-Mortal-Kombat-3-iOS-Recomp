========================================================================
ZN4midp16ReferenceCounted7_incRefEv  0x0009e2e0  16 bytes   ReferenceCounted.cpp
========================================================================

0009e2e0  push    {r7, lr}
0009e2e2  add     r7, sp, #0
0009e2e4  adds    r1, r0, #4
0009e2e6  movs    r0, #1
0009e2e8  blx     #0xdd428 ; -> OSAtomicAdd32
0009e2ec  pop     {r7, pc}
0009e2ee  nop     
