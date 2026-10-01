========================================================================
t_r_motaro_kick  0x00044ef4  476 bytes   mkreact.c
========================================================================

00044ef4  push    {r4, r5, r6, r7, lr}
00044ef6  add     r7, sp, #0xc
00044ef8  push.w  {r8, sl}
00044efc  ldr.w   r2, [r0, #0xa4]
00044f00  movw    r8, #0xd7a
00044f04  mov     r4, r0
00044f06  adds    r3, r2, #1
00044f08  ldr.w   r6, [r0, #0x108]
00044f0c  ldr.w   r5, [r0, r3, lsl #3]
00044f10  cmp     r5, r8
00044f12  beq.w   #0x45088
00044f16  ble     #0x44f4c
00044f18  movw    r1, #0xd7e
00044f1c  cmp     r5, r1
00044f1e  beq.w   #0x45098
00044f22  ble     #0x44fb0
00044f24  movw    r3, #0xd7f
00044f28  cmp     r5, r3
00044f2a  beq     #0x44ff8
00044f2c  adds    r3, #2
00044f2e  cmp     r5, r3
00044f30  bne     #0x44fb8
00044f32  ldr     r3, [pc, #0x17c]
00044f34  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00044f36  ldr     r1, [r3]
00044f38  lsls    r3, r2, #3
00044f3a  adds    r3, r3, r4
00044f3c  movs    r0, #0
00044f3e  str     r1, [r3, #4]
00044f40  ldr.w   r3, [r4, #0xa4]
00044f44  adds    r3, #1
00044f46  str.w   r0, [r4, r3, lsl #3]
00044f4a  b       #0x44faa
00044f4c  movw    sl, #0xd68
00044f50  cmp     r5, sl
00044f52  beq     #0x45030
00044f54  movw    r3, #0xd75
00044f58  cmp     r5, r3
00044f5a  beq     #0x44fbe
00044f5c  cmp     r5, #0
00044f5e  bne     #0x44fb8
00044f60  mov     r0, r6
00044f62  movs    r3, #4
00044f64  str     r3, [r6, #0x1c]
00044f66  bl      #0x5877c ; -> create_blood_proc
00044f6a  mov     r0, r6
00044f6c  mov.w   r8, #1
00044f70  str.w   r8, [r6, #0x1c]
00044f74  bl      #0x5877c ; -> create_blood_proc
00044f78  str.w   r8, [r6, #0x34]
00044f7c  str     r5, [r6, #0x30]
00044f7e  str     r5, [r6, #0x38]
00044f80  ldr.w   r3, [r4, #0xa4]
00044f84  ldr     r2, [pc, #0x12c]
00044f86  mov     r0, r5
00044f88  add     r3, r8
00044f8a  add     r2, pc ; -> 0x00044b85  t_reaction_start
00044f8c  str.w   sl, [r4, r3, lsl #3]
00044f90  ldr.w   r3, [r4, #0xa4]
00044f94  add     r3, r8
00044f96  str.w   r3, [r4, #0xa4]
00044f9a  lsls    r3, r3, #3
00044f9c  adds    r3, r3, r4
00044f9e  str     r2, [r3, #4]
00044fa0  ldr.w   r3, [r4, #0xa4]
00044fa4  add     r3, r8
00044fa6  str.w   r5, [r4, r3, lsl #3]
00044faa  pop.w   {r8, sl}
00044fae  pop     {r4, r5, r6, r7, pc}
00044fb0  movw    r2, #0xd7c
00044fb4  cmp     r5, r2
00044fb6  beq     #0x4501c
00044fb8  mvn     r0, #2
00044fbc  b       #0x44faa
00044fbe  mov     r0, r6
00044fc0  bl      #0x424fc ; -> shake_n_sound
00044fc4  movs    r3, #3
00044fc6  str     r3, [r6, #0x1c]
00044fc8  subs    r3, #2
00044fca  str     r3, [r6, #0x44]
00044fcc  ldr.w   r3, [r4, #0xa4]
00044fd0  ldr     r2, [pc, #0xe4]
00044fd2  adds    r3, #1
00044fd4  add     r2, pc ; -> 0x00042219  t_shake_on_my_back
00044fd6  str.w   r8, [r4, r3, lsl #3]
00044fda  ldr.w   r3, [r4, #0xa4]
00044fde  adds    r3, #1
00044fe0  str.w   r3, [r4, #0xa4]
00044fe4  lsls    r3, r3, #3
00044fe6  adds    r3, r3, r4
00044fe8  movs    r0, #0
00044fea  str     r2, [r3, #4]
00044fec  ldr.w   r3, [r4, #0xa4]
00044ff0  adds    r3, #1
00044ff2  str.w   r0, [r4, r3, lsl #3]
00044ff6  b       #0x44faa
00044ff8  ldr     r3, [pc, #0xc0]
00044ffa  movw    r2, #0xd81
00044ffe  str     r3, [r6, #0x40]
00045000  ldr.w   r3, [r0, #0xa4]
00045004  adds    r3, #1
00045006  str.w   r2, [r0, r3, lsl #3]
0004500a  ldr.w   r3, [r0, #0xa4]
0004500e  adds    r2, r3, #1
00045010  ldr.w   r3, [pc, #0xac]
00045014  str.w   r2, [r0, #0xa4]
00045018  add     r3, pc ; -> 0x000f36d0  t_animate_a9
0004501a  b       #0x44f36
0004501c  str.w   r1, [r0, r3, lsl #3]
00045020  ldr     r2, [pc, #0xa0]
00045022  ldr.w   r3, [r0, #0xa4]
00045026  add     r2, pc ; -> 0x00042005  t_check_stay_down
00045028  adds    r3, #1
0004502a  str.w   r3, [r0, #0xa4]
0004502e  b       #0x44fe4
00045030  mov     r0, r6
00045032  movs    r3, #2
00045034  str     r3, [r6, #0x1c]
00045036  bl      #0x580a4 ; -> group_sound
0004503a  mov     r0, r6
0004503c  movs    r1, #0xa
0004503e  bl      #0x57dbc ; -> rsnd_func
00045042  mov     r0, r6
00045044  mov.w   r3, #0xa000a
00045048  str     r3, [r6, #0x48]
0004504a  bl      #0x581e0 ; -> shake_a11
0004504e  mov.w   r3, #0x80000
00045052  str     r3, [r6, #0x1c]
00045054  sub.w   r3, r3, #0x100000
00045058  str     r3, [r6, #0x20]
0004505a  add.w   r3, r3, #0x88000
0004505e  str     r3, [r6, #0x24]
00045060  movs    r3, #5
00045062  str     r3, [r6, #0x28]
00045064  adds    r3, #0x19
00045066  str     r3, [r6, #0x40]
00045068  ldr.w   r3, [r4, #0xa4]
0004506c  movw    r2, #0xd75
00045070  adds    r3, #1
00045072  str.w   r2, [r4, r3, lsl #3]
00045076  ldr.w   r3, [r4, #0xa4]
0004507a  adds    r2, r3, #1
0004507c  ldr.w   r3, [pc, #0x48]
00045080  str.w   r2, [r4, #0xa4]
00045084  add     r3, pc ; -> 0x000f3720  t_flight
00045086  b       #0x44f36
00045088  movw    r2, #0xd7c
0004508c  str.w   r2, [r0, r3, lsl #3]
00045090  movs    r0, #4
00045092  str.w   r0, [r4, #0xfc]
00045096  b       #0x44faa
00045098  movw    r2, #0xd7f
0004509c  str.w   r2, [r0, r3, lsl #3]
000450a0  ldr.w   r3, [r0, #0xa4]
000450a4  adds    r2, r3, #1
000450a6  ldr     r3, [pc, #0x24]
000450a8  str.w   r2, [r0, #0xa4]
000450ac  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
000450ae  b       #0x44f36
000450b0  b       #0x45054
000450b2  movs    r2, r1
