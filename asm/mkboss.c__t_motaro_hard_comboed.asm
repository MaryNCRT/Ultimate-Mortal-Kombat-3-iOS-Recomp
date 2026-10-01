========================================================================
t_motaro_hard_comboed  0x000a9504  204 bytes   mkboss.c
========================================================================

000a9504  push    {r4, r5, r7, lr}
000a9506  add     r7, sp, #8
000a9508  ldr.w   r2, [r0, #0xa4]
000a950c  mov     r4, r0
000a950e  ldr.w   r5, [r0, #0x108]
000a9512  adds    r3, r2, #1
000a9514  movw    r1, #0x807
000a9518  ldr.w   r0, [r0, r3, lsl #3]
000a951c  cmp     r0, r1
000a951e  beq     #0xa9578
000a9520  cmp.w   r0, #0x810
000a9524  beq     #0xa955e
000a9526  cbz     r0, #0xa952e
000a9528  mvn     r0, #2
000a952c  pop     {r4, r5, r7, pc}
000a952e  movs    r3, #2
000a9530  str     r3, [r5, #0x20]
000a9532  ldr.w   r3, [r4, #0xa4]
000a9536  adds    r3, #1
000a9538  str.w   r1, [r4, r3, lsl #3]
000a953c  ldr.w   r3, [r4, #0xa4]
000a9540  adds    r2, r3, #1
000a9542  ldr     r3, [pc, #0x7c]
000a9544  str.w   r2, [r4, #0xa4]
000a9548  add     r3, pc ; -> 0x000f340c  t_avoid_corner_trap
000a954a  ldr     r1, [r3]
000a954c  lsls    r3, r2, #3
000a954e  adds    r3, r3, r4
000a9550  str     r1, [r3, #4]
000a9552  ldr.w   r3, [r4, #0xa4]
000a9556  adds    r3, #1
000a9558  str.w   r0, [r4, r3, lsl #3]
000a955c  b       #0xa952c
000a955e  ldr.w   r1, [pc, #0x64]
000a9562  add     r1, pc ; -> 0x000a9741  t_motaro_stumble
000a9564  lsls    r3, r2, #3
000a9566  adds    r3, r3, r4
000a9568  movs    r0, #0
000a956a  str     r1, [r3, #4]
000a956c  ldr.w   r3, [r4, #0xa4]
000a9570  adds    r3, #1
000a9572  str.w   r0, [r4, r3, lsl #3]
000a9576  b       #0xa952c
000a9578  mov     r0, r5
000a957a  mov.w   r3, #0x60006
000a957e  str     r3, [r5, #0x48]
000a9580  bl      #0x581e0 ; -> shake_a11
000a9584  movs    r1, #0xa
000a9586  mov     r0, r5
000a9588  bl      #0x57dbc ; -> rsnd_func
000a958c  mov     r0, r5
000a958e  mov.w   r3, #0x40000
000a9592  str     r3, [r5, #0x1c]
000a9594  bl      #0x55ab0 ; -> away_x_vel
000a9598  ldr     r3, [pc, #0x2c]
000a959a  mov.w   r2, #0x810
000a959e  str     r3, [r5, #0x40]
000a95a0  ldr.w   r3, [r4, #0xa4]
000a95a4  adds    r3, #1
000a95a6  str.w   r2, [r4, r3, lsl #3]
000a95aa  ldr.w   r3, [r4, #0xa4]
000a95ae  adds    r2, r3, #1
000a95b0  ldr.w   r3, [pc, #0x18]
000a95b4  str.w   r2, [r4, #0xa4]
000a95b8  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a95ba  ldr     r1, [r3]
000a95bc  b       #0xa9564
000a95be  nop     
000a95c0  ldr     r6, [sp, #0x300]
000a95c2  movs    r4, r0
000a95c4  lsls    r3, r3, #7
000a95c6  movs    r0, r0
000a95c8  movs    r0, r4
000a95ca  movs    r3, r0
000a95cc  adr     r1, #0x50
000a95ce  movs    r4, r0
