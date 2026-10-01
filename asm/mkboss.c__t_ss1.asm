========================================================================
t_ss1  0x000ab3d8  192 bytes   mkboss.c
========================================================================

000ab3d8  push    {r4, r5, r7, lr}
000ab3da  add     r7, sp, #8
000ab3dc  ldr.w   r3, [r0, #0xa4]
000ab3e0  movw    r2, #0x2ce
000ab3e4  mov     r4, r0
000ab3e6  adds    r3, #1
000ab3e8  ldr.w   r5, [r0, #0x108]
000ab3ec  ldr.w   r3, [r0, r3, lsl #3]
000ab3f0  cmp     r3, r2
000ab3f2  beq     #0xab450
000ab3f4  adds    r2, #4
000ab3f6  cmp     r3, r2
000ab3f8  beq     #0xab440
000ab3fa  cbnz    r3, #0xab43a
000ab3fc  mov     r0, r5
000ab3fe  bl      #0x553c4 ; -> stance_setup
000ab402  mov     r0, r5
000ab404  bl      #0x5a680 ; -> next_anirate
000ab408  ldr.w   r3, [r4, #0xa4]
000ab40c  movw    r2, #0x2ce
000ab410  movs    r0, #0
000ab412  adds    r3, #1
000ab414  str.w   r2, [r4, r3, lsl #3]
000ab418  ldr.w   r3, [r4, #0xa4]
000ab41c  adds    r2, r3, #1
000ab41e  ldr     r3, [pc, #0x6c]
000ab420  str.w   r2, [r4, #0xa4]
000ab424  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
000ab426  ldr     r1, [r3]
000ab428  lsls    r3, r2, #3
000ab42a  adds    r3, r3, r4
000ab42c  str     r1, [r3, #4]
000ab42e  ldr.w   r3, [r4, #0xa4]
000ab432  adds    r3, #1
000ab434  str.w   r0, [r4, r3, lsl #3]
000ab438  b       #0xab43e
000ab43a  mvn     r0, #2
000ab43e  pop     {r4, r5, r7, pc}
000ab440  ldr     r3, [r5, #0x44]
000ab442  subs    r0, r3, #1
000ab444  str     r0, [r5, #0x44]
000ab446  cmp     r0, #0
000ab448  bne     #0xab402
000ab44a  ldr     r3, [pc, #0x44]
000ab44c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000ab44e  b       #0xab45e
000ab450  mov     r0, r5
000ab452  bl      #0x551f0 ; -> am_i_facing_him
000ab456  ldr     r0, [r5, #0x5c]
000ab458  cbnz    r0, #0xab476
000ab45a  ldr     r3, [pc, #0x38]
000ab45c  add     r3, pc ; -> 0x000f3420  t_d_turnaround
000ab45e  ldr     r2, [r3]
000ab460  ldr.w   r3, [r4, #0xa4]
000ab464  lsls    r3, r3, #3
000ab466  adds    r3, r3, r4
000ab468  str     r2, [r3, #4]
000ab46a  ldr.w   r3, [r4, #0xa4]
000ab46e  adds    r3, #1
000ab470  str.w   r0, [r4, r3, lsl #3]
000ab474  b       #0xab43e
000ab476  ldr.w   r3, [r4, #0xa4]
000ab47a  movs    r0, #1
000ab47c  movw    r2, #0x2d2
000ab480  adds    r3, #1
000ab482  str.w   r2, [r4, r3, lsl #3]
000ab486  str.w   r0, [r4, #0xfc]
000ab48a  b       #0xab43e
000ab48c  strh    r0, [r0, #0x1c]
000ab48e  movs    r4, r0
000ab490  strh    r0, [r7, #0x14]
000ab492  movs    r4, r0
000ab494  ldrb    r0, [r0, #0x1f]
000ab496  movs    r4, r0
