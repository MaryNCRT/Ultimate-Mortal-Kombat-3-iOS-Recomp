========================================================================
t_d_retreat_a11  0x00072828  256 bytes   mkdrone.c
========================================================================

00072828  push    {r4, r5, r7, lr}
0007282a  add     r7, sp, #8
0007282c  ldr.w   r3, [r0, #0xa4]
00072830  movw    r2, #0x2ee
00072834  mov     r4, r0
00072836  adds    r3, #1
00072838  ldr.w   r5, [r0, #0x108]
0007283c  ldr.w   r3, [r0, r3, lsl #3]
00072840  cmp     r3, r2
00072842  beq     #0x72898
00072844  cmp.w   r3, #0x2f0
00072848  beq     #0x72882
0007284a  cbnz    r3, #0x7287c
0007284c  mov     r0, r5
0007284e  bl      #0x55388 ; -> face_opponent
00072852  mov     r0, r5
00072854  bl      #0x724c4 ; -> d_walkb_setup
00072858  mov     r0, r5
0007285a  bl      #0x551f0 ; -> am_i_facing_him
0007285e  cmp     r0, #0
00072860  bne     #0x728d0
00072862  ldr.w   r3, [r4, #0xa4]
00072866  ldr     r2, [pc, #0xac]
00072868  lsls    r3, r3, #3
0007286a  adds    r3, r3, r4
0007286c  add     r2, pc ; -> 0x00070675  t_d_turnaround
0007286e  str     r2, [r3, #4]
00072870  ldr.w   r3, [r4, #0xa4]
00072874  adds    r3, #1
00072876  str.w   r0, [r4, r3, lsl #3]
0007287a  b       #0x72880
0007287c  mvn     r0, #2
00072880  pop     {r4, r5, r7, pc}
00072882  mov     r0, r5
00072884  bl      #0x71328 ; -> d_either_edge_a5
00072888  ldr     r3, [r5, #0x30]
0007288a  cmp     r3, #0x4f
0007288c  bgt     #0x728e6
0007288e  ldr     r2, [pc, #0x88]
00072890  ldr.w   r3, [r4, #0xa4]
00072894  add     r2, pc ; -> 0x00067e5d  t_d_cornered
00072896  b       #0x728bc
00072898  mov     r0, r5
0007289a  bl      #0x5a680 ; -> next_anirate
0007289e  ldr.w   r3, [r4, #0xa4]
000728a2  mov.w   r2, #0x2f0
000728a6  adds    r3, #1
000728a8  str.w   r2, [r4, r3, lsl #3]
000728ac  ldr.w   r2, [pc, #0x6c]
000728b0  ldr.w   r3, [r4, #0xa4]
000728b4  add     r2, pc ; -> 0x0006c40d  t_d_beware
000728b6  adds    r3, #1
000728b8  str.w   r3, [r4, #0xa4]
000728bc  lsls    r3, r3, #3
000728be  adds    r3, r3, r4
000728c0  movs    r0, #0
000728c2  str     r2, [r3, #4]
000728c4  ldr.w   r3, [r4, #0xa4]
000728c8  adds    r3, #1
000728ca  str.w   r0, [r4, r3, lsl #3]
000728ce  b       #0x72880
000728d0  ldr.w   r3, [r4, #0xa4]
000728d4  movs    r0, #1
000728d6  movw    r2, #0x2ee
000728da  adds    r3, #1
000728dc  str.w   r2, [r4, r3, lsl #3]
000728e0  str.w   r0, [r4, #0xfc]
000728e4  b       #0x72880
000728e6  mov     r0, r5
000728e8  bl      #0x2f3a0 ; -> get_x_dist
000728ec  ldr     r2, [r5, #0x28]
000728ee  ldr     r3, [r5, #0x48]
000728f0  cmp     r2, r3
000728f2  bgt     #0x72908
000728f4  ldr     r3, [r5, #0x44]
000728f6  subs    r3, #1
000728f8  cmp     r3, #0
000728fa  str     r3, [r5, #0x44]
000728fc  bgt     #0x72858
000728fe  ldr     r2, [pc, #0x20]
00072900  ldr.w   r3, [r4, #0xa4]
00072904  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072906  b       #0x728bc
00072908  ldr.w   r2, [pc, #0x18]
0007290c  ldr.w   r3, [r4, #0xa4]
00072910  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072912  b       #0x728bc
00072914  udf     #5
