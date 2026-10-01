========================================================================
ZN6Mayhem12MayhemThread4waitEv  0x0008b6a8  16 bytes   Mayhem.mm
========================================================================

0008b6a8  push    {r7, lr}
0008b6aa  add     r7, sp, #0
0008b6ac  movs    r1, #0
0008b6ae  ldr     r0, [r0, #8]
0008b6b0  blx     #0xddc68 ; -> pthread_join
0008b6b4  pop     {r7, pc}
0008b6b6  nop     
