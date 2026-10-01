========================================================================
tcf_1  0x0007fc80  100 bytes   EASDK_Handler.mm
========================================================================

0007fc80  push    {r4, r7, lr}
0007fc82  add     r7, sp, #4
0007fc84  sub     sp, #4
0007fc86  ldr     r3, [pc, #0x54]
0007fc88  add     r3, pc ; -> 0x00379b40  m_mayhemID
0007fc8a  ldr     r2, [r3]
0007fc8c  ldr     r3, [pc, #0x50]
0007fc8e  sub.w   r0, r2, #0xc
0007fc92  add     r3, pc ; -> 0x000f3370  0x0
0007fc94  ldr     r3, [r3]
0007fc96  cmp     r0, r3
0007fc98  bne     #0x7fca0
0007fc9a  sub.w   sp, r7, #4
0007fc9e  pop     {r4, r7, pc}
0007fca0  ldr     r3, [r2, #-0x4]
0007fca4  subs    r1, r2, #4
0007fca6  subs    r2, r3, #1
0007fca8  dmb     ish
0007fcac  mov     ip, r3
0007fcae  ldrex   r4, [r1]
0007fcb2  cmp     r4, r3
0007fcb4  beq     #0x7fcca
0007fcb6  cmp     r4, ip
0007fcb8  mov     r3, r4
0007fcba  bne     #0x7fca6
0007fcbc  cmp     r4, #0
0007fcbe  bgt     #0x7fc9a
0007fcc0  add.w   r1, sp, #3
0007fcc4  blx     #0xdd4e8 ; -> ZNSs4_Rep10_M_destroyERKSaIcE
0007fcc8  b       #0x7fc9a
0007fcca  strex   lr, r2, [r1]
0007fcce  cmp.w   lr, #0
0007fcd2  bne     #0x7fcae
0007fcd4  dmb     ish
0007fcd8  b       #0x7fcb6
0007fcda  nop     
0007fcdc  ldr     r6, [sp, #0x2d0]
0007fcde  movs    r7, r5
0007fce0  adds    r6, #0xda
0007fce2  movs    r7, r0
