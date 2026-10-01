========================================================================
t_sk_air_charge  0x000ab008  520 bytes   mkboss.c
========================================================================

000ab008  push    {r4, r5, r6, r7, lr}
000ab00a  add     r7, sp, #0xc
000ab00c  str     r8, [sp, #-0x4]!
000ab010  ldr.w   r3, [r0, #0xa4]
000ab014  mov     r6, r0
000ab016  ldr.w   r5, [r0, #0x108]
000ab01a  adds    r3, #1
000ab01c  ldr.w   r4, [r0, r3, lsl #3]
000ab020  movw    r3, #0x397
000ab024  cmp     r4, r3
000ab026  beq.w   #0xab150
000ab02a  ble     #0xab04a
000ab02c  movw    r3, #0x3c6
000ab030  cmp     r4, r3
000ab032  beq     #0xab10e
000ab034  adds    r3, #7
000ab036  cmp     r4, r3
000ab038  beq     #0xab0de
000ab03a  subs    r3, #0x24
000ab03c  cmp     r4, r3
000ab03e  beq     #0xab0de
000ab040  mvn     r0, #2
000ab044  ldr     r8, [sp], #4
000ab048  pop     {r4, r5, r6, r7, pc}
000ab04a  movw    r8, #0x383
000ab04e  cmp     r4, r8
000ab050  beq     #0xab134
000ab052  subs    r3, #0x12
000ab054  cmp     r4, r3
000ab056  beq     #0xab09a
000ab058  cmp     r4, #0
000ab05a  bne     #0xab040
000ab05c  mov     r0, r5
000ab05e  bl      #0x587c8 ; -> init_special
000ab062  mov     r0, r5
000ab064  str     r4, [r5, #0x1c]
000ab066  bl      #0x580a4 ; -> group_sound
000ab06a  mov     r0, r5
000ab06c  str     r4, [r5, #0x1c]
000ab06e  bl      #0x57be4 ; -> ochar_sound
000ab072  mov     r0, r5
000ab074  bl      #0x54ed0 ; -> set_nocol
000ab078  mov     r0, r5
000ab07a  movs    r3, #0x14
000ab07c  str     r3, [r5, #0x40]
000ab07e  bl      #0x5520c ; -> get_char_ani
000ab082  mov     r0, r5
000ab084  bl      #0x59e24 ; -> do_next_a9_frame
000ab088  ldr.w   r3, [r6, #0xa4]
000ab08c  movs    r0, #3
000ab08e  adds    r3, #1
000ab090  str.w   r8, [r6, r3, lsl #3]
000ab094  str.w   r0, [r6, #0xfc]
000ab098  b       #0xab044
000ab09a  mov     r0, r5
000ab09c  movs    r4, #4
000ab09e  str     r4, [r5, #0x1c]
000ab0a0  bl      #0x553a0 ; -> init_anirate
000ab0a4  mov     r0, r5
000ab0a6  movs    r3, #1
000ab0a8  str     r3, [r5, #0x1c]
000ab0aa  bl      #0x58d70 ; -> create_fx
000ab0ae  ldr     r2, [pc, #0x158]
000ab0b0  ldr     r3, [r5, #8]
000ab0b2  mov     r0, r5
000ab0b4  str     r2, [r5, #0x20]
000ab0b6  str     r2, [r3, #0x1c]
000ab0b8  mov.w   r3, #0xa0000
000ab0bc  str     r3, [r5, #0x1c]
000ab0be  bl      #0x55a94 ; -> towards_x_vel
000ab0c2  movs    r3, #0x10
000ab0c4  str     r4, [r5, #0x44]
000ab0c6  str     r3, [r5, #0x48]
000ab0c8  ldr.w   r3, [r6, #0xa4]
000ab0cc  movs    r0, #1
000ab0ce  movw    r2, #0x397
000ab0d2  adds    r3, #1
000ab0d4  str.w   r2, [r6, r3, lsl #3]
000ab0d8  str.w   r0, [r6, #0xfc]
000ab0dc  b       #0xab044
000ab0de  mov     r0, r5
000ab0e0  movs    r3, #0x14
000ab0e2  str     r3, [r5, #0x40]
000ab0e4  bl      #0x55474 ; -> find_ani_part2
000ab0e8  mov     r0, r5
000ab0ea  bl      #0x59e24 ; -> do_next_a9_frame
000ab0ee  ldr.w   r3, [pc, #0x11c]
000ab0f2  movs    r0, #0
000ab0f4  add     r3, pc ; -> 0x000f3424  t_drop_down_land_jump
000ab0f6  ldr     r2, [r3]
000ab0f8  ldr.w   r3, [r6, #0xa4]
000ab0fc  lsls    r3, r3, #3
000ab0fe  adds    r3, r3, r6
000ab100  str     r2, [r3, #4]
000ab102  ldr.w   r3, [r6, #0xa4]
000ab106  adds    r3, #1
000ab108  str.w   r0, [r6, r3, lsl #3]
000ab10c  b       #0xab044
000ab10e  ldr     r3, [r5, #0x48]
000ab110  subs    r3, #1
000ab112  str     r3, [r5, #0x48]
000ab114  cmp     r3, #0
000ab116  bne     #0xab180
000ab118  mov     r0, r5
000ab11a  bl      #0x55c04 ; -> stop_me_player
000ab11e  ldr.w   r3, [r6, #0xa4]
000ab122  movs    r0, #8
000ab124  movw    r2, #0x3cd
000ab128  adds    r3, #1
000ab12a  str.w   r2, [r6, r3, lsl #3]
000ab12e  str.w   r0, [r6, #0xfc]
000ab132  b       #0xab044
000ab134  mov     r0, r5
000ab136  bl      #0x59e24 ; -> do_next_a9_frame
000ab13a  ldr.w   r3, [r6, #0xa4]
000ab13e  movs    r0, #3
000ab140  movw    r2, #0x385
000ab144  adds    r3, #1
000ab146  str.w   r2, [r6, r3, lsl #3]
000ab14a  str.w   r0, [r6, #0xfc]
000ab14e  b       #0xab044
000ab150  mov     r0, r5
000ab152  bl      #0x5a680 ; -> next_anirate
000ab156  ldr     r3, [r5, #0x44]
000ab158  subs    r3, #1
000ab15a  str     r3, [r5, #0x44]
000ab15c  cmp     r3, #0
000ab15e  beq     #0xab1bc
000ab160  ldr     r3, [r5, #0x48]
000ab162  subs    r3, #1
000ab164  str     r3, [r5, #0x48]
000ab166  cmp     r3, #0
000ab168  bne     #0xab0c8
000ab16a  mov     r0, r5
000ab16c  bl      #0x54ee0 ; -> clear_nocol
000ab170  mov     r0, r5
000ab172  bl      #0x551f0 ; -> am_i_facing_him
000ab176  ldr     r3, [r5, #0x5c]
000ab178  cmp     r3, #0
000ab17a  beq     #0xab118
000ab17c  movs    r3, #8
000ab17e  str     r3, [r5, #0x48]
000ab180  ldr     r3, [r5, #8]
000ab182  mov     r0, r5
000ab184  ldr     r3, [r3, #0x18]
000ab186  cmp     r3, #0
000ab188  str     r3, [r5, #0x1c]
000ab18a  itt     lt
000ab18c  rsblt   r3, r3, #0
000ab18e  strlt   r3, [r5, #0x1c]
000ab190  ldr     r2, [r5, #0x1c]
000ab192  asrs    r3, r2, #2
000ab194  subs    r2, r2, r3
000ab196  str     r3, [r5, #0x20]
000ab198  asrs    r3, r2, #3
000ab19a  str     r3, [r5, #0x24]
000ab19c  rsb     r3, r3, r2
000ab1a0  str     r3, [r5, #0x1c]
000ab1a2  bl      #0x55a94 ; -> towards_x_vel
000ab1a6  ldr.w   r3, [r6, #0xa4]
000ab1aa  movs    r0, #1
000ab1ac  movw    r2, #0x3c6
000ab1b0  adds    r3, #1
000ab1b2  str.w   r2, [r6, r3, lsl #3]
000ab1b6  str.w   r0, [r6, #0xfc]
000ab1ba  b       #0xab044
000ab1bc  adds    r3, #1
000ab1be  mov     r0, r5
000ab1c0  str     r3, [r5, #0x44]
000ab1c2  adds    r3, #4
000ab1c4  str     r3, [r5, #0x1c]
000ab1c6  bl      #0x594c8 ; -> strike_check_a0
000ab1ca  ldr     r3, [r5, #0x5c]
000ab1cc  cmp     r3, #0
000ab1ce  beq     #0xab160
000ab1d0  mov     r0, r5
000ab1d2  bl      #0x54ee0 ; -> clear_nocol
000ab1d6  mov     r0, r5
000ab1d8  bl      #0x55c04 ; -> stop_me_player
000ab1dc  mov     r0, r5
000ab1de  movs    r3, #0x14
000ab1e0  str     r3, [r5, #0x40]
000ab1e2  bl      #0x5520c ; -> get_char_ani
000ab1e6  mov     r0, r5
000ab1e8  bl      #0x55428 ; -> find_last_frame
000ab1ec  mov     r0, r5
000ab1ee  bl      #0x59e24 ; -> do_next_a9_frame
000ab1f2  ldr.w   r3, [r6, #0xa4]
000ab1f6  movs    r0, #0x18
000ab1f8  movw    r2, #0x3a9
000ab1fc  adds    r3, #1
000ab1fe  str.w   r2, [r6, r3, lsl #3]
000ab202  str.w   r0, [r6, #0xfc]
000ab206  b       #0xab044
000ab208  movs    r0, r0
