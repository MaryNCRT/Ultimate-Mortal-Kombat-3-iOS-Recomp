========================================================================
-[SBJSON stringWithObject  0x000d3758  32 bytes   SBJSON.m
========================================================================

000d3758  push    {r7, lr}
000d375a  add     r7, sp, #0
000d375c  sub     sp, #4
000d375e  ldr     r1, [pc, #0x14]
000d3760  str     r3, [sp]
000d3762  movs    r3, #0
000d3764  add     r1, pc ; -> 0x000fd764  'K\x04\x0f'
000d3766  ldr     r1, [r1]
000d3768  blx     #0xddbfc ; -> objc_msgSend
000d376c  sub.w   sp, r7, #0
000d3770  pop     {r7, pc}
000d3772  nop     
000d3774  ldr     r7, [sp, #0x3f0]
000d3776  movs    r2, r0
