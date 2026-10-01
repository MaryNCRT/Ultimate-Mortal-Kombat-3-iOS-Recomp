========================================================================
tcf_6  0x0007fd38  44 bytes   EASDK_Handler.mm
========================================================================

0007fd38  push    {r4, r5, r7, lr}
0007fd3a  add     r7, sp, #8
0007fd3c  ldr     r3, [pc, #0x20]
0007fd3e  add     r3, pc ; -> 0x00379bb8  m_pendingChallenge
0007fd40  ldr     r4, [r3]
0007fd42  cbz     r4, #0x7fd52
0007fd44  ldr     r3, [r4, #0x20]
0007fd46  add.w   r5, r4, #0x20
0007fd4a  mov     r0, r5
0007fd4c  ldr     r3, [r3, #8]
0007fd4e  blx     r3
0007fd50  cbnz    r0, #0x7fd54
0007fd52  pop     {r4, r5, r7, pc}
0007fd54  ldr     r3, [r4, #0x20]
0007fd56  mov     r0, r5
0007fd58  ldr     r3, [r3, #4]
0007fd5a  blx     r3
0007fd5c  b       #0x7fd52
0007fd5e  nop     
0007fd60  ldr     r6, [sp, #0x1d8]
0007fd62  movs    r7, r5
