========================================================================
t_motaro_flip_kicked  0x000a9c10  236 bytes   mkboss.c
========================================================================

000a9c10  push    {r4, r5, r6, r7, lr}
000a9c12  add     r7, sp, #0xc
000a9c14  str     r8, [sp, #-0x4]!
000a9c18  ldr.w   r2, [r0, #0xa4]
000a9c1c  movw    r8, #0x78c
000a9c20  mov     r4, r0
000a9c22  adds    r3, r2, #1
000a9c24  ldr.w   r5, [r0, #0x108]
000a9c28  ldr.w   r6, [r0, r3, lsl #3]
000a9c2c  cmp     r6, r8
000a9c2e  beq     #0xa9cba
000a9c30  movw    r3, #0x792
000a9c34  cmp     r6, r3
000a9c36  beq     #0xa9ca0
000a9c38  cbz     r6, #0xa9c44
000a9c3a  mvn     r0, #2
000a9c3e  ldr     r8, [sp], #4
000a9c42  pop     {r4, r5, r6, r7, pc}
000a9c44  movs    r1, #0xa
000a9c46  mov     r0, r5
000a9c48  bl      #0x57dbc ; -> rsnd_func
000a9c4c  ldr     r3, [pc, #0x98]
000a9c4e  mov     r0, r5
000a9c50  str     r3, [r5, #0x1c]
000a9c52  bl      #0x5873c ; -> rsnd_ochar_sound
000a9c56  mov     r0, r5
000a9c58  mov.w   r3, #0x60006
000a9c5c  str     r3, [r5, #0x48]
000a9c5e  bl      #0x581e0 ; -> shake_a11
000a9c62  mov     r0, r5
000a9c64  mov.w   r3, #0x50000
000a9c68  str     r3, [r5, #0x1c]
000a9c6a  bl      #0x55ab0 ; -> away_x_vel
000a9c6e  ldr     r3, [pc, #0x7c]
000a9c70  mov     r0, r6
000a9c72  str     r3, [r5, #0x40]
000a9c74  ldr.w   r3, [r4, #0xa4]
000a9c78  adds    r3, #1
000a9c7a  str.w   r8, [r4, r3, lsl #3]
000a9c7e  ldr.w   r3, [r4, #0xa4]
000a9c82  adds    r2, r3, #1
000a9c84  ldr     r3, [pc, #0x68]
000a9c86  str.w   r2, [r4, #0xa4]
000a9c8a  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a9c8c  ldr     r1, [r3]
000a9c8e  lsls    r3, r2, #3
000a9c90  adds    r3, r3, r4
000a9c92  str     r1, [r3, #4]
000a9c94  ldr.w   r3, [r4, #0xa4]
000a9c98  adds    r3, #1
000a9c9a  str.w   r6, [r4, r3, lsl #3]
000a9c9e  b       #0xa9c3e
000a9ca0  ldr     r3, [pc, #0x50]
000a9ca2  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9ca4  ldr     r1, [r3]
000a9ca6  lsls    r3, r2, #3
000a9ca8  adds    r3, r3, r4
000a9caa  movs    r0, #0
000a9cac  str     r1, [r3, #4]
000a9cae  ldr.w   r3, [r4, #0xa4]
000a9cb2  adds    r3, #1
000a9cb4  str.w   r0, [r4, r3, lsl #3]
000a9cb8  b       #0xa9c3e
000a9cba  mov     r0, r5
000a9cbc  movs    r3, #0x10
000a9cbe  str     r3, [r5, #0x1c]
000a9cc0  str     r3, [r5, #0x20]
000a9cc2  bl      #0x58764 ; -> randu_minimum
000a9cc6  ldr     r3, [r5, #0x1c]
000a9cc8  movw    r2, #0x792
000a9ccc  str     r3, [r5, #0x44]
000a9cce  ldr.w   r3, [r4, #0xa4]
000a9cd2  adds    r3, #1
000a9cd4  str.w   r2, [r4, r3, lsl #3]
000a9cd8  ldr.w   r3, [r4, #0xa4]
000a9cdc  adds    r2, r3, #1
000a9cde  ldr     r3, [pc, #0x18]
000a9ce0  str.w   r2, [r4, #0xa4]
000a9ce4  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000a9ce6  b       #0xa9ca4
000a9ce8  movs    r2, r0
000a9cea  movs    r3, r0
000a9cec  movs    r0, r4
000a9cee  movs    r4, r0
000a9cf0  ldr     r2, [sp, #0x108]
000a9cf2  movs    r4, r0
000a9cf4  ldr     r2, [sp, #0x188]
000a9cf6  movs    r4, r0
000a9cf8  str     r7, [sp, #0x50]
000a9cfa  movs    r4, r0
