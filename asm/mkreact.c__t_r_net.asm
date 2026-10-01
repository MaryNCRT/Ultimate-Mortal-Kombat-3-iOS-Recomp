========================================================================
t_r_net  0x00048ec8  512 bytes   mkreact.c
========================================================================

00048ec8  push    {r4, r5, r6, r7, lr}
00048eca  add     r7, sp, #0xc
00048ecc  ldr.w   r2, [r0, #0xa4]
00048ed0  mov     r6, r0
00048ed2  ldr.w   r4, [r0, #0x108]
00048ed6  adds    r3, r2, #1
00048ed8  ldr.w   r5, [r0, r3, lsl #3]
00048edc  movw    r3, #0x4f4
00048ee0  cmp     r5, r3
00048ee2  beq.w   #0x48ffc
00048ee6  ble     #0x48efe
00048ee8  movw    r3, #0x50a
00048eec  cmp     r5, r3
00048eee  beq.w   #0x4903a
00048ef2  cmp.w   r5, #0x518
00048ef6  beq     #0x48fe4
00048ef8  mvn     r0, #2
00048efc  pop     {r4, r5, r6, r7, pc}
00048efe  cmp     r5, #0
00048f00  beq     #0x48f9c
00048f02  subs    r3, #0x19
00048f04  cmp     r5, r3
00048f06  bne     #0x48ef8
00048f08  mov     r0, r4
00048f0a  bl      #0x54dec ; -> dec_my_p_hit
00048f0e  mov     r0, r4
00048f10  movs    r3, #8
00048f12  str     r3, [r4, #0x1c]
00048f14  bl      #0x580a4 ; -> group_sound
00048f18  mov     r0, r4
00048f1a  bl      #0x54f00 ; -> clear_noflip
00048f1e  mov     r0, r4
00048f20  bl      #0x54f20 ; -> set_no_block
00048f24  ldr     r3, [r4]
00048f26  mov     r0, r4
00048f28  movw    r2, #0x607
00048f2c  str     r2, [r4, #0x20]
00048f2e  str     r2, [r3, #0x18]
00048f30  movs    r3, #0x20
00048f32  str     r3, [r4, #0x40]
00048f34  bl      #0x55474 ; -> find_ani_part2
00048f38  mov     r0, r4
00048f3a  movs    r3, #4
00048f3c  str     r3, [r4, #0x1c]
00048f3e  bl      #0x553a0 ; -> init_anirate
00048f42  ldr     r2, [r4]
00048f44  mov.w   r3, #0x30000
00048f48  str     r3, [r4, #0x48]
00048f4a  sub.w   r3, r3, #0x2e000
00048f4e  str     r3, [r4, #0x44]
00048f50  movs    r3, #0x50
00048f52  str     r3, [r4, #0x1c]
00048f54  ldr     r3, [r4, #0x1c]
00048f56  mov     r0, r4
00048f58  str     r3, [r2, #0x28]
00048f5a  ldr     r2, [r4, #0x48]
00048f5c  ldr     r3, [r4, #0x44]
00048f5e  rsb     r3, r3, r2
00048f62  str     r3, [r4, #0x48]
00048f64  str     r3, [r4, #0x1c]
00048f66  bl      #0x55ab0 ; -> away_x_vel
00048f6a  ldr.w   r3, [r6, #0xa4]
00048f6e  movw    r2, #0x4f4
00048f72  adds    r3, #1
00048f74  str.w   r2, [r6, r3, lsl #3]
00048f78  ldr.w   r2, [pc, #0x134]
00048f7c  ldr.w   r3, [r6, #0xa4]
00048f80  add     r2, pc ; -> 0x00041309  t_net_sleep
00048f82  adds    r3, #1
00048f84  str.w   r3, [r6, #0xa4]
00048f88  lsls    r3, r3, #3
00048f8a  adds    r3, r3, r6
00048f8c  movs    r0, #0
00048f8e  str     r2, [r3, #4]
00048f90  ldr.w   r3, [r6, #0xa4]
00048f94  adds    r3, #1
00048f96  str.w   r0, [r6, r3, lsl #3]
00048f9a  b       #0x48efc
00048f9c  ldr     r3, [r4]
00048f9e  movs    r2, #0xa
00048fa0  mov     r0, r4
00048fa2  str     r2, [r4, #0x20]
00048fa4  str     r2, [r3, #0x48]
00048fa6  movs    r3, #1
00048fa8  str     r3, [r4, #0x34]
00048faa  bl      #0x41354 ; -> if_shao_then_pass
00048fae  str     r5, [r4, #0x30]
00048fb0  str     r5, [r4, #0x38]
00048fb2  ldr.w   r3, [r6, #0xa4]
00048fb6  movw    r2, #0x4db
00048fba  adds    r3, #1
00048fbc  str.w   r2, [r6, r3, lsl #3]
00048fc0  ldr.w   r2, [pc, #0xf0]
00048fc4  ldr.w   r3, [r6, #0xa4]
00048fc8  add     r2, pc ; -> 0x00044b85  t_reaction_start
00048fca  adds    r3, #1
00048fcc  str.w   r3, [r6, #0xa4]
00048fd0  lsls    r3, r3, #3
00048fd2  adds    r3, r3, r6
00048fd4  mov     r0, r5
00048fd6  str     r2, [r3, #4]
00048fd8  ldr.w   r3, [r6, #0xa4]
00048fdc  adds    r3, #1
00048fde  str.w   r5, [r6, r3, lsl #3]
00048fe2  b       #0x48efc
00048fe4  ldr     r1, [pc, #0xd0]
00048fe6  lsls    r3, r2, #3
00048fe8  adds    r3, r3, r0
00048fea  add     r1, pc ; -> 0x000425b9  t_reaction_land
00048fec  str     r1, [r3, #4]
00048fee  ldr.w   r3, [r0, #0xa4]
00048ff2  movs    r0, #0
00048ff4  adds    r3, #1
00048ff6  str.w   r0, [r6, r3, lsl #3]
00048ffa  b       #0x48efc
00048ffc  ldr     r2, [r4]
00048ffe  ldr     r3, [r2, #0x28]
00049000  cmp     r3, #0x28
00049002  str     r3, [r4, #0x1c]
00049004  ble     #0x4905a
00049006  ldr     r3, [r2, #0x28]
00049008  subs    r3, #1
0004900a  str     r3, [r4, #0x1c]
0004900c  cmp     r3, #0
0004900e  bne     #0x48f54
00049010  mov     r0, r4
00049012  bl      #0x55c04 ; -> stop_me_player
00049016  movs    r3, #0x20
00049018  str     r3, [r4, #0x44]
0004901a  ldr.w   r3, [r6, #0xa4]
0004901e  movw    r2, #0x50a
00049022  adds    r3, #1
00049024  str.w   r2, [r6, r3, lsl #3]
00049028  ldr.w   r2, [pc, #0x90]
0004902c  ldr.w   r3, [r6, #0xa4]
00049030  add     r2, pc ; -> 0x00041309  t_net_sleep
00049032  adds    r3, #1
00049034  str.w   r3, [r6, #0xa4]
00049038  b       #0x48f88
0004903a  ldr     r3, [r4, #0x44]
0004903c  subs    r5, r3, #1
0004903e  str     r5, [r4, #0x44]
00049040  cmp     r5, #0
00049042  bne     #0x4901a
00049044  mov     r0, r4
00049046  bl      #0x55070 ; -> am_i_airborn
0004904a  ldr     r3, [r4, #0x5c]
0004904c  cbnz    r3, #0x4906a
0004904e  ldr     r3, [pc, #0x70]
00049050  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00049052  ldr     r2, [r3]
00049054  ldr.w   r3, [r6, #0xa4]
00049058  b       #0x48fd0
0004905a  mov     r0, r4
0004905c  bl      #0x2f3a0 ; -> get_x_dist
00049060  ldr     r3, [r4, #0x28]
00049062  cmp     r3, #0x45
00049064  ble     #0x49010
00049066  ldr     r2, [r4]
00049068  b       #0x49006
0004906a  mov.w   r3, #0x8000
0004906e  str     r3, [r4, #0x24]
00049070  movs    r3, #5
00049072  str     r5, [r4, #0x1c]
00049074  str     r3, [r4, #0x28]
00049076  str     r5, [r4, #0x20]
00049078  adds    r3, #0x19
0004907a  str     r3, [r4, #0x40]
0004907c  ldr.w   r3, [r6, #0xa4]
00049080  mov.w   r2, #0x518
00049084  mov     r0, r5
00049086  adds    r3, #1
00049088  str.w   r2, [r6, r3, lsl #3]
0004908c  ldr.w   r3, [r6, #0xa4]
00049090  adds    r2, r3, #1
00049092  ldr     r3, [pc, #0x30]
00049094  str.w   r2, [r6, #0xa4]
00049098  add     r3, pc ; -> 0x000f3720  t_flight
0004909a  ldr     r1, [r3]
0004909c  lsls    r3, r2, #3
0004909e  adds    r3, r3, r6
000490a0  str     r1, [r3, #4]
000490a2  ldr.w   r3, [r6, #0xa4]
000490a6  adds    r3, #1
000490a8  str.w   r5, [r6, r3, lsl #3]
000490ac  b       #0x48efc
000490ae  nop     
000490b0  strh    r5, [r0, #0x1c]
