========================================================================
t_r_floor_ice  0x000495ec  492 bytes   mkreact.c
========================================================================

000495ec  push    {r4, r5, r6, r7, lr}
000495ee  add     r7, sp, #0xc
000495f0  ldr.w   r3, [r0, #0xa4]
000495f4  mov     r5, r0
000495f6  ldr.w   r4, [r0, #0x108]
000495fa  adds    r3, #1
000495fc  movw    r2, #0x282
00049600  ldr.w   r0, [r0, r3, lsl #3]
00049604  cmp     r0, r2
00049606  beq     #0x496a2
00049608  ble     #0x49620
0004960a  cmp.w   r0, #0x2b8
0004960e  beq.w   #0x4973c
00049612  movw    r3, #0x2c3
00049616  cmp     r0, r3
00049618  beq     #0x49654
0004961a  mvn     r0, #2
0004961e  pop     {r4, r5, r6, r7, pc}
00049620  cmp     r0, #0
00049622  bne     #0x4961a
00049624  str     r0, [r4, #0x30]
00049626  str     r0, [r4, #0x34]
00049628  str     r0, [r4, #0x38]
0004962a  ldr.w   r3, [r5, #0xa4]
0004962e  adds    r3, #1
00049630  str.w   r2, [r5, r3, lsl #3]
00049634  ldr.w   r3, [r5, #0xa4]
00049638  ldr     r2, [pc, #0x184]
0004963a  adds    r3, #1
0004963c  str.w   r3, [r5, #0xa4]
00049640  lsls    r3, r3, #3
00049642  adds    r3, r3, r5
00049644  add     r2, pc ; -> 0x00044b85  t_reaction_start
00049646  str     r2, [r3, #4]
00049648  ldr.w   r3, [r5, #0xa4]
0004964c  adds    r3, #1
0004964e  str.w   r0, [r5, r3, lsl #3]
00049652  b       #0x4961e
00049654  ldr     r3, [r4, #8]
00049656  ldr     r2, [r4, #0x44]
00049658  ldrsh.w r3, [r3, #0xe]
0004965c  subs    r3, r3, r2
0004965e  cmp     r3, #0
00049660  str     r3, [r4, #0x24]
00049662  itt     lt
00049664  rsblt   r3, r3, #0
00049666  strlt   r3, [r4, #0x24]
00049668  ldr     r3, [r4, #0x24]
0004966a  cmp     r3, #5
0004966c  ble.w   #0x49776
00049670  ldr.w   r3, [r5, #0xa4]
00049674  movw    r2, #0x2c3
00049678  adds    r3, #1
0004967a  str.w   r2, [r5, r3, lsl #3]
0004967e  ldr.w   r2, [pc, #0x144]
00049682  ldr.w   r3, [r5, #0xa4]
00049686  add     r2, pc ; -> 0x000441bd  t_slip_sleep
00049688  adds    r3, #1
0004968a  str.w   r3, [r5, #0xa4]
0004968e  lsls    r3, r3, #3
00049690  adds    r3, r3, r5
00049692  movs    r0, #0
00049694  str     r2, [r3, #4]
00049696  ldr.w   r3, [r5, #0xa4]
0004969a  adds    r3, #1
0004969c  str.w   r0, [r5, r3, lsl #3]
000496a0  b       #0x4961e
000496a2  mov     r0, r4
000496a4  bl      #0x54ce0 ; -> am_i_joy
000496a8  ldr     r6, [r4, #0x5c]
000496aa  cmp     r6, #0
000496ac  beq     #0x49784
000496ae  ldr     r3, [r4]
000496b0  mov     r0, r4
000496b2  movs    r2, #0x26
000496b4  str     r2, [r4, #0x20]
000496b6  str     r2, [r3, #0x48]
000496b8  bl      #0x54f20 ; -> set_no_block
000496bc  mov     r0, r4
000496be  bl      #0x5533c ; -> ground_player
000496c2  ldr     r3, [r4]
000496c4  mov     r0, r4
000496c6  mov.w   r2, #0x628
000496ca  str     r2, [r4, #0x1c]
000496cc  str     r2, [r3, #0x18]
000496ce  movs    r3, #0x20
000496d0  str     r3, [r4, #0x40]
000496d2  bl      #0x55474 ; -> find_ani_part2
000496d6  mov     r0, r4
000496d8  movs    r3, #0x50
000496da  str     r3, [r4, #0x54]
000496dc  bl      #0x54ce0 ; -> am_i_joy
000496e0  ldr     r3, [r4, #0x5c]
000496e2  cbnz    r3, #0x496e8
000496e4  adds    r3, #0x38
000496e6  str     r3, [r4, #0x54]
000496e8  ldr     r2, [r4]
000496ea  ldr     r3, [r4, #0x54]
000496ec  mov     r0, r4
000496ee  str     r3, [r2, #0x3c]
000496f0  movs    r3, #8
000496f2  str     r3, [r4, #0x1c]
000496f4  bl      #0x580a4 ; -> group_sound
000496f8  mov     r0, r4
000496fa  movs    r3, #4
000496fc  str     r3, [r4, #0x1c]
000496fe  bl      #0x553a0 ; -> init_anirate
00049702  ldr     r3, [r4, #8]
00049704  ldr     r2, [r4, #0x44]
00049706  ldr     r1, [r4, #0x48]
00049708  ldrsh.w r3, [r3, #0xe]
0004970c  rsb     r2, r2, r3
00049710  subs    r3, r3, r1
00049712  cmp     r2, #0
00049714  str     r3, [r4, #0x28]
00049716  str     r2, [r4, #0x24]
00049718  itt     lt
0004971a  rsblt   r3, r2, #0
0004971c  strlt   r3, [r4, #0x24]
0004971e  ldr     r3, [r4, #0x28]
00049720  ldr     r2, [r4, #0x24]
00049722  cmp     r3, #0
00049724  itt     lt
00049726  rsblt   r3, r3, #0
00049728  strlt   r3, [r4, #0x28]
0004972a  cmp     r2, r3
0004972c  ble     #0x49776
0004972e  ldr.w   r3, [pc, #0x98]
00049732  mov     r0, r4
00049734  str     r3, [r4, #0x1c]
00049736  bl      #0x55a68 ; -> set_x_vel_player
0004973a  b       #0x49670
0004973c  ldr     r3, [r4, #8]
0004973e  ldr     r2, [r4, #0x48]
00049740  ldrsh.w r3, [r3, #0xe]
00049744  subs    r3, r3, r2
00049746  cmp     r3, #0
00049748  str     r3, [r4, #0x24]
0004974a  itt     lt
0004974c  rsblt   r3, r3, #0
0004974e  strlt   r3, [r4, #0x24]
00049750  ldr     r3, [r4, #0x24]
00049752  cmp     r3, #5
00049754  ble     #0x4972e
00049756  ldr.w   r3, [r5, #0xa4]
0004975a  mov.w   r2, #0x2b8
0004975e  adds    r3, #1
00049760  str.w   r2, [r5, r3, lsl #3]
00049764  ldr.w   r2, [pc, #0x64]
00049768  ldr.w   r3, [r5, #0xa4]
0004976c  add     r2, pc ; -> 0x000441bd  t_slip_sleep
0004976e  adds    r3, #1
00049770  str.w   r3, [r5, #0xa4]
00049774  b       #0x4968e
00049776  mov     r0, r4
00049778  mov.w   r3, #0x10000
0004977c  str     r3, [r4, #0x1c]
0004977e  bl      #0x55a68 ; -> set_x_vel_player
00049782  b       #0x49756
00049784  mov     r0, r4
00049786  bl      #0x495cc ; -> get_his_floor_ice
0004978a  ldr     r3, [r4, #0x1c]
0004978c  cbnz    r3, #0x497ae
0004978e  ldr.w   r3, [pc, #0x40]
00049792  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00049794  ldr     r2, [r3]
00049796  ldr.w   r3, [r5, #0xa4]
0004979a  mov     r0, r6
0004979c  lsls    r3, r3, #3
0004979e  adds    r3, r3, r5
000497a0  str     r2, [r3, #4]
000497a2  ldr.w   r3, [r5, #0xa4]
000497a6  adds    r3, #1
000497a8  str.w   r6, [r5, r3, lsl #3]
000497ac  b       #0x4961e
000497ae  ldr     r3, [r3, #0x48]
000497b0  cmp     r3, #0x20
000497b2  str     r3, [r4, #0x20]
000497b4  bgt.w   #0x496ae
000497b8  ldr     r3, [pc, #0x18]
000497ba  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000497bc  b       #0x49794
000497be  nop     
000497c0  push    {r0, r2, r3, r4, r5, lr}
