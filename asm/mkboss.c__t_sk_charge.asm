========================================================================
t_sk_charge  0x000ab210  456 bytes   mkboss.c
========================================================================

000ab210  push    {r4, r5, r6, r7, lr}
000ab212  add     r7, sp, #0xc
000ab214  str     r8, [sp, #-0x4]!
000ab218  ldr.w   r2, [r0, #0xa4]
000ab21c  movw    r8, #0x349
000ab220  mov     r6, r0
000ab222  adds    r3, r2, #1
000ab224  ldr.w   r5, [r0, #0x108]
000ab228  ldr.w   r4, [r0, r3, lsl #3]
000ab22c  cmp     r4, r8
000ab22e  beq     #0xab314
000ab230  ble     #0xab250
000ab232  movw    r3, #0x36b
000ab236  cmp     r4, r3
000ab238  beq     #0xab314
000ab23a  adds    r3, #6
000ab23c  cmp     r4, r3
000ab23e  beq     #0xab2d6
000ab240  cmp.w   r4, #0x364
000ab244  beq     #0xab2f0
000ab246  mvn     r0, #2
000ab24a  ldr     r8, [sp], #4
000ab24e  pop     {r4, r5, r6, r7, pc}
000ab250  cbz     r4, #0xab28c
000ab252  movw    r3, #0x339
000ab256  cmp     r4, r3
000ab258  bne     #0xab246
000ab25a  mov     r0, r5
000ab25c  bl      #0x5a680 ; -> next_anirate
000ab260  ldr     r3, [r5, #0x44]
000ab262  subs    r3, #1
000ab264  str     r3, [r5, #0x44]
000ab266  cmp     r3, #0
000ab268  beq.w   #0xab38c
000ab26c  ldr     r3, [r5, #0x48]
000ab26e  subs    r3, #1
000ab270  str     r3, [r5, #0x48]
000ab272  cmp     r3, #0
000ab274  beq     #0xab340
000ab276  ldr.w   r3, [r6, #0xa4]
000ab27a  movs    r0, #1
000ab27c  movw    r2, #0x339
000ab280  adds    r3, #1
000ab282  str.w   r2, [r6, r3, lsl #3]
000ab286  str.w   r0, [r6, #0xfc]
000ab28a  b       #0xab24a
000ab28c  mov     r0, r5
000ab28e  bl      #0x587c8 ; -> init_special
000ab292  mov     r0, r5
000ab294  str     r4, [r5, #0x1c]
000ab296  bl      #0x580a4 ; -> group_sound
000ab29a  mov     r0, r5
000ab29c  str     r4, [r5, #0x1c]
000ab29e  bl      #0x57be4 ; -> ochar_sound
000ab2a2  mov     r0, r5
000ab2a4  movs    r3, #0x19
000ab2a6  str     r3, [r5, #0x40]
000ab2a8  bl      #0x5520c ; -> get_char_ani
000ab2ac  mov     r0, r5
000ab2ae  movs    r3, #3
000ab2b0  str     r3, [r5, #0x1c]
000ab2b2  bl      #0x553a0 ; -> init_anirate
000ab2b6  mov     r0, r5
000ab2b8  movs    r3, #1
000ab2ba  str     r3, [r5, #0x1c]
000ab2bc  bl      #0x58d70 ; -> create_fx
000ab2c0  mov     r0, r5
000ab2c2  mov.w   r3, #0x80000
000ab2c6  str     r3, [r5, #0x1c]
000ab2c8  bl      #0x55a94 ; -> towards_x_vel
000ab2cc  movs    r3, #0x14
000ab2ce  str     r3, [r5, #0x48]
000ab2d0  subs    r3, #0xe
000ab2d2  str     r3, [r5, #0x44]
000ab2d4  b       #0xab276
000ab2d6  ldr     r3, [pc, #0xf8]
000ab2d8  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000ab2da  ldr     r1, [r3]
000ab2dc  lsls    r3, r2, #3
000ab2de  adds    r3, r3, r6
000ab2e0  movs    r0, #0
000ab2e2  str     r1, [r3, #4]
000ab2e4  ldr.w   r3, [r6, #0xa4]
000ab2e8  adds    r3, #1
000ab2ea  str.w   r0, [r6, r3, lsl #3]
000ab2ee  b       #0xab24a
000ab2f0  ldr     r3, [r5, #0x48]
000ab2f2  subs    r3, #1
000ab2f4  str     r3, [r5, #0x48]
000ab2f6  cbnz    r3, #0xab350
000ab2f8  mov     r0, r5
000ab2fa  bl      #0x55c04 ; -> stop_me_player
000ab2fe  ldr.w   r3, [r6, #0xa4]
000ab302  movs    r0, #8
000ab304  movw    r2, #0x36b
000ab308  adds    r3, #1
000ab30a  str.w   r2, [r6, r3, lsl #3]
000ab30e  str.w   r0, [r6, #0xfc]
000ab312  b       #0xab24a
000ab314  mov     r0, r5
000ab316  movs    r3, #0x19
000ab318  str     r3, [r5, #0x40]
000ab31a  bl      #0x55474 ; -> find_ani_part2
000ab31e  movs    r3, #3
000ab320  str     r3, [r5, #0x1c]
000ab322  ldr.w   r3, [r6, #0xa4]
000ab326  movw    r2, #0x371
000ab32a  adds    r3, #1
000ab32c  str.w   r2, [r6, r3, lsl #3]
000ab330  ldr.w   r3, [r6, #0xa4]
000ab334  adds    r2, r3, #1
000ab336  ldr     r3, [pc, #0x9c]
000ab338  str.w   r2, [r6, #0xa4]
000ab33c  add     r3, pc ; -> 0x000f37cc  t_mframew
000ab33e  b       #0xab2da
000ab340  mov     r0, r5
000ab342  bl      #0x551f0 ; -> am_i_facing_him
000ab346  ldr     r3, [r5, #0x5c]
000ab348  cmp     r3, #0
000ab34a  beq     #0xab2f8
000ab34c  movs    r3, #8
000ab34e  str     r3, [r5, #0x48]
000ab350  ldr     r3, [r5, #8]
000ab352  mov     r0, r5
000ab354  ldr     r3, [r3, #0x18]
000ab356  cmp     r3, #0
000ab358  str     r3, [r5, #0x1c]
000ab35a  itt     lt
000ab35c  rsblt   r3, r3, #0
000ab35e  strlt   r3, [r5, #0x1c]
000ab360  ldr     r2, [r5, #0x1c]
000ab362  asrs    r3, r2, #2
000ab364  subs    r2, r2, r3
000ab366  str     r3, [r5, #0x20]
000ab368  asrs    r3, r2, #3
000ab36a  str     r3, [r5, #0x24]
000ab36c  rsb     r3, r3, r2
000ab370  str     r3, [r5, #0x1c]
000ab372  bl      #0x55a94 ; -> towards_x_vel
000ab376  ldr.w   r3, [r6, #0xa4]
000ab37a  movs    r0, #1
000ab37c  mov.w   r2, #0x364
000ab380  adds    r3, #1
000ab382  str.w   r2, [r6, r3, lsl #3]
000ab386  str.w   r0, [r6, #0xfc]
000ab38a  b       #0xab24a
000ab38c  adds    r3, #1
000ab38e  mov     r0, r5
000ab390  str     r3, [r5, #0x44]
000ab392  adds    r3, #2
000ab394  str     r3, [r5, #0x1c]
000ab396  bl      #0x594c8 ; -> strike_check_a0
000ab39a  ldr     r3, [r5, #0x5c]
000ab39c  cmp     r3, #0
000ab39e  beq.w   #0xab26c
000ab3a2  mov     r0, r5
000ab3a4  bl      #0x55c04 ; -> stop_me_player
000ab3a8  mov     r0, r5
000ab3aa  movs    r3, #0x19
000ab3ac  str     r3, [r5, #0x40]
000ab3ae  bl      #0x5520c ; -> get_char_ani
000ab3b2  mov     r0, r5
000ab3b4  bl      #0x55428 ; -> find_last_frame
000ab3b8  mov     r0, r5
000ab3ba  bl      #0x59e24 ; -> do_next_a9_frame
000ab3be  ldr.w   r3, [r6, #0xa4]
000ab3c2  movs    r0, #0x20
000ab3c4  adds    r3, #1
000ab3c6  str.w   r8, [r6, r3, lsl #3]
000ab3ca  str.w   r0, [r6, #0xfc]
000ab3ce  b       #0xab24a
000ab3d0  strh    r4, [r5, #0x20]
000ab3d2  movs    r4, r0
000ab3d4  strh    r4, [r1, #0x24]
000ab3d6  movs    r4, r0
