========================================================================
tcf_4  0x0007fd10  40 bytes   EASDK_Handler.mm
========================================================================

0007fd10  push    {r4, r7, lr}
0007fd12  add     r7, sp, #4
0007fd14  ldr     r0, [pc, #0x1c]
0007fd16  add     r0, pc ; -> 0x00379b4c  m_mayhemToken
0007fd18  ldr     r4, [r0]
0007fd1a  cbz     r4, #0x7fd26
0007fd1c  ldr     r3, [r4]
0007fd1e  mov     r0, r4
0007fd20  ldr     r3, [r3, #8]
0007fd22  blx     r3
0007fd24  cbnz    r0, #0x7fd28
0007fd26  pop     {r4, r7, pc}
0007fd28  ldr     r3, [r4]
0007fd2a  mov     r0, r4
0007fd2c  ldr     r3, [r3, #4]
0007fd2e  blx     r3
0007fd30  b       #0x7fd26
0007fd32  nop     
0007fd34  ldr     r6, [sp, #0xc8]
0007fd36  movs    r7, r5
