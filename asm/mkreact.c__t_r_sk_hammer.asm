========================================================================
t_r_sk_hammer  0x000463bc  284 bytes   mkreact.c
========================================================================

000463bc  push    {r4, r5, r7, lr}
000463be  add     r7, sp, #8
000463c0  ldr.w   r3, [r0, #0xa4]
000463c4  mov     r5, r0
000463c6  ldr.w   r4, [r0, #0x108]
000463ca  adds    r3, #1
000463cc  ldr.w   r0, [r0, r3, lsl #3]
000463d0  cmp.w   r0, #0xd20
000463d4  beq     #0x4644e
000463d6  movw    r3, #0xd32
000463da  cmp     r0, r3
000463dc  beq     #0x46422
000463de  cbz     r0, #0x463e6
000463e0  mvn     r0, #2
000463e4  pop     {r4, r5, r7, pc}
000463e6  movs    r3, #1
000463e8  str     r3, [r4, #0x34]
000463ea  ldr     r3, [pc, #0xd8]
000463ec  str     r0, [r4, #0x38]
000463ee  mov.w   r2, #0xd20
000463f2  add     r3, pc ; -> 0x00044ef5  t_r_motaro_kick
000463f4  str     r3, [r4, #0x30]
000463f6  ldr.w   r3, [r5, #0xa4]
000463fa  adds    r3, #1
000463fc  str.w   r2, [r5, r3, lsl #3]
00046400  ldr.w   r3, [r5, #0xa4]
00046404  ldr.w   r2, [pc, #0xc0]
00046408  adds    r3, #1
0004640a  str.w   r3, [r5, #0xa4]
0004640e  lsls    r3, r3, #3
00046410  adds    r3, r3, r5
00046412  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046414  str     r2, [r3, #4]
00046416  ldr.w   r3, [r5, #0xa4]
0004641a  adds    r3, #1
0004641c  str.w   r0, [r5, r3, lsl #3]
00046420  b       #0x463e4
00046422  mov     r0, r4
00046424  bl      #0x55c04 ; -> stop_me_player
00046428  ldr     r0, [r4]
0004642a  mov.w   r3, #0x620
0004642e  str     r3, [r4, #0x1c]
00046430  ldr     r2, [pc, #0x98]
00046432  str     r3, [r0, #0x18]
00046434  ldr.w   r3, [r5, #0xa4]
00046438  add     r2, pc ; -> 0x00043f19  t_dizzy_by_boss
0004643a  movs    r0, #0
0004643c  lsls    r3, r3, #3
0004643e  adds    r3, r3, r5
00046440  str     r2, [r3, #4]
00046442  ldr.w   r3, [r5, #0xa4]
00046446  adds    r3, #1
00046448  str.w   r0, [r5, r3, lsl #3]
0004644c  b       #0x463e4
0004644e  mov     r0, r4
00046450  movs    r3, #2
00046452  str     r3, [r4, #0x1c]
00046454  bl      #0x57b94 ; -> his_ochar_sound
00046458  mov     r0, r4
0004645a  movs    r3, #9
0004645c  str     r3, [r4, #0x1c]
0004645e  bl      #0x580a4 ; -> group_sound
00046462  mov     r0, r4
00046464  mov.w   r3, #0xa000a
00046468  str     r3, [r4, #0x48]
0004646a  bl      #0x581e0 ; -> shake_a11
0004646e  mov     r0, r4
00046470  movs    r3, #4
00046472  str     r3, [r4, #0x1c]
00046474  bl      #0x5877c ; -> create_blood_proc
00046478  mov     r0, r4
0004647a  movs    r3, #1
0004647c  str     r3, [r4, #0x1c]
0004647e  bl      #0x5877c ; -> create_blood_proc
00046482  mov     r0, r4
00046484  mov.w   r3, #0x30000
00046488  str     r3, [r4, #0x1c]
0004648a  bl      #0x55ab0 ; -> away_x_vel
0004648e  ldr     r3, [pc, #0x40]
00046490  movw    r2, #0xd32
00046494  movs    r0, #0
00046496  str     r3, [r4, #0x40]
00046498  ldr.w   r3, [r5, #0xa4]
0004649c  adds    r3, #1
0004649e  str.w   r2, [r5, r3, lsl #3]
000464a2  ldr.w   r3, [r5, #0xa4]
000464a6  adds    r2, r3, #1
000464a8  ldr     r3, [pc, #0x28]
000464aa  str.w   r2, [r5, #0xa4]
000464ae  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000464b0  ldr     r1, [r3]
000464b2  lsls    r3, r2, #3
000464b4  adds    r3, r3, r5
000464b6  str     r1, [r3, #4]
000464b8  ldr.w   r3, [r5, #0xa4]
000464bc  adds    r3, #1
000464be  str.w   r0, [r5, r3, lsl #3]
000464c2  b       #0x463e4
