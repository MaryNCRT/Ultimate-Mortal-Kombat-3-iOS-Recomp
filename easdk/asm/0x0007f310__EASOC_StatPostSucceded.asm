========================================================================
EASOC_StatPostSucceded  0x0007f310  68 bytes   EASDK_Handler.mm
========================================================================

0007f310  push    {r4, r7, lr}
0007f312  add     r7, sp, #4
0007f314  sub     sp, #4
0007f316  ldr     r4, [pc, #0x30]
0007f318  add     r4, pc ; -> 0x0017e5e4  
0007f31a  mov     r0, r4
0007f31c  blx     #0xdd3e0 ; -> NSLog
0007f320  ldr     r0, [pc, #0x28]
0007f322  add     r0, pc ; -> 0x0017e604  
0007f324  blx     #0xdd3e0 ; -> NSLog
0007f328  mov     r0, r4
0007f32a  blx     #0xdd3e0 ; -> NSLog
0007f32e  ldr     r2, [pc, #0x20]
0007f330  movs    r3, #0
0007f332  movw    r0, #0x3f5
0007f336  add     r2, pc ; -> 0x001757a8  'Score posted successfully'
0007f338  movs    r1, #0xf
0007f33a  str     r3, [sp]
0007f33c  bl      #0x7f1e4 ; -> EASDK_LogEventEnumEnumString
0007f340  sub.w   sp, r7, #4
0007f344  pop     {r4, r7, pc}
0007f346  nop     
0007f348  movt    r0, #0x800f
