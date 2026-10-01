========================================================================
t_d_turnaround_jsrp  0x000716d8  252 bytes   mkdrone.c
========================================================================

000716d8  push    {r4, r5, r6, r7, lr}
000716da  add     r7, sp, #0xc
000716dc  ldr.w   r3, [r0, #0xa4]
000716e0  mov     r4, r0
000716e2  ldr.w   r5, [r0, #0x108]
000716e6  adds    r2, r3, #1
000716e8  movw    r3, #0x1b3
000716ec  ldr.w   r6, [r0, r2, lsl #3]
000716f0  cmp     r6, r3
000716f2  beq     #0x7176a
000716f4  cmp.w   r6, #0x1b4
000716f8  beq     #0x7171c
000716fa  cbz     r6, #0x71702
000716fc  mvn     r0, #2
00071700  pop     {r4, r5, r6, r7, pc}
00071702  mov     r0, r5
00071704  bl      #0x551f0 ; -> am_i_facing_him
00071708  cbz     r0, #0x7173a
0007170a  ldr.w   r3, [r4, #0xa4]
0007170e  cmp     r3, #0
00071710  ble     #0x71794
00071712  subs    r3, #1
00071714  mov     r0, r6
00071716  str.w   r3, [r4, #0xa4]
0007171a  b       #0x71700
0007171c  mov     r0, r5
0007171e  bl      #0x5a680 ; -> next_anirate
00071722  ldr     r3, [r5, #0x40]
00071724  ldr     r0, [r3]
00071726  str     r0, [r5, #0x1c]
00071728  cbnz    r0, #0x71754
0007172a  ldr.w   r3, [r4, #0xa4]
0007172e  cmp     r3, #0
00071730  ble     #0x717ae
00071732  subs    r3, #1
00071734  str.w   r3, [r4, #0xa4]
00071738  b       #0x71700
0007173a  mov     r0, r5
0007173c  bl      #0x55c04 ; -> stop_me_player
00071740  mov     r0, r5
00071742  movs    r3, #3
00071744  str     r3, [r5, #0x40]
00071746  bl      #0x5520c ; -> get_char_ani
0007174a  mov     r0, r5
0007174c  movs    r3, #2
0007174e  str     r3, [r5, #0x1c]
00071750  bl      #0x553a0 ; -> init_anirate
00071754  ldr.w   r3, [r4, #0xa4]
00071758  movs    r0, #1
0007175a  movw    r2, #0x1b3
0007175e  adds    r3, #1
00071760  str.w   r2, [r4, r3, lsl #3]
00071764  str.w   r0, [r4, #0xfc]
00071768  b       #0x71700
0007176a  mov.w   r3, #0x1b4
0007176e  str.w   r3, [r0, r2, lsl #3]
00071772  ldr.w   r3, [r0, #0xa4]
00071776  ldr     r2, [pc, #0x50]
00071778  adds    r3, #1
0007177a  str.w   r3, [r0, #0xa4]
0007177e  lsls    r3, r3, #3
00071780  adds    r3, r3, r0
00071782  add     r2, pc ; -> 0x0006c40d  t_d_beware
00071784  str     r2, [r3, #4]
00071786  ldr.w   r3, [r0, #0xa4]
0007178a  movs    r0, #0
0007178c  adds    r3, #1
0007178e  str.w   r0, [r4, r3, lsl #3]
00071792  b       #0x71700
00071794  ldr     r2, [pc, #0x34]
00071796  lsls    r3, r3, #3
00071798  adds    r3, r3, r4
0007179a  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007179c  mov     r0, r6
0007179e  ldr     r2, [r2]
000717a0  str     r2, [r3, #4]
000717a2  ldr.w   r3, [r4, #0xa4]
000717a6  adds    r3, #1
000717a8  str.w   r6, [r4, r3, lsl #3]
000717ac  b       #0x71700
000717ae  ldr     r2, [pc, #0x20]
000717b0  lsls    r3, r3, #3
000717b2  adds    r3, r3, r4
000717b4  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000717b6  ldr     r2, [r2]
000717b8  str     r2, [r3, #4]
000717ba  ldr.w   r3, [r4, #0xa4]
000717be  adds    r3, #1
000717c0  str.w   r0, [r4, r3, lsl #3]
000717c4  b       #0x71700
000717c6  nop     
000717c8  add     r4, sp, #0x21c
