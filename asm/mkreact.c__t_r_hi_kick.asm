========================================================================
t_r_hi_kick  0x00045410  412 bytes   mkreact.c
========================================================================

00045410  push    {r4, r5, r6, r7, lr}
00045412  add     r7, sp, #0xc
00045414  str     r8, [sp, #-0x4]!
00045418  ldr.w   r2, [r0, #0xa4]
0004541c  mov     r6, r0
0004541e  ldr.w   r5, [r0, #0x108]
00045422  adds    r3, r2, #1
00045424  ldr.w   r4, [r0, r3, lsl #3]
00045428  cmp.w   r4, #0x600
0004542c  beq     #0x45502
0004542e  ble     #0x45450
00045430  movw    r3, #0x609
00045434  cmp     r4, r3
00045436  beq     #0x4551e
00045438  adds    r3, #0x12
0004543a  cmp     r4, r3
0004543c  beq     #0x454e8
0004543e  subs    r3, #0x19
00045440  cmp     r4, r3
00045442  beq.w   #0x4555e
00045446  mvn     r0, #2
0004544a  ldr     r8, [sp], #4
0004544e  pop     {r4, r5, r6, r7, pc}
00045450  cbz     r4, #0x4548a
00045452  cmp.w   r4, #0x5f8
00045456  bne     #0x45446
00045458  mov     r0, r5
0004545a  mov.w   r3, #0x48000
0004545e  str     r3, [r5, #0x1c]
00045460  bl      #0x55ab0 ; -> away_x_vel
00045464  mov     r0, r5
00045466  movs    r3, #0x1c
00045468  str     r3, [r5, #0x40]
0004546a  bl      #0x5520c ; -> get_char_ani
0004546e  mov     r0, r5
00045470  bl      #0x59e24 ; -> do_next_a9_frame
00045474  ldr.w   r3, [r6, #0xa4]
00045478  movs    r0, #2
0004547a  mov.w   r2, #0x600
0004547e  adds    r3, #1
00045480  str.w   r2, [r6, r3, lsl #3]
00045484  str.w   r0, [r6, #0xfc]
00045488  b       #0x4544a
0004548a  mov     r0, r5
0004548c  mov.w   r8, #2
00045490  str.w   r8, [r5, #0x1c]
00045494  bl      #0x5877c ; -> create_blood_proc
00045498  mov     r0, r5
0004549a  str.w   r8, [r5, #0x1c]
0004549e  bl      #0x580a4 ; -> group_sound
000454a2  mov     r0, r5
000454a4  movs    r1, #0xa
000454a6  bl      #0x57dbc ; -> rsnd_func
000454aa  ldr.w   r3, [pc, #0xf0]
000454ae  str     r4, [r5, #0x38]
000454b0  mov.w   r2, #0x5f8
000454b4  add     r3, pc ; -> 0x00042851  t_generic_airborn_hit
000454b6  str     r3, [r5, #0x30]
000454b8  movs    r3, #1
000454ba  str     r3, [r5, #0x34]
000454bc  ldr.w   r3, [r6, #0xa4]
000454c0  mov     r0, r4
000454c2  adds    r3, #1
000454c4  str.w   r2, [r6, r3, lsl #3]
000454c8  ldr.w   r3, [r6, #0xa4]
000454cc  ldr     r2, [pc, #0xd0]
000454ce  adds    r3, #1
000454d0  str.w   r3, [r6, #0xa4]
000454d4  lsls    r3, r3, #3
000454d6  adds    r3, r3, r6
000454d8  add     r2, pc ; -> 0x00044b85  t_reaction_start
000454da  str     r2, [r3, #4]
000454dc  ldr.w   r3, [r6, #0xa4]
000454e0  adds    r3, #1
000454e2  str.w   r4, [r6, r3, lsl #3]
000454e6  b       #0x4544a
000454e8  ldr     r3, [pc, #0xb8]
000454ea  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000454ec  ldr     r1, [r3]
000454ee  lsls    r3, r2, #3
000454f0  adds    r3, r3, r6
000454f2  movs    r0, #0
000454f4  str     r1, [r3, #4]
000454f6  ldr.w   r3, [r6, #0xa4]
000454fa  adds    r3, #1
000454fc  str.w   r0, [r6, r3, lsl #3]
00045500  b       #0x4544a
00045502  mov     r0, r5
00045504  bl      #0x59e24 ; -> do_next_a9_frame
00045508  ldr.w   r3, [r6, #0xa4]
0004550c  movs    r0, #6
0004550e  movw    r2, #0x602
00045512  adds    r3, #1
00045514  str.w   r2, [r6, r3, lsl #3]
00045518  str.w   r0, [r6, #0xfc]
0004551c  b       #0x4544a
0004551e  ldr     r3, [r5, #8]
00045520  mov     r0, r5
00045522  ldr     r3, [r3, #0x18]
00045524  cmp     r3, #0
00045526  str     r3, [r5, #0x1c]
00045528  itt     lt
0004552a  rsblt   r3, r3, #0
0004552c  strlt   r3, [r5, #0x1c]
0004552e  ldr     r2, [r5, #0x1c]
00045530  asrs    r3, r2, #6
00045532  str     r3, [r5, #0x20]
00045534  rsb     r3, r3, r2
00045538  str     r3, [r5, #0x1c]
0004553a  bl      #0x55ab0 ; -> away_x_vel
0004553e  ldr     r3, [r5, #0x44]
00045540  subs    r3, #1
00045542  cmp     r3, #0
00045544  str     r3, [r5, #0x44]
00045546  ble     #0x45564
00045548  ldr.w   r3, [r6, #0xa4]
0004554c  movs    r0, #1
0004554e  movw    r2, #0x609
00045552  adds    r3, #1
00045554  str.w   r2, [r6, r3, lsl #3]
00045558  str.w   r0, [r6, #0xfc]
0004555c  b       #0x4544a
0004555e  movs    r3, #0xa
00045560  str     r3, [r5, #0x44]
00045562  b       #0x45548
00045564  mov     r0, r5
00045566  bl      #0x55c04 ; -> stop_me_player
0004556a  mov     r0, r5
0004556c  movs    r3, #0x1c
0004556e  str     r3, [r5, #0x40]
00045570  bl      #0x5520c ; -> get_char_ani
00045574  ldr     r3, [r5, #0x40]
00045576  movw    r2, #0x61b
0004557a  adds    r3, #4
0004557c  str     r3, [r5, #0x40]
0004557e  movs    r3, #4
00045580  str     r3, [r5, #0x1c]
00045582  ldr.w   r3, [r6, #0xa4]
00045586  adds    r3, #1
00045588  str.w   r2, [r6, r3, lsl #3]
0004558c  ldr.w   r3, [r6, #0xa4]
00045590  adds    r2, r3, #1
00045592  ldr     r3, [pc, #0x14]
00045594  str.w   r2, [r6, #0xa4]
00045598  add     r3, pc ; -> 0x000f37cc  t_mframew
0004559a  b       #0x454ec
0004559c  blo     #0x454d2
