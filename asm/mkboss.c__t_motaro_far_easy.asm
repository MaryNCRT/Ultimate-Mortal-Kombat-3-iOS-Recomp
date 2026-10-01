========================================================================
t_motaro_far_easy  0x000a869c  96 bytes   mkboss.c
========================================================================

000a869c  ldr.w   r3, [r0, #0xa4]
000a86a0  ldr.w   r2, [r0, #0x108]
000a86a4  adds    r3, #1
000a86a6  ldr.w   r1, [r0, r3, lsl #3]
000a86aa  cbz     r1, #0xa86b2
000a86ac  mvn     r0, #2
000a86b0  bx      lr
000a86b2  ldr     r3, [pc, #0x40]
000a86b4  add     r3, pc ; -> 0x0017b9bc  funcs.5148
000a86b6  str     r3, [r2, #0x68]
000a86b8  movs    r3, #2
000a86ba  str     r3, [r2, #0x64]
000a86bc  ldr.w   r3, [r0, #0xa4]
000a86c0  mov.w   r2, #0x180
000a86c4  adds    r3, #1
000a86c6  str.w   r2, [r0, r3, lsl #3]
000a86ca  ldr.w   r3, [r0, #0xa4]
000a86ce  adds    r2, r3, #1
000a86d0  ldr     r3, [pc, #0x24]
000a86d2  str.w   r2, [r0, #0xa4]
000a86d6  add     r3, pc ; -> 0x000f3404  t_random_do
000a86d8  ldr.w   ip, [r3]
000a86dc  lsls    r3, r2, #3
000a86de  adds    r3, r3, r0
000a86e0  str.w   ip, [r3, #4]
000a86e4  ldr.w   r3, [r0, #0xa4]
000a86e8  adds    r3, #1
000a86ea  str.w   r1, [r0, r3, lsl #3]
000a86ee  mov     r0, r1
000a86f0  b       #0xa86b0
000a86f2  nop     
000a86f4  adds    r3, #4
000a86f6  movs    r5, r1
000a86f8  add     r5, sp, #0xa8
000a86fa  movs    r4, r0
