========================================================================
t_r_pounce2  0x000444c0  180 bytes   mkreact.c
========================================================================

000444c0  push    {r4, r5, r7, lr}
000444c2  add     r7, sp, #8
000444c4  ldr.w   r3, [r0, #0xa4]
000444c8  movw    r2, #0x47b
000444cc  mov     r5, r0
000444ce  adds    r3, #1
000444d0  ldr.w   r4, [r0, #0x108]
000444d4  ldr.w   r3, [r0, r3, lsl #3]
000444d8  cmp     r3, r2
000444da  beq     #0x44550
000444dc  adds    r2, #4
000444de  cmp     r3, r2
000444e0  beq     #0x4452a
000444e2  cbnz    r3, #0x44524
000444e4  mov     r0, r4
000444e6  movs    r3, #2
000444e8  str     r3, [r4, #0x1c]
000444ea  bl      #0x580a4 ; -> group_sound
000444ee  movs    r3, #3
000444f0  str     r3, [r4, #0x48]
000444f2  mov     r0, r4
000444f4  movs    r3, #0x1e
000444f6  str     r3, [r4, #0x40]
000444f8  bl      #0x55474 ; -> find_ani_part2
000444fc  ldr     r2, [r4, #0x40]
000444fe  mov     r0, r4
00044500  adds    r3, r2, #4
00044502  str     r3, [r4, #0x44]
00044504  sub.w   r3, r2, #8
00044508  str     r3, [r4, #0x40]
0004450a  bl      #0x59e24 ; -> do_next_a9_frame
0004450e  ldr.w   r3, [r5, #0xa4]
00044512  movs    r0, #3
00044514  movw    r2, #0x47b
00044518  adds    r3, #1
0004451a  str.w   r2, [r5, r3, lsl #3]
0004451e  str.w   r0, [r5, #0xfc]
00044522  b       #0x44528
00044524  mvn     r0, #2
00044528  pop     {r4, r5, r7, pc}
0004452a  ldr     r3, [r4, #0x48]
0004452c  subs    r3, #1
0004452e  cmp     r3, #0
00044530  str     r3, [r4, #0x48]
00044532  bgt     #0x444f2
00044534  ldr.w   r3, [r0, #0xa4]
00044538  ldr     r2, [pc, #0x34]
0004453a  lsls    r3, r3, #3
0004453c  adds    r3, r3, r0
0004453e  add     r2, pc ; -> 0x000446bd  t_pounce4
00044540  str     r2, [r3, #4]
00044542  ldr.w   r3, [r0, #0xa4]
00044546  movs    r0, #0
00044548  adds    r3, #1
0004454a  str.w   r0, [r5, r3, lsl #3]
0004454e  b       #0x44528
00044550  ldr     r3, [r4, #0x44]
00044552  mov     r0, r4
00044554  str     r3, [r4, #0x40]
00044556  bl      #0x59e24 ; -> do_next_a9_frame
0004455a  ldr.w   r3, [r5, #0xa4]
0004455e  movs    r0, #3
00044560  movw    r2, #0x47f
00044564  adds    r3, #1
00044566  str.w   r2, [r5, r3, lsl #3]
0004456a  str.w   r0, [r5, #0xfc]
0004456e  b       #0x44528
00044570  lsls    r3, r7, #5
00044572  movs    r0, r0
