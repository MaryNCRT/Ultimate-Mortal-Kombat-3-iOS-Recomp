========================================================================
t_boss_close_attack  0x000a879c  96 bytes   mkboss.c
========================================================================

000a879c  ldr.w   r3, [r0, #0xa4]
000a87a0  ldr.w   r2, [r0, #0x108]
000a87a4  adds    r3, #1
000a87a6  ldr.w   r1, [r0, r3, lsl #3]
000a87aa  cbz     r1, #0xa87b2
000a87ac  mvn     r0, #2
000a87b0  bx      lr
000a87b2  ldr     r3, [pc, #0x40]
000a87b4  add     r3, pc ; -> 0x0017b9b0  funcs.5239
000a87b6  str     r3, [r2, #0x68]
000a87b8  movs    r3, #3
000a87ba  str     r3, [r2, #0x64]
000a87bc  ldr.w   r3, [r0, #0xa4]
000a87c0  movw    r2, #0x1d3
000a87c4  adds    r3, #1
000a87c6  str.w   r2, [r0, r3, lsl #3]
000a87ca  ldr.w   r3, [r0, #0xa4]
000a87ce  adds    r2, r3, #1
000a87d0  ldr     r3, [pc, #0x24]
000a87d2  str.w   r2, [r0, #0xa4]
000a87d6  add     r3, pc ; -> 0x000f3404  t_random_do
000a87d8  ldr.w   ip, [r3]
000a87dc  lsls    r3, r2, #3
000a87de  adds    r3, r3, r0
000a87e0  str.w   ip, [r3, #4]
000a87e4  ldr.w   r3, [r0, #0xa4]
000a87e8  adds    r3, #1
000a87ea  str.w   r1, [r0, r3, lsl #3]
000a87ee  mov     r0, r1
000a87f0  b       #0xa87b0
000a87f2  nop     
000a87f4  adds    r1, #0xf8
000a87f6  movs    r5, r1
000a87f8  add     r4, sp, #0xa8
000a87fa  movs    r4, r0
