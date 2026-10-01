========================================================================
tcf_0  0x0008c65c  20 bytes   Mayhem.mm
========================================================================

0008c65c  push    {r7, lr}
0008c65e  add     r7, sp, #0
0008c660  ldr     r0, [pc, #8]
0008c662  add     r0, pc ; -> 0x00379be4  ZN6Mayhem4User14s_userDatabaseE
0008c664  bl      #0x8c650 ; -> ZN6Mayhem12UserDatabaseD1Ev
0008c668  pop     {r7, pc}
0008c66a  nop     
0008c66c  bpl     #0x8c76c
0008c66e  movs    r6, r5
