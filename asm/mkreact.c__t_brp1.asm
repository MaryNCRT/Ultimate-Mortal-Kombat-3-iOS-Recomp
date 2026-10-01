========================================================================
t_brp1  0x000483a0  216 bytes   mkreact.c
========================================================================

000483a0  push    {r4, r5, r6, r7, lr}
000483a2  add     r7, sp, #0xc
000483a4  ldr.w   r1, [r0, #0xa4]
000483a8  mov     r4, r0
000483aa  ldr.w   r5, [r0, #0x108]
000483ae  adds    r2, r1, #1
000483b0  ldr.w   r0, [r0, r2, lsl #3]
000483b4  cmp.w   r0, #0x7e0
000483b8  beq     #0x4840e
000483ba  movw    r3, #0x7ed
000483be  cmp     r0, r3
000483c0  beq     #0x483f4
000483c2  cbz     r0, #0x483ca
000483c4  mvn     r0, #2
000483c8  pop     {r4, r5, r6, r7, pc}
000483ca  mov.w   r3, #0x7e0
000483ce  str.w   r3, [r4, r2, lsl #3]
000483d2  ldr.w   r3, [r4, #0xa4]
000483d6  adds    r2, r3, #1
000483d8  ldr     r3, [pc, #0x94]
000483da  str.w   r2, [r4, #0xa4]
000483de  add     r3, pc ; -> 0x000f37f4  t_flight_call
000483e0  ldr     r1, [r3]
000483e2  lsls    r3, r2, #3
000483e4  adds    r3, r3, r4
000483e6  str     r1, [r3, #4]
000483e8  ldr.w   r3, [r4, #0xa4]
000483ec  adds    r3, #1
000483ee  str.w   r0, [r4, r3, lsl #3]
000483f2  b       #0x483c8
000483f4  ldr     r3, [pc, #0x7c]
000483f6  movs    r0, #0
000483f8  add     r3, pc ; -> 0x000f3724  t_wait_forever
000483fa  ldr     r2, [r3]
000483fc  lsls    r3, r1, #3
000483fe  adds    r3, r3, r4
00048400  str     r2, [r3, #4]
00048402  ldr.w   r3, [r4, #0xa4]
00048406  adds    r3, #1
00048408  str.w   r0, [r4, r3, lsl #3]
0004840c  b       #0x483c8
0004840e  movs    r1, #0xb
00048410  mov     r0, r5
00048412  bl      #0x57dd0 ; -> tsound_func
00048416  mov     r0, r5
00048418  bl      #0x55c04 ; -> stop_me_player
0004841c  ldr     r3, [r5]
0004841e  movs    r2, #0
00048420  movs    r0, #4
00048422  movs    r1, #0x3f
00048424  ldr     r3, [r3, #8]
00048426  bl      #0x31a28 ; -> MKEvent_Add
0004842a  movs    r1, #3
0004842c  mov     r0, r5
0004842e  bl      #0x57dbc ; -> rsnd_func
00048432  mov     r0, r5
00048434  bl      #0x34fc4 ; -> death_scream
00048438  mov     r0, r5
0004843a  movs    r3, #0x1e
0004843c  str     r3, [r5, #0x40]
0004843e  bl      #0x55474 ; -> find_ani_part2
00048442  mov     r0, r5
00048444  bl      #0x59e24 ; -> do_next_a9_frame
00048448  mov     r0, r5
0004844a  movs    r6, #0xa
0004844c  str     r6, [r5, #0x1c]
0004844e  bl      #0x5877c ; -> create_blood_proc
00048452  mov     r0, r5
00048454  bl      #0x336e8 ; -> death_blow_complete
00048458  ldr.w   r3, [r4, #0xa4]
0004845c  movw    r2, #0x7ed
00048460  mov     r0, r6
00048462  adds    r3, #1
00048464  str.w   r2, [r4, r3, lsl #3]
00048468  str.w   r6, [r4, #0xfc]
0004846c  b       #0x483c8
0004846e  nop     
00048470  push    {r1, r4}
00048472  movs    r2, r1
00048474  cbz     r0, #0x484c2
00048476  movs    r2, r1
