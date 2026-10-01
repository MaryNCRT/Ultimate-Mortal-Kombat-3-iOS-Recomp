========================================================================
t_fatality_stalk_a11  0x0007293c  240 bytes   mkdrone.c
========================================================================

0007293c  push    {r4, r5, r7, lr}
0007293e  add     r7, sp, #8
00072940  ldr.w   r3, [r0, #0xa4]
00072944  movw    r2, #0xa91
00072948  mov     r4, r0
0007294a  adds    r1, r3, #1
0007294c  ldr.w   r5, [r0, #0x108]
00072950  ldr.w   r3, [r0, r1, lsl #3]
00072954  cmp     r3, r2
00072956  beq     #0x729bc
00072958  adds    r2, #1
0007295a  cmp     r3, r2
0007295c  beq     #0x72998
0007295e  cbnz    r3, #0x72992
00072960  mov     r0, r5
00072962  bl      #0x55388 ; -> face_opponent
00072966  mov     r0, r5
00072968  bl      #0x72928 ; -> d_walkf_setup
0007296c  mov     r0, r5
0007296e  bl      #0x551f0 ; -> am_i_facing_him
00072972  ldr     r0, [r5, #0x5c]
00072974  cmp     r0, #0
00072976  bne     #0x729e8
00072978  ldr     r2, [pc, #0xa0]
0007297a  add     r2, pc ; -> 0x00070675  t_d_turnaround
0007297c  ldr.w   r3, [r4, #0xa4]
00072980  lsls    r3, r3, #3
00072982  adds    r3, r3, r4
00072984  str     r2, [r3, #4]
00072986  ldr.w   r3, [r4, #0xa4]
0007298a  adds    r3, #1
0007298c  str.w   r0, [r4, r3, lsl #3]
00072990  b       #0x72996
00072992  mvn     r0, #2
00072996  pop     {r4, r5, r7, pc}
00072998  mov     r0, r5
0007299a  bl      #0x5a680 ; -> next_anirate
0007299e  mov     r0, r5
000729a0  bl      #0x2f3a0 ; -> get_x_dist
000729a4  ldr     r2, [r5, #0x28]
000729a6  ldr     r3, [r5, #0x48]
000729a8  cmp     r2, r3
000729aa  blt     #0x729fe
000729ac  ldr     r3, [r5, #0x44]
000729ae  subs    r0, r3, #1
000729b0  str     r0, [r5, #0x44]
000729b2  cmp     r0, #0
000729b4  bne     #0x7296c
000729b6  ldr     r2, [pc, #0x68]
000729b8  add     r2, pc ; -> 0x0006eda5  t_dist_retp
000729ba  b       #0x7297c
000729bc  movw    r3, #0xa92
000729c0  str.w   r3, [r0, r1, lsl #3]
000729c4  ldr.w   r3, [r0, #0xa4]
000729c8  adds    r2, r3, #1
000729ca  ldr     r3, [pc, #0x58]
000729cc  str.w   r2, [r0, #0xa4]
000729d0  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
000729d2  ldr     r1, [r3]
000729d4  lsls    r3, r2, #3
000729d6  adds    r3, r3, r0
000729d8  str     r1, [r3, #4]
000729da  ldr.w   r3, [r0, #0xa4]
000729de  movs    r0, #0
000729e0  adds    r3, #1
000729e2  str.w   r0, [r4, r3, lsl #3]
000729e6  b       #0x72996
000729e8  ldr.w   r3, [r4, #0xa4]
000729ec  movs    r0, #1
000729ee  movw    r2, #0xa91
000729f2  adds    r3, #1
000729f4  str.w   r2, [r4, r3, lsl #3]
000729f8  str.w   r0, [r4, #0xfc]
000729fc  b       #0x72996
000729fe  ldr.w   r3, [r4, #0xa4]
00072a02  ldr.w   r2, [pc, #0x24]
00072a06  movs    r0, #0
00072a08  lsls    r3, r3, #3
00072a0a  adds    r3, r3, r4
00072a0c  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072a0e  str     r2, [r3, #4]
00072a10  ldr.w   r3, [r4, #0xa4]
00072a14  adds    r3, #1
00072a16  str.w   r0, [r4, r3, lsl #3]
00072a1a  b       #0x72996
00072a1c  bgt     #0x72a0e
