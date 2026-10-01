========================================================================
t_motaro_hip_jsrp  0x000aa330  260 bytes   mkboss.c
========================================================================

000aa330  push    {r4, r5, r6, r7, lr}
000aa332  add     r7, sp, #0xc
000aa334  str     r8, [sp, #-0x4]!
000aa338  ldr.w   r3, [r0, #0xa4]
000aa33c  movw    r8, #0x4b2
000aa340  mov     r4, r0
000aa342  adds    r3, #1
000aa344  ldr.w   r5, [r0, #0x108]
000aa348  ldr.w   r6, [r0, r3, lsl #3]
000aa34c  cmp     r6, r8
000aa34e  beq     #0xaa3da
000aa350  movw    r3, #0x4b7
000aa354  cmp     r6, r3
000aa356  beq     #0xaa3a8
000aa358  cbz     r6, #0xaa364
000aa35a  mvn     r0, #2
000aa35e  ldr     r8, [sp], #4
000aa362  pop     {r4, r5, r6, r7, pc}
000aa364  mov     r0, r5
000aa366  str     r6, [r5, #0x1c]
000aa368  bl      #0x57be4 ; -> ochar_sound
000aa36c  mov     r0, r5
000aa36e  movs    r3, #0x1a
000aa370  str     r3, [r5, #0x40]
000aa372  bl      #0x5520c ; -> get_char_ani
000aa376  ldr     r3, [pc, #0xac]
000aa378  mov     r0, r6
000aa37a  str     r3, [r5, #0x1c]
000aa37c  ldr.w   r3, [r4, #0xa4]
000aa380  adds    r3, #1
000aa382  str.w   r8, [r4, r3, lsl #3]
000aa386  ldr.w   r3, [r4, #0xa4]
000aa38a  adds    r2, r3, #1
000aa38c  ldr     r3, [pc, #0x98]
000aa38e  str.w   r2, [r4, #0xa4]
000aa392  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000aa394  ldr     r1, [r3]
000aa396  lsls    r3, r2, #3
000aa398  adds    r3, r3, r4
000aa39a  str     r1, [r3, #4]
000aa39c  ldr.w   r3, [r4, #0xa4]
000aa3a0  adds    r3, #1
000aa3a2  str.w   r6, [r4, r3, lsl #3]
000aa3a6  b       #0xaa35e
000aa3a8  mov     r0, r5
000aa3aa  bl      #0x424fc ; -> shake_n_sound
000aa3ae  mov     r0, r5
000aa3b0  movs    r3, #0x1a
000aa3b2  str     r3, [r5, #0x40]
000aa3b4  bl      #0x55474 ; -> find_ani_part2
000aa3b8  movs    r3, #3
000aa3ba  str     r3, [r5, #0x1c]
000aa3bc  ldr     r3, [pc, #0x6c]
000aa3be  movs    r0, #0
000aa3c0  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa3c2  ldr     r2, [r3]
000aa3c4  ldr.w   r3, [r4, #0xa4]
000aa3c8  lsls    r3, r3, #3
000aa3ca  adds    r3, r3, r4
000aa3cc  str     r2, [r3, #4]
000aa3ce  ldr.w   r3, [r4, #0xa4]
000aa3d2  adds    r3, #1
000aa3d4  str.w   r0, [r4, r3, lsl #3]
000aa3d8  b       #0xaa35e
000aa3da  mov.w   r3, #0x10000
000aa3de  str     r3, [r5, #0x1c]
000aa3e0  sub.w   r3, r3, #0x70000
000aa3e4  str     r3, [r5, #0x20]
000aa3e6  add.w   r3, r3, #0x68000
000aa3ea  str     r3, [r5, #0x24]
000aa3ec  movs    r3, #4
000aa3ee  str     r3, [r5, #0x28]
000aa3f0  ldr.w   r3, [r0, #0xa4]
000aa3f4  movw    r2, #0x4b7
000aa3f8  adds    r3, #1
000aa3fa  str.w   r2, [r0, r3, lsl #3]
000aa3fe  ldr.w   r3, [r0, #0xa4]
000aa402  adds    r2, r3, #1
000aa404  ldr     r3, [pc, #0x28]
000aa406  str.w   r2, [r0, #0xa4]
000aa40a  add     r3, pc ; -> 0x000f3720  t_flight
000aa40c  ldr     r1, [r3]
000aa40e  lsls    r3, r2, #3
000aa410  adds    r3, r3, r0
000aa412  str     r1, [r3, #4]
000aa414  ldr.w   r3, [r0, #0xa4]
000aa418  movs    r0, #0
000aa41a  adds    r3, #1
000aa41c  str.w   r0, [r4, r3, lsl #3]
000aa420  b       #0xaa35e
000aa422  nop     
000aa424  movs    r3, r0
000aa426  movs    r2, r0
000aa428  str     r3, [sp, #0x88]
000aa42a  movs    r4, r0
000aa42c  str     r4, [sp, #0x20]
000aa42e  movs    r4, r0
000aa430  str     r3, [sp, #0x48]
000aa432  movs    r4, r0
