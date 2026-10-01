========================================================================
t_sk_stalk  0x000ac134  740 bytes   mkboss.c
========================================================================

000ac134  push    {r4, r5, r6, r7, lr}
000ac136  add     r7, sp, #0xc
000ac138  str     r8, [sp, #-0x4]!
000ac13c  ldr.w   r3, [r0, #0xa4]
000ac140  movw    r8, #0x24b
000ac144  mov     r5, r0
000ac146  adds    r3, #1
000ac148  ldr.w   r6, [r0, #0x108]
000ac14c  ldr.w   r4, [r0, r3, lsl #3]
000ac150  cmp     r4, r8
000ac152  beq.w   #0xac2d0
000ac156  ble     #0xac1b2
000ac158  movw    r3, #0x272
000ac15c  cmp     r4, r3
000ac15e  beq     #0xac248
000ac160  ble     #0xac1f6
000ac162  movw    r3, #0x285
000ac166  cmp     r4, r3
000ac168  beq.w   #0xac270
000ac16c  adds    r3, #0x12
000ac16e  cmp     r4, r3
000ac170  bne     #0xac1fc
000ac172  ldr.w   r3, [pc, #0x264]
000ac176  movw    r2, #0x2a7
000ac17a  add     r3, pc ; -> 0x0017b940  funcs.5329
000ac17c  str     r3, [r6, #0x68]
000ac17e  movs    r3, #7
000ac180  str     r3, [r6, #0x64]
000ac182  ldr.w   r3, [r5, #0xa4]
000ac186  adds    r3, #1
000ac188  str.w   r2, [r5, r3, lsl #3]
000ac18c  ldr.w   r3, [r5, #0xa4]
000ac190  adds    r2, r3, #1
000ac192  ldr.w   r3, [pc, #0x248]
000ac196  str.w   r2, [r5, #0xa4]
000ac19a  add     r3, pc ; -> 0x000f3404  t_random_do
000ac19c  ldr     r1, [r3]
000ac19e  lsls    r3, r2, #3
000ac1a0  adds    r3, r3, r5
000ac1a2  movs    r0, #0
000ac1a4  str     r1, [r3, #4]
000ac1a6  ldr.w   r3, [r5, #0xa4]
000ac1aa  adds    r3, #1
000ac1ac  str.w   r0, [r5, r3, lsl #3]
000ac1b0  b       #0xac1f0
000ac1b2  cmp.w   r4, #0x238
000ac1b6  beq.w   #0xac304
000ac1ba  movw    r3, #0x242
000ac1be  cmp     r4, r3
000ac1c0  beq     #0xac202
000ac1c2  cbnz    r4, #0xac1fc
000ac1c4  mov     r0, r6
000ac1c6  bl      #0xabdf0 ; -> q_boss_stupid
000ac1ca  ldr.w   r8, [r6, #0x5c]
000ac1ce  cmp.w   r8, #0
000ac1d2  beq.w   #0xac36e
000ac1d6  ldr.w   r3, [r5, #0xa4]
000ac1da  ldr     r2, [pc, #0x204]
000ac1dc  mov     r0, r4
000ac1de  lsls    r3, r3, #3
000ac1e0  adds    r3, r3, r5
000ac1e2  add     r2, pc ; -> 0x000a87fd  t_sk_stupid
000ac1e4  str     r2, [r3, #4]
000ac1e6  ldr.w   r3, [r5, #0xa4]
000ac1ea  adds    r3, #1
000ac1ec  str.w   r4, [r5, r3, lsl #3]
000ac1f0  ldr     r8, [sp], #4
000ac1f4  pop     {r4, r5, r6, r7, pc}
000ac1f6  cmp.w   r4, #0x260
000ac1fa  beq     #0xac2a0
000ac1fc  mvn     r0, #2
000ac200  b       #0xac1f0
000ac202  mov.w   r3, #0x1f4
000ac206  mov     r0, r6
000ac208  str     r3, [r6, #0x1c]
000ac20a  bl      #0xab6bc ; -> bossrandper
000ac20e  ldr     r0, [r6, #0x5c]
000ac210  cbnz    r0, #0xac270
000ac212  mov.w   r3, #0x100
000ac216  str     r3, [r6, #0x44]
000ac218  subs    r3, #0xa0
000ac21a  str     r3, [r6, #0x48]
000ac21c  ldr.w   r3, [r5, #0xa4]
000ac220  adds    r3, #1
000ac222  str.w   r8, [r5, r3, lsl #3]
000ac226  ldr.w   r3, [r5, #0xa4]
000ac22a  adds    r2, r3, #1
000ac22c  ldr     r3, [pc, #0x1b4]
000ac22e  str.w   r2, [r5, #0xa4]
000ac232  add     r3, pc ; -> 0x000f3414  t_d_stalk_a11
000ac234  ldr     r1, [r3]
000ac236  lsls    r3, r2, #3
000ac238  adds    r3, r3, r5
000ac23a  str     r1, [r3, #4]
000ac23c  ldr.w   r3, [r5, #0xa4]
000ac240  adds    r3, #1
000ac242  str.w   r0, [r5, r3, lsl #3]
000ac246  b       #0xac1f0
000ac248  ldr     r3, [pc, #0x19c]
000ac24a  movw    r2, #0x285
000ac24e  add     r3, pc ; -> 0x0017b96c  funcs.5322
000ac250  str     r3, [r6, #0x68]
000ac252  movs    r3, #9
000ac254  str     r3, [r6, #0x64]
000ac256  ldr.w   r3, [r5, #0xa4]
000ac25a  adds    r3, #1
000ac25c  str.w   r2, [r5, r3, lsl #3]
000ac260  ldr.w   r3, [r5, #0xa4]
000ac264  adds    r2, r3, #1
000ac266  ldr     r3, [pc, #0x184]
000ac268  str.w   r2, [r5, #0xa4]
000ac26c  add     r3, pc ; -> 0x000f3404  t_random_do
000ac26e  b       #0xac19c
000ac270  ldr     r0, [r6, #0x1c]
000ac272  cmp     r0, #0
000ac274  bne.w   #0xac172
000ac278  ldr     r3, [pc, #0x174]
000ac27a  movw    r2, #0x297
000ac27e  add     r3, pc ; -> 0x0017b95c  funcs.5326
000ac280  str     r3, [r6, #0x68]
000ac282  movs    r3, #4
000ac284  str     r3, [r6, #0x64]
000ac286  ldr.w   r3, [r5, #0xa4]
000ac28a  adds    r3, #1
000ac28c  str.w   r2, [r5, r3, lsl #3]
000ac290  ldr.w   r3, [r5, #0xa4]
000ac294  adds    r2, r3, #1
000ac296  ldr     r3, [pc, #0x15c]
000ac298  str.w   r2, [r5, #0xa4]
000ac29c  add     r3, pc ; -> 0x000f3404  t_random_do
000ac29e  b       #0xac234
000ac2a0  ldr     r0, [r6, #0x1c]
000ac2a2  cmp     r0, #0
000ac2a4  bne     #0xac248
000ac2a6  ldr     r3, [pc, #0x150]
000ac2a8  movw    r2, #0x272
000ac2ac  add     r3, pc ; -> 0x0017b990  funcs.5319
000ac2ae  str     r3, [r6, #0x68]
000ac2b0  movs    r3, #4
000ac2b2  str     r3, [r6, #0x64]
000ac2b4  ldr.w   r3, [r5, #0xa4]
000ac2b8  adds    r3, #1
000ac2ba  str.w   r2, [r5, r3, lsl #3]
000ac2be  ldr.w   r3, [r5, #0xa4]
000ac2c2  adds    r2, r3, #1
000ac2c4  ldr.w   r3, [pc, #0x134]
000ac2c8  str.w   r2, [r5, #0xa4]
000ac2cc  add     r3, pc ; -> 0x000f3404  t_random_do
000ac2ce  b       #0xac234
000ac2d0  mov     r0, r6
000ac2d2  bl      #0xa8d64 ; -> q_is_he_car
000ac2d6  ldr     r3, [r6, #0x5c]
000ac2d8  cbnz    r3, #0xac33e
000ac2da  ldr     r3, [pc, #0x124]
000ac2dc  mov.w   r2, #0x260
000ac2e0  add     r3, pc ; -> 0x0017b9a0  funcs.5315
000ac2e2  str     r3, [r6, #0x68]
000ac2e4  movs    r3, #4
000ac2e6  str     r3, [r6, #0x64]
000ac2e8  ldr.w   r3, [r5, #0xa4]
000ac2ec  adds    r3, #1
000ac2ee  str.w   r2, [r5, r3, lsl #3]
000ac2f2  ldr.w   r3, [r5, #0xa4]
000ac2f6  adds    r2, r3, #1
000ac2f8  ldr.w   r3, [pc, #0x108]
000ac2fc  str.w   r2, [r5, #0xa4]
000ac300  add     r3, pc ; -> 0x000f3404  t_random_do
000ac302  b       #0xac19c
000ac304  mov.w   r3, #0x1f4
000ac308  mov     r0, r6
000ac30a  str     r3, [r6, #0x1c]
000ac30c  bl      #0xab6bc ; -> bossrandper
000ac310  ldr     r0, [r6, #0x5c]
000ac312  cmp     r0, #0
000ac314  bne     #0xac2a0
000ac316  mov.w   r3, #0x100
000ac31a  str     r3, [r6, #0x44]
000ac31c  subs    r3, #0x70
000ac31e  str     r3, [r6, #0x48]
000ac320  ldr.w   r3, [r5, #0xa4]
000ac324  movw    r2, #0x242
000ac328  adds    r3, #1
000ac32a  str.w   r2, [r5, r3, lsl #3]
000ac32e  ldr.w   r3, [r5, #0xa4]
000ac332  adds    r2, r3, #1
000ac334  ldr     r3, [pc, #0xd0]
000ac336  str.w   r2, [r5, #0xa4]
000ac33a  add     r3, pc ; -> 0x000f3414  t_d_stalk_a11
000ac33c  b       #0xac234
000ac33e  mov.w   r3, #0x2bc
000ac342  mov     r0, r6
000ac344  str     r3, [r6, #0x1c]
000ac346  bl      #0xab5f0 ; -> bossrandper_org
000ac34a  ldr     r3, [r6, #0x5c]
000ac34c  cmp     r3, #0
000ac34e  beq     #0xac2da
000ac350  ldr.w   r3, [r5, #0xa4]
000ac354  ldr.w   r2, [pc, #0xb4]
000ac358  movs    r0, #0
000ac35a  lsls    r3, r3, #3
000ac35c  adds    r3, r3, r5
000ac35e  add     r2, pc ; -> 0x000aaa45  t_boss_ease_back
000ac360  str     r2, [r3, #4]
000ac362  ldr.w   r3, [r5, #0xa4]
000ac366  adds    r3, #1
000ac368  str.w   r0, [r5, r3, lsl #3]
000ac36c  b       #0xac1f0
000ac36e  mov     r0, r6
000ac370  bl      #0x2f3a0 ; -> get_x_dist
000ac374  ldr     r3, [r6, #0x28]
000ac376  cmp     r3, #0x5f
000ac378  ble     #0xac2d0
000ac37a  cmp     r3, #0x8f
000ac37c  ble.w   #0xac270
000ac380  cmp     r3, #0xdf
000ac382  ble     #0xac2a0
000ac384  movs    r3, #0xc8
000ac386  mov     r0, r6
000ac388  str     r3, [r6, #0x1c]
000ac38a  bl      #0xab6bc ; -> bossrandper
000ac38e  ldr     r0, [r6, #0x5c]
000ac390  cbz     r0, #0xac3ae
000ac392  ldr.w   r3, [r5, #0xa4]
000ac396  ldr     r2, [pc, #0x78]
000ac398  mov     r0, r8
000ac39a  lsls    r3, r3, #3
000ac39c  adds    r3, r3, r5
000ac39e  add     r2, pc ; -> 0x000a9019  t_sk_zap
000ac3a0  str     r2, [r3, #4]
000ac3a2  ldr.w   r3, [r5, #0xa4]
000ac3a6  adds    r3, #1
000ac3a8  str.w   r8, [r5, r3, lsl #3]
000ac3ac  b       #0xac1f0
000ac3ae  mov.w   r3, #0x100
000ac3b2  str     r3, [r6, #0x44]
000ac3b4  subs    r3, #0x20
000ac3b6  str     r3, [r6, #0x48]
000ac3b8  ldr.w   r3, [r5, #0xa4]
000ac3bc  mov.w   r2, #0x238
000ac3c0  adds    r3, #1
000ac3c2  str.w   r2, [r5, r3, lsl #3]
000ac3c6  ldr.w   r3, [r5, #0xa4]
000ac3ca  adds    r2, r3, #1
000ac3cc  ldr.w   r3, [pc, #0x44]
000ac3d0  str.w   r2, [r5, #0xa4]
000ac3d4  add     r3, pc ; -> 0x000f3414  t_d_stalk_a11
000ac3d6  b       #0xac234
000ac3d8  ubfx    r0, r2, #0, #0xd
000ac3dc  strb    r6, [r4, #9]
000ac3de  movs    r4, r0
000ac3e0  stm     r6!, {r0, r1, r2, r4}
