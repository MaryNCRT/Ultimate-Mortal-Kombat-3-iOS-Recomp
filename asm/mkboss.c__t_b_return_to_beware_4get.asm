========================================================================
t_b_return_to_beware_4get  0x000a858c  64 bytes   mkboss.c
========================================================================

000a858c  ldr.w   r3, [r0, #0xa4]
000a8590  ldr.w   r1, [r0, #0x108]
000a8594  adds    r3, #1
000a8596  ldr.w   r2, [r0, r3, lsl #3]
000a859a  cbz     r2, #0xa85a2
000a859c  mvn     r0, #2
000a85a0  bx      lr
000a85a2  ldr     r3, [r1]
000a85a4  str     r2, [r1, #0x1c]
000a85a6  str     r2, [r3, #0x5c]
000a85a8  ldr     r3, [pc, #0x1c]
000a85aa  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000a85ac  ldr     r1, [r3]
000a85ae  ldr.w   r3, [r0, #0xa4]
000a85b2  lsls    r3, r3, #3
000a85b4  adds    r3, r3, r0
000a85b6  str     r1, [r3, #4]
000a85b8  ldr.w   r3, [r0, #0xa4]
000a85bc  adds    r3, #1
000a85be  str.w   r2, [r0, r3, lsl #3]
000a85c2  mov     r0, r2
000a85c4  b       #0xa85a0
000a85c6  nop     
000a85c8  add     r6, sp, #0x1e8
000a85ca  movs    r4, r0
