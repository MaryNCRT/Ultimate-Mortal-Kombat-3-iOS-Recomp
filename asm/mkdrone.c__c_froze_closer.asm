========================================================================
c_froze_closer  0x0006f36c  180 bytes   mkdrone.c
========================================================================

0006f36c  push    {r4, r5, r7, lr}
0006f36e  add     r7, sp, #8
0006f370  ldr.w   r3, [r0, #0xa4]
0006f374  mov     r4, r0
0006f376  ldr.w   r5, [r0, #0x108]
0006f37a  adds    r3, #1
0006f37c  ldr.w   r0, [r0, r3, lsl #3]
0006f380  cbnz    r0, #0x6f3b8
0006f382  movs    r3, #0x30
0006f384  str     r3, [r5, #0x44]
0006f386  adds    r3, #0x10
0006f388  str     r3, [r5, #0x48]
0006f38a  ldr.w   r3, [r4, #0xa4]
0006f38e  movw    r2, #0x10f6
0006f392  adds    r3, #1
0006f394  str.w   r2, [r4, r3, lsl #3]
0006f398  ldr     r2, [pc, #0x74]
0006f39a  ldr.w   r3, [r4, #0xa4]
0006f39e  add     r2, pc ; -> 0x00072b95  t_d_stalk_a11
0006f3a0  adds    r3, #1
0006f3a2  str.w   r3, [r4, #0xa4]
0006f3a6  lsls    r3, r3, #3
0006f3a8  adds    r3, r3, r4
0006f3aa  str     r2, [r3, #4]
0006f3ac  ldr.w   r3, [r4, #0xa4]
0006f3b0  adds    r3, #1
0006f3b2  str.w   r0, [r4, r3, lsl #3]
0006f3b6  pop     {r4, r5, r7, pc}
0006f3b8  movw    r3, #0x10f6
0006f3bc  cmp     r0, r3
0006f3be  it      ne
0006f3c0  mvnne   r0, #2
0006f3c4  bne     #0x6f3b6
0006f3c6  mov     r0, r5
0006f3c8  bl      #0x55060 ; -> is_he_airborn
0006f3cc  ldr     r0, [r5, #0x5c]
0006f3ce  cbnz    r0, #0x6f3dc
0006f3d0  ldr.w   r2, [pc, #0x40]
0006f3d4  ldr.w   r3, [r4, #0xa4]
0006f3d8  add     r2, pc ; -> 0x0006f681  t_d_attack_very_close
0006f3da  b       #0x6f3a6
0006f3dc  mov     r0, r5
0006f3de  bl      #0x57828 ; -> get_his_dog
0006f3e2  ldr     r0, [r5, #0x1c]
0006f3e4  cmp     r0, #0xf
0006f3e6  bgt     #0x6f406
0006f3e8  ldr.w   r2, [pc, #0x2c]
0006f3ec  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0006f3ee  ldr.w   r3, [r4, #0xa4]
0006f3f2  movs    r0, #0
0006f3f4  lsls    r3, r3, #3
0006f3f6  adds    r3, r3, r4
0006f3f8  str     r2, [r3, #4]
0006f3fa  ldr.w   r3, [r4, #0xa4]
0006f3fe  adds    r3, #1
0006f400  str.w   r0, [r4, r3, lsl #3]
0006f404  b       #0x6f3b6
0006f406  ldr.w   r2, [pc, #0x14]
0006f40a  add     r2, pc ; -> 0x000675b1  t_d_jump_up_kick
0006f40c  b       #0x6f3ee
0006f40e  nop     
0006f410  adds    r7, #0xf3
0006f412  movs    r0, r0
0006f414  lsls    r5, r4, #0xa
0006f416  movs    r0, r0
0006f418  strh    r1, [r6, #0x14]
