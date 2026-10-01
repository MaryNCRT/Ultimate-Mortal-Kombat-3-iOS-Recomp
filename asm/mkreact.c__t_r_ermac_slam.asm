========================================================================
t_r_ermac_slam  0x00049180  440 bytes   mkreact.c
========================================================================

00049180  push    {r4, r5, r6, r7, lr}
00049182  add     r7, sp, #0xc
00049184  ldr.w   r3, [r0, #0xa4]
00049188  mov     r4, r0
0004918a  ldr.w   r5, [r0, #0x108]
0004918e  adds    r3, #1
00049190  movw    r2, #0x215
00049194  ldr.w   r0, [r0, r3, lsl #3]
00049198  cmp     r0, r2
0004919a  beq.w   #0x49300
0004919e  ble     #0x491bc
000491a0  movw    r6, #0x226
000491a4  cmp     r0, r6
000491a6  beq     #0x49246
000491a8  movw    r3, #0x22e
000491ac  cmp     r0, r3
000491ae  beq     #0x49204
000491b0  subs    r3, #0x17
000491b2  cmp     r0, r3
000491b4  beq     #0x49294
000491b6  mvn     r0, #2
000491ba  pop     {r4, r5, r6, r7, pc}
000491bc  movw    r1, #0x211
000491c0  cmp     r0, r1
000491c2  beq.w   #0x492e8
000491c6  movw    r3, #0x213
000491ca  cmp     r0, r3
000491cc  beq     #0x49226
000491ce  cmp     r0, #0
000491d0  bne     #0x491b6
000491d2  str     r0, [r5, #0x30]
000491d4  str     r0, [r5, #0x34]
000491d6  str     r0, [r5, #0x38]
000491d8  ldr.w   r3, [r4, #0xa4]
000491dc  ldr.w   r2, [pc, #0x138]
000491e0  adds    r3, #1
000491e2  add     r2, pc ; -> 0x00044b85  t_reaction_start
000491e4  str.w   r1, [r4, r3, lsl #3]
000491e8  ldr.w   r3, [r4, #0xa4]
000491ec  adds    r3, #1
000491ee  str.w   r3, [r4, #0xa4]
000491f2  lsls    r3, r3, #3
000491f4  adds    r3, r3, r4
000491f6  str     r2, [r3, #4]
000491f8  ldr.w   r3, [r4, #0xa4]
000491fc  adds    r3, #1
000491fe  str.w   r0, [r4, r3, lsl #3]
00049202  b       #0x491ba
00049204  mov     r0, r5
00049206  bl      #0x55c04 ; -> stop_me_player
0004920a  ldr     r2, [pc, #0x110]
0004920c  ldr.w   r3, [r4, #0xa4]
00049210  add     r2, pc ; -> 0x00042519  t_land_on_my_back
00049212  lsls    r3, r3, #3
00049214  adds    r3, r3, r4
00049216  movs    r0, #0
00049218  str     r2, [r3, #4]
0004921a  ldr.w   r3, [r4, #0xa4]
0004921e  adds    r3, #1
00049220  str.w   r0, [r4, r3, lsl #3]
00049224  b       #0x491ba
00049226  movs    r3, #8
00049228  str     r3, [r5, #0x44]
0004922a  ldr.w   r3, [r4, #0xa4]
0004922e  adds    r3, #1
00049230  str.w   r2, [r4, r3, lsl #3]
00049234  ldr.w   r2, [pc, #0xe8]
00049238  ldr.w   r3, [r4, #0xa4]
0004923c  add     r2, pc ; -> 0x00044575  t_slammed_zoom_up
0004923e  adds    r3, #1
00049240  str.w   r3, [r4, #0xa4]
00049244  b       #0x49212
00049246  ldr.w   r3, [pc, #0xdc]
0004924a  movs    r0, #0
0004924c  str     r0, [r5, #0x34]
0004924e  movw    r2, #0x22e
00049252  str     r3, [r5, #0x1c]
00049254  sub.w   r3, r3, #0x48000
00049258  str     r3, [r5, #0x20]
0004925a  add.w   r3, r3, #0x86000
0004925e  str     r3, [r5, #0x24]
00049260  movs    r3, #4
00049262  str     r3, [r5, #0x28]
00049264  adds    r3, #0x3f
00049266  str     r3, [r5, #0x40]
00049268  ldr.w   r3, [r4, #0xa4]
0004926c  adds    r3, #1
0004926e  str.w   r2, [r4, r3, lsl #3]
00049272  ldr.w   r3, [r4, #0xa4]
00049276  adds    r2, r3, #1
00049278  ldr     r3, [pc, #0xac]
0004927a  str.w   r2, [r4, #0xa4]
0004927e  add     r3, pc ; -> 0x000f3720  t_flight
00049280  ldr     r1, [r3]
00049282  lsls    r3, r2, #3
00049284  adds    r3, r3, r4
00049286  str     r1, [r3, #4]
00049288  ldr.w   r3, [r4, #0xa4]
0004928c  adds    r3, #1
0004928e  str.w   r0, [r4, r3, lsl #3]
00049292  b       #0x491ba
00049294  mov     r0, r5
00049296  movs    r3, #9
00049298  str     r3, [r5, #0x44]
0004929a  bl      #0x59650 ; -> damage_to_me
0004929e  mov     r0, r5
000492a0  movs    r3, #0x1e
000492a2  str     r3, [r5, #0x40]
000492a4  bl      #0x55474 ; -> find_ani_part2
000492a8  ldr     r3, [r5, #0x40]
000492aa  mov     r0, r5
000492ac  adds    r3, #4
000492ae  str     r3, [r5, #0x40]
000492b0  bl      #0x59e24 ; -> do_next_a9_frame
000492b4  ldr     r3, [pc, #0x74]
000492b6  mov     r0, r5
000492b8  str     r3, [r5, #0x48]
000492ba  bl      #0x581e0 ; -> shake_a11
000492be  mov     r0, r5
000492c0  bl      #0x54dec ; -> dec_my_p_hit
000492c4  mov     r0, r5
000492c6  movs    r1, #0xd
000492c8  bl      #0x57dbc ; -> rsnd_func
000492cc  mov     r0, r5
000492ce  movs    r3, #2
000492d0  str     r3, [r5, #0x1c]
000492d2  bl      #0x580a4 ; -> group_sound
000492d6  ldr.w   r3, [r4, #0xa4]
000492da  movs    r0, #8
000492dc  adds    r3, #1
000492de  str.w   r6, [r4, r3, lsl #3]
000492e2  str.w   r0, [r4, #0xfc]
000492e6  b       #0x491ba
000492e8  movw    r2, #0x213
000492ec  str.w   r2, [r4, r3, lsl #3]
000492f0  ldr     r2, [pc, #0x3c]
000492f2  ldr.w   r3, [r4, #0xa4]
000492f6  add     r2, pc ; -> 0x00047af5  t_slammed_shake_up
000492f8  adds    r3, #1
000492fa  str.w   r3, [r4, #0xa4]
000492fe  b       #0x49212
00049300  movw    r2, #0x217
00049304  str.w   r2, [r4, r3, lsl #3]
00049308  ldr     r2, [pc, #0x28]
0004930a  ldr.w   r3, [r4, #0xa4]
0004930e  add     r2, pc ; -> 0x000470dd  t_slammed_slam_down
00049310  adds    r3, #1
00049312  str.w   r3, [r4, #0xa4]
00049316  b       #0x49212
00049318  cbnz    r7, #0x49342
