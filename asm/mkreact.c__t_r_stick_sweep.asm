========================================================================
t_r_stick_sweep  0x00047044  152 bytes   mkreact.c
========================================================================

00047044  push    {r4, r5, r7, lr}
00047046  add     r7, sp, #8
00047048  ldr.w   r3, [r0, #0xa4]
0004704c  mov     r5, r0
0004704e  ldr.w   r4, [r0, #0x108]
00047052  adds    r3, #1
00047054  ldr.w   r0, [r0, r3, lsl #3]
00047058  cbnz    r0, #0x47090
0004705a  str     r0, [r4, #0x30]
0004705c  str     r0, [r4, #0x38]
0004705e  movs    r3, #1
00047060  str     r3, [r4, #0x34]
00047062  ldr.w   r3, [r5, #0xa4]
00047066  movw    r2, #0xdd5
0004706a  adds    r3, #1
0004706c  str.w   r2, [r5, r3, lsl #3]
00047070  ldr.w   r3, [r5, #0xa4]
00047074  ldr     r2, [pc, #0x5c]
00047076  adds    r3, #1
00047078  str.w   r3, [r5, #0xa4]
0004707c  lsls    r3, r3, #3
0004707e  adds    r3, r3, r5
00047080  add     r2, pc ; -> 0x00044b85  t_reaction_start
00047082  str     r2, [r3, #4]
00047084  ldr.w   r3, [r5, #0xa4]
00047088  adds    r3, #1
0004708a  str.w   r0, [r5, r3, lsl #3]
0004708e  pop     {r4, r5, r7, pc}
00047090  movw    r3, #0xdd5
00047094  cmp     r0, r3
00047096  it      ne
00047098  mvnne   r0, #2
0004709c  bne     #0x4708e
0004709e  movs    r1, #0xc
000470a0  mov     r0, r4
000470a2  bl      #0x57dbc ; -> rsnd_func
000470a6  mov     r0, r4
000470a8  movs    r3, #6
000470aa  str     r3, [r4, #0x1c]
000470ac  bl      #0x580a4 ; -> group_sound
000470b0  mov     r0, r4
000470b2  bl      #0x5533c ; -> ground_player
000470b6  ldr.w   r3, [r5, #0xa4]
000470ba  ldr     r2, [pc, #0x1c]
000470bc  movs    r0, #0
000470be  lsls    r3, r3, #3
000470c0  adds    r3, r3, r5
000470c2  add     r2, pc ; -> 0x00043c09  t_sweep3
000470c4  str     r2, [r3, #4]
000470c6  ldr.w   r3, [r5, #0xa4]
000470ca  adds    r3, #1
000470cc  str.w   r0, [r5, r3, lsl #3]
000470d0  b       #0x4708e
000470d2  nop     
000470d4  blt     #0x470da
000470d6  vtbx.8  d28, {d15, d16, d17, d18}, d3
