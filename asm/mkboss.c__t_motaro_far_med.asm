========================================================================
t_motaro_far_med  0x000a85dc  96 bytes   mkboss.c
========================================================================

000a85dc  ldr.w   r3, [r0, #0xa4]
000a85e0  ldr.w   r2, [r0, #0x108]
000a85e4  adds    r3, #1
000a85e6  ldr.w   r1, [r0, r3, lsl #3]
000a85ea  cbz     r1, #0xa85f2
000a85ec  mvn     r0, #2
000a85f0  bx      lr
000a85f2  ldr     r3, [pc, #0x40]
000a85f4  add     r3, pc ; -> 0x0017b9cc  funcs.5116
000a85f6  str     r3, [r2, #0x68]
000a85f8  movs    r3, #2
000a85fa  str     r3, [r2, #0x64]
000a85fc  ldr.w   r3, [r0, #0xa4]
000a8600  movw    r2, #0x15b
000a8604  adds    r3, #1
000a8606  str.w   r2, [r0, r3, lsl #3]
000a860a  ldr.w   r3, [r0, #0xa4]
000a860e  adds    r2, r3, #1
000a8610  ldr     r3, [pc, #0x24]
000a8612  str.w   r2, [r0, #0xa4]
000a8616  add     r3, pc ; -> 0x000f3404  t_random_do
000a8618  ldr.w   ip, [r3]
000a861c  lsls    r3, r2, #3
000a861e  adds    r3, r3, r0
000a8620  str.w   ip, [r3, #4]
000a8624  ldr.w   r3, [r0, #0xa4]
000a8628  adds    r3, #1
000a862a  str.w   r1, [r0, r3, lsl #3]
000a862e  mov     r0, r1
000a8630  b       #0xa85f0
000a8632  nop     
000a8634  adds    r3, #0xd4
000a8636  movs    r5, r1
000a8638  add     r5, sp, #0x3a8
000a863a  movs    r4, r0
