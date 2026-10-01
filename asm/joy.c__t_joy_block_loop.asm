========================================================================
t_joy_block_loop  0x000301c4  272 bytes   joy.c
========================================================================

000301c4  push    {r4, r5, r6, r7, lr}
000301c6  add     r7, sp, #0xc
000301c8  ldr.w   r2, [r0, #0xa4]
000301cc  movw    r6, #0x28b
000301d0  mov     r4, r0
000301d2  adds    r1, r2, #1
000301d4  ldr.w   r5, [r0, #0x108]
000301d8  ldr.w   r3, [r0, r1, lsl #3]
000301dc  cmp     r3, r6
000301de  beq     #0x3026a
000301e0  ble     #0x301f6
000301e2  movw    r1, #0x28e
000301e6  cmp     r3, r1
000301e8  beq     #0x3025a
000301ea  adds    r1, #4
000301ec  cmp     r3, r1
000301ee  beq     #0x3023a
000301f0  mvn     r0, #2
000301f4  pop     {r4, r5, r6, r7, pc}
000301f6  cbz     r3, #0x3022a
000301f8  movw    r2, #0x283
000301fc  cmp     r3, r2
000301fe  bne     #0x301f0
00030200  mov     r0, r5
00030202  bl      #0x55d94 ; -> joystick_in_a0
00030206  ldr     r3, [r5, #0x1c]
00030208  tst.w   r3, #2
0003020c  beq     #0x30252
0003020e  ldr     r2, [pc, #0xac]
00030210  add     r2, pc ; -> 0x0002ed81  t_joy_down
00030212  ldr.w   r3, [r4, #0xa4]
00030216  movs    r0, #0
00030218  lsls    r3, r3, #3
0003021a  adds    r3, r3, r4
0003021c  str     r2, [r3, #4]
0003021e  ldr.w   r3, [r4, #0xa4]
00030222  adds    r3, #1
00030224  str.w   r0, [r4, r3, lsl #3]
00030228  b       #0x301f4
0003022a  movw    r3, #0x283
0003022e  str.w   r3, [r0, r1, lsl #3]
00030232  movs    r0, #1
00030234  str.w   r0, [r4, #0xfc]
00030238  b       #0x301f4
0003023a  ldr     r1, [pc, #0x84]
0003023c  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0003023e  lsls    r3, r2, #3
00030240  adds    r3, r3, r4
00030242  movs    r0, #0
00030244  str     r1, [r3, #4]
00030246  ldr.w   r3, [r4, #0xa4]
0003024a  adds    r3, #1
0003024c  str.w   r0, [r4, r3, lsl #3]
00030250  b       #0x301f4
00030252  mov     r0, r5
00030254  bl      #0x551f0 ; -> am_i_facing_him
00030258  cbz     r0, #0x302a2
0003025a  mov     r0, r5
0003025c  bl      #0x2eca8 ; -> check_block_bit
00030260  cbz     r0, #0x30272
00030262  ldr.w   r2, [pc, #0x60]
00030266  add     r2, pc ; -> 0x000301c5  t_joy_block_loop
00030268  b       #0x30212
0003026a  ldr.w   r1, [pc, #0x5c]
0003026e  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
00030270  b       #0x3023e
00030272  ldr.w   r3, [r4, #0xa4]
00030276  movw    r2, #0x292
0003027a  adds    r3, #1
0003027c  str.w   r2, [r4, r3, lsl #3]
00030280  ldr.w   r3, [r4, #0xa4]
00030284  adds    r2, r3, #1
00030286  ldr     r3, [pc, #0x44]
00030288  str.w   r2, [r4, #0xa4]
0003028c  add     r3, pc ; -> 0x000f38a0  t_do_unblock_hi
0003028e  ldr     r1, [r3]
00030290  lsls    r3, r2, #3
00030292  adds    r3, r3, r4
00030294  str     r1, [r3, #4]
00030296  ldr.w   r3, [r4, #0xa4]
0003029a  adds    r3, #1
0003029c  str.w   r0, [r4, r3, lsl #3]
000302a0  b       #0x301f4
000302a2  ldr.w   r3, [r4, #0xa4]
000302a6  adds    r3, #1
000302a8  str.w   r6, [r4, r3, lsl #3]
000302ac  ldr.w   r3, [r4, #0xa4]
000302b0  adds    r2, r3, #1
000302b2  ldr     r3, [pc, #0x1c]
000302b4  str.w   r2, [r4, #0xa4]
000302b8  add     r3, pc ; -> 0x000f3844  t_turn_around
000302ba  b       #0x3028e
000302bc  sbc.w   pc, sp, pc, ror #31
000302c0  mcr2    p15, #1, pc, c1, c15, #7
