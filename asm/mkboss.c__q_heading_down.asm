========================================================================
q_heading_down  0x000a89e8  28 bytes   mkboss.c
========================================================================

000a89e8  push    {r7, lr}
000a89ea  add     r7, sp, #0
000a89ec  ldr     r3, [r0]
000a89ee  ldr     r3, [r3, #4]
000a89f0  ldr     r3, [r3, #0x1c]
000a89f2  cmp     r3, #0
000a89f4  str     r3, [r0, #0x1c]
000a89f6  blt     #0xa89fe
000a89f8  bl      #0xa85cc ; -> q_yes
000a89fc  pop     {r7, pc}
000a89fe  bl      #0xa85d4 ; -> q_no
000a8a02  b       #0xa89fc
