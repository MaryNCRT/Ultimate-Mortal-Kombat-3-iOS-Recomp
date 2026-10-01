========================================================================
c_elbow  0x0006bcc4  124 bytes   mkdrone.c
========================================================================

0006bcc4  ldr.w   r3, [r0, #0xa4]
0006bcc8  ldr.w   r1, [r0, #0x108]
0006bccc  adds    r3, #1
0006bcce  ldr.w   r2, [r0, r3, lsl #3]
0006bcd2  cbnz    r2, #0x6bcfe
0006bcd4  movw    r1, #0x137e
0006bcd8  str.w   r1, [r0, r3, lsl #3]
0006bcdc  ldr.w   r3, [r0, #0xa4]
0006bce0  ldr     r1, [pc, #0x50]
0006bce2  adds    r3, #1
0006bce4  str.w   r3, [r0, #0xa4]
0006bce8  lsls    r3, r3, #3
0006bcea  adds    r3, r3, r0
0006bcec  add     r1, pc ; -> 0x0006d3c1  t_avoid_agressive_bastards
0006bcee  str     r1, [r3, #4]
0006bcf0  ldr.w   r3, [r0, #0xa4]
0006bcf4  adds    r3, #1
0006bcf6  str.w   r2, [r0, r3, lsl #3]
0006bcfa  mov     r0, r2
0006bcfc  bx      lr
0006bcfe  movw    r3, #0x137e
0006bd02  cmp     r2, r3
0006bd04  it      ne
0006bd06  mvnne   r0, #2
0006bd0a  bne     #0x6bcfc
0006bd0c  ldr.w   r3, [pc, #0x28]
0006bd10  ldr     r2, [pc, #0x28]
0006bd12  add     r3, pc ; -> 0x001723a8  funcs.13782
0006bd14  str     r3, [r1, #0x68]
0006bd16  ldr.w   r3, [r0, #0xa4]
0006bd1a  add     r2, pc ; -> 0x0006c5ad  t_react_jump_table_act
0006bd1c  lsls    r3, r3, #3
0006bd1e  adds    r3, r3, r0
0006bd20  str     r2, [r3, #4]
0006bd22  ldr.w   r3, [r0, #0xa4]
0006bd26  movs    r2, #0
0006bd28  adds    r3, #1
0006bd2a  str.w   r2, [r0, r3, lsl #3]
0006bd2e  mov     r0, r2
0006bd30  b       #0x6bcfc
0006bd32  nop     
0006bd34  asrs    r1, r2, #0x1b
0006bd36  movs    r0, r0
0006bd38  str     r2, [r2, #0x68]
0006bd3a  movs    r0, r2
0006bd3c  lsrs    r7, r1, #2
0006bd3e  movs    r0, r0
