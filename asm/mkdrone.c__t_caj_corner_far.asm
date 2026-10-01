========================================================================
t_caj_corner_far  0x0006c918  176 bytes   mkdrone.c
========================================================================

0006c918  push    {r4, r5, r6, r7, lr}
0006c91a  add     r7, sp, #0xc
0006c91c  ldr.w   r2, [r0, #0xa4]
0006c920  mov     r4, r0
0006c922  ldr.w   r5, [r0, #0x108]
0006c926  adds    r3, r2, #1
0006c928  ldr.w   r6, [r0, r3, lsl #3]
0006c92c  cbnz    r6, #0x6c95a
0006c92e  mov     r0, r5
0006c930  mov.w   r3, #0x1f4
0006c934  str     r3, [r5, #0x1c]
0006c936  bl      #0x586dc ; -> randper
0006c93a  ldr     r0, [r5, #0x5c]
0006c93c  cbz     r0, #0x6c984
0006c93e  ldr.w   r3, [r4, #0xa4]
0006c942  ldr     r2, [pc, #0x78]
0006c944  mov     r0, r6
0006c946  lsls    r3, r3, #3
0006c948  adds    r3, r3, r4
0006c94a  add     r2, pc ; -> 0x00067f91  t_d_zap
0006c94c  str     r2, [r3, #4]
0006c94e  ldr.w   r3, [r4, #0xa4]
0006c952  adds    r3, #1
0006c954  str.w   r6, [r4, r3, lsl #3]
0006c958  pop     {r4, r5, r6, r7, pc}
0006c95a  movw    r3, #0xc66
0006c95e  cmp     r6, r3
0006c960  it      ne
0006c962  mvnne   r0, #2
0006c966  bne     #0x6c958
0006c968  ldr.w   r3, [pc, #0x54]
0006c96c  movs    r0, #0
0006c96e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006c970  ldr     r1, [r3]
0006c972  lsls    r3, r2, #3
0006c974  adds    r3, r3, r4
0006c976  str     r1, [r3, #4]
0006c978  ldr.w   r3, [r4, #0xa4]
0006c97c  adds    r3, #1
0006c97e  str.w   r0, [r4, r3, lsl #3]
0006c982  b       #0x6c958
0006c984  movs    r3, #0x80
0006c986  str     r3, [r5, #0x1c]
0006c988  adds    r3, #0x20
0006c98a  str     r3, [r5, #0x48]
0006c98c  ldr.w   r3, [r4, #0xa4]
0006c990  movw    r2, #0xc66
0006c994  adds    r3, #1
0006c996  str.w   r2, [r4, r3, lsl #3]
0006c99a  ldr.w   r3, [r4, #0xa4]
0006c99e  ldr.w   r2, [pc, #0x24]
0006c9a2  adds    r3, #1
0006c9a4  str.w   r3, [r4, #0xa4]
0006c9a8  lsls    r3, r3, #3
0006c9aa  adds    r3, r3, r4
0006c9ac  add     r2, pc ; -> 0x00072b95  t_d_stalk_a11
0006c9ae  str     r2, [r3, #4]
0006c9b0  ldr.w   r3, [r4, #0xa4]
0006c9b4  adds    r3, #1
0006c9b6  str.w   r0, [r4, r3, lsl #3]
0006c9ba  b       #0x6c958
