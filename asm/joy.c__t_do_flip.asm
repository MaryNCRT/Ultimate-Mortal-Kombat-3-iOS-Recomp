========================================================================
t_do_flip  0x00030634  340 bytes   joy.c
========================================================================

00030634  push    {r4, r5, r7, lr}
00030636  add     r7, sp, #8
00030638  ldr.w   r1, [r0, #0xa4]
0003063c  mov     r5, r0
0003063e  ldr.w   r4, [r0, #0x108]
00030642  adds    r3, r1, #1
00030644  ldr.w   r3, [r0, r3, lsl #3]
00030648  cmp.w   r3, #0x368
0003064c  beq     #0x306a0
0003064e  ble     #0x30664
00030650  movw    r2, #0x375
00030654  cmp     r3, r2
00030656  beq     #0x306d4
00030658  adds    r2, #0xd
0003065a  cmp     r3, r2
0003065c  beq     #0x3075a
0003065e  mvn     r0, #2
00030662  b       #0x30720
00030664  cmp     r3, #0
00030666  beq     #0x3072c
00030668  movw    r2, #0x35e
0003066c  cmp     r3, r2
0003066e  bne     #0x3065e
00030670  mov     r0, r4
00030672  movs    r3, #1
00030674  str     r3, [r4, #0x1c]
00030676  bl      #0x580a4 ; -> group_sound
0003067a  ldr.w   r3, [r5, #0xf8]
0003067e  subs    r3, #1
00030680  str.w   r3, [r5, #0xf8]
00030684  lsls    r3, r3, #2
00030686  adds    r3, r3, r5
00030688  ldr.w   r3, [r3, #0xa8]
0003068c  str     r3, [r4, #0x40]
0003068e  str     r3, [r4, #0x1c]
00030690  ldr     r3, [r4, #8]
00030692  ldr     r3, [r3, #0x28]
00030694  tst.w   r3, #0x10
00030698  str     r3, [r4, #0x2c]
0003069a  itt     ne
0003069c  ldrne   r3, [r4, #0x20]
0003069e  strne   r3, [r4, #0x40]
000306a0  mov     r0, r4
000306a2  bl      #0x55c04 ; -> stop_me_player
000306a6  mov     r0, r4
000306a8  bl      #0x2ec68 ; -> disable_all_buttons
000306ac  ldr     r1, [pc, #0xc4]
000306ae  mov     r0, r4
000306b0  add     r1, pc ; -> 0x001655ac  bt_angle_jump
000306b2  bl      #0x2ec50 ; -> stuff_buttons
000306b6  ldr     r3, [r4]
000306b8  mov.w   r2, #0x308
000306bc  str     r2, [r4, #0x1c]
000306be  mov     r0, r4
000306c0  str     r2, [r3, #0x18]
000306c2  ldr     r3, [r4, #8]
000306c4  ldr     r2, [r4]
000306c6  ldrsh.w r3, [r3, #0xe]
000306ca  str     r3, [r2, #0x3c]
000306cc  bl      #0x5517c ; -> is_he_right
000306d0  cmp     r0, #0
000306d2  bne     #0x30722
000306d4  ldr     r3, [r4, #0x48]
000306d6  str     r3, [r4, #0x1c]
000306d8  ldr     r3, [pc, #0x9c]
000306da  movw    r2, #0x382
000306de  movs    r0, #0
000306e0  add     r3, pc ; -> 0x00030789  t_angle_jump_call
000306e2  str     r3, [r4, #0x34]
000306e4  ldr     r3, [pc, #0x94]
000306e6  str     r3, [r4, #0x20]
000306e8  add.w   r3, r3, #0xa8000
000306ec  str     r3, [r4, #0x24]
000306ee  movs    r3, #3
000306f0  str     r3, [r4, #0x28]
000306f2  adds    r3, #1
000306f4  str     r3, [r4, #0x48]
000306f6  ldr.w   r3, [r5, #0xa4]
000306fa  adds    r3, #1
000306fc  str.w   r2, [r5, r3, lsl #3]
00030700  ldr.w   r3, [r5, #0xa4]
00030704  adds    r2, r3, #1
00030706  ldr     r3, [pc, #0x78]
00030708  str.w   r2, [r5, #0xa4]
0003070c  add     r3, pc ; -> 0x000f37f4  t_flight_call
0003070e  ldr     r1, [r3]
00030710  lsls    r3, r2, #3
00030712  adds    r3, r3, r5
00030714  str     r1, [r3, #4]
00030716  ldr.w   r3, [r5, #0xa4]
0003071a  adds    r3, #1
0003071c  str.w   r0, [r5, r3, lsl #3]
00030720  pop     {r4, r5, r7, pc}
00030722  ldr     r3, [r4, #0x48]
00030724  rsb.w   r3, r3, #0
00030728  str     r3, [r4, #0x48]
0003072a  b       #0x306d6
0003072c  ldr.w   r1, [r0, #0xf8]
00030730  ldr     r2, [r4, #0x1c]
00030732  lsls    r3, r1, #2
00030734  adds    r3, r3, r0
00030736  str.w   r2, [r3, #0xa8]
0003073a  adds    r3, r1, #1
0003073c  str.w   r3, [r0, #0xf8]
00030740  ldr     r3, [r4, #0x40]
00030742  mov     r0, r4
00030744  str     r3, [r4, #0x30]
00030746  movs    r3, #0x39
00030748  str     r3, [r4, #0x40]
0003074a  bl      #0x5520c ; -> get_char_ani
0003074e  ldr     r3, [r4, #0x40]
00030750  mov     r0, r4
00030752  str     r3, [r4, #0x38]
00030754  bl      #0x55428 ; -> find_last_frame
00030758  b       #0x30670
0003075a  ldr     r3, [pc, #0x28]
0003075c  add     r3, pc ; -> 0x000f38a8  t_angle_jump_land_jsrp
0003075e  ldr     r2, [r3]
00030760  lsls    r3, r1, #3
00030762  adds    r3, r3, r0
00030764  str     r2, [r3, #4]
00030766  ldr.w   r3, [r0, #0xa4]
0003076a  movs    r0, #0
0003076c  adds    r3, #1
0003076e  str.w   r0, [r5, r3, lsl #3]
00030772  b       #0x30720
00030774  ldr     r6, [pc, #0x3e0]
00030776  movs    r3, r2
00030778  lsls    r5, r4, #2
0003077a  movs    r0, r0
0003077c  movs    r0, r0
