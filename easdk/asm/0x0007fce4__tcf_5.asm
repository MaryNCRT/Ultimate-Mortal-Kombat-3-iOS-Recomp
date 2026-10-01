========================================================================
tcf_5  0x0007fce4  44 bytes   EASDK_Handler.mm
========================================================================

0007fce4  push    {r4, r5, r7, lr}
0007fce6  add     r7, sp, #8
0007fce8  ldr     r3, [pc, #0x20]
0007fcea  add     r3, pc ; -> 0x00379bb4  m_pendingGetUserStat
0007fcec  ldr     r4, [r3]
0007fcee  cbz     r4, #0x7fcfe
0007fcf0  ldr     r3, [r4, #8]
0007fcf2  add.w   r5, r4, #8
0007fcf6  mov     r0, r5
0007fcf8  ldr     r3, [r3, #8]
0007fcfa  blx     r3
0007fcfc  cbnz    r0, #0x7fd00
0007fcfe  pop     {r4, r5, r7, pc}
0007fd00  ldr     r3, [r4, #8]
0007fd02  mov     r0, r5
0007fd04  ldr     r3, [r3, #4]
0007fd06  blx     r3
0007fd08  b       #0x7fcfe
0007fd0a  nop     
0007fd0c  ldr     r6, [sp, #0x318]
0007fd0e  movs    r7, r5
