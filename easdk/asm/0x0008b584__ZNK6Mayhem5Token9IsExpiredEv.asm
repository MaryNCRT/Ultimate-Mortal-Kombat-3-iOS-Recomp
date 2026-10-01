========================================================================
ZNK6Mayhem5Token9IsExpiredEv  0x0008b584  28 bytes   Mayhem.mm
========================================================================

0008b584  push    {r4, r7, lr}
0008b586  add     r7, sp, #4
0008b588  mov     r4, r0
0008b58a  movs    r0, #0
0008b58c  blx     #0xdde3c ; -> time
0008b590  ldr     r3, [r4, #0x5c]
0008b592  subs    r0, r0, r3
0008b594  ldr     r3, [r4, #0x60]
0008b596  cmp     r0, r3
0008b598  ite     lt
0008b59a  movlt   r0, #0
0008b59c  movge   r0, #1
0008b59e  pop     {r4, r7, pc}
