========================================================================
t_motaro_far_hard  0x000a863c  96 bytes   mkboss.c
========================================================================

000a863c  ldr.w   r3, [r0, #0xa4]
000a8640  ldr.w   r2, [r0, #0x108]
000a8644  adds    r3, #1
000a8646  ldr.w   r1, [r0, r3, lsl #3]
000a864a  cbz     r1, #0xa8652
000a864c  mvn     r0, #2
000a8650  bx      lr
000a8652  ldr     r3, [pc, #0x40]
000a8654  add     r3, pc ; -> 0x0017b9c4  funcs.5132
000a8656  str     r3, [r2, #0x68]
000a8658  movs    r3, #2
000a865a  str     r3, [r2, #0x64]
000a865c  ldr.w   r3, [r0, #0xa4]
000a8660  mov.w   r2, #0x16e
000a8664  adds    r3, #1
000a8666  str.w   r2, [r0, r3, lsl #3]
000a866a  ldr.w   r3, [r0, #0xa4]
000a866e  adds    r2, r3, #1
000a8670  ldr     r3, [pc, #0x24]
000a8672  str.w   r2, [r0, #0xa4]
000a8676  add     r3, pc ; -> 0x000f3404  t_random_do
000a8678  ldr.w   ip, [r3]
000a867c  lsls    r3, r2, #3
000a867e  adds    r3, r3, r0
000a8680  str.w   ip, [r3, #4]
000a8684  ldr.w   r3, [r0, #0xa4]
000a8688  adds    r3, #1
000a868a  str.w   r1, [r0, r3, lsl #3]
000a868e  mov     r0, r1
000a8690  b       #0xa8650
000a8692  nop     
000a8694  adds    r3, #0x6c
000a8696  movs    r5, r1
000a8698  add     r5, sp, #0x228
000a869a  movs    r4, r0
