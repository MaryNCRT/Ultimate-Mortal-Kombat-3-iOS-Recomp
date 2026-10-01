========================================================================
t_d_duck_block  0x000714d8  220 bytes   mkdrone.c
========================================================================

000714d8  push    {r4, r5, r6, r7, lr}
000714da  add     r7, sp, #0xc
000714dc  str     r8, [sp, #-0x4]!
000714e0  ldr.w   r2, [r0, #0xa4]
000714e4  movw    r8, #0x847
000714e8  mov     r4, r0
000714ea  adds    r3, r2, #1
000714ec  ldr.w   r5, [r0, #0x108]
000714f0  ldr.w   r6, [r0, r3, lsl #3]
000714f4  cmp     r6, r8
000714f6  beq     #0x71574
000714f8  movw    r3, #0x849
000714fc  cmp     r6, r3
000714fe  beq     #0x7155a
00071500  cbz     r6, #0x7150c
00071502  mvn     r0, #2
00071506  ldr     r8, [sp], #4
0007150a  pop     {r4, r5, r6, r7, pc}
0007150c  mov     r0, r5
0007150e  bl      #0x55c04 ; -> stop_me_player
00071512  mov     r0, r5
00071514  bl      #0x55388 ; -> face_opponent
00071518  mov     r0, r5
0007151a  movs    r3, #6
0007151c  str     r3, [r5, #0x40]
0007151e  bl      #0x5520c ; -> get_char_ani
00071522  movs    r3, #3
00071524  str     r3, [r5, #0x1c]
00071526  movw    r3, #0x701
0007152a  str     r3, [r5, #0x20]
0007152c  ldr.w   r3, [r4, #0xa4]
00071530  mov     r0, r6
00071532  adds    r3, #1
00071534  str.w   r8, [r4, r3, lsl #3]
00071538  ldr.w   r3, [r4, #0xa4]
0007153c  adds    r2, r3, #1
0007153e  ldr     r3, [pc, #0x68]
00071540  str.w   r2, [r4, #0xa4]
00071544  add     r3, pc ; -> 0x000f37e8  t_act_mframew
00071546  ldr     r1, [r3]
00071548  lsls    r3, r2, #3
0007154a  adds    r3, r3, r4
0007154c  str     r1, [r3, #4]
0007154e  ldr.w   r3, [r4, #0xa4]
00071552  adds    r3, #1
00071554  str.w   r6, [r4, r3, lsl #3]
00071558  b       #0x71506
0007155a  ldr     r3, [pc, #0x50]
0007155c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007155e  ldr     r1, [r3]
00071560  lsls    r3, r2, #3
00071562  adds    r3, r3, r0
00071564  str     r1, [r3, #4]
00071566  ldr.w   r3, [r0, #0xa4]
0007156a  movs    r0, #0
0007156c  adds    r3, #1
0007156e  str.w   r0, [r4, r3, lsl #3]
00071572  b       #0x71506
00071574  movs    r3, #0x80
00071576  str     r3, [r5, #0x1c]
00071578  ldr.w   r3, [r0, #0xa4]
0007157c  movw    r2, #0x849
00071580  adds    r3, #1
00071582  str.w   r2, [r0, r3, lsl #3]
00071586  ldr.w   r3, [r0, #0xa4]
0007158a  ldr     r2, [pc, #0x24]
0007158c  adds    r3, #1
0007158e  str.w   r3, [r0, #0xa4]
00071592  lsls    r3, r3, #3
00071594  adds    r3, r3, r0
00071596  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
00071598  str     r2, [r3, #4]
0007159a  ldr.w   r3, [r0, #0xa4]
0007159e  movs    r0, #0
000715a0  adds    r3, #1
000715a2  str.w   r0, [r4, r3, lsl #3]
000715a6  b       #0x71506
000715a8  movs    r2, #0xa0
000715aa  movs    r0, r1
000715ac  movs    r1, #0xa8
000715ae  movs    r0, r1
000715b0  cbz     r3, #0x715ec
