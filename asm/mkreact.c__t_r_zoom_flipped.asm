========================================================================
t_r_zoom_flipped  0x000490c8  184 bytes   mkreact.c
========================================================================

000490c8  push    {r4, r5, r7, lr}
000490ca  add     r7, sp, #8
000490cc  ldr.w   r3, [r0, #0xa4]
000490d0  mov     r5, r0
000490d2  ldr.w   r4, [r0, #0x108]
000490d6  adds    r3, #1
000490d8  ldr.w   r0, [r0, r3, lsl #3]
000490dc  cbnz    r0, #0x49122
000490de  ldr     r3, [pc, #0x94]
000490e0  movw    r2, #0x443
000490e4  str     r3, [r4, #0x1c]
000490e6  add.w   r3, r3, #0x20000
000490ea  str     r3, [r4, #0x20]
000490ec  add.w   r3, r3, #0x68000
000490f0  str     r3, [r4, #0x24]
000490f2  movs    r3, #4
000490f4  str     r3, [r4, #0x28]
000490f6  ldr.w   r3, [r5, #0xa4]
000490fa  adds    r3, #1
000490fc  str.w   r2, [r5, r3, lsl #3]
00049100  ldr.w   r3, [r5, #0xa4]
00049104  adds    r2, r3, #1
00049106  ldr     r3, [pc, #0x70]
00049108  str.w   r2, [r5, #0xa4]
0004910c  add     r3, pc ; -> 0x000f3720  t_flight
0004910e  ldr     r1, [r3]
00049110  lsls    r3, r2, #3
00049112  adds    r3, r3, r5
00049114  str     r1, [r3, #4]
00049116  ldr.w   r3, [r5, #0xa4]
0004911a  adds    r3, #1
0004911c  str.w   r0, [r5, r3, lsl #3]
00049120  pop     {r4, r5, r7, pc}
00049122  movw    r3, #0x443
00049126  cmp     r0, r3
00049128  it      ne
0004912a  mvnne   r0, #2
0004912e  bne     #0x49120
00049130  movs    r3, #0x20
00049132  str     r3, [r4, #0x44]
00049134  ldr     r3, [r4]
00049136  ldr     r3, [r3, #0x44]
00049138  cmp     r3, #3
0004913a  str     r3, [r4, #0x1c]
0004913c  bgt     #0x4916c
0004913e  mov     r0, r4
00049140  bl      #0x59650 ; -> damage_to_me
00049144  ldr     r2, [r4]
00049146  ldr     r3, [r4, #0x44]
00049148  movs    r0, #0
0004914a  ldr     r1, [r2, #0x54]
0004914c  add     r3, r1
0004914e  str     r3, [r4, #0x20]
00049150  str     r3, [r2, #0x54]
00049152  ldr.w   r3, [r5, #0xa4]
00049156  ldr     r2, [pc, #0x24]
00049158  lsls    r3, r3, #3
0004915a  adds    r3, r3, r5
0004915c  add     r2, pc ; -> 0x00042519  t_land_on_my_back
0004915e  str     r2, [r3, #4]
00049160  ldr.w   r3, [r5, #0xa4]
00049164  adds    r3, #1
00049166  str.w   r0, [r5, r3, lsl #3]
0004916a  b       #0x49120
0004916c  movs    r3, #8
0004916e  str     r3, [r4, #0x44]
00049170  b       #0x4913e
00049172  nop     
00049174  movs    r0, r0
00049176  vqshlu.s32 d26, d0, #0x18
0004917a  movs    r2, r1
0004917c  str     r3, [sp, #0x2e4]
