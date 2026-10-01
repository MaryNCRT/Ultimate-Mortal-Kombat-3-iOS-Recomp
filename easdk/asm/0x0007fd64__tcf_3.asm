========================================================================
tcf_3  0x0007fd64  44 bytes   EASDK_Handler.mm
========================================================================

0007fd64  push    {r4, r5, r7, lr}
0007fd66  add     r7, sp, #8
0007fd68  ldr     r3, [pc, #0x20]
0007fd6a  add     r3, pc ; -> 0x00379b48  m_pendingStat
0007fd6c  ldr     r4, [r3]
0007fd6e  cbz     r4, #0x7fd7e
0007fd70  ldr     r3, [r4, #8]
0007fd72  add.w   r5, r4, #8
0007fd76  mov     r0, r5
0007fd78  ldr     r3, [r3, #8]
0007fd7a  blx     r3
0007fd7c  cbnz    r0, #0x7fd80
0007fd7e  pop     {r4, r5, r7, pc}
0007fd80  ldr     r3, [r4, #8]
0007fd82  mov     r0, r5
0007fd84  ldr     r3, [r3, #4]
0007fd86  blx     r3
0007fd88  b       #0x7fd7e
0007fd8a  nop     
0007fd8c  ldr     r5, [sp, #0x368]
0007fd8e  movs    r7, r5
