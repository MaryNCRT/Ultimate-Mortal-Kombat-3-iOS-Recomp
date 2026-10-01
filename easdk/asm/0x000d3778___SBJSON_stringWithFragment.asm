========================================================================
-[SBJSON stringWithFragment  0x000d3778  32 bytes   SBJSON.m
========================================================================

000d3778  push    {r7, lr}
000d377a  add     r7, sp, #0
000d377c  sub     sp, #4
000d377e  ldr     r1, [pc, #0x14]
000d3780  str     r3, [sp]
000d3782  movs    r3, #1
000d3784  add     r1, pc ; -> 0x000fd764  'K\x04\x0f'
000d3786  ldr     r1, [r1]
000d3788  blx     #0xddbfc ; -> objc_msgSend
000d378c  sub.w   sp, r7, #0
000d3790  pop     {r7, pc}
000d3792  nop     
000d3794  ldr     r7, [sp, #0x370]
000d3796  movs    r2, r0
