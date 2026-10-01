========================================================================
ZSt4fillIPSsSsEvT_S1_RKT0_  0x0009a810  32 bytes   Mayhem.mm
========================================================================

0009a810  push    {r4, r5, r6, r7, lr}
0009a812  add     r7, sp, #0xc
0009a814  cmp     r0, r1
0009a816  mov     r4, r0
0009a818  mov     r6, r1
0009a81a  mov     r5, r2
0009a81c  beq     #0x9a82c
0009a81e  mov     r0, r4
0009a820  mov     r1, r5
0009a822  adds    r4, #4
0009a824  blx     #0xdd518 ; -> ZNSs6assignERKSs
0009a828  cmp     r6, r4
0009a82a  bne     #0x9a81e
0009a82c  pop     {r4, r5, r6, r7, pc}
0009a82e  nop     
