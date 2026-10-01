========================================================================
t_r_fan_lift  0x00049338  428 bytes   mkreact.c
========================================================================

00049338  push    {r4, r5, r6, r7, lr}
0004933a  add     r7, sp, #0xc
0004933c  ldr.w   r3, [r0, #0xa4]
00049340  mov     r5, r0
00049342  ldr.w   r4, [r0, #0x108]
00049346  adds    r3, #1
00049348  movw    r2, #0x382
0004934c  ldr.w   r0, [r0, r3, lsl #3]
00049350  cmp     r0, r2
00049352  beq     #0x493d6
00049354  ble     #0x4936a
00049356  movw    r3, #0x39b
0004935a  cmp     r0, r3
0004935c  beq     #0x4944a
0004935e  adds    r3, #0x18
00049360  cmp     r0, r3
00049362  beq     #0x4939e
00049364  mvn     r0, #2
00049368  pop     {r4, r5, r6, r7, pc}
0004936a  cmp     r0, #0
0004936c  bne     #0x49364
0004936e  str     r0, [r4, #0x30]
00049370  str     r0, [r4, #0x34]
00049372  str     r0, [r4, #0x38]
00049374  ldr.w   r3, [r5, #0xa4]
00049378  adds    r3, #1
0004937a  str.w   r2, [r5, r3, lsl #3]
0004937e  ldr.w   r3, [r5, #0xa4]
00049382  ldr     r2, [pc, #0x150]
00049384  adds    r3, #1
00049386  str.w   r3, [r5, #0xa4]
0004938a  lsls    r3, r3, #3
0004938c  adds    r3, r3, r5
0004938e  add     r2, pc ; -> 0x00044b85  t_reaction_start
00049390  str     r2, [r3, #4]
00049392  ldr.w   r3, [r5, #0xa4]
00049396  adds    r3, #1
00049398  str.w   r0, [r5, r3, lsl #3]
0004939c  b       #0x49368
0004939e  ldr     r3, [r4, #0x44]
000493a0  subs    r3, #1
000493a2  cmp     r3, #0
000493a4  str     r3, [r4, #0x44]
000493a6  ble.w   #0x494ba
000493aa  mov     r0, r4
000493ac  bl      #0x55144 ; -> distance_from_ground
000493b0  ldr     r3, [r4, #0x1c]
000493b2  cmp     r3, #0xf0
000493b4  bgt     #0x49492
000493b6  ldr     r3, [r4, #0x48]
000493b8  subs    r3, #1
000493ba  cmp     r3, #0
000493bc  str     r3, [r4, #0x48]
000493be  ble     #0x4949c
000493c0  ldr.w   r3, [r5, #0xa4]
000493c4  movs    r0, #1
000493c6  movw    r2, #0x3b3
000493ca  adds    r3, #1
000493cc  str.w   r2, [r5, r3, lsl #3]
000493d0  str.w   r0, [r5, #0xfc]
000493d4  b       #0x49368
000493d6  mov     r0, r4
000493d8  movs    r3, #0x20
000493da  str     r3, [r4, #0x40]
000493dc  bl      #0x5a31c ; -> do_first_a9_frame
000493e0  ldr     r3, [r4]
000493e2  mov     r0, r4
000493e4  movw    r2, #0x624
000493e8  str     r2, [r4, #0x20]
000493ea  str     r2, [r3, #0x18]
000493ec  bl      #0x54f40 ; -> set_half_damage
000493f0  mov     r0, r4
000493f2  movs    r6, #0
000493f4  str     r6, [r4, #0x34]
000493f6  bl      #0x55144 ; -> distance_from_ground
000493fa  ldr     r3, [r4, #0x1c]
000493fc  ldr     r2, [r4, #8]
000493fe  mov     r0, r6
00049400  cmp     r3, #0xa8
00049402  itt     le
00049404  ldrle.w r3, [pc, #0xd0]
00049408  strle   r3, [r4, #0x34]
0004940a  ldr     r3, [r4, #0x34]
0004940c  str     r3, [r2, #0x1c]
0004940e  movs    r3, #4
00049410  str     r3, [r4, #0x1c]
00049412  subs    r3, #1
00049414  str     r3, [r4, #0x20]
00049416  adds    r3, #5
00049418  str     r3, [r4, #0x24]
0004941a  ldr.w   r3, [r5, #0xa4]
0004941e  movw    r2, #0x39b
00049422  adds    r3, #1
00049424  str.w   r2, [r5, r3, lsl #3]
00049428  ldr.w   r3, [r5, #0xa4]
0004942c  adds    r2, r3, #1
0004942e  ldr     r3, [pc, #0xac]
00049430  str.w   r2, [r5, #0xa4]
00049434  add     r3, pc ; -> 0x000f36f8  t_shake_ob_up
00049436  ldr     r1, [r3]
00049438  lsls    r3, r2, #3
0004943a  adds    r3, r3, r5
0004943c  str     r1, [r3, #4]
0004943e  ldr.w   r3, [r5, #0xa4]
00049442  adds    r3, #1
00049444  str.w   r6, [r5, r3, lsl #3]
00049448  b       #0x49368
0004944a  mov     r0, r4
0004944c  movs    r3, #0
0004944e  str     r3, [r4, #0x34]
00049450  bl      #0x55144 ; -> distance_from_ground
00049454  ldr     r3, [r4, #0x1c]
00049456  ldr     r2, [r4, #8]
00049458  mov     r0, r4
0004945a  cmp     r3, #0xf0
0004945c  itt     le
0004945e  ldrle   r3, [pc, #0x78]
00049460  strle   r3, [r4, #0x34]
00049462  ldr     r3, [r4, #0x34]
00049464  str     r3, [r2, #0x1c]
00049466  mov.w   r3, #0x20000
0004946a  str     r3, [r4, #0x1c]
0004946c  bl      #0x410f8 ; -> is_he_flipped
00049470  ldr     r3, [r4, #0x5c]
00049472  cbz     r3, #0x49488
00049474  mov     r0, r4
00049476  bl      #0x55a68 ; -> set_x_vel_player
0004947a  movs    r3, #3
0004947c  str     r3, [r4, #0x44]
0004947e  adds    r3, #1
00049480  str     r3, [r4, #0x40]
00049482  adds    r3, #0x3c
00049484  str     r3, [r4, #0x48]
00049486  b       #0x493c0
00049488  ldr     r3, [r4, #0x1c]
0004948a  rsb.w   r3, r3, #0
0004948e  str     r3, [r4, #0x1c]
00049490  b       #0x49474
00049492  ldr     r3, [r4, #8]
00049494  movs    r2, #0
00049496  str     r2, [r4, #0x1c]
00049498  str     r2, [r3, #0x1c]
0004949a  b       #0x493b6
0004949c  ldr     r3, [pc, #0x40]
0004949e  movs    r0, #0
000494a0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000494a2  ldr     r2, [r3]
000494a4  ldr.w   r3, [r5, #0xa4]
000494a8  lsls    r3, r3, #3
000494aa  adds    r3, r3, r5
000494ac  str     r2, [r3, #4]
000494ae  ldr.w   r3, [r5, #0xa4]
000494b2  adds    r3, #1
000494b4  str.w   r0, [r5, r3, lsl #3]
000494b8  b       #0x49368
000494ba  movs    r3, #3
000494bc  str     r3, [r4, #0x44]
000494be  ldr     r3, [r4, #0x40]
000494c0  mov     r0, r4
000494c2  rsb.w   r3, r3, #0
000494c6  str     r3, [r4, #0x40]
000494c8  str     r3, [r4, #0x1c]
000494ca  str     r3, [r4, #0x20]
000494cc  bl      #0x570ac ; -> multi_adjust_xy
000494d0  b       #0x493aa
000494d2  nop     
