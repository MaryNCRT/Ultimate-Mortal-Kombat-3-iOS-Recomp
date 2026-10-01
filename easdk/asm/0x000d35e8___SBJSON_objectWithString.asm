========================================================================
-[SBJSON objectWithString  0x000d35e8  32 bytes   SBJSON.m
========================================================================

000d35e8  push    {r7, lr}
000d35ea  add     r7, sp, #0
000d35ec  sub     sp, #4
000d35ee  ldr     r1, [pc, #0x14]
000d35f0  str     r3, [sp]
000d35f2  movs    r3, #0
000d35f4  add     r1, pc ; -> 0x000fd75c  
000d35f6  ldr     r1, [r1]
000d35f8  blx     #0xddbfc ; -> objc_msgSend
000d35fc  sub.w   sp, r7, #0
000d3600  pop     {r7, pc}
000d3602  nop     
000d3604  adr     r1, #0x190
000d3606  movs    r2, r0
