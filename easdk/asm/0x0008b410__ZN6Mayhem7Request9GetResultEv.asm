========================================================================
ZN6Mayhem7Request9GetResultEv  0x0008b410  28 bytes   Mayhem.mm
========================================================================

0008b410  push    {r4, r5, r7, lr}
0008b412  add     r7, sp, #8
0008b414  add.w   r4, r0, #0x20
0008b418  mov     r5, r0
0008b41a  mov     r0, r4
0008b41c  blx     #0xddc8c ; -> pthread_mutex_lock
0008b420  mov     r0, r4
0008b422  ldr     r5, [r5, #0x4c]
0008b424  blx     #0xddc98 ; -> pthread_mutex_unlock
0008b428  mov     r0, r5
0008b42a  pop     {r4, r5, r7, pc}
