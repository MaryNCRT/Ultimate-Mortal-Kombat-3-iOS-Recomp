========================================================================
t_motaro_hit0  0x000a98e4  224 bytes   mkboss.c
========================================================================

000a98e4  push    {r4, r5, r6, r7, lr}
000a98e6  add     r7, sp, #0xc
000a98e8  str     r8, [sp, #-0x4]!
000a98ec  ldr.w   r2, [r0, #0xa4]
000a98f0  mov     r4, r0
000a98f2  ldr.w   r6, [r0, #0x108]
000a98f6  adds    r3, r2, #1
000a98f8  ldr.w   r5, [r0, r3, lsl #3]
000a98fc  cbnz    r5, #0xa992e
000a98fe  mov     r0, r6
000a9900  bl      #0x55070 ; -> am_i_airborn
000a9904  ldr.w   r8, [r6, #0x5c]
000a9908  cmp.w   r8, #0
000a990c  beq     #0xa9958
000a990e  ldr.w   r3, [r4, #0xa4]
000a9912  ldr     r2, [pc, #0x9c]
000a9914  mov     r0, r5
000a9916  lsls    r3, r3, #3
000a9918  adds    r3, r3, r4
000a991a  add     r2, pc ; -> 0x000a8a6d  t_motaro_hit_flight
000a991c  str     r2, [r3, #4]
000a991e  ldr.w   r3, [r4, #0xa4]
000a9922  adds    r3, #1
000a9924  str.w   r5, [r4, r3, lsl #3]
000a9928  ldr     r8, [sp], #4
000a992c  pop     {r4, r5, r6, r7, pc}
000a992e  movw    r3, #0x801
000a9932  cmp     r5, r3
000a9934  it      ne
000a9936  mvnne   r0, #2
000a993a  bne     #0xa9928
000a993c  ldr.w   r3, [pc, #0x74]
000a9940  movs    r0, #0
000a9942  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9944  ldr     r1, [r3]
000a9946  lsls    r3, r2, #3
000a9948  adds    r3, r3, r4
000a994a  str     r1, [r3, #4]
000a994c  ldr.w   r3, [r4, #0xa4]
000a9950  adds    r3, #1
000a9952  str.w   r0, [r4, r3, lsl #3]
000a9956  b       #0xa9928
000a9958  movs    r1, #8
000a995a  mov     r0, r6
000a995c  bl      #0x57dbc ; -> rsnd_func
000a9960  ldr.w   r3, [pc, #0x54]
000a9964  mov     r0, r6
000a9966  str     r3, [r6, #0x1c]
000a9968  bl      #0x5873c ; -> rsnd_ochar_sound
000a996c  mov     r0, r6
000a996e  mov.w   r3, #0x20000
000a9972  str     r3, [r6, #0x1c]
000a9974  bl      #0x55ab0 ; -> away_x_vel
000a9978  ldr.w   r3, [pc, #0x40]
000a997c  movw    r2, #0x801
000a9980  mov     r0, r8
000a9982  str     r3, [r6, #0x40]
000a9984  ldr.w   r3, [r4, #0xa4]
000a9988  adds    r3, #1
000a998a  str.w   r2, [r4, r3, lsl #3]
000a998e  ldr.w   r3, [r4, #0xa4]
000a9992  adds    r2, r3, #1
000a9994  ldr     r3, [pc, #0x28]
000a9996  str.w   r2, [r4, #0xa4]
000a999a  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000a999c  ldr     r1, [r3]
000a999e  lsls    r3, r2, #3
000a99a0  adds    r3, r3, r4
000a99a2  str     r1, [r3, #4]
000a99a4  ldr.w   r3, [r4, #0xa4]
000a99a8  adds    r3, #1
000a99aa  str.w   r8, [r4, r3, lsl #3]
000a99ae  b       #0xa9928
000a99b0  bl      #0x1f99b2
000a99b4  ldr     r5, [sp, #0x308]
000a99b6  movs    r4, r0
000a99b8  movs    r2, r0
000a99ba  movs    r3, r0
000a99bc  movs    r4, r3
000a99be  movs    r3, r0
000a99c0  ldr     r5, [sp, #0xc8]
000a99c2  movs    r4, r0
