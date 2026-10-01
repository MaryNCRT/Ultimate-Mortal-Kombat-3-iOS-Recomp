========================================================================
t_jax_zap_proc  0x0007753c  372 bytes   mkzap.c
========================================================================

0007753c  push    {r4, r5, r6, r7, lr}
0007753e  add     r7, sp, #0xc
00077540  ldr.w   r1, [r0, #0xa4]
00077544  movw    r6, #0x1229
00077548  mov     r5, r0
0007754a  adds    r3, r1, #1
0007754c  ldr.w   r4, [r0, #0x108]
00077550  ldr.w   r3, [r0, r3, lsl #3]
00077554  cmp     r3, r6
00077556  beq     #0x7763c
00077558  ble     #0x7756e
0007755a  movw    r2, #0x1233
0007755e  cmp     r3, r2
00077560  beq     #0x775c0
00077562  adds    r2, #0x20
00077564  cmp     r3, r2
00077566  beq     #0x775a8
00077568  mvn     r0, #2
0007756c  pop     {r4, r5, r6, r7, pc}
0007756e  cmp     r3, #0
00077570  bne     #0x77568
00077572  mov     r0, r4
00077574  movs    r3, #0x3f
00077576  str     r3, [r4, #0x40]
00077578  bl      #0x5520c ; -> get_char_ani
0007757c  mov     r0, r4
0007757e  bl      #0x59e24 ; -> do_next_a9_frame
00077582  movs    r3, #0x13
00077584  mov     r0, r4
00077586  str     r3, [r4, #0x1c]
00077588  bl      #0x75900 ; -> tell_world_stk
0007758c  mov     r0, r4
0007758e  bl      #0x594c8 ; -> strike_check_a0
00077592  ldr     r3, [r4, #0x5c]
00077594  cbnz    r3, #0x775c0
00077596  ldr.w   r3, [r5, #0xa4]
0007759a  movs    r0, #3
0007759c  adds    r3, #1
0007759e  str.w   r6, [r5, r3, lsl #3]
000775a2  str.w   r0, [r5, #0xfc]
000775a6  b       #0x7756c
000775a8  ldr     r2, [pc, #0xf0]
000775aa  lsls    r3, r1, #3
000775ac  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000775ae  adds    r3, r3, r5
000775b0  movs    r0, #0
000775b2  str     r2, [r3, #4]
000775b4  ldr.w   r3, [r5, #0xa4]
000775b8  adds    r3, #1
000775ba  str.w   r0, [r5, r3, lsl #3]
000775be  b       #0x7756c
000775c0  ldr     r3, [r4, #0x18]
000775c2  cmp     r3, #0
000775c4  beq     #0x7768e
000775c6  ldr     r3, [pc, #0xd8]
000775c8  mov     r0, r4
000775ca  movs    r6, #0
000775cc  str     r3, [r4, #0x1c]
000775ce  bl      #0x57c18 ; -> hob_ochar_sound
000775d2  ldr     r0, [r4, #8]
000775d4  bl      #0x55a60 ; -> stop_a8
000775d8  mov     r0, r4
000775da  bl      #0x570f8 ; -> match_me_with_him
000775de  mov     r0, r4
000775e0  mvn     r3, #0xb2
000775e4  str     r6, [r4, #0x20]
000775e6  str     r3, [r4, #0x1c]
000775e8  bl      #0x570ac ; -> multi_adjust_xy
000775ec  ldr     r3, [r4]
000775ee  ldr     r3, [r3, #0x34]
000775f0  str     r3, [r4, #0x1c]
000775f2  cmp     r3, #0
000775f4  bne     #0x7767c
000775f6  movs    r3, #0x3f
000775f8  mov     r0, r4
000775fa  str     r3, [r4, #0x40]
000775fc  subs    r3, #0x3d
000775fe  str     r3, [r4, #0x54]
00077600  bl      #0x554a8 ; -> find_ani_part_a14
00077604  movs    r3, #4
00077606  str     r3, [r4, #0x1c]
00077608  ldr.w   r3, [r5, #0xa4]
0007760c  movw    r2, #0x1253
00077610  mov     r0, r6
00077612  adds    r3, #1
00077614  str.w   r2, [r5, r3, lsl #3]
00077618  ldr.w   r3, [r5, #0xa4]
0007761c  adds    r2, r3, #1
0007761e  ldr.w   r3, [pc, #0x84]
00077622  str.w   r2, [r5, #0xa4]
00077626  add     r3, pc ; -> 0x000f37cc  t_mframew
00077628  ldr     r1, [r3]
0007762a  lsls    r3, r2, #3
0007762c  adds    r3, r3, r5
0007762e  str     r1, [r3, #4]
00077630  ldr.w   r3, [r5, #0xa4]
00077634  adds    r3, #1
00077636  str.w   r6, [r5, r3, lsl #3]
0007763a  b       #0x7756c
0007763c  ldr     r2, [r4]
0007763e  movs    r3, #3
00077640  mov     r0, r4
00077642  str     r3, [r2, #0x38]
00077644  mov.w   r3, #0x80000
00077648  str     r3, [r4, #0x1c]
0007764a  movs    r3, #4
0007764c  str     r3, [r4, #0x20]
0007764e  bl      #0x75d6c ; -> set_proj_vel
00077652  movs    r3, #0x12
00077654  str     r3, [r4, #0x48]
00077656  ldr     r3, [pc, #0x50]
00077658  movw    r2, #0x1233
0007765c  add     r3, pc ; -> 0x000768e5  t_jax_proj_calla
0007765e  str     r3, [r4, #0x34]
00077660  ldr.w   r3, [r5, #0xa4]
00077664  adds    r3, #1
00077666  str.w   r2, [r5, r3, lsl #3]
0007766a  ldr.w   r3, [r5, #0xa4]
0007766e  ldr     r2, [pc, #0x3c]
00077670  adds    r3, #1
00077672  add     r2, pc ; -> 0x00075919  tl_projectile_flight_call
00077674  str.w   r3, [r5, #0xa4]
00077678  lsls    r3, r3, #3
0007767a  b       #0x775ae
0007767c  mov     r0, r4
0007767e  mvn     r3, #0x19
00077682  str     r3, [r4, #0x1c]
00077684  subs    r3, #0xb
00077686  str     r3, [r4, #0x20]
00077688  bl      #0x570ac ; -> multi_adjust_xy
0007768c  b       #0x775f6
0007768e  mov     r0, r4
00077690  add.w   r3, r3, #0x50005
00077694  str     r3, [r4, #0x48]
00077696  bl      #0x581e0 ; -> shake_a11
0007769a  b       #0x775c6
0007769c  b       #0x7780a
