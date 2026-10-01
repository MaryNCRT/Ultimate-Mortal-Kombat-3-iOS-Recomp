========================================================================
t_r_swat_gun  0x00048478  276 bytes   mkreact.c
========================================================================

00048478  push    {r4, r5, r7, lr}
0004847a  add     r7, sp, #8
0004847c  ldr.w   r3, [r0, #0xa4]
00048480  mov     r5, r0
00048482  ldr.w   r4, [r0, #0x108]
00048486  adds    r3, #1
00048488  movw    r2, #0x242
0004848c  ldr.w   r0, [r0, r3, lsl #3]
00048490  cmp     r0, r2
00048492  beq     #0x48504
00048494  movw    r3, #0x255
00048498  cmp     r0, r3
0004849a  beq     #0x484d4
0004849c  cbz     r0, #0x484a4
0004849e  mvn     r0, #2
000484a2  pop     {r4, r5, r7, pc}
000484a4  str     r0, [r4, #0x30]
000484a6  str     r0, [r4, #0x34]
000484a8  str     r0, [r4, #0x38]
000484aa  ldr.w   r3, [r5, #0xa4]
000484ae  adds    r3, #1
000484b0  str.w   r2, [r5, r3, lsl #3]
000484b4  ldr.w   r3, [r5, #0xa4]
000484b8  ldr     r2, [pc, #0xc4]
000484ba  adds    r3, #1
000484bc  str.w   r3, [r5, #0xa4]
000484c0  lsls    r3, r3, #3
000484c2  adds    r3, r3, r5
000484c4  add     r2, pc ; -> 0x00044b85  t_reaction_start
000484c6  str     r2, [r3, #4]
000484c8  ldr.w   r3, [r5, #0xa4]
000484cc  adds    r3, #1
000484ce  str.w   r0, [r5, r3, lsl #3]
000484d2  b       #0x484a2
000484d4  ldr     r3, [r4, #0x44]
000484d6  subs    r3, #1
000484d8  cmp     r3, #0
000484da  str     r3, [r4, #0x44]
000484dc  ble     #0x48568
000484de  mov     r0, r4
000484e0  bl      #0x5a680 ; -> next_anirate
000484e4  ldr     r3, [r4, #0x48]
000484e6  subs    r3, #1
000484e8  cmp     r3, #0
000484ea  str     r3, [r4, #0x48]
000484ec  ble     #0x4854a
000484ee  ldr.w   r3, [r5, #0xa4]
000484f2  movs    r0, #1
000484f4  movw    r2, #0x255
000484f8  adds    r3, #1
000484fa  str.w   r2, [r5, r3, lsl #3]
000484fe  str.w   r0, [r5, #0xfc]
00048502  b       #0x484a2
00048504  mov     r0, r4
00048506  bl      #0x410e0 ; -> at_least_ground_level
0004850a  mov     r0, r4
0004850c  bl      #0x54f40 ; -> set_half_damage
00048510  ldr     r3, [pc, #0x70]
00048512  mov     r0, r4
00048514  str     r3, [r4, #0x48]
00048516  bl      #0x581e0 ; -> shake_a11
0004851a  mov     r0, r4
0004851c  mov.w   r3, #0x30000
00048520  str     r3, [r4, #0x1c]
00048522  bl      #0x55ab0 ; -> away_x_vel
00048526  mov     r0, r4
00048528  bl      #0x34fc4 ; -> death_scream
0004852c  mov     r0, r4
0004852e  movs    r3, #0x20
00048530  str     r3, [r4, #0x40]
00048532  bl      #0x55474 ; -> find_ani_part2
00048536  mov     r0, r4
00048538  movs    r3, #3
0004853a  str     r3, [r4, #0x1c]
0004853c  bl      #0x553a0 ; -> init_anirate
00048540  movs    r3, #0x30
00048542  str     r3, [r4, #0x48]
00048544  subs    r3, #0x2a
00048546  str     r3, [r4, #0x44]
00048548  b       #0x484ee
0004854a  ldr     r3, [pc, #0x3c]
0004854c  movs    r0, #0
0004854e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00048550  ldr     r2, [r3]
00048552  ldr.w   r3, [r5, #0xa4]
00048556  lsls    r3, r3, #3
00048558  adds    r3, r3, r5
0004855a  str     r2, [r3, #4]
0004855c  ldr.w   r3, [r5, #0xa4]
00048560  adds    r3, #1
00048562  str.w   r0, [r5, r3, lsl #3]
00048566  b       #0x484a2
00048568  mov     r0, r4
0004856a  movs    r3, #5
0004856c  str     r3, [r4, #0x1c]
0004856e  bl      #0x5877c ; -> create_blood_proc
00048572  mov     r0, r4
00048574  movs    r1, #3
00048576  bl      #0x57dbc ; -> rsnd_func
0004857a  movs    r3, #6
0004857c  str     r3, [r4, #0x44]
0004857e  b       #0x484de
00048580  stm     r6!, {r0, r2, r3, r4, r5, r7}
