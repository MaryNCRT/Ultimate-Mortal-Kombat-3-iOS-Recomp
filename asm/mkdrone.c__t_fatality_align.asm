========================================================================
t_fatality_align  0x000724d8  528 bytes   mkdrone.c
========================================================================

000724d8  push    {r4, r5, r6, r7, lr}
000724da  add     r7, sp, #0xc
000724dc  ldr.w   r2, [r0, #0xa4]
000724e0  mov     r6, r0
000724e2  ldr.w   r4, [r0, #0x108]
000724e6  adds    r3, r2, #1
000724e8  ldr.w   r5, [r0, r3, lsl #3]
000724ec  movw    r3, #0xab2
000724f0  cmp     r5, r3
000724f2  beq.w   #0x72606
000724f6  ble     #0x7250c
000724f8  movw    r3, #0xac2
000724fc  cmp     r5, r3
000724fe  beq     #0x7254a
00072500  adds    r3, #7
00072502  cmp     r5, r3
00072504  beq     #0x725e6
00072506  mvn     r0, #2
0007250a  pop     {r4, r5, r6, r7, pc}
0007250c  cbz     r5, #0x72564
0007250e  subs    r3, #4
00072510  cmp     r5, r3
00072512  bne     #0x72506
00072514  movs    r3, #0xc0
00072516  str     r3, [r4, #0x44]
00072518  ldr.w   r3, [r6, #0xa4]
0007251c  movw    r2, #0xab2
00072520  adds    r3, #1
00072522  str.w   r2, [r6, r3, lsl #3]
00072526  ldr.w   r2, [pc, #0x19c]
0007252a  ldr.w   r3, [r6, #0xa4]
0007252e  add     r2, pc ; -> 0x0007293d  t_fatality_stalk_a11
00072530  adds    r3, #1
00072532  str.w   r3, [r6, #0xa4]
00072536  lsls    r3, r3, #3
00072538  adds    r3, r3, r6
0007253a  movs    r0, #0
0007253c  str     r2, [r3, #4]
0007253e  ldr.w   r3, [r6, #0xa4]
00072542  adds    r3, #1
00072544  str.w   r0, [r6, r3, lsl #3]
00072548  b       #0x7250a
0007254a  movs    r3, #0x80
0007254c  mov     r0, r4
0007254e  str     r3, [r4, #0x44]
00072550  bl      #0x70f58 ; -> q_am_i_cornered
00072554  ldr     r5, [r4, #0x5c]
00072556  cbz     r5, #0x7259c
00072558  ldr.w   r2, [pc, #0x16c]
0007255c  ldr.w   r3, [r6, #0xa4]
00072560  add     r2, pc ; -> 0x000695c5  t_d_fatality_cornered
00072562  b       #0x72536
00072564  ldr     r3, [r4, #0x1c]
00072566  mov     r0, r4
00072568  str     r3, [r4, #0x48]
0007256a  bl      #0x2f3a0 ; -> get_x_dist
0007256e  ldr     r2, [r4, #0x1c]
00072570  ldr     r3, [r4, #0x28]
00072572  cmp     r2, r3
00072574  bge     #0x7254a
00072576  subs    r3, r3, r2
00072578  cmp     r3, #0xff
0007257a  ble     #0x72514
0007257c  ldr.w   r3, [r6, #0xa4]
00072580  movw    r2, #0xaae
00072584  adds    r3, #1
00072586  str.w   r2, [r6, r3, lsl #3]
0007258a  ldr.w   r2, [pc, #0x140]
0007258e  ldr.w   r3, [r6, #0xa4]
00072592  add     r2, pc ; -> 0x00070de1  t_d_fflip_jsrp
00072594  adds    r3, #1
00072596  str.w   r3, [r6, #0xa4]
0007259a  b       #0x725d2
0007259c  mov     r0, r4
0007259e  bl      #0x2f3a0 ; -> get_x_dist
000725a2  ldr     r3, [r4, #0x28]
000725a4  ldr     r2, [r4, #0x48]
000725a6  subs    r3, r3, r2
000725a8  cmp     r3, #0
000725aa  str     r3, [r4, #0x28]
000725ac  itt     lt
000725ae  rsblt   r3, r3, #0
000725b0  strlt   r3, [r4, #0x28]
000725b2  cmp     r3, #0xff
000725b4  ble     #0x7265e
000725b6  ldr.w   r3, [r6, #0xa4]
000725ba  movw    r2, #0xac2
000725be  adds    r3, #1
000725c0  str.w   r2, [r6, r3, lsl #3]
000725c4  ldr     r2, [pc, #0x108]
000725c6  ldr.w   r3, [r6, #0xa4]
000725ca  add     r2, pc ; -> 0x00071251  t_d_bflip_jsrp
000725cc  adds    r3, #1
000725ce  str.w   r3, [r6, #0xa4]
000725d2  lsls    r3, r3, #3
000725d4  adds    r3, r3, r6
000725d6  mov     r0, r5
000725d8  str     r2, [r3, #4]
000725da  ldr.w   r3, [r6, #0xa4]
000725de  adds    r3, #1
000725e0  str.w   r5, [r6, r3, lsl #3]
000725e4  b       #0x7250a
000725e6  mov     r0, r4
000725e8  bl      #0x5a680 ; -> next_anirate
000725ec  mov     r0, r4
000725ee  bl      #0x2f3a0 ; -> get_x_dist
000725f2  ldr     r2, [r4, #0x28]
000725f4  ldr     r3, [r4, #0x48]
000725f6  cmp     r2, r3
000725f8  ble     #0x72624
000725fa  ldr.w   r2, [pc, #0xd8]
000725fe  add     r2, pc ; -> 0x0006eda5  t_dist_retp
00072600  ldr.w   r3, [r6, #0xa4]
00072604  b       #0x72536
00072606  ldr     r0, [r4, #0x44]
00072608  cmp     r0, #0
0007260a  bne     #0x72680
0007260c  ldr.w   r1, [pc, #0xc8]
00072610  lsls    r3, r2, #3
00072612  adds    r3, r3, r6
00072614  add     r1, pc ; -> 0x000703c9  t_d_fatality_abort
00072616  str     r1, [r3, #4]
00072618  ldr.w   r3, [r6, #0xa4]
0007261c  adds    r3, #1
0007261e  str.w   r0, [r6, r3, lsl #3]
00072622  b       #0x7250a
00072624  ldr     r3, [r4, #0x44]
00072626  subs    r3, #1
00072628  str     r3, [r4, #0x44]
0007262a  cbnz    r3, #0x7266a
0007262c  ldr.w   r2, [r6, #0xa4]
00072630  cmp     r2, #0
00072632  ble     #0x726a8
00072634  subs    r3, r2, #1
00072636  str.w   r3, [r6, #0xa4]
0007263a  ldr.w   r1, [r6, #0xa4]
0007263e  adds    r3, r1, #1
00072640  lsls    r2, r3, #3
00072642  adds    r2, r2, r6
00072644  ldr     r0, [r2, #4]
00072646  adds    r2, r3, #1
00072648  ldr.w   r2, [r6, r2, lsl #3]
0007264c  str.w   r2, [r6, r3, lsl #3]
00072650  ldr.w   r2, [pc, #0x88]
00072654  lsls    r3, r1, #3
00072656  adds    r3, r3, r6
00072658  add     r2, pc ; -> 0x000703c9  t_d_fatality_abort
0007265a  str     r0, [r3, #4]
0007265c  b       #0x72600
0007265e  mov     r0, r4
00072660  bl      #0x55388 ; -> face_opponent
00072664  mov     r0, r4
00072666  bl      #0x724c4 ; -> d_walkb_setup
0007266a  ldr.w   r3, [r6, #0xa4]
0007266e  movs    r0, #1
00072670  movw    r2, #0xac9
00072674  adds    r3, #1
00072676  str.w   r2, [r6, r3, lsl #3]
0007267a  str.w   r0, [r6, #0xfc]
0007267e  b       #0x7250a
00072680  cmp     r2, #0
00072682  ble     #0x7268e
00072684  subs    r3, r2, #1
00072686  movs    r0, #0
00072688  str.w   r3, [r6, #0xa4]
0007268c  b       #0x7250a
0007268e  ldr     r3, [pc, #0x50]
00072690  movs    r0, #0
00072692  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00072694  ldr     r1, [r3]
00072696  lsls    r3, r2, #3
00072698  adds    r3, r3, r6
0007269a  str     r1, [r3, #4]
0007269c  ldr.w   r3, [r6, #0xa4]
000726a0  adds    r3, #1
000726a2  str.w   r0, [r6, r3, lsl #3]
000726a6  b       #0x7250a
000726a8  ldr.w   r1, [pc, #0x38]
000726ac  lsls    r2, r2, #3
000726ae  adds    r2, r2, r6
000726b0  add     r1, pc ; -> 0x000f3708  t_local_reaction_exit
000726b2  ldr     r1, [r1]
000726b4  str     r1, [r2, #4]
000726b6  ldr.w   r2, [r6, #0xa4]
000726ba  adds    r2, #1
000726bc  str.w   r3, [r6, r2, lsl #3]
000726c0  b       #0x7263a
000726c2  nop     
000726c4  lsls    r3, r1, #0x10
000726c6  movs    r0, r0
000726c8  strb    r1, [r4, #1]
000726ca  vtbx.8  d30, {d15}, d11
