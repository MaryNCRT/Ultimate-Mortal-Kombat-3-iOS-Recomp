========================================================================
-[Reachability localWiFiStatusForFlags  0x0009e3c8  20 bytes   Reachability.m
========================================================================

0009e3c8  and     r2, r2, #0x20002
0009e3cc  cmp.w   r2, #0x20002
0009e3d0  ite     ne
0009e3d2  movne   r2, #0
0009e3d4  moveq   r2, #1
0009e3d6  mov     r0, r2
0009e3d8  bx      lr
0009e3da  nop     
