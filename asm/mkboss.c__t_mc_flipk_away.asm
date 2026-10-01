========================================================================
t_mc_flipk_away  0x000a8d8c  84 bytes   mkboss.c
========================================================================

000a8d8c  push    {r4, r5, r6, r7, lr}
000a8d8e  add     r7, sp, #0xc
000a8d90  ldr.w   r3, [r0, #0xa4]
000a8d94  mov     r4, r0
000a8d96  ldr.w   r5, [r0, #0x108]
000a8d9a  adds    r3, #1
000a8d9c  ldr.w   r6, [r0, r3, lsl #3]
000a8da0  cbnz    r6, #0xa8dcc
000a8da2  mov     r0, r5
000a8da4  bl      #0x2f3a0 ; -> get_x_dist
000a8da8  ldr     r0, [r5, #0x28]
000a8daa  cmp     r0, #0x80
000a8dac  bgt     #0xa8dd2
000a8dae  ldr     r3, [pc, #0x28]
000a8db0  add     r3, pc ; -> 0x000f3418  t_d_block
000a8db2  ldr     r2, [r3]
000a8db4  ldr.w   r3, [r4, #0xa4]
000a8db8  mov     r0, r6
000a8dba  lsls    r3, r3, #3
000a8dbc  adds    r3, r3, r4
000a8dbe  str     r2, [r3, #4]
000a8dc0  ldr.w   r3, [r4, #0xa4]
000a8dc4  adds    r3, #1
000a8dc6  str.w   r6, [r4, r3, lsl #3]
000a8dca  b       #0xa8dd0
000a8dcc  mvn     r0, #2
000a8dd0  pop     {r4, r5, r6, r7, pc}
000a8dd2  ldr     r3, [pc, #8]
000a8dd4  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000a8dd6  b       #0xa8db2
000a8dd8  adr     r6, #0x190
000a8dda  movs    r4, r0
000a8ddc  adr     r6, #0x140
000a8dde  movs    r4, r0
