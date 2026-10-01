========================================================================
t_d_backoff_a_bit  0x00067a30  128 bytes   mkdrone.c
========================================================================

00067a30  ldr.w   r1, [r0, #0xa4]
00067a34  ldr.w   ip, [r0, #0x108]
00067a38  adds    r3, r1, #1
00067a3a  ldr.w   r2, [r0, r3, lsl #3]
00067a3e  cbnz    r2, #0x67a7c
00067a40  movs    r3, #0x40
00067a42  str.w   r3, [ip, #0x44]
00067a46  adds    r3, r3, r3
00067a48  str.w   r3, [ip, #0x48]
00067a4c  ldr.w   r3, [r0, #0xa4]
00067a50  movw    r1, #0x303
00067a54  adds    r3, #1
00067a56  str.w   r1, [r0, r3, lsl #3]
00067a5a  ldr.w   r3, [r0, #0xa4]
00067a5e  ldr     r1, [pc, #0x48]
00067a60  adds    r3, #1
00067a62  str.w   r3, [r0, #0xa4]
00067a66  lsls    r3, r3, #3
00067a68  adds    r3, r3, r0
00067a6a  add     r1, pc ; -> 0x00072829  t_d_retreat_a11
00067a6c  str     r1, [r3, #4]
00067a6e  ldr.w   r3, [r0, #0xa4]
00067a72  adds    r3, #1
00067a74  str.w   r2, [r0, r3, lsl #3]
00067a78  mov     r0, r2
00067a7a  bx      lr
00067a7c  movw    r3, #0x303
00067a80  cmp     r2, r3
00067a82  it      ne
00067a84  mvnne   r0, #2
00067a88  bne     #0x67a7a
00067a8a  ldr.w   r3, [pc, #0x20]
00067a8e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00067a90  ldr     r2, [r3]
00067a92  lsls    r3, r1, #3
00067a94  adds    r3, r3, r0
00067a96  str     r2, [r3, #4]
00067a98  ldr.w   r3, [r0, #0xa4]
00067a9c  movs    r2, #0
00067a9e  adds    r3, #1
00067aa0  str.w   r2, [r0, r3, lsl #3]
00067aa4  mov     r0, r2
00067aa6  b       #0x67a7a
00067aa8  add     r5, sp, #0x2ec
00067aaa  movs    r0, r0
00067aac  pop     {r1, r2, r4, r5, r6}
00067aae  movs    r0, r1
