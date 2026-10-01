========================================================================
t_b_block  0x000a9cfc  224 bytes   mkboss.c
========================================================================

000a9cfc  push    {r4, r5, r6, r7, lr}
000a9cfe  add     r7, sp, #0xc
000a9d00  str     r8, [sp, #-0x4]!
000a9d04  ldr.w   r3, [r0, #0xa4]
000a9d08  movw    r8, #0x759
000a9d0c  mov     r4, r0
000a9d0e  adds    r3, #1
000a9d10  ldr.w   r6, [r0, #0x108]
000a9d14  ldr.w   r5, [r0, r3, lsl #3]
000a9d18  cmp     r5, r8
000a9d1a  beq     #0xa9d8e
000a9d1c  movw    r3, #0x75b
000a9d20  cmp     r5, r3
000a9d22  beq     #0xa9d64
000a9d24  cbz     r5, #0xa9d30
000a9d26  mvn     r0, #2
000a9d2a  ldr     r8, [sp], #4
000a9d2e  pop     {r4, r5, r6, r7, pc}
000a9d30  mov     r0, r6
000a9d32  bl      #0x55388 ; -> face_opponent
000a9d36  ldr.w   r3, [r4, #0xa4]
000a9d3a  mov     r0, r5
000a9d3c  adds    r3, #1
000a9d3e  str.w   r8, [r4, r3, lsl #3]
000a9d42  ldr.w   r3, [r4, #0xa4]
000a9d46  adds    r2, r3, #1
000a9d48  ldr     r3, [pc, #0x80]
000a9d4a  str.w   r2, [r4, #0xa4]
000a9d4e  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
000a9d50  ldr     r1, [r3]
000a9d52  lsls    r3, r2, #3
000a9d54  adds    r3, r3, r4
000a9d56  str     r1, [r3, #4]
000a9d58  ldr.w   r3, [r4, #0xa4]
000a9d5c  adds    r3, #1
000a9d5e  str.w   r5, [r4, r3, lsl #3]
000a9d62  b       #0xa9d2a
000a9d64  mov     r0, r6
000a9d66  bl      #0x2f3a0 ; -> get_x_dist
000a9d6a  ldr     r0, [r6, #0x28]
000a9d6c  cmp     r0, #0x7f
000a9d6e  ble     #0xa9dc4
000a9d70  ldr     r3, [pc, #0x5c]
000a9d72  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9d74  ldr     r2, [r3]
000a9d76  ldr.w   r3, [r4, #0xa4]
000a9d7a  movs    r0, #0
000a9d7c  lsls    r3, r3, #3
000a9d7e  adds    r3, r3, r4
000a9d80  str     r2, [r3, #4]
000a9d82  ldr.w   r3, [r4, #0xa4]
000a9d86  adds    r3, #1
000a9d88  str.w   r0, [r4, r3, lsl #3]
000a9d8c  b       #0xa9d2a
000a9d8e  movs    r3, #0x40
000a9d90  str     r3, [r6, #0x44]
000a9d92  ldr.w   r3, [r0, #0xa4]
000a9d96  movw    r2, #0x75b
000a9d9a  adds    r3, #1
000a9d9c  str.w   r2, [r0, r3, lsl #3]
000a9da0  ldr.w   r3, [r0, #0xa4]
000a9da4  adds    r2, r3, #1
000a9da6  ldr     r3, [pc, #0x2c]
000a9da8  str.w   r2, [r0, #0xa4]
000a9dac  add     r3, pc ; -> 0x000f3410  t_d_wait_nonattack
000a9dae  ldr     r1, [r3]
000a9db0  lsls    r3, r2, #3
000a9db2  adds    r3, r3, r0
000a9db4  str     r1, [r3, #4]
000a9db6  ldr.w   r3, [r0, #0xa4]
000a9dba  movs    r0, #0
000a9dbc  adds    r3, #1
000a9dbe  str.w   r0, [r4, r3, lsl #3]
000a9dc2  b       #0xa9d2a
000a9dc4  ldr     r2, [pc, #0x10]
000a9dc6  add     r2, pc ; -> 0x000a8ead  t_motaro_grab_punch
000a9dc8  b       #0xa9d76
000a9dca  nop     
000a9dcc  ldr     r2, [sp, #0x218]
000a9dce  movs    r4, r0
000a9dd0  ldr     r1, [sp, #0x248]
000a9dd2  movs    r4, r0
000a9dd4  str     r6, [sp, #0x180]
000a9dd6  movs    r4, r0
000a9dd8  bl      #0x18ddda
