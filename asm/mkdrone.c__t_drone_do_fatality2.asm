========================================================================
t_drone_do_fatality2  0x000693e0  244 bytes   mkdrone.c
========================================================================

000693e0  push    {lr}
000693e2  ldr.w   r2, [r0, #0xa4]
000693e6  movw    lr, #0xa27
000693ea  ldr.w   ip, [r0, #0x108]
000693ee  adds    r3, r2, #1
000693f0  ldr.w   r1, [r0, r3, lsl #3]
000693f4  cmp     r1, lr
000693f6  beq     #0x6946c
000693f8  movw    r3, #0xa2a
000693fc  cmp     r1, r3
000693fe  beq     #0x6944a
00069400  cbz     r1, #0x69408
00069402  mvn     r0, #2
00069406  pop     {pc}
00069408  ldr.w   r3, [ip, #8]
0006940c  ldr     r2, [pc, #0xac]
0006940e  ldr     r3, [r3, #0x24]
00069410  add     r2, pc ; -> 0x00171dfc  ochar_fatality_distances
00069412  ldr.w   r3, [r2, r3, lsl #2]
00069416  ldr.w   r2, [pc, #0xa8]
0006941a  asrs    r3, r3, #0x10
0006941c  str.w   r3, [ip, #0x1c]
00069420  ldr.w   r3, [r0, #0xa4]
00069424  add     r2, pc ; -> 0x000724d9  t_fatality_align
00069426  adds    r3, #1
00069428  str.w   lr, [r0, r3, lsl #3]
0006942c  ldr.w   r3, [r0, #0xa4]
00069430  adds    r3, #1
00069432  str.w   r3, [r0, #0xa4]
00069436  lsls    r3, r3, #3
00069438  adds    r3, r3, r0
0006943a  str     r2, [r3, #4]
0006943c  ldr.w   r3, [r0, #0xa4]
00069440  adds    r3, #1
00069442  str.w   r1, [r0, r3, lsl #3]
00069446  mov     r0, r1
00069448  b       #0x69406
0006944a  ldr.w   r1, [ip, #0x44]
0006944e  cbnz    r1, #0x694ae
00069450  ldr.w   ip, [pc, #0x70]
00069454  lsls    r3, r2, #3
00069456  adds    r3, r3, r0
00069458  add     ip, pc ; -> 0x000703c9  t_d_fatality_abort
0006945a  str.w   ip, [r3, #4]
0006945e  ldr.w   r3, [r0, #0xa4]
00069462  adds    r3, #1
00069464  str.w   r1, [r0, r3, lsl #3]
00069468  mov     r0, r1
0006946a  b       #0x69406
0006946c  movs    r3, #0x40
0006946e  str.w   r3, [ip, #0x44]
00069472  ldr     r3, [pc, #0x54]
00069474  movw    r2, #0xa2a
00069478  add     r3, pc ; -> 0x00068ea1  q_is_he_dizzy
0006947a  str.w   r3, [ip, #0x48]
0006947e  ldr.w   r3, [r0, #0xa4]
00069482  adds    r3, #1
00069484  str.w   r2, [r0, r3, lsl #3]
00069488  ldr.w   r3, [r0, #0xa4]
0006948c  ldr.w   r2, [pc, #0x3c]
00069490  adds    r3, #1
00069492  str.w   r3, [r0, #0xa4]
00069496  lsls    r3, r3, #3
00069498  adds    r3, r3, r0
0006949a  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006949c  str     r2, [r3, #4]
0006949e  ldr.w   r3, [r0, #0xa4]
000694a2  movs    r1, #0
000694a4  adds    r3, #1
000694a6  str.w   r1, [r0, r3, lsl #3]
000694aa  mov     r0, r1
000694ac  b       #0x69406
000694ae  ldr     r3, [pc, #0x20]
000694b0  add     r3, pc ; -> 0x000f31a4  t_do_fatality_2
000694b2  ldr     r1, [r3]
000694b4  lsls    r3, r2, #3
000694b6  adds    r3, r3, r0
000694b8  str     r1, [r3, #4]
000694ba  b       #0x6949e
000694bc  ldrh    r0, [r5, #0xe]
000694be  movs    r0, r2
000694c0  str     r0, [sp, #0x2c4]
000694c2  movs    r0, r0
000694c4  ldr     r5, [r5, #0x74]
000694c6  movs    r0, r0
000694c8  sxtab16 pc, r5, pc, ror #24
000694cc  ldrh    r7, [r0, #0x1a]
000694ce  movs    r0, r0
000694d0  ldr     r4, [sp, #0x3c0]
000694d2  movs    r0, r1
