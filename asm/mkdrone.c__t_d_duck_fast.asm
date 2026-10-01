========================================================================
t_d_duck_fast  0x000715b4  100 bytes   mkdrone.c
========================================================================

000715b4  push    {r4, r5, r6, r7, lr}
000715b6  add     r7, sp, #0xc
000715b8  ldr.w   r3, [r0, #0xa4]
000715bc  mov     r5, r0
000715be  ldr.w   r4, [r0, #0x108]
000715c2  adds    r3, #1
000715c4  ldr.w   r6, [r0, r3, lsl #3]
000715c8  cmp     r6, #0
000715ca  bne     #0x7160e
000715cc  ldr     r3, [r4]
000715ce  mov     r0, r4
000715d0  movw    r2, #0x302
000715d4  str     r2, [r4, #0x20]
000715d6  str     r2, [r3, #0x18]
000715d8  bl      #0x55c04 ; -> stop_me_player
000715dc  mov     r0, r4
000715de  bl      #0x55388 ; -> face_opponent
000715e2  mov     r0, r4
000715e4  movs    r3, #4
000715e6  str     r3, [r4, #0x40]
000715e8  bl      #0x5520c ; -> get_char_ani
000715ec  movs    r3, #1
000715ee  str     r3, [r4, #0x1c]
000715f0  ldr     r3, [pc, #0x20]
000715f2  mov     r0, r6
000715f4  add     r3, pc ; -> 0x000f37cc  t_mframew
000715f6  ldr     r2, [r3]
000715f8  ldr.w   r3, [r5, #0xa4]
000715fc  lsls    r3, r3, #3
000715fe  adds    r3, r3, r5
00071600  str     r2, [r3, #4]
00071602  ldr.w   r3, [r5, #0xa4]
00071606  adds    r3, #1
00071608  str.w   r6, [r5, r3, lsl #3]
0007160c  pop     {r4, r5, r6, r7, pc}
0007160e  mvn     r0, #2
00071612  b       #0x7160c
00071614  movs    r1, #0xd4
00071616  movs    r0, r1
