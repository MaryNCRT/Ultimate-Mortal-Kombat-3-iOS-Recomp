========================================================================
t_boss_ease_back  0x000aaa44  364 bytes   mkboss.c
========================================================================

000aaa44  push    {r4, r5, r7, lr}
000aaa46  add     r7, sp, #8
000aaa48  ldr.w   r3, [r0, #0xa4]
000aaa4c  mov     r5, r0
000aaa4e  ldr.w   r4, [r0, #0x108]
000aaa52  adds    r3, #1
000aaa54  ldr.w   r3, [r0, r3, lsl #3]
000aaa58  cmp.w   r3, #0x460
000aaa5c  beq     #0xaab04
000aaa5e  ble     #0xaaa74
000aaa60  movw    r2, #0x465
000aaa64  cmp     r3, r2
000aaa66  beq     #0xaab2e
000aaa68  adds    r2, #2
000aaa6a  cmp     r3, r2
000aaa6c  beq     #0xaaaec
000aaa6e  mvn     r0, #2
000aaa72  pop     {r4, r5, r7, pc}
000aaa74  cmp     r3, #0
000aaa76  bne     #0xaaa6e
000aaa78  mov     r0, r4
000aaa7a  bl      #0x552f4 ; -> get_walk_info_b
000aaa7e  ldr.w   r1, [r5, #0xf8]
000aaa82  ldr     r2, [r4, #0x1c]
000aaa84  mov     r0, r4
000aaa86  lsls    r3, r1, #2
000aaa88  adds    r3, r3, r5
000aaa8a  str.w   r2, [r3, #0xa8]
000aaa8e  adds    r3, r1, #1
000aaa90  str.w   r3, [r5, #0xf8]
000aaa94  ldr     r3, [r4, #0x24]
000aaa96  str     r3, [r4, #0x40]
000aaa98  ldr     r3, [r4, #0x20]
000aaa9a  str     r3, [r4, #0x1c]
000aaa9c  bl      #0x55a68 ; -> set_x_vel_player
000aaaa0  mov     r0, r4
000aaaa2  bl      #0x5520c ; -> get_char_ani
000aaaa6  ldr.w   r3, [r5, #0xf8]
000aaaaa  mov     r0, r4
000aaaac  subs    r3, #1
000aaaae  str.w   r3, [r5, #0xf8]
000aaab2  lsls    r3, r3, #2
000aaab4  adds    r3, r3, r5
000aaab6  ldr.w   r3, [r3, #0xa8]
000aaaba  str     r3, [r4, #0x1c]
000aaabc  bl      #0x553a0 ; -> init_anirate
000aaac0  movs    r3, #0x60
000aaac2  str     r3, [r4, #0x44]
000aaac4  mov     r0, r4
000aaac6  bl      #0x551f0 ; -> am_i_facing_him
000aaaca  ldr     r0, [r4, #0x5c]
000aaacc  cmp     r0, #0
000aaace  bne     #0xaab66
000aaad0  ldr     r3, [pc, #0xc8]
000aaad2  add     r3, pc ; -> 0x000f3420  t_d_turnaround
000aaad4  ldr     r2, [r3]
000aaad6  ldr.w   r3, [r5, #0xa4]
000aaada  lsls    r3, r3, #3
000aaadc  adds    r3, r3, r5
000aaade  str     r2, [r3, #4]
000aaae0  ldr.w   r3, [r5, #0xa4]
000aaae4  adds    r3, #1
000aaae6  str.w   r0, [r5, r3, lsl #3]
000aaaea  b       #0xaaa72
000aaaec  mov     r0, r4
000aaaee  bl      #0x2f3a0 ; -> get_x_dist
000aaaf2  ldr     r3, [r4, #0x44]
000aaaf4  subs    r0, r3, #1
000aaaf6  str     r0, [r4, #0x44]
000aaaf8  cmp     r0, #0
000aaafa  bne     #0xaaac4
000aaafc  ldr.w   r2, [pc, #0xa0]
000aab00  add     r2, pc ; -> 0x000a885d  t_sk_stance_pause
000aab02  b       #0xaaad6
000aab04  mov     r0, r4
000aab06  bl      #0x2f3a0 ; -> get_x_dist
000aab0a  ldr     r0, [r4, #0x28]
000aab0c  cmp.w   r0, #0x100
000aab10  ble     #0xaab7c
000aab12  ldr.w   r3, [r5, #0xa4]
000aab16  ldr     r2, [pc, #0x8c]
000aab18  movs    r0, #0
000aab1a  lsls    r3, r3, #3
000aab1c  adds    r3, r3, r5
000aab1e  add     r2, pc ; -> 0x000a9811  t_ease5
000aab20  str     r2, [r3, #4]
000aab22  ldr.w   r3, [r5, #0xa4]
000aab26  adds    r3, #1
000aab28  str.w   r0, [r5, r3, lsl #3]
000aab2c  b       #0xaaa72
000aab2e  mov     r0, r4
000aab30  bl      #0x5a680 ; -> next_anirate
000aab34  ldr.w   r3, [r5, #0xa4]
000aab38  movw    r2, #0x467
000aab3c  adds    r3, #1
000aab3e  str.w   r2, [r5, r3, lsl #3]
000aab42  ldr.w   r3, [r5, #0xa4]
000aab46  adds    r2, r3, #1
000aab48  ldr     r3, [pc, #0x5c]
000aab4a  str.w   r2, [r5, #0xa4]
000aab4e  add     r3, pc ; -> 0x000f373c  t_d_beware
000aab50  ldr     r1, [r3]
000aab52  lsls    r3, r2, #3
000aab54  adds    r3, r3, r5
000aab56  movs    r0, #0
000aab58  str     r1, [r3, #4]
000aab5a  ldr.w   r3, [r5, #0xa4]
000aab5e  adds    r3, #1
000aab60  str.w   r0, [r5, r3, lsl #3]
000aab64  b       #0xaaa72
000aab66  ldr.w   r3, [r5, #0xa4]
000aab6a  movs    r0, #1
000aab6c  mov.w   r2, #0x460
000aab70  adds    r3, #1
000aab72  str.w   r2, [r5, r3, lsl #3]
000aab76  str.w   r0, [r5, #0xfc]
000aab7a  b       #0xaaa72
000aab7c  ldr.w   r3, [r5, #0xa4]
000aab80  movw    r2, #0x465
000aab84  adds    r3, #1
000aab86  str.w   r2, [r5, r3, lsl #3]
000aab8a  ldr.w   r3, [r5, #0xa4]
000aab8e  adds    r2, r3, #1
000aab90  ldr.w   r3, [pc, #0x18]
000aab94  str.w   r2, [r5, #0xa4]
000aab98  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
000aab9a  b       #0xaab50
000aab9c  ldrh    r2, [r1, #0xa]
000aab9e  movs    r4, r0
000aaba0  ble     #0xaac56
