========================================================================
-[SBJSON fragmentWithString  0x000d3608  32 bytes   SBJSON.m
========================================================================

000d3608  push    {r7, lr}
000d360a  add     r7, sp, #0
000d360c  sub     sp, #4
000d360e  ldr     r1, [pc, #0x14]
000d3610  str     r3, [sp]
000d3612  movs    r3, #1
000d3614  add     r1, pc ; -> 0x000fd75c  
000d3616  ldr     r1, [r1]
000d3618  blx     #0xddbfc ; -> objc_msgSend
000d361c  sub.w   sp, r7, #0
000d3620  pop     {r7, pc}
000d3622  nop     
000d3624  adr     r1, #0x110
000d3626  movs    r2, r0
