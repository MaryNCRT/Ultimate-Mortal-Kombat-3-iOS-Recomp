========================================================================
c_floor_ice  0x0006dfd4  112 bytes   mkdrone.c
========================================================================

0006dfd4  push    {r4, r5, r6, r7, lr}
0006dfd6  add     r7, sp, #0xc
0006dfd8  ldr.w   r3, [r0, #0xa4]
0006dfdc  mov     r4, r0
0006dfde  ldr.w   r5, [r0, #0x108]
0006dfe2  adds    r3, #1
0006dfe4  ldr.w   r6, [r0, r3, lsl #3]
0006dfe8  cbnz    r6, #0x6e016
0006dfea  ldr     r3, [pc, #0x48]
0006dfec  mov     r0, r5
0006dfee  add     r3, pc ; -> 0x00171fe4  rpt_promoves
0006dff0  str     r3, [r5, #0x1c]
0006dff2  bl      #0x6c9c8 ; -> ask_mr_diff
0006dff6  ldr     r3, [r5, #0x5c]
0006dff8  cbnz    r3, #0x6e01c
0006dffa  ldr     r2, [pc, #0x3c]
0006dffc  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006dffe  ldr.w   r3, [r4, #0xa4]
0006e002  mov     r0, r6
0006e004  lsls    r3, r3, #3
0006e006  adds    r3, r3, r4
0006e008  str     r2, [r3, #4]
0006e00a  ldr.w   r3, [r4, #0xa4]
0006e00e  adds    r3, #1
0006e010  str.w   r6, [r4, r3, lsl #3]
0006e014  b       #0x6e01a
0006e016  mvn     r0, #2
0006e01a  pop     {r4, r5, r6, r7, pc}
0006e01c  mov     r0, r5
0006e01e  bl      #0x2f3a0 ; -> get_x_dist
0006e022  ldr     r0, [r5, #0x28]
0006e024  cmp     r0, #0x6f
0006e026  bgt     #0x6e02e
0006e028  ldr     r2, [pc, #0x10]
0006e02a  add     r2, pc ; -> 0x00067895  t_run_in_close
0006e02c  b       #0x6dffe
0006e02e  ldr     r2, [pc, #0x10]
0006e030  add     r2, pc ; -> 0x0006e8b5  t_drone_zone
0006e032  b       #0x6dffe
0006e034  subs    r7, #0xf2
0006e036  movs    r0, r2
0006e038  b       #0x6e346
0006e03a  vtbx.8  d25, {d15}, d23
0006e03e  vtbl.8  d16, {d31}, d1
0006e042  movs    r0, r0
