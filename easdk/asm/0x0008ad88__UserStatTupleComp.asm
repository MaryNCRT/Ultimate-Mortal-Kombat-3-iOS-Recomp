========================================================================
UserStatTupleComp  0x0008ad88  32 bytes   Mayhem.mm
========================================================================

0008ad88  push    {r4, r5, r7, lr}
0008ad8a  add     r7, sp, #8
0008ad8c  ldr     r0, [r0, #4]
0008ad8e  mov     r4, r1
0008ad90  bl      #0x8ad5c ; -> ZNK6Mayhem4Stat8GetValueEv
0008ad94  mov     r5, r0
0008ad96  ldr     r0, [r4, #4]
0008ad98  bl      #0x8ad5c ; -> ZNK6Mayhem4Stat8GetValueEv
0008ad9c  cmp     r5, r0
0008ad9e  ite     le
0008ada0  movle   r0, #0
0008ada2  movgt   r0, #1
0008ada4  pop     {r4, r5, r7, pc}
0008ada6  nop     
