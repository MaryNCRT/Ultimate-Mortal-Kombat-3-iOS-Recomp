========================================================================
t_tugged_in_by_spear  0x0007c504  248 bytes   mkzap.c
========================================================================

0007c504  push    {r4, r5, r7, lr}
0007c506  add     r7, sp, #8
0007c508  ldr.w   r3, [r0, #0xa4]
0007c50c  movw    r2, #0x44f
0007c510  mov     r5, r0
0007c512  adds    r3, #1
0007c514  ldr.w   r4, [r0, #0x108]
0007c518  ldr.w   r3, [r0, r3, lsl #3]
0007c51c  cmp     r3, r2
0007c51e  beq     #0x7c58c
0007c520  adds    r2, #0x10
0007c522  cmp     r3, r2
0007c524  beq     #0x7c556
0007c526  cbnz    r3, #0x7c550
0007c528  mov     r0, r4
0007c52a  mov.w   r3, #0x80000
0007c52e  str     r3, [r4, #0x1c]
0007c530  bl      #0x55a94 ; -> towards_x_vel
0007c534  mov     r0, r4
0007c536  bl      #0x54f20 ; -> set_no_block
0007c53a  ldr.w   r3, [r5, #0xa4]
0007c53e  movs    r0, #1
0007c540  movw    r2, #0x44f
0007c544  adds    r3, #1
0007c546  str.w   r2, [r5, r3, lsl #3]
0007c54a  str.w   r0, [r5, #0xfc]
0007c54e  b       #0x7c554
0007c550  mvn     r0, #2
0007c554  pop     {r4, r5, r7, pc}
0007c556  mov     r0, r4
0007c558  bl      #0x5a680 ; -> next_anirate
0007c55c  mov     r0, r4
0007c55e  bl      #0x55060 ; -> is_he_airborn
0007c562  ldr     r3, [r4, #0x5c]
0007c564  cmp     r3, #0
0007c566  bne     #0x7c5d6
0007c568  ldr     r3, [r4, #0x48]
0007c56a  subs    r0, r3, #1
0007c56c  str     r0, [r4, #0x48]
0007c56e  cbnz    r0, #0x7c5c0
0007c570  ldr     r3, [pc, #0x80]
0007c572  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007c574  ldr     r2, [r3]
0007c576  ldr.w   r3, [r5, #0xa4]
0007c57a  lsls    r3, r3, #3
0007c57c  adds    r3, r3, r5
0007c57e  str     r2, [r3, #4]
0007c580  ldr.w   r3, [r5, #0xa4]
0007c584  adds    r3, #1
0007c586  str.w   r0, [r5, r3, lsl #3]
0007c58a  b       #0x7c554
0007c58c  mov     r0, r4
0007c58e  bl      #0x2f3a0 ; -> get_x_dist
0007c592  ldr     r3, [r4, #0x28]
0007c594  cmp     r3, #0x40
0007c596  bgt     #0x7c53a
0007c598  ldr     r3, [r4]
0007c59a  mov     r0, r4
0007c59c  movw    r2, #0x623
0007c5a0  str     r2, [r4, #0x1c]
0007c5a2  str     r2, [r3, #0x18]
0007c5a4  bl      #0x55c04 ; -> stop_me_player
0007c5a8  mov     r0, r4
0007c5aa  movs    r3, #0x25
0007c5ac  str     r3, [r4, #0x40]
0007c5ae  bl      #0x5a028 ; -> pose_a9_manual
0007c5b2  mov     r0, r4
0007c5b4  movs    r3, #8
0007c5b6  str     r3, [r4, #0x1c]
0007c5b8  bl      #0x553a0 ; -> init_anirate
0007c5bc  movs    r3, #0x40
0007c5be  str     r3, [r4, #0x48]
0007c5c0  ldr.w   r3, [r5, #0xa4]
0007c5c4  movs    r0, #1
0007c5c6  movw    r2, #0x45f
0007c5ca  adds    r3, #1
0007c5cc  str.w   r2, [r5, r3, lsl #3]
0007c5d0  str.w   r0, [r5, #0xfc]
0007c5d4  b       #0x7c554
0007c5d6  ldr     r3, [pc, #0x20]
0007c5d8  movs    r0, #0
0007c5da  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007c5dc  ldr     r2, [r3]
0007c5de  ldr.w   r3, [r5, #0xa4]
0007c5e2  lsls    r3, r3, #3
0007c5e4  adds    r3, r3, r5
0007c5e6  str     r2, [r3, #4]
0007c5e8  ldr.w   r3, [r5, #0xa4]
0007c5ec  adds    r3, #1
0007c5ee  str.w   r0, [r5, r3, lsl #3]
0007c5f2  b       #0x7c554
0007c5f4  strb    r2, [r2, #6]
0007c5f6  movs    r7, r0
0007c5f8  strb    r2, [r5, #4]
0007c5fa  movs    r7, r0
