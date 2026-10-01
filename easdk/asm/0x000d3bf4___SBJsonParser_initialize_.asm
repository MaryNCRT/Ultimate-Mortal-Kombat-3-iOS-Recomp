========================================================================
+[SBJsonParser initialize]  0x000d3bf4  60 bytes   SBJsonParser.mm
========================================================================

000d3bf4  ldr     r3, [pc, #0x2c]
000d3bf6  movs    r2, #0x22
000d3bf8  ldr     r0, [pc, #0x2c]
000d3bfa  add     r3, pc ; -> 0x006bc138  ZL4ctrl
000d3bfc  strb    r2, [r3]
000d3bfe  adds    r2, #0x3a
000d3c00  strb    r2, [r3, #1]
000d3c02  ldr     r3, [pc, #0x28]
000d3c04  subs    r2, #0x5b
000d3c06  add     r3, pc ; -> 0x006bc138  ZL4ctrl
000d3c08  strb    r2, [r3, #2]
000d3c0a  adds    r2, #1
000d3c0c  mov     r1, r0
000d3c0e  add     r1, pc
000d3c10  add.w   r3, r2, r1
000d3c14  strb    r2, [r3, #1]
000d3c16  adds    r2, #1
000d3c18  cmp     r2, #0x20
000d3c1a  bne     #0xd3c0c
000d3c1c  movs    r3, #0
000d3c1e  strb.w  r3, [r1, #0x21]
000d3c22  bx      lr
000d3c24  strh    r2, [r7, #0x28]
000d3c26  lsls    r6, r3, #1
000d3c28  strh    r6, [r4, #0x28]
000d3c2a  lsls    r6, r3, #1
000d3c2c  strh    r6, [r5, #0x28]
000d3c2e  lsls    r6, r3, #1
