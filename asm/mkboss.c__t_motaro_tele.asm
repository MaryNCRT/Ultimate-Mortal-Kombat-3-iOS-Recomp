========================================================================
t_motaro_tele  0x000ab498  344 bytes   mkboss.c
========================================================================

000ab498  push    {r4, r5, r6, r7, lr}
000ab49a  add     r7, sp, #0xc
000ab49c  str     r8, [sp, #-0x4]!
000ab4a0  ldr.w   r3, [r0, #0xa4]
000ab4a4  movw    r8, #0x1fb
000ab4a8  mov     r5, r0
000ab4aa  adds    r3, #1
000ab4ac  ldr.w   r4, [r0, #0x108]
000ab4b0  ldr.w   r6, [r0, r3, lsl #3]
000ab4b4  cmp     r6, r8
000ab4b6  beq     #0xab54a
000ab4b8  ble     #0xab4d2
000ab4ba  movw    r3, #0x212
000ab4be  cmp     r6, r3
000ab4c0  beq     #0xab584
000ab4c2  adds    r3, #4
000ab4c4  cmp     r6, r3
000ab4c6  beq     #0xab526
000ab4c8  mvn     r0, #2
000ab4cc  ldr     r8, [sp], #4
000ab4d0  pop     {r4, r5, r6, r7, pc}
000ab4d2  cmp     r6, #0
000ab4d4  bne     #0xab4c8
000ab4d6  mov     r0, r4
000ab4d8  bl      #0x587c8 ; -> init_special
000ab4dc  movs    r1, #0x27
000ab4de  mov     r0, r4
000ab4e0  bl      #0x57dd0 ; -> tsound_func
000ab4e4  mov     r0, r4
000ab4e6  bl      #0x54ed0 ; -> set_nocol
000ab4ea  mov     r0, r4
000ab4ec  movs    r3, #5
000ab4ee  str     r3, [r4, #0x40]
000ab4f0  bl      #0x5520c ; -> get_char_ani
000ab4f4  movs    r3, #3
000ab4f6  str     r3, [r4, #0x1c]
000ab4f8  ldr.w   r3, [r5, #0xa4]
000ab4fc  mov     r0, r6
000ab4fe  adds    r3, #1
000ab500  str.w   r8, [r5, r3, lsl #3]
000ab504  ldr.w   r3, [r5, #0xa4]
000ab508  adds    r2, r3, #1
000ab50a  ldr     r3, [pc, #0xd8]
000ab50c  str.w   r2, [r5, #0xa4]
000ab510  add     r3, pc ; -> 0x000f37cc  t_mframew
000ab512  ldr     r1, [r3]
000ab514  lsls    r3, r2, #3
000ab516  adds    r3, r3, r5
000ab518  str     r1, [r3, #4]
000ab51a  ldr.w   r3, [r5, #0xa4]
000ab51e  adds    r3, #1
000ab520  str.w   r6, [r5, r3, lsl #3]
000ab524  b       #0xab4cc
000ab526  mov     r0, r4
000ab528  bl      #0x54ee0 ; -> clear_nocol
000ab52c  ldr     r3, [pc, #0xb8]
000ab52e  movs    r0, #0
000ab530  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000ab532  ldr     r2, [r3]
000ab534  ldr.w   r3, [r5, #0xa4]
000ab538  lsls    r3, r3, #3
000ab53a  adds    r3, r3, r5
000ab53c  str     r2, [r3, #4]
000ab53e  ldr.w   r3, [r5, #0xa4]
000ab542  adds    r3, #1
000ab544  str.w   r0, [r5, r3, lsl #3]
000ab548  b       #0xab4cc
000ab54a  mov     r0, r4
000ab54c  bl      #0x54f70 ; -> set_inviso
000ab550  mov     r0, r4
000ab552  bl      #0x708a8 ; -> q_is_he_cornered
000ab556  ldr     r6, [r4, #0x5c]
000ab558  cbnz    r6, #0xab5c6
000ab55a  mov     r0, r4
000ab55c  bl      #0x570f8 ; -> match_me_with_him
000ab560  mov     r0, r4
000ab562  mvn     r3, #0x6f
000ab566  str     r6, [r4, #0x20]
000ab568  str     r3, [r4, #0x1c]
000ab56a  bl      #0x570ac ; -> multi_adjust_xy
000ab56e  ldr.w   r3, [r5, #0xa4]
000ab572  movs    r0, #3
000ab574  movw    r2, #0x212
000ab578  adds    r3, #1
000ab57a  str.w   r2, [r5, r3, lsl #3]
000ab57e  str.w   r0, [r5, #0xfc]
000ab582  b       #0xab4cc
000ab584  mov     r0, r4
000ab586  bl      #0x5533c ; -> ground_player
000ab58a  mov     r0, r4
000ab58c  bl      #0x54f10 ; -> clear_inviso
000ab590  movs    r3, #3
000ab592  str     r3, [r4, #0x1c]
000ab594  ldr.w   r3, [r5, #0xa4]
000ab598  movw    r2, #0x216
000ab59c  movs    r0, #0
000ab59e  adds    r3, #1
000ab5a0  str.w   r2, [r5, r3, lsl #3]
000ab5a4  ldr.w   r3, [r5, #0xa4]
000ab5a8  adds    r2, r3, #1
000ab5aa  ldr     r3, [pc, #0x40]
000ab5ac  str.w   r2, [r5, #0xa4]
000ab5b0  add     r3, pc ; -> 0x000f37cc  t_mframew
000ab5b2  ldr     r1, [r3]
000ab5b4  lsls    r3, r2, #3
000ab5b6  adds    r3, r3, r5
000ab5b8  str     r1, [r3, #4]
000ab5ba  ldr.w   r3, [r5, #0xa4]
000ab5be  adds    r3, #1
000ab5c0  str.w   r0, [r5, r3, lsl #3]
000ab5c4  b       #0xab4cc
000ab5c6  mov     r0, r4
000ab5c8  bl      #0x570f8 ; -> match_me_with_him
000ab5cc  mov     r0, r4
000ab5ce  bl      #0x55394 ; -> flip_multi
000ab5d2  movs    r3, #0
000ab5d4  mov     r0, r4
000ab5d6  str     r3, [r4, #0x20]
000ab5d8  subs    r3, #0x70
000ab5da  str     r3, [r4, #0x1c]
000ab5dc  bl      #0x570ac ; -> multi_adjust_xy
000ab5e0  b       #0xab56e
000ab5e2  nop     
000ab5e4  strh    r0, [r7, #0x14]
000ab5e6  movs    r4, r0
000ab5e8  strh    r4, [r2, #0xe]
000ab5ea  movs    r4, r0
000ab5ec  strh    r0, [r3, #0x10]
000ab5ee  movs    r4, r0
