========================================================================
t_kano_zap_proc  0x0007667c  312 bytes   mkzap.c
========================================================================

0007667c  push    {r4, r5, r6, r7, lr}
0007667e  add     r7, sp, #0xc
00076680  push.w  {r8, sl}
00076684  ldr.w   r1, [r0, #0xa4]
00076688  movw    r8, #0x1301
0007668c  mov     r5, r0
0007668e  adds    r3, r1, #1
00076690  ldr.w   r4, [r0, #0x108]
00076694  ldr.w   r3, [r0, r3, lsl #3]
00076698  cmp     r3, r8
0007669a  beq     #0x766ee
0007669c  movw    r2, #0x1312
000766a0  cmp     r3, r2
000766a2  beq     #0x766d6
000766a4  cbz     r3, #0x766b0
000766a6  mvn     r0, #2
000766aa  pop.w   {r8, sl}
000766ae  pop     {r4, r5, r6, r7, pc}
000766b0  ldr     r3, [pc, #0xe8]
000766b2  mov.w   sl, #0x15
000766b6  mov     r0, r4
000766b8  str.w   sl, [r4, #0x1c]
000766bc  str     r3, [r4, #0x20]
000766be  ldr     r3, [pc, #0xe0]
000766c0  str     r3, [r4, #0x24]
000766c2  bl      #0x75f1c ; -> local_strike_check_box
000766c6  ldr     r6, [r4, #0x5c]
000766c8  cmp     r6, #0
000766ca  beq     #0x76752
000766cc  movs    r3, #0x38
000766ce  str     r3, [r4, #0x1c]
000766d0  subs    r3, #0x18
000766d2  str     r3, [r4, #0x20]
000766d4  b       #0x766fc
000766d6  ldr     r2, [pc, #0xcc]
000766d8  lsls    r3, r1, #3
000766da  adds    r3, r3, r0
000766dc  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
000766de  str     r2, [r3, #4]
000766e0  ldr.w   r3, [r0, #0xa4]
000766e4  movs    r0, #0
000766e6  adds    r3, #1
000766e8  str.w   r0, [r5, r3, lsl #3]
000766ec  b       #0x766aa
000766ee  ldr     r0, [r4, #8]
000766f0  bl      #0x55a60 ; -> stop_a8
000766f4  movs    r3, #0xd
000766f6  str     r3, [r4, #0x1c]
000766f8  subs    r3, #0xd
000766fa  str     r3, [r4, #0x20]
000766fc  mov     r0, r4
000766fe  bl      #0x570ac ; -> multi_adjust_xy
00076702  ldr     r3, [pc, #0xa4]
00076704  mov     r0, r4
00076706  str     r3, [r4, #0x1c]
00076708  bl      #0x57c18 ; -> hob_ochar_sound
0007670c  movs    r3, #0x3f
0007670e  mov     r0, r4
00076710  str     r3, [r4, #0x40]
00076712  subs    r3, #0x3c
00076714  str     r3, [r4, #0x54]
00076716  bl      #0x554a8 ; -> find_ani_part_a14
0007671a  movs    r3, #4
0007671c  str     r3, [r4, #0x1c]
0007671e  ldr.w   r3, [r5, #0xa4]
00076722  movw    r2, #0x1312
00076726  movs    r0, #0
00076728  adds    r3, #1
0007672a  str.w   r2, [r5, r3, lsl #3]
0007672e  ldr.w   r3, [r5, #0xa4]
00076732  adds    r2, r3, #1
00076734  ldr.w   r3, [pc, #0x74]
00076738  str.w   r2, [r5, #0xa4]
0007673c  add     r3, pc ; -> 0x000f37cc  t_mframew
0007673e  ldr     r1, [r3]
00076740  lsls    r3, r2, #3
00076742  adds    r3, r3, r5
00076744  str     r1, [r3, #4]
00076746  ldr.w   r3, [r5, #0xa4]
0007674a  adds    r3, #1
0007674c  str.w   r0, [r5, r3, lsl #3]
00076750  b       #0x766aa
00076752  mov     r0, r4
00076754  movs    r3, #0x3f
00076756  str     r3, [r4, #0x40]
00076758  bl      #0x55474 ; -> find_ani_part2
0007675c  mov.w   r3, #0x80000
00076760  mov     r0, r4
00076762  str     r3, [r4, #0x1c]
00076764  movs    r3, #1
00076766  str     r3, [r4, #0x20]
00076768  bl      #0x75d6c ; -> set_proj_vel
0007676c  str.w   sl, [r4, #0x48]
00076770  ldr.w   r3, [r5, #0xa4]
00076774  ldr     r2, [pc, #0x38]
00076776  mov     r0, r6
00076778  adds    r3, #1
0007677a  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
0007677c  str.w   r8, [r5, r3, lsl #3]
00076780  ldr.w   r3, [r5, #0xa4]
00076784  adds    r3, #1
00076786  str.w   r3, [r5, #0xa4]
0007678a  lsls    r3, r3, #3
0007678c  adds    r3, r3, r5
0007678e  str     r2, [r3, #4]
00076790  ldr.w   r3, [r5, #0xa4]
00076794  adds    r3, #1
00076796  str.w   r6, [r5, r3, lsl #3]
0007679a  b       #0x766aa
0007679c  lsls    r0, r4, #1
0007679e  movs    r3, r0
000767a0  lsls    r4, r0, #1
000767a2  movs    r2, r4
