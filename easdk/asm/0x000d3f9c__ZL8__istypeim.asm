========================================================================
ZL8__istypeim  0x000d3f9c  48 bytes   SBJsonParser.mm
========================================================================

000d3f9c  push    {r7, lr}
000d3f9e  add     r7, sp, #0
000d3fa0  bics    r3, r0, #0x7f
000d3fa4  bne     #0xd3fbc
000d3fa6  ldr     r3, [pc, #0x20]
000d3fa8  lsls    r0, r0, #2
000d3faa  add     r3, pc ; -> 0x000f344c  0x0
000d3fac  ldr     r3, [r3]
000d3fae  adds    r0, r0, r3
000d3fb0  ldr     r0, [r0, #0x34]
000d3fb2  tst     r1, r0
000d3fb4  ite     eq
000d3fb6  moveq   r0, #0
000d3fb8  movne   r0, #1
000d3fba  b       #0xd3fc6
000d3fbc  blx     #0xdd614 ; -> maskrune
000d3fc0  subs    r0, #0
000d3fc2  it      ne
000d3fc4  movne   r0, #1
000d3fc6  pop     {r7, pc}
000d3fc8  eors    r0, lr, #0x810000
