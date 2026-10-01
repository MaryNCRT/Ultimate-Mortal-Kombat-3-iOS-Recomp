========================================================================
t_flykick_towards_me  0x0006f220  332 bytes   mkdrone.c
========================================================================

0006f220  push    {r4, r5, r6, r7, lr}
0006f222  add     r7, sp, #0xc
0006f224  str     r8, [sp, #-0x4]!
0006f228  ldr.w   r3, [r0, #0xa4]
0006f22c  mov     r5, r0
0006f22e  ldr.w   r6, [r0, #0x108]
0006f232  adds    r3, #1
0006f234  ldr.w   r4, [r0, r3, lsl #3]
0006f238  cbnz    r4, #0x6f26a
0006f23a  mov     r0, r6
0006f23c  bl      #0x6e9c4 ; -> q_will_he_reach_me
0006f240  ldr.w   r8, [r6, #0x5c]
0006f244  cmp.w   r8, #0
0006f248  beq     #0x6f2a4
0006f24a  ldr.w   r3, [r5, #0xa4]
0006f24e  ldr     r2, [pc, #0xf8]
0006f250  mov     r0, r4
0006f252  lsls    r3, r3, #3
0006f254  adds    r3, r3, r5
0006f256  add     r2, pc ; -> 0x0006fa21  t_d_block
0006f258  str     r2, [r3, #4]
0006f25a  ldr.w   r3, [r5, #0xa4]
0006f25e  adds    r3, #1
0006f260  str.w   r4, [r5, r3, lsl #3]
0006f264  ldr     r8, [sp], #4
0006f268  pop     {r4, r5, r6, r7, pc}
0006f26a  movw    r3, #0x12b4
0006f26e  cmp     r4, r3
0006f270  it      ne
0006f272  mvnne   r0, #2
0006f276  bne     #0x6f264
0006f278  mov     r0, r6
0006f27a  bl      #0x2f3a0 ; -> get_x_dist
0006f27e  ldr     r3, [r6, #0x28]
0006f280  cmp     r3, #0xa0
0006f282  ble     #0x6f2ce
0006f284  ldr.w   r3, [pc, #0xc4]
0006f288  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f28a  ldr     r2, [r3]
0006f28c  ldr.w   r3, [r5, #0xa4]
0006f290  movs    r0, #0
0006f292  lsls    r3, r3, #3
0006f294  adds    r3, r3, r5
0006f296  str     r2, [r3, #4]
0006f298  ldr.w   r3, [r5, #0xa4]
0006f29c  adds    r3, #1
0006f29e  str.w   r0, [r5, r3, lsl #3]
0006f2a2  b       #0x6f264
0006f2a4  mov     r0, r6
0006f2a6  bl      #0x2f3a0 ; -> get_x_dist
0006f2aa  ldr     r3, [r6, #0x28]
0006f2ac  cmp     r3, #0x7f
0006f2ae  bgt     #0x6f2f4
0006f2b0  ldr.w   r2, [pc, #0x9c]
0006f2b4  add     r2, pc ; -> 0x0006fa21  t_d_block
0006f2b6  ldr.w   r3, [r5, #0xa4]
0006f2ba  lsls    r3, r3, #3
0006f2bc  adds    r3, r3, r5
0006f2be  mov     r0, r8
0006f2c0  str     r2, [r3, #4]
0006f2c2  ldr.w   r3, [r5, #0xa4]
0006f2c6  adds    r3, #1
0006f2c8  str.w   r8, [r5, r3, lsl #3]
0006f2cc  b       #0x6f264
0006f2ce  mov     r0, r6
0006f2d0  bl      #0x55060 ; -> is_he_airborn
0006f2d4  ldr     r0, [r6, #0x5c]
0006f2d6  cbnz    r0, #0x6f312
0006f2d8  ldr     r3, [pc, #0x78]
0006f2da  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f2dc  ldr     r2, [r3]
0006f2de  ldr.w   r3, [r5, #0xa4]
0006f2e2  lsls    r3, r3, #3
0006f2e4  adds    r3, r3, r5
0006f2e6  str     r2, [r3, #4]
0006f2e8  ldr.w   r3, [r5, #0xa4]
0006f2ec  adds    r3, #1
0006f2ee  str.w   r0, [r5, r3, lsl #3]
0006f2f2  b       #0x6f264
0006f2f4  ldr     r3, [r6]
0006f2f6  ldr     r3, [r3, #4]
0006f2f8  ldr     r3, [r3, #0x1c]
0006f2fa  cmp     r3, #0
0006f2fc  str     r3, [r6, #0x1c]
0006f2fe  blt     #0x6f318
0006f300  mov     r0, r6
0006f302  bl      #0x57828 ; -> get_his_dog
0006f306  ldr     r3, [r6, #0x1c]
0006f308  cmp     r3, #0x27
0006f30a  bgt     #0x6f31e
0006f30c  ldr     r2, [pc, #0x48]
0006f30e  add     r2, pc ; -> 0x0006edf5  t_flykick_heading_up
0006f310  b       #0x6f2b6
0006f312  ldr     r2, [pc, #0x48]
0006f314  add     r2, pc ; -> 0x0006fa21  t_d_block
0006f316  b       #0x6f28c
0006f318  ldr     r2, [pc, #0x44]
0006f31a  add     r2, pc ; -> 0x0006edf5  t_flykick_heading_up
0006f31c  b       #0x6f2b6
0006f31e  movs    r3, #0x30
0006f320  str     r3, [r6, #0x44]
0006f322  ldr     r3, [pc, #0x40]
0006f324  movw    r2, #0x12b4
0006f328  add     r3, pc ; -> 0x0006d66d  is_flyk_close
0006f32a  str     r3, [r6, #0x48]
0006f32c  ldr.w   r3, [r5, #0xa4]
0006f330  adds    r3, #1
0006f332  str.w   r2, [r5, r3, lsl #3]
0006f336  ldr     r2, [pc, #0x30]
0006f338  ldr.w   r3, [r5, #0xa4]
0006f33c  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006f33e  adds    r3, #1
0006f340  str.w   r3, [r5, #0xa4]
0006f344  b       #0x6f2ba
0006f346  nop     
0006f348  lsls    r7, r0, #0x1f
0006f34a  movs    r0, r0
0006f34c  add     r4, pc
0006f34e  movs    r0, r1
0006f350  lsls    r1, r5, #0x1d
0006f352  movs    r0, r0
0006f354  add     r2, r5
0006f356  movs    r0, r1
