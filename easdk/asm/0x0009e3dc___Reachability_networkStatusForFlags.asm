========================================================================
-[Reachability networkStatusForFlags  0x0009e3dc  44 bytes   Reachability.m
========================================================================

0009e3dc  ands    r0, r2, #2
0009e3e0  beq     #0x9e3fc
0009e3e2  lsrs    r3, r2, #2
0009e3e4  tst.w   r2, #0x28
0009e3e8  eor     r3, r3, #1
0009e3ec  and     r0, r3, #1
0009e3f0  bne     #0x9e3fe
0009e3f2  tst.w   r2, #0x40000
0009e3f6  ite     eq
0009e3f8  sxtbeq  r0, r0
0009e3fa  movne   r0, #2
0009e3fc  bx      lr
0009e3fe  tst.w   r2, #0x10
0009e402  it      eq
0009e404  moveq   r0, #1
0009e406  b       #0x9e3f2
