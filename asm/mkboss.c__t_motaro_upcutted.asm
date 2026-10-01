========================================================================
t_motaro_upcutted  0x000a9aec  292 bytes   mkboss.c
========================================================================

000a9aec  push    {r4, r5, r6, r7, lr}
000a9aee  add     r7, sp, #0xc
000a9af0  push.w  {r8, sl}
000a9af4  ldr.w   r2, [r0, #0xa4]
000a9af8  movw    sl, #0x7b1
000a9afc  mov     r5, r0
000a9afe  adds    r3, r2, #1
000a9b00  ldr.w   r4, [r0, #0x108]
000a9b04  ldr.w   r6, [r0, r3, lsl #3]
000a9b08  cmp     r6, sl
000a9b0a  beq     #0xa9b68
000a9b0c  movw    r3, #0x7b7
000a9b10  cmp     r6, r3
000a9b12  beq     #0xa9b4c
000a9b14  cbz     r6, #0xa9b20
000a9b16  mvn     r0, #2
000a9b1a  pop.w   {r8, sl}
000a9b1e  pop     {r4, r5, r6, r7, pc}
000a9b20  mov     r0, r4
000a9b22  bl      #0x55070 ; -> am_i_airborn
000a9b26  ldr.w   r8, [r4, #0x5c]
000a9b2a  cmp.w   r8, #0
000a9b2e  beq     #0xa9b98
000a9b30  ldr.w   r3, [r5, #0xa4]
000a9b34  ldr     r2, [pc, #0xc0]
000a9b36  mov     r0, r6
000a9b38  lsls    r3, r3, #3
000a9b3a  adds    r3, r3, r5
000a9b3c  add     r2, pc ; -> 0x000a8a6d  t_motaro_hit_flight
000a9b3e  str     r2, [r3, #4]
000a9b40  ldr.w   r3, [r5, #0xa4]
000a9b44  adds    r3, #1
000a9b46  str.w   r6, [r5, r3, lsl #3]
000a9b4a  b       #0xa9b1a
000a9b4c  ldr.w   r3, [pc, #0xac]
000a9b50  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9b52  ldr     r1, [r3]
000a9b54  lsls    r3, r2, #3
000a9b56  adds    r3, r3, r5
000a9b58  movs    r0, #0
000a9b5a  str     r1, [r3, #4]
000a9b5c  ldr.w   r3, [r5, #0xa4]
000a9b60  adds    r3, #1
000a9b62  str.w   r0, [r5, r3, lsl #3]
000a9b66  b       #0xa9b1a
000a9b68  mov     r0, r4
000a9b6a  movs    r3, #0x10
000a9b6c  str     r3, [r4, #0x1c]
000a9b6e  str     r3, [r4, #0x20]
000a9b70  bl      #0x58764 ; -> randu_minimum
000a9b74  ldr     r3, [r4, #0x1c]
000a9b76  movw    r2, #0x7b7
000a9b7a  str     r3, [r4, #0x44]
000a9b7c  ldr.w   r3, [r5, #0xa4]
000a9b80  adds    r3, #1
000a9b82  str.w   r2, [r5, r3, lsl #3]
000a9b86  ldr.w   r3, [r5, #0xa4]
000a9b8a  adds    r2, r3, #1
000a9b8c  ldr.w   r3, [pc, #0x70]
000a9b90  str.w   r2, [r5, #0xa4]
000a9b94  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000a9b96  b       #0xa9b52
000a9b98  movs    r1, #0xa
000a9b9a  mov     r0, r4
000a9b9c  bl      #0x57dbc ; -> rsnd_func
000a9ba0  ldr.w   r3, [pc, #0x60]
000a9ba4  mov     r0, r4
000a9ba6  str     r3, [r4, #0x1c]
000a9ba8  bl      #0x5873c ; -> rsnd_ochar_sound
000a9bac  mov     r0, r4
000a9bae  mov.w   r3, #0x60006
000a9bb2  str     r3, [r4, #0x48]
000a9bb4  bl      #0x581e0 ; -> shake_a11
000a9bb8  mov     r0, r4
000a9bba  mov.w   r3, #0x60000
000a9bbe  str     r3, [r4, #0x1c]
000a9bc0  bl      #0x55ab0 ; -> away_x_vel
000a9bc4  ldr.w   r3, [pc, #0x40]
000a9bc8  mov     r0, r8
000a9bca  str     r3, [r4, #0x40]
000a9bcc  ldr.w   r3, [r5, #0xa4]
000a9bd0  adds    r3, #1
000a9bd2  str.w   sl, [r5, r3, lsl #3]
000a9bd6  ldr.w   r3, [r5, #0xa4]
000a9bda  adds    r2, r3, #1
000a9bdc  ldr     r3, [pc, #0x2c]
000a9bde  str.w   r2, [r5, #0xa4]
000a9be2  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a9be4  ldr     r1, [r3]
000a9be6  lsls    r3, r2, #3
000a9be8  adds    r3, r3, r5
000a9bea  str     r1, [r3, #4]
000a9bec  ldr.w   r3, [r5, #0xa4]
000a9bf0  adds    r3, #1
000a9bf2  str.w   r8, [r5, r3, lsl #3]
000a9bf6  b       #0xa9b1a
