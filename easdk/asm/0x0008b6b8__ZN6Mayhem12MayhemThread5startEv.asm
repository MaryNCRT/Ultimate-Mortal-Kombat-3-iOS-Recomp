========================================================================
ZN6Mayhem12MayhemThread5startEv  0x0008b6b8  48 bytes   Mayhem.mm
========================================================================

0008b6b8  push    {r4, r7, lr}
0008b6ba  add     r7, sp, #4
0008b6bc  sub     sp, #0x28
0008b6be  mov     r4, r0
0008b6c0  mov     r0, sp
0008b6c2  blx     #0xddc50 ; -> pthread_attr_init
0008b6c6  ldr     r2, [pc, #0x1c]
0008b6c8  add.w   r0, r4, #8
0008b6cc  mov     r1, sp
0008b6ce  add     r2, pc ; -> 0x0008b5a1  ZN6Mayhem15threadRunMethodEPv
0008b6d0  mov     r3, r4
0008b6d2  blx     #0xddc5c ; -> pthread_create
0008b6d6  mov     r0, sp
0008b6d8  blx     #0xddc44 ; -> pthread_attr_destroy
0008b6dc  sub.w   sp, r7, #4
0008b6e0  pop     {r4, r7, pc}
0008b6e2  nop     
0008b6e4  mcr2    p15, #6, pc, c15, c15, #7
