========================================================================
t_motaro_comboed  0x000a91b8  372 bytes   mkboss.c
========================================================================

000a91b8  push    {r4, r5, r6, r7, lr}
000a91ba  add     r7, sp, #0xc
000a91bc  push.w  {r8, sl}
000a91c0  ldr.w   r3, [r0, #0xa4]
000a91c4  movw    r8, #0x7df
000a91c8  mov     r4, r0
000a91ca  adds    r3, #1
000a91cc  ldr.w   r6, [r0, #0x108]
000a91d0  ldr.w   r5, [r0, r3, lsl #3]
000a91d4  cmp     r5, r8
000a91d6  beq     #0xa924a
000a91d8  ble     #0xa91f2
000a91da  cmp.w   r5, #0x7e0
000a91de  beq     #0xa925a
000a91e0  movw    r3, #0x7e2
000a91e4  cmp     r5, r3
000a91e6  beq     #0xa9222
000a91e8  mvn     r0, #2
000a91ec  pop.w   {r8, sl}
000a91f0  pop     {r4, r5, r6, r7, pc}
000a91f2  cmp     r5, #0
000a91f4  bne     #0xa91e8
000a91f6  mov     r0, r6
000a91f8  bl      #0x55070 ; -> am_i_airborn
000a91fc  ldr.w   sl, [r6, #0x5c]
000a9200  cmp.w   sl, #0
000a9204  beq     #0xa92bc
000a9206  ldr.w   r3, [r4, #0xa4]
000a920a  ldr     r2, [pc, #0x104]
000a920c  mov     r0, r5
000a920e  lsls    r3, r3, #3
000a9210  adds    r3, r3, r4
000a9212  add     r2, pc ; -> 0x000a8a6d  t_motaro_hit_flight
000a9214  str     r2, [r3, #4]
000a9216  ldr.w   r3, [r4, #0xa4]
000a921a  adds    r3, #1
000a921c  str.w   r5, [r4, r3, lsl #3]
000a9220  b       #0xa91ec
000a9222  ldr     r3, [r6]
000a9224  ldr     r3, [r3, #0x44]
000a9226  cmp     r3, #2
000a9228  str     r3, [r6, #0x1c]
000a922a  bgt     #0xa9292
000a922c  ldr     r3, [pc, #0xe4]
000a922e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9230  ldr     r2, [r3]
000a9232  ldr.w   r3, [r0, #0xa4]
000a9236  lsls    r3, r3, #3
000a9238  adds    r3, r3, r0
000a923a  str     r2, [r3, #4]
000a923c  ldr.w   r3, [r0, #0xa4]
000a9240  movs    r0, #0
000a9242  adds    r3, #1
000a9244  str.w   r0, [r4, r3, lsl #3]
000a9248  b       #0xa91ec
000a924a  mov.w   r2, #0x7e0
000a924e  str.w   r2, [r0, r3, lsl #3]
000a9252  movs    r0, #6
000a9254  str.w   r0, [r4, #0xfc]
000a9258  b       #0xa91ec
000a925a  movs    r3, #3
000a925c  str     r3, [r6, #0x1c]
000a925e  ldr.w   r3, [r0, #0xa4]
000a9262  movw    r2, #0x7e2
000a9266  adds    r3, #1
000a9268  str.w   r2, [r0, r3, lsl #3]
000a926c  ldr.w   r3, [r0, #0xa4]
000a9270  adds    r2, r3, #1
000a9272  ldr.w   r3, [pc, #0xa4]
000a9276  str.w   r2, [r0, #0xa4]
000a927a  add     r3, pc ; -> 0x000f37cc  t_mframew
000a927c  ldr     r1, [r3]
000a927e  lsls    r3, r2, #3
000a9280  adds    r3, r3, r4
000a9282  movs    r0, #0
000a9284  str     r1, [r3, #4]
000a9286  ldr.w   r3, [r4, #0xa4]
000a928a  adds    r3, #1
000a928c  str.w   r0, [r4, r3, lsl #3]
000a9290  b       #0xa91ec
000a9292  ldr.w   r3, [pc, #0x88]
000a9296  movw    r2, #0x7ee
000a929a  add     r3, pc ; -> 0x0017b91c  funcs.6632
000a929c  str     r3, [r6, #0x68]
000a929e  movs    r3, #2
000a92a0  str     r3, [r6, #0x64]
000a92a2  ldr.w   r3, [r0, #0xa4]
000a92a6  adds    r3, #1
000a92a8  str.w   r2, [r0, r3, lsl #3]
000a92ac  ldr.w   r3, [r0, #0xa4]
000a92b0  adds    r2, r3, #1
000a92b2  ldr     r3, [pc, #0x6c]
000a92b4  str.w   r2, [r0, #0xa4]
000a92b8  add     r3, pc ; -> 0x000f3404  t_random_do
000a92ba  b       #0xa927c
000a92bc  movs    r1, #0xa
000a92be  mov     r0, r6
000a92c0  bl      #0x57dbc ; -> rsnd_func
000a92c4  mov     r0, r6
000a92c6  mov.w   r3, #0x10000
000a92ca  str     r3, [r6, #0x1c]
000a92cc  bl      #0x55ab0 ; -> away_x_vel
000a92d0  mov     r0, r6
000a92d2  movs    r3, #0x1c
000a92d4  str     r3, [r6, #0x40]
000a92d6  bl      #0x5520c ; -> get_char_ani
000a92da  ldr     r3, [pc, #0x48]
000a92dc  mov     r0, sl
000a92de  str     r3, [r6, #0x1c]
000a92e0  ldr.w   r3, [r4, #0xa4]
000a92e4  adds    r3, #1
000a92e6  str.w   r8, [r4, r3, lsl #3]
000a92ea  ldr.w   r3, [r4, #0xa4]
000a92ee  adds    r2, r3, #1
000a92f0  ldr.w   r3, [pc, #0x34]
000a92f4  str.w   r2, [r4, #0xa4]
000a92f8  add     r3, pc ; -> 0x000f36b8  t_animate_a0_frames
000a92fa  ldr     r1, [r3]
000a92fc  lsls    r3, r2, #3
000a92fe  adds    r3, r3, r4
000a9300  str     r1, [r3, #4]
000a9302  ldr.w   r3, [r4, #0xa4]
000a9306  adds    r3, #1
000a9308  str.w   sl, [r4, r3, lsl #3]
000a930c  b       #0xa91ec
000a930e  nop     
000a9310  ldr     pc, [r7, #0xff]!
000a9314  adr     r4, #0x358
000a9316  movs    r4, r0
000a9318  adr     r5, #0x138
000a931a  movs    r4, r0
000a931c  movs    r6, #0x7e
000a931e  movs    r5, r1
000a9320  adr     r1, #0x120
000a9322  movs    r4, r0
000a9324  movs    r2, r0
000a9326  movs    r3, r0
000a9328  adr     r3, #0x2f0
000a932a  movs    r4, r0
