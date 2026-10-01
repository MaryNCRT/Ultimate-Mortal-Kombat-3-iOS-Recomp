========================================================================
t_r_tusk_blur  0x00047170  608 bytes   mkreact.c
========================================================================

00047170  push    {r4, r5, r6, r7, lr}
00047172  add     r7, sp, #0xc
00047174  str     r8, [sp, #-0x4]!
00047178  ldr.w   r2, [r0, #0xa4]
0004717c  movw    r8, #0x107f
00047180  mov     r6, r0
00047182  adds    r3, r2, #1
00047184  ldr.w   r5, [r0, #0x108]
00047188  ldr.w   r4, [r0, r3, lsl #3]
0004718c  cmp     r4, r8
0004718e  beq     #0x47204
00047190  ble     #0x471aa
00047192  movw    r3, #0x1095
00047196  cmp     r4, r3
00047198  beq     #0x47284
0004719a  adds    r3, #0x29
0004719c  cmp     r4, r3
0004719e  beq     #0x471e8
000471a0  mvn     r0, #2
000471a4  ldr     r8, [sp], #4
000471a8  pop     {r4, r5, r6, r7, pc}
000471aa  cmp     r4, #0
000471ac  bne     #0x471a0
000471ae  movs    r3, #1
000471b0  mov     r0, r5
000471b2  str     r3, [r5, #0x34]
000471b4  bl      #0x41354 ; -> if_shao_then_pass
000471b8  str     r4, [r5, #0x30]
000471ba  str     r4, [r5, #0x38]
000471bc  ldr.w   r3, [r6, #0xa4]
000471c0  ldr     r2, [pc, #0x1f4]
000471c2  adds    r3, #1
000471c4  add     r2, pc ; -> 0x00044b85  t_reaction_start
000471c6  str.w   r8, [r6, r3, lsl #3]
000471ca  ldr.w   r3, [r6, #0xa4]
000471ce  adds    r3, #1
000471d0  str.w   r3, [r6, #0xa4]
000471d4  lsls    r3, r3, #3
000471d6  adds    r3, r3, r6
000471d8  mov     r0, r4
000471da  str     r2, [r3, #4]
000471dc  ldr.w   r3, [r6, #0xa4]
000471e0  adds    r3, #1
000471e2  str.w   r4, [r6, r3, lsl #3]
000471e6  b       #0x471a4
000471e8  ldr.w   r3, [pc, #0x1d0]
000471ec  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000471ee  ldr     r1, [r3]
000471f0  lsls    r3, r2, #3
000471f2  adds    r3, r3, r0
000471f4  str     r1, [r3, #4]
000471f6  ldr.w   r3, [r0, #0xa4]
000471fa  movs    r0, #0
000471fc  adds    r3, #1
000471fe  str.w   r0, [r6, r3, lsl #3]
00047202  b       #0x471a4
00047204  mov     r0, r5
00047206  bl      #0x55c04 ; -> stop_me_player
0004720a  mov     r0, r5
0004720c  bl      #0x54f20 ; -> set_no_block
00047210  ldr     r3, [r5]
00047212  movw    r2, #0x617
00047216  str     r2, [r5, #0x1c]
00047218  mov     r0, r5
0004721a  str     r2, [r3, #0x18]
0004721c  ldr     r3, [r5, #8]
0004721e  ldr     r2, [r3, #0x24]
00047220  str     r2, [r5, #0x1c]
00047222  ldr.w   r1, [r6, #0xf8]
00047226  lsls    r3, r1, #2
00047228  adds    r3, r3, r6
0004722a  str.w   r2, [r3, #0xa8]
0004722e  adds    r3, r1, #1
00047230  str.w   r3, [r6, #0xf8]
00047234  ldr     r3, [r5, #8]
00047236  movs    r2, #6
00047238  str     r2, [r5, #0x1c]
0004723a  str     r2, [r3, #0x24]
0004723c  movs    r3, #8
0004723e  str     r3, [r5, #0x40]
00047240  bl      #0x55228 ; -> get_char_ani2
00047244  ldr.w   r3, [r6, #0xf8]
00047248  mov     r0, r5
0004724a  subs    r3, #1
0004724c  str.w   r3, [r6, #0xf8]
00047250  lsls    r3, r3, #2
00047252  adds    r3, r3, r6
00047254  ldr     r2, [r5, #8]
00047256  ldr.w   r3, [r3, #0xa8]
0004725a  str     r3, [r5, #0x1c]
0004725c  str     r3, [r2, #0x24]
0004725e  bl      #0x59e24 ; -> do_next_a9_frame
00047262  ldr     r3, [r5]
00047264  movs    r2, #4
00047266  str     r2, [r5, #0x1c]
00047268  str     r2, [r3, #0x28]
0004726a  movs    r3, #0x30
0004726c  str     r3, [r5, #0x44]
0004726e  ldr.w   r3, [r6, #0xa4]
00047272  movs    r0, #2
00047274  movw    r2, #0x1095
00047278  adds    r3, #1
0004727a  str.w   r2, [r6, r3, lsl #3]
0004727e  str.w   r0, [r6, #0xfc]
00047282  b       #0x471a4
00047284  mov     r0, r5
00047286  bl      #0x59e24 ; -> do_next_a9_frame
0004728a  ldr     r2, [r5]
0004728c  ldr     r3, [r2, #0x28]
0004728e  subs    r3, #1
00047290  str     r3, [r5, #0x1c]
00047292  cmp     r3, #0
00047294  beq     #0x47338
00047296  ldr     r3, [r5, #0x1c]
00047298  str     r3, [r2, #0x28]
0004729a  ldr     r3, [r5, #0x44]
0004729c  subs    r4, r3, #1
0004729e  str     r4, [r5, #0x44]
000472a0  cmp     r4, #0
000472a2  bne     #0x4726e
000472a4  ldr     r3, [r5]
000472a6  mov     r0, r5
000472a8  ldr     r2, [r3, #0x44]
000472aa  str     r2, [r5, #0x1c]
000472ac  ldr     r3, [r3, #0x54]
000472ae  str     r3, [r5, #0x20]
000472b0  ldr.w   r1, [r6, #0xf8]
000472b4  lsls    r3, r1, #2
000472b6  adds    r3, r3, r6
000472b8  str.w   r2, [r3, #0xa8]
000472bc  adds    r3, r1, #1
000472be  str.w   r3, [r6, #0xf8]
000472c2  ldr     r1, [r5, #0x20]
000472c4  lsls    r2, r3, #2
000472c6  adds    r2, r2, r6
000472c8  adds    r3, #1
000472ca  str.w   r1, [r2, #0xa8]
000472ce  str.w   r3, [r6, #0xf8]
000472d2  ldr     r3, [r5]
000472d4  str     r4, [r5, #0x1c]
000472d6  str     r4, [r3, #0x44]
000472d8  ldr     r2, [r5]
000472da  ldr     r3, [r5, #0x1c]
000472dc  str     r3, [r2, #0x54]
000472de  bl      #0x59750 ; -> back_to_normal
000472e2  ldr.w   r3, [r6, #0xf8]
000472e6  mov     r0, r5
000472e8  subs    r3, #1
000472ea  str.w   r3, [r6, #0xf8]
000472ee  lsls    r3, r3, #2
000472f0  adds    r3, r3, r6
000472f2  ldr.w   r3, [r3, #0xa8]
000472f6  str     r3, [r5, #0x20]
000472f8  ldr.w   r3, [r6, #0xf8]
000472fc  subs    r3, #1
000472fe  str.w   r3, [r6, #0xf8]
00047302  lsls    r3, r3, #2
00047304  adds    r3, r3, r6
00047306  ldr     r2, [r5]
00047308  ldr.w   r3, [r3, #0xa8]
0004730c  str     r3, [r2, #0x44]
0004730e  ldr     r2, [r5]
00047310  ldr     r3, [r5, #0x20]
00047312  str     r3, [r2, #0x54]
00047314  ldr     r3, [r5]
00047316  movw    r2, #0x617
0004731a  str     r2, [r5, #0x1c]
0004731c  str     r2, [r3, #0x18]
0004731e  bl      #0x55070 ; -> am_i_airborn
00047322  ldr.w   r8, [r5, #0x5c]
00047326  cmp.w   r8, #0
0004732a  beq     #0x47348
0004732c  ldr.w   r2, [pc, #0x90]
00047330  ldr.w   r3, [r6, #0xa4]
00047334  add     r2, pc ; -> 0x00041efd  t_fall_on_my_back
00047336  b       #0x471d4
00047338  mov     r0, r5
0004733a  movs    r1, #0xe
0004733c  bl      #0x57dbc ; -> rsnd_func
00047340  ldr     r2, [r5]
00047342  movs    r3, #4
00047344  str     r3, [r5, #0x1c]
00047346  b       #0x47296
00047348  mov     r0, r5
0004734a  bl      #0x5533c ; -> ground_player
0004734e  mov     r0, r5
00047350  bl      #0x68e14 ; -> q_am_i_a_boss
00047354  ldr     r4, [r5, #0x5c]
00047356  cbz     r4, #0x47376
00047358  ldr     r3, [pc, #0x68]
0004735a  mov     r0, r8
0004735c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0004735e  ldr     r2, [r3]
00047360  ldr.w   r3, [r6, #0xa4]
00047364  lsls    r3, r3, #3
00047366  adds    r3, r3, r6
00047368  str     r2, [r3, #4]
0004736a  ldr.w   r3, [r6, #0xa4]
0004736e  adds    r3, #1
00047370  str.w   r8, [r6, r3, lsl #3]
00047374  b       #0x471a4
00047376  mov     r0, r5
00047378  movs    r3, #0x25
0004737a  str     r3, [r5, #0x40]
0004737c  bl      #0x5520c ; -> get_char_ani
00047380  ldr.w   r3, [pc, #0x44]
00047384  movw    r2, #0x10be
00047388  mov     r0, r4
0004738a  str     r3, [r5, #0x1c]
0004738c  ldr.w   r3, [r6, #0xa4]
00047390  adds    r3, #1
00047392  str.w   r2, [r6, r3, lsl #3]
00047396  ldr.w   r3, [r6, #0xa4]
0004739a  adds    r2, r3, #1
0004739c  ldr     r3, [pc, #0x2c]
0004739e  str.w   r2, [r6, #0xa4]
000473a2  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000473a4  ldr     r1, [r3]
000473a6  lsls    r3, r2, #3
000473a8  adds    r3, r3, r6
000473aa  str     r1, [r3, #4]
000473ac  ldr.w   r3, [r6, #0xa4]
000473b0  adds    r3, #1
000473b2  str.w   r4, [r6, r3, lsl #3]
000473b6  b       #0x471a4
000473b8  bls     #0x47336
000473ba  vsli.32 d28, d8, #0x1f
000473be  movs    r2, r1
000473c0  add     r3, sp, #0x314
