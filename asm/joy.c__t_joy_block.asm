========================================================================
t_joy_block  0x000304d0  128 bytes   joy.c
========================================================================

000304d0  push    {r4, r5, r6, r7, lr}
000304d2  add     r7, sp, #0xc
000304d4  ldr.w   r2, [r0, #0xa4]
000304d8  mov     r4, r0
000304da  ldr.w   r6, [r0, #0x108]
000304de  adds    r3, r2, #1
000304e0  ldr.w   r5, [r0, r3, lsl #3]
000304e4  cbnz    r5, #0x30524
000304e6  mov     r0, r6
000304e8  bl      #0x2ec68 ; -> disable_all_buttons
000304ec  mov     r0, r6
000304ee  bl      #0x55388 ; -> face_opponent
000304f2  ldr.w   r3, [r4, #0xa4]
000304f6  mov.w   r2, #0x280
000304fa  mov     r0, r5
000304fc  adds    r3, #1
000304fe  str.w   r2, [r4, r3, lsl #3]
00030502  ldr.w   r3, [r4, #0xa4]
00030506  adds    r2, r3, #1
00030508  ldr     r3, [pc, #0x3c]
0003050a  str.w   r2, [r4, #0xa4]
0003050e  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
00030510  ldr     r1, [r3]
00030512  lsls    r3, r2, #3
00030514  adds    r3, r3, r4
00030516  str     r1, [r3, #4]
00030518  ldr.w   r3, [r4, #0xa4]
0003051c  adds    r3, #1
0003051e  str.w   r5, [r4, r3, lsl #3]
00030522  pop     {r4, r5, r6, r7, pc}
00030524  cmp.w   r5, #0x280
00030528  it      ne
0003052a  mvnne   r0, #2
0003052e  bne     #0x30522
00030530  ldr     r1, [pc, #0x18]
00030532  lsls    r3, r2, #3
00030534  adds    r3, r3, r4
00030536  add     r1, pc ; -> 0x000301c5  t_joy_block_loop
00030538  str     r1, [r3, #4]
0003053a  ldr.w   r3, [r4, #0xa4]
0003053e  movs    r0, #0
00030540  adds    r3, #1
00030542  str.w   r0, [r4, r3, lsl #3]
00030546  b       #0x30522
00030548  adds    r2, #0xc6
0003054a  movs    r4, r1
0003054c  stc2    p15, c15, [fp], {0xff}
