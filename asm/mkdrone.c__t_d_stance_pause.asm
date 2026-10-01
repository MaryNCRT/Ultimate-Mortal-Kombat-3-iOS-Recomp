========================================================================
t_d_stance_pause  0x000720d4  272 bytes   mkdrone.c
========================================================================

000720d4  push    {r4, r5, r7, lr}
000720d6  add     r7, sp, #8
000720d8  ldr.w   r3, [r0, #0xa4]
000720dc  movw    r2, #0x2aa
000720e0  mov     r4, r0
000720e2  adds    r1, r3, #1
000720e4  ldr.w   r5, [r0, #0x108]
000720e8  ldr.w   r3, [r0, r1, lsl #3]
000720ec  cmp     r3, r2
000720ee  beq     #0x72162
000720f0  ble     #0x72106
000720f2  movw    r2, #0x2ab
000720f6  cmp     r3, r2
000720f8  beq     #0x72190
000720fa  adds    r2, #4
000720fc  cmp     r3, r2
000720fe  beq     #0x72146
00072100  mvn     r0, #2
00072104  pop     {r4, r5, r7, pc}
00072106  cmp     r3, #0
00072108  bne     #0x72100
0007210a  mov     r0, r5
0007210c  bl      #0x71e0c ; -> d_stance_setup
00072110  mov     r0, r5
00072112  bl      #0x5a680 ; -> next_anirate
00072116  ldr.w   r3, [r4, #0xa4]
0007211a  movw    r2, #0x2aa
0007211e  adds    r3, #1
00072120  str.w   r2, [r4, r3, lsl #3]
00072124  ldr     r2, [pc, #0xac]
00072126  ldr.w   r3, [r4, #0xa4]
0007212a  add     r2, pc ; -> 0x0006c40d  t_d_beware
0007212c  adds    r3, #1
0007212e  str.w   r3, [r4, #0xa4]
00072132  lsls    r3, r3, #3
00072134  adds    r3, r3, r4
00072136  movs    r0, #0
00072138  str     r2, [r3, #4]
0007213a  ldr.w   r3, [r4, #0xa4]
0007213e  adds    r3, #1
00072140  str.w   r0, [r4, r3, lsl #3]
00072144  b       #0x72104
00072146  ldr     r3, [r5, #0x44]
00072148  subs    r3, #1
0007214a  cmp     r3, #0
0007214c  str     r3, [r5, #0x44]
0007214e  bgt     #0x72110
00072150  ldr.w   r3, [r0, #0xa4]
00072154  cmp     r3, #0
00072156  ble     #0x721c8
00072158  subs    r3, #1
0007215a  str.w   r3, [r0, #0xa4]
0007215e  movs    r0, #0
00072160  b       #0x72104
00072162  movw    r3, #0x2ab
00072166  str.w   r3, [r0, r1, lsl #3]
0007216a  ldr.w   r3, [r0, #0xa4]
0007216e  adds    r2, r3, #1
00072170  ldr.w   r3, [pc, #0x64]
00072174  str.w   r2, [r0, #0xa4]
00072178  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
0007217a  ldr     r1, [r3]
0007217c  lsls    r3, r2, #3
0007217e  adds    r3, r3, r0
00072180  str     r1, [r3, #4]
00072182  ldr.w   r3, [r0, #0xa4]
00072186  movs    r0, #0
00072188  adds    r3, #1
0007218a  str.w   r0, [r4, r3, lsl #3]
0007218e  b       #0x72104
00072190  mov     r0, r5
00072192  bl      #0x551f0 ; -> am_i_facing_him
00072196  cbnz    r0, #0x721b2
00072198  ldr.w   r3, [r4, #0xa4]
0007219c  ldr     r2, [pc, #0x3c]
0007219e  lsls    r3, r3, #3
000721a0  adds    r3, r3, r4
000721a2  add     r2, pc ; -> 0x00070675  t_d_turnaround
000721a4  str     r2, [r3, #4]
000721a6  ldr.w   r3, [r4, #0xa4]
000721aa  adds    r3, #1
000721ac  str.w   r0, [r4, r3, lsl #3]
000721b0  b       #0x72104
000721b2  ldr.w   r3, [r4, #0xa4]
000721b6  movs    r0, #1
000721b8  movw    r2, #0x2af
000721bc  adds    r3, #1
000721be  str.w   r2, [r4, r3, lsl #3]
000721c2  str.w   r0, [r4, #0xfc]
000721c6  b       #0x72104
000721c8  ldr.w   r2, [pc, #0x14]
000721cc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
000721ce  ldr     r2, [r2]
000721d0  b       #0x72132
000721d2  nop     
000721d4  adr     r2, #0x37c
