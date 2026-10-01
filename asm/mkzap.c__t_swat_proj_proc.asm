========================================================================
t_swat_proj_proc  0x00076e78  408 bytes   mkzap.c
========================================================================

00076e78  push    {r4, r5, r6, r7, lr}
00076e7a  add     r7, sp, #0xc
00076e7c  str     r8, [sp, #-0x4]!
00076e80  ldr.w   r2, [r0, #0xa4]
00076e84  movw    r6, #0xe7d
00076e88  mov     r5, r0
00076e8a  adds    r3, r2, #1
00076e8c  ldr.w   r4, [r0, #0x108]
00076e90  ldr.w   r3, [r0, r3, lsl #3]
00076e94  cmp     r3, r6
00076e96  beq     #0x76f96
00076e98  ble     #0x76ebe
00076e9a  movw    r6, #0xe8a
00076e9e  cmp     r3, r6
00076ea0  beq     #0x76f3c
00076ea2  movw    r1, #0xe97
00076ea6  cmp     r3, r1
00076ea8  beq     #0x76f22
00076eaa  movw    r2, #0xe84
00076eae  cmp     r3, r2
00076eb0  beq.w   #0x76fc2
00076eb4  mvn     r0, #2
00076eb8  ldr     r8, [sp], #4
00076ebc  pop     {r4, r5, r6, r7, pc}
00076ebe  cbz     r3, #0x76eee
00076ec0  movw    r2, #0xe76
00076ec4  cmp     r3, r2
00076ec6  bne     #0x76eb4
00076ec8  mov     r0, r4
00076eca  bl      #0x59e24 ; -> do_next_a9_frame
00076ece  movs    r3, #0x14
00076ed0  mov     r0, r4
00076ed2  str     r3, [r4, #0x1c]
00076ed4  bl      #0x75f5c ; -> proj_strike_check
00076ed8  ldr     r3, [r4, #0x5c]
00076eda  cbnz    r3, #0x76f3c
00076edc  ldr.w   r3, [r5, #0xa4]
00076ee0  movs    r0, #3
00076ee2  adds    r3, #1
00076ee4  str.w   r6, [r5, r3, lsl #3]
00076ee8  str.w   r0, [r5, #0xfc]
00076eec  b       #0x76eb8
00076eee  mov     r0, r4
00076ef0  movs    r3, #0x24
00076ef2  str     r3, [r4, #0x40]
00076ef4  bl      #0x55474 ; -> find_ani_part2
00076ef8  mov     r0, r4
00076efa  bl      #0x59e24 ; -> do_next_a9_frame
00076efe  movs    r3, #0x13
00076f00  mov     r0, r4
00076f02  str     r3, [r4, #0x1c]
00076f04  bl      #0x75f5c ; -> proj_strike_check
00076f08  ldr     r3, [r4, #0x5c]
00076f0a  cbnz    r3, #0x76f3c
00076f0c  ldr.w   r3, [r5, #0xa4]
00076f10  movs    r0, #3
00076f12  movw    r2, #0xe76
00076f16  adds    r3, #1
00076f18  str.w   r2, [r5, r3, lsl #3]
00076f1c  str.w   r0, [r5, #0xfc]
00076f20  b       #0x76eb8
00076f22  ldr.w   r1, [pc, #0xe0]
00076f26  lsls    r3, r2, #3
00076f28  adds    r3, r3, r0
00076f2a  add     r1, pc ; -> 0x00075665  tl_delete_proj_and_die
00076f2c  str     r1, [r3, #4]
00076f2e  ldr.w   r3, [r0, #0xa4]
00076f32  movs    r0, #0
00076f34  adds    r3, #1
00076f36  str.w   r0, [r5, r3, lsl #3]
00076f3a  b       #0x76eb8
00076f3c  ldr     r0, [r4, #8]
00076f3e  bl      #0x55a60 ; -> stop_a8
00076f42  mov     r0, r4
00076f44  mov.w   r8, #0
00076f48  movs    r6, #3
00076f4a  mvn     r3, #0xf9
00076f4e  str.w   r8, [r4, #0x20]
00076f52  str     r3, [r4, #0x1c]
00076f54  str     r6, [r4, #0x54]
00076f56  add.w   r3, r3, #0x11e
00076f5a  str     r3, [r4, #0x40]
00076f5c  bl      #0x554a8 ; -> find_ani_part_a14
00076f60  str     r6, [r4, #0x1c]
00076f62  ldr.w   r3, [r5, #0xa4]
00076f66  movw    r2, #0xe97
00076f6a  mov     r0, r8
00076f6c  adds    r3, #1
00076f6e  str.w   r2, [r5, r3, lsl #3]
00076f72  ldr.w   r3, [r5, #0xa4]
00076f76  adds    r2, r3, #1
00076f78  ldr     r3, [pc, #0x8c]
00076f7a  str.w   r2, [r5, #0xa4]
00076f7e  add     r3, pc ; -> 0x000f37cc  t_mframew
00076f80  ldr     r1, [r3]
00076f82  lsls.w  r3, r2, r6
00076f86  adds    r3, r3, r5
00076f88  str     r1, [r3, #4]
00076f8a  ldr.w   r3, [r5, #0xa4]
00076f8e  adds    r3, #1
00076f90  str.w   r8, [r5, r3, lsl #3]
00076f94  b       #0x76eb8
00076f96  mov     r0, r4
00076f98  bl      #0x59e24 ; -> do_next_a9_frame
00076f9c  movs    r3, #0x14
00076f9e  mov     r0, r4
00076fa0  str     r3, [r4, #0x1c]
00076fa2  bl      #0x75f5c ; -> proj_strike_check
00076fa6  ldr     r3, [r4, #0x5c]
00076fa8  cmp     r3, #0
00076faa  bne     #0x76f3c
00076fac  ldr.w   r3, [r5, #0xa4]
00076fb0  movs    r0, #3
00076fb2  movw    r2, #0xe84
00076fb6  adds    r3, #1
00076fb8  str.w   r2, [r5, r3, lsl #3]
00076fbc  str.w   r0, [r5, #0xfc]
00076fc0  b       #0x76eb8
00076fc2  mov.w   r3, #0xa0000
00076fc6  mov     r0, r4
00076fc8  str     r3, [r4, #0x1c]
00076fca  movs    r3, #4
00076fcc  str     r3, [r4, #0x20]
00076fce  bl      #0x75d6c ; -> set_proj_vel
00076fd2  movs    r3, #0x12
00076fd4  str     r3, [r4, #0x48]
00076fd6  ldr.w   r3, [r5, #0xa4]
00076fda  ldr.w   r2, [pc, #0x30]
00076fde  movs    r0, #0
00076fe0  adds    r3, #1
00076fe2  add     r2, pc ; -> 0x0007562d  tl_projectile_flight
00076fe4  str.w   r6, [r5, r3, lsl #3]
00076fe8  ldr.w   r3, [r5, #0xa4]
00076fec  adds    r3, #1
00076fee  str.w   r3, [r5, #0xa4]
00076ff2  lsls    r3, r3, #3
00076ff4  adds    r3, r3, r5
00076ff6  str     r2, [r3, #4]
00076ff8  ldr.w   r3, [r5, #0xa4]
00076ffc  adds    r3, #1
00076ffe  str.w   r0, [r5, r3, lsl #3]
00077002  b       #0x76eb8
00077004  b       #0x76e76
00077006  vtbx.8  d28, {d15}, d10
0007700a  movs    r7, r0
0007700c  b       #0x76c9e
