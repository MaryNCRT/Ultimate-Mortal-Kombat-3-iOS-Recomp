========================================================================
t_r_sweep  0x00042e3c  152 bytes   mkreact.c
========================================================================

00042e3c  push    {r4, r5, r7, lr}
00042e3e  add     r7, sp, #8
00042e40  ldr.w   r3, [r0, #0xa4]
00042e44  mov     r4, r0
00042e46  ldr.w   r5, [r0, #0x108]
00042e4a  adds    r3, #1
00042e4c  ldr.w   r0, [r0, r3, lsl #3]
00042e50  cbnz    r0, #0x42e8c
00042e52  ldr     r3, [pc, #0x74]
00042e54  str     r0, [r5, #0x38]
00042e56  movw    r2, #0xde2
00042e5a  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
00042e5c  str     r3, [r5, #0x30]
00042e5e  movs    r3, #1
00042e60  str     r3, [r5, #0x34]
00042e62  ldr.w   r3, [r4, #0xa4]
00042e66  adds    r3, #1
00042e68  str.w   r2, [r4, r3, lsl #3]
00042e6c  ldr.w   r3, [r4, #0xa4]
00042e70  ldr     r2, [pc, #0x58]
00042e72  adds    r3, #1
00042e74  str.w   r3, [r4, #0xa4]
00042e78  lsls    r3, r3, #3
00042e7a  adds    r3, r3, r4
00042e7c  add     r2, pc ; -> 0x00044b85  t_reaction_start
00042e7e  str     r2, [r3, #4]
00042e80  ldr.w   r3, [r4, #0xa4]
00042e84  adds    r3, #1
00042e86  str.w   r0, [r4, r3, lsl #3]
00042e8a  pop     {r4, r5, r7, pc}
00042e8c  movw    r3, #0xde2
00042e90  cmp     r0, r3
00042e92  it      ne
00042e94  mvnne   r0, #2
00042e98  bne     #0x42e8a
00042e9a  mov     r0, r5
00042e9c  movs    r1, #0xc
00042e9e  bl      #0x57dbc ; -> rsnd_func
00042ea2  mov     r0, r5
00042ea4  movs    r3, #5
00042ea6  str     r3, [r5, #0x1c]
00042ea8  bl      #0x580a4 ; -> group_sound
00042eac  ldr.w   r3, [r4, #0xa4]
00042eb0  ldr     r2, [pc, #0x1c]
00042eb2  movs    r0, #0
00042eb4  lsls    r3, r3, #3
00042eb6  adds    r3, r3, r4
00042eb8  add     r2, pc ; -> 0x00043c09  t_sweep3
00042eba  str     r2, [r3, #4]
00042ebc  ldr.w   r3, [r4, #0xa4]
00042ec0  adds    r3, #1
00042ec2  str.w   r0, [r4, r3, lsl #3]
00042ec6  b       #0x42e8a
