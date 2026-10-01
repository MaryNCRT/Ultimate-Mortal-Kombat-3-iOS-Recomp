========================================================================
t_swait_nonattack_jump  0x0006b308  136 bytes   mkdrone.c
========================================================================

0006b308  ldr.w   r1, [r0, #0xa4]
0006b30c  ldr.w   ip, [r0, #0x108]
0006b310  adds    r3, r1, #1
0006b312  ldr.w   r2, [r0, r3, lsl #3]
0006b316  cbnz    r2, #0x6b358
0006b318  ldr     r3, [pc, #0x68]
0006b31a  movw    r1, #0x11c8
0006b31e  add     r3, pc ; -> 0x0006c6b1  is_he_attacking
0006b320  str.w   r3, [ip, #0x48]
0006b324  movs    r3, #0x40
0006b326  str.w   r3, [ip, #0x44]
0006b32a  ldr.w   r3, [r0, #0xa4]
0006b32e  adds    r3, #1
0006b330  str.w   r1, [r0, r3, lsl #3]
0006b334  ldr.w   r3, [r0, #0xa4]
0006b338  ldr.w   r1, [pc, #0x4c]
0006b33c  adds    r3, #1
0006b33e  str.w   r3, [r0, #0xa4]
0006b342  lsls    r3, r3, #3
0006b344  adds    r3, r3, r0
0006b346  add     r1, pc ; -> 0x00071ee5  t_stance_wait_no
0006b348  str     r1, [r3, #4]
0006b34a  ldr.w   r3, [r0, #0xa4]
0006b34e  adds    r3, #1
0006b350  str.w   r2, [r0, r3, lsl #3]
0006b354  mov     r0, r2
0006b356  bx      lr
0006b358  movw    r3, #0x11c8
0006b35c  cmp     r2, r3
0006b35e  it      ne
0006b360  mvnne   r0, #2
0006b364  bne     #0x6b356
0006b366  ldr     r3, [pc, #0x24]
0006b368  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006b36a  ldr     r2, [r3]
0006b36c  lsls    r3, r1, #3
0006b36e  adds    r3, r3, r0
0006b370  str     r2, [r3, #4]
0006b372  ldr.w   r3, [r0, #0xa4]
0006b376  movs    r2, #0
0006b378  adds    r3, #1
0006b37a  str.w   r2, [r0, r3, lsl #3]
0006b37e  mov     r0, r2
0006b380  b       #0x6b356
0006b382  nop     
0006b384  asrs    r7, r1, #0xe
0006b386  movs    r0, r0
0006b388  ldr     r3, [r3, #0x38]
0006b38a  movs    r0, r0
0006b38c  strh    r4, [r3, #0x1c]
0006b38e  movs    r0, r1
