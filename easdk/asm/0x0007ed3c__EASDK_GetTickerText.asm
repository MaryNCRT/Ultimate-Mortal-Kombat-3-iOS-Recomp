========================================================================
EASDK_GetTickerText  0x0007ed3c  52 bytes   EASDK_Handler.mm
========================================================================

0007ed3c  push    {r4, r7, lr}
0007ed3e  add     r7, sp, #4
0007ed40  sub     sp, #4
0007ed42  ldr     r1, [pc, #0x24]
0007ed44  ldr     r4, [pc, #0x24]
0007ed46  movs    r3, #0xa
0007ed48  add     r1, pc ; -> 0x000fcbc4  'Rm\x0e'
0007ed4a  add     r4, pc ; -> 0x00375b34  convBuffer
0007ed4c  str     r3, [sp]
0007ed4e  mov     r2, r4
0007ed50  mov.w   r3, #0x4000
0007ed54  ldr     r1, [r1]
0007ed56  blx     #0xddbfc ; -> objc_msgSend
0007ed5a  movw    r3, #0x3fff
0007ed5e  movs    r2, #0
0007ed60  strb    r2, [r4, r3]
0007ed62  sub.w   sp, r7, #4
0007ed66  pop     {r4, r7, pc}
0007ed68  udf     #0x78
0007ed6a  movs    r7, r0
0007ed6c  ldr     r6, [r4, #0x5c]
0007ed6e  movs    r7, r5
