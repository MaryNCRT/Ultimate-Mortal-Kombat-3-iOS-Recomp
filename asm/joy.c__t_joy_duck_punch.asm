========================================================================
t_joy_duck_punch  0x00030340  176 bytes   joy.c
========================================================================

00030340  push    {r4, r5, r6, r7, lr}
00030342  add     r7, sp, #0xc
00030344  ldr.w   r3, [r0, #0xa4]
00030348  mov     r4, r0
0003034a  ldr.w   r5, [r0, #0x108]
0003034e  adds    r3, #1
00030350  ldr.w   r6, [r0, r3, lsl #3]
00030354  cbnz    r6, #0x3038e
00030356  mov     r0, r5
00030358  bl      #0x2ec68 ; -> disable_all_buttons
0003035c  ldr.w   r3, [r4, #0xa4]
00030360  movw    r2, #0x185
00030364  mov     r0, r6
00030366  adds    r3, #1
00030368  str.w   r2, [r4, r3, lsl #3]
0003036c  ldr.w   r3, [r4, #0xa4]
00030370  adds    r2, r3, #1
00030372  ldr     r3, [pc, #0x70]
00030374  str.w   r2, [r4, #0xa4]
00030378  add     r3, pc ; -> 0x000f38b8  t_stat_do_duck_punch
0003037a  ldr     r1, [r3]
0003037c  lsls    r3, r2, #3
0003037e  adds    r3, r3, r4
00030380  str     r1, [r3, #4]
00030382  ldr.w   r3, [r4, #0xa4]
00030386  adds    r3, #1
00030388  str.w   r6, [r4, r3, lsl #3]
0003038c  pop     {r4, r5, r6, r7, pc}
0003038e  movw    r3, #0x185
00030392  cmp     r6, r3
00030394  it      ne
00030396  mvnne   r0, #2
0003039a  bne     #0x3038c
0003039c  mov     r0, r5
0003039e  bl      #0x55d94 ; -> joystick_in_a0
000303a2  ldr     r0, [r5, #0x1c]
000303a4  ands    r0, r0, #2
000303a8  beq     #0x303c6
000303aa  ldr.w   r3, [r4, #0xa4]
000303ae  ldr     r2, [pc, #0x38]
000303b0  movs    r0, #0
000303b2  lsls    r3, r3, #3
000303b4  adds    r3, r3, r4
000303b6  add     r2, pc ; -> 0x0002ee31  t_joyd3
000303b8  str     r2, [r3, #4]
000303ba  ldr.w   r3, [r4, #0xa4]
000303be  adds    r3, #1
000303c0  str.w   r0, [r4, r3, lsl #3]
000303c4  b       #0x3038c
000303c6  ldr.w   r3, [r4, #0xa4]
000303ca  ldr.w   r2, [pc, #0x20]
000303ce  lsls    r3, r3, #3
000303d0  adds    r3, r3, r4
000303d2  add     r2, pc ; -> 0x000305b1  t_joy_back_up
000303d4  str     r2, [r3, #4]
000303d6  ldr.w   r3, [r4, #0xa4]
000303da  adds    r3, #1
000303dc  str.w   r0, [r4, r3, lsl #3]
000303e0  b       #0x3038c
000303e2  nop     
000303e4  adds    r5, #0x3c
000303e6  movs    r4, r1
000303e8  orns    pc, r7, pc, ror #31
000303ec  lsls    r3, r3, #7
000303ee  movs    r0, r0
