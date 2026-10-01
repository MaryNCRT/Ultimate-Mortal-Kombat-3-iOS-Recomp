========================================================================
t_ken_masters_xfer  0x00047634  392 bytes   mkreact.c
========================================================================

00047634  push    {r4, r5, r6, r7, lr}
00047636  add     r7, sp, #0xc
00047638  ldr.w   r2, [r0, #0xa4]
0004763c  mov     r4, r0
0004763e  ldr.w   r5, [r0, #0x108]
00047642  adds    r3, r2, #1
00047644  ldr.w   r6, [r0, r3, lsl #3]
00047648  movw    r3, #0xfde
0004764c  cmp     r6, r3
0004764e  beq     #0x47714
00047650  ble     #0x47666
00047652  movw    r3, #0xfe7
00047656  cmp     r6, r3
00047658  beq     #0x4773a
0004765a  adds    r3, #0xe
0004765c  cmp     r6, r3
0004765e  beq     #0x4770a
00047660  mvn     r0, #2
00047664  pop     {r4, r5, r6, r7, pc}
00047666  cbz     r6, #0x47686
00047668  subs    r3, #7
0004766a  cmp     r6, r3
0004766c  bne     #0x47660
0004766e  ldr     r1, [pc, #0x13c]
00047670  add     r1, pc ; -> 0x00042519  t_land_on_my_back
00047672  lsls    r3, r2, #3
00047674  adds    r3, r3, r4
00047676  movs    r0, #0
00047678  str     r1, [r3, #4]
0004767a  ldr.w   r3, [r4, #0xa4]
0004767e  adds    r3, #1
00047680  str.w   r0, [r4, r3, lsl #3]
00047684  b       #0x47664
00047686  mov.w   r1, #0x70000
0004768a  str     r1, [r5, #0x1c]
0004768c  ldr.w   r2, [r0, #0xf8]
00047690  lsls    r3, r2, #2
00047692  adds    r3, r3, r0
00047694  str.w   r1, [r3, #0xa8]
00047698  adds    r3, r2, #1
0004769a  str.w   r3, [r0, #0xf8]
0004769e  mov     r0, r5
000476a0  bl      #0x55070 ; -> am_i_airborn
000476a4  ldr.w   r3, [r4, #0xf8]
000476a8  subs    r3, #1
000476aa  str.w   r3, [r4, #0xf8]
000476ae  lsls    r3, r3, #2
000476b0  adds    r3, r3, r4
000476b2  ldr.w   r3, [r3, #0xa8]
000476b6  str     r3, [r5, #0x1c]
000476b8  ldr     r3, [r5, #0x5c]
000476ba  cmp     r3, #0
000476bc  beq     #0x4779e
000476be  mov.w   r3, #0x38000
000476c2  str     r3, [r5, #0x1c]
000476c4  sub.w   r3, r3, #0x98000
000476c8  str     r3, [r5, #0x20]
000476ca  add.w   r3, r3, #0x68000
000476ce  str     r3, [r5, #0x24]
000476d0  movs    r3, #5
000476d2  str     r3, [r5, #0x28]
000476d4  adds    r3, #0x19
000476d6  str     r3, [r5, #0x40]
000476d8  ldr.w   r3, [r4, #0xa4]
000476dc  movw    r2, #0xfd7
000476e0  mov     r0, r6
000476e2  adds    r3, #1
000476e4  str.w   r2, [r4, r3, lsl #3]
000476e8  ldr.w   r3, [r4, #0xa4]
000476ec  adds    r2, r3, #1
000476ee  ldr     r3, [pc, #0xc0]
000476f0  str.w   r2, [r4, #0xa4]
000476f4  add     r3, pc ; -> 0x000f3720  t_flight
000476f6  ldr     r1, [r3]
000476f8  lsls    r3, r2, #3
000476fa  adds    r3, r3, r4
000476fc  str     r1, [r3, #4]
000476fe  ldr.w   r3, [r4, #0xa4]
00047702  adds    r3, #1
00047704  str.w   r6, [r4, r3, lsl #3]
00047708  b       #0x47664
0004770a  ldr.w   r3, [pc, #0xa8]
0004770e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00047710  ldr     r1, [r3]
00047712  b       #0x47672
00047714  mov     r0, r5
00047716  bl      #0x4761c ; -> move_slave_too
0004771a  ldr     r3, [r5, #0x48]
0004771c  subs    r3, #1
0004771e  cmp     r3, #0
00047720  str     r3, [r5, #0x48]
00047722  ble     #0x4775e
00047724  ldr.w   r3, [r4, #0xa4]
00047728  movs    r0, #1
0004772a  movw    r2, #0xfde
0004772e  adds    r3, #1
00047730  str.w   r2, [r4, r3, lsl #3]
00047734  str.w   r0, [r4, #0xfc]
00047738  b       #0x47664
0004773a  mov     r0, r5
0004773c  bl      #0x4761c ; -> move_slave_too
00047740  ldr     r3, [r5, #8]
00047742  ldr     r3, [r3, #0x18]
00047744  asrs    r3, r3, #1
00047746  cmp     r3, #0
00047748  str     r3, [r5, #0x1c]
0004774a  itt     lt
0004774c  rsblt   r3, r3, #0
0004774e  strlt   r3, [r5, #0x1c]
00047750  ldr     r3, [r5, #0x1c]
00047752  cmp.w   r3, #0x1000
00047756  blt     #0x47774
00047758  mov     r0, r5
0004775a  bl      #0x55ab0 ; -> away_x_vel
0004775e  ldr.w   r3, [r4, #0xa4]
00047762  movs    r0, #1
00047764  movw    r2, #0xfe7
00047768  adds    r3, #1
0004776a  str.w   r2, [r4, r3, lsl #3]
0004776e  str.w   r0, [r4, #0xfc]
00047772  b       #0x47664
00047774  mov     r0, r5
00047776  bl      #0x4761c ; -> move_slave_too
0004777a  movs    r3, #0x50
0004777c  str     r3, [r5, #0x44]
0004777e  ldr.w   r3, [r4, #0xa4]
00047782  movw    r2, #0xff5
00047786  adds    r3, #1
00047788  str.w   r2, [r4, r3, lsl #3]
0004778c  ldr.w   r3, [r4, #0xa4]
00047790  adds    r2, r3, #1
00047792  ldr     r3, [pc, #0x24]
00047794  str.w   r2, [r4, #0xa4]
00047798  add     r3, pc ; -> 0x000f3744  t_wait_for_his_dog
0004779a  ldr     r1, [r3]
0004779c  b       #0x47672
0004779e  mov     r0, r5
000477a0  bl      #0x55ab0 ; -> away_x_vel
000477a4  movs    r3, #0xa
000477a6  str     r3, [r5, #0x48]
000477a8  b       #0x47724
000477aa  nop     
000477ac  add     r6, sp, #0x294
