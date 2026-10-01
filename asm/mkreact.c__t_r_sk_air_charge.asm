========================================================================
t_r_sk_air_charge  0x000450d0  352 bytes   mkreact.c
========================================================================

000450d0  push    {r4, r5, r6, r7, lr}
000450d2  add     r7, sp, #0xc
000450d4  ldr.w   r1, [r0, #0xa4]
000450d8  mov     r5, r0
000450da  ldr.w   r4, [r0, #0x108]
000450de  adds    r3, r1, #1
000450e0  movw    r6, #0xd51
000450e4  ldr.w   r0, [r0, r3, lsl #3]
000450e8  cmp     r0, r6
000450ea  beq     #0x451dc
000450ec  ble     #0x45106
000450ee  movw    r2, #0xd57
000450f2  cmp     r0, r2
000450f4  beq.w   #0x4520e
000450f8  movw    r3, #0xd58
000450fc  cmp     r0, r3
000450fe  beq     #0x451c4
00045100  mvn     r0, #2
00045104  pop     {r4, r5, r6, r7, pc}
00045106  cmp     r0, #0
00045108  beq     #0x4518e
0004510a  movw    r3, #0xd3f
0004510e  cmp     r0, r3
00045110  bne     #0x45100
00045112  mov     r0, r4
00045114  movs    r3, #4
00045116  str     r3, [r4, #0x1c]
00045118  bl      #0x5877c ; -> create_blood_proc
0004511c  mov     r0, r4
0004511e  movs    r3, #1
00045120  str     r3, [r4, #0x1c]
00045122  bl      #0x5877c ; -> create_blood_proc
00045126  mov     r0, r4
00045128  movs    r3, #2
0004512a  str     r3, [r4, #0x1c]
0004512c  bl      #0x580a4 ; -> group_sound
00045130  mov     r0, r4
00045132  movs    r1, #0xa
00045134  bl      #0x57dbc ; -> rsnd_func
00045138  mov     r0, r4
0004513a  mov.w   r3, #0xa000a
0004513e  str     r3, [r4, #0x48]
00045140  bl      #0x581e0 ; -> shake_a11
00045144  mov.w   r3, #0x60000
00045148  str     r3, [r4, #0x1c]
0004514a  sub.w   r3, r3, #0xc0000
0004514e  str     r3, [r4, #0x20]
00045150  add.w   r3, r3, #0x68000
00045154  str     r3, [r4, #0x24]
00045156  movs    r3, #5
00045158  str     r3, [r4, #0x28]
0004515a  adds    r3, #0x19
0004515c  str     r3, [r4, #0x40]
0004515e  ldr.w   r3, [r5, #0xa4]
00045162  adds    r3, #1
00045164  str.w   r6, [r5, r3, lsl #3]
00045168  ldr.w   r3, [r5, #0xa4]
0004516c  adds    r2, r3, #1
0004516e  ldr.w   r3, [pc, #0xb0]
00045172  str.w   r2, [r5, #0xa4]
00045176  add     r3, pc ; -> 0x000f3720  t_flight
00045178  ldr     r1, [r3]
0004517a  lsls    r3, r2, #3
0004517c  adds    r3, r3, r5
0004517e  movs    r0, #0
00045180  str     r1, [r3, #4]
00045182  ldr.w   r3, [r5, #0xa4]
00045186  adds    r3, #1
00045188  str.w   r0, [r5, r3, lsl #3]
0004518c  b       #0x45104
0004518e  str     r0, [r4, #0x30]
00045190  str     r0, [r4, #0x38]
00045192  movs    r3, #1
00045194  str     r3, [r4, #0x34]
00045196  ldr.w   r3, [r5, #0xa4]
0004519a  movw    r2, #0xd3f
0004519e  adds    r3, #1
000451a0  str.w   r2, [r5, r3, lsl #3]
000451a4  ldr.w   r3, [r5, #0xa4]
000451a8  ldr     r2, [pc, #0x78]
000451aa  adds    r3, #1
000451ac  str.w   r3, [r5, #0xa4]
000451b0  lsls    r3, r3, #3
000451b2  adds    r3, r3, r5
000451b4  add     r2, pc ; -> 0x00044b85  t_reaction_start
000451b6  str     r2, [r3, #4]
000451b8  ldr.w   r3, [r5, #0xa4]
000451bc  adds    r3, #1
000451be  str.w   r0, [r5, r3, lsl #3]
000451c2  b       #0x45104
000451c4  ldr     r2, [pc, #0x60]
000451c6  lsls    r3, r1, #3
000451c8  adds    r3, r3, r5
000451ca  add     r2, pc ; -> 0x00041f8d  t_getup_reaction_exit
000451cc  str     r2, [r3, #4]
000451ce  ldr.w   r3, [r5, #0xa4]
000451d2  movs    r0, #0
000451d4  adds    r3, #1
000451d6  str.w   r0, [r5, r3, lsl #3]
000451da  b       #0x45104
000451dc  mov     r0, r4
000451de  bl      #0x424fc ; -> shake_n_sound
000451e2  mov     r0, r4
000451e4  movs    r3, #0x1e
000451e6  str     r3, [r4, #0x40]
000451e8  bl      #0x55474 ; -> find_ani_part2
000451ec  movs    r3, #6
000451ee  str     r3, [r4, #0x1c]
000451f0  ldr.w   r3, [r5, #0xa4]
000451f4  movw    r2, #0xd57
000451f8  adds    r3, #1
000451fa  str.w   r2, [r5, r3, lsl #3]
000451fe  ldr.w   r3, [r5, #0xa4]
00045202  adds    r2, r3, #1
00045204  ldr     r3, [pc, #0x24]
00045206  str.w   r2, [r5, #0xa4]
0004520a  add     r3, pc ; -> 0x000f37cc  t_mframew
0004520c  b       #0x45178
0004520e  movs    r0, #4
00045210  movw    r2, #0xd58
00045214  str.w   r2, [r5, r3, lsl #3]
00045218  str.w   r0, [r5, #0xfc]
0004521c  b       #0x45104
0004521e  nop     
00045220  b       #0x44d70
00045222  movs    r2, r1
