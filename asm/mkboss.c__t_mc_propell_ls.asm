========================================================================
t_mc_propell_ls  0x000ab8e8  92 bytes   mkboss.c
========================================================================

000ab8e8  push    {r4, r5, r6, r7, lr}
000ab8ea  add     r7, sp, #0xc
000ab8ec  ldr.w   r3, [r0, #0xa4]
000ab8f0  mov     r4, r0
000ab8f2  ldr.w   r5, [r0, #0x108]
000ab8f6  adds    r3, #1
000ab8f8  ldr.w   r6, [r0, r3, lsl #3]
000ab8fc  cbnz    r6, #0xab92e
000ab8fe  mov     r0, r5
000ab900  bl      #0xab804 ; -> motaro_randper
000ab904  mov     r0, r5
000ab906  bl      #0x2f3a0 ; -> get_x_dist
000ab90a  ldr     r0, [r5, #0x28]
000ab90c  cmp     r0, #0x70
000ab90e  bgt     #0xab934
000ab910  ldr     r3, [pc, #0x28]
000ab912  add     r3, pc ; -> 0x000f3418  t_d_block
000ab914  ldr     r2, [r3]
000ab916  ldr.w   r3, [r4, #0xa4]
000ab91a  mov     r0, r6
000ab91c  lsls    r3, r3, #3
000ab91e  adds    r3, r3, r4
000ab920  str     r2, [r3, #4]
000ab922  ldr.w   r3, [r4, #0xa4]
000ab926  adds    r3, #1
000ab928  str.w   r6, [r4, r3, lsl #3]
000ab92c  b       #0xab932
000ab92e  mvn     r0, #2
000ab932  pop     {r4, r5, r6, r7, pc}
000ab934  ldr     r2, [pc, #8]
000ab936  add     r2, pc ; -> 0x000a858d  t_b_return_to_beware_4get
000ab938  b       #0xab916
000ab93a  nop     
000ab93c  ldrb    r2, [r0, #0xc]
000ab93e  movs    r4, r0
000ab940  ldm     r4, {r0, r1, r4, r6}
