========================================================================
t_boss_close  0x000ac418  456 bytes   mkboss.c
========================================================================

000ac418  push    {r4, r5, r6, r7, lr}
000ac41a  add     r7, sp, #0xc
000ac41c  ldr.w   r3, [r0, #0xa4]
000ac420  mov     r5, r0
000ac422  ldr.w   r4, [r0, #0x108]
000ac426  adds    r3, #1
000ac428  ldr.w   r6, [r0, r3, lsl #3]
000ac42c  cmp.w   r6, #0x1a6
000ac430  beq     #0xac4be
000ac432  ble     #0xac448
000ac434  cmp.w   r6, #0x1ac
000ac438  beq     #0xac4fa
000ac43a  movw    r3, #0x1b9
000ac43e  cmp     r6, r3
000ac440  beq     #0xac486
000ac442  mvn     r0, #2
000ac446  pop     {r4, r5, r6, r7, pc}
000ac448  cmp     r6, #0
000ac44a  bne     #0xac442
000ac44c  movs    r3, #0xc0
000ac44e  mov     r0, r4
000ac450  str     r3, [r4, #0x44]
000ac452  bl      #0xa9ea0 ; -> q_is_this_a_joke
000ac456  ldr     r3, [r4, #0x5c]
000ac458  cbz     r3, #0xac4ae
000ac45a  mov.w   r3, #0x1f4
000ac45e  mov     r0, r4
000ac460  str     r3, [r4, #0x1c]
000ac462  bl      #0xab6bc ; -> bossrandper
000ac466  ldr     r3, [r4, #0x5c]
000ac468  cbz     r3, #0xac4ae
000ac46a  ldr.w   r3, [r5, #0xa4]
000ac46e  ldr     r2, [pc, #0x150]
000ac470  mov     r0, r6
000ac472  lsls    r3, r3, #3
000ac474  adds    r3, r3, r5
000ac476  add     r2, pc ; -> 0x000a9899  t_motaro_stupid_stance
000ac478  str     r2, [r3, #4]
000ac47a  ldr.w   r3, [r5, #0xa4]
000ac47e  adds    r3, #1
000ac480  str.w   r6, [r5, r3, lsl #3]
000ac484  b       #0xac446
000ac486  mov     r0, r4
000ac488  bl      #0x55060 ; -> is_he_airborn
000ac48c  ldr     r0, [r4, #0x5c]
000ac48e  cmp     r0, #0
000ac490  bne     #0xac544
000ac492  ldr.w   r3, [r5, #0xa4]
000ac496  ldr.w   r2, [pc, #0x12c]
000ac49a  lsls    r3, r3, #3
000ac49c  adds    r3, r3, r5
000ac49e  add     r2, pc ; -> 0x000a879d  t_boss_close_attack
000ac4a0  str     r2, [r3, #4]
000ac4a2  ldr.w   r3, [r5, #0xa4]
000ac4a6  adds    r3, #1
000ac4a8  str.w   r0, [r5, r3, lsl #3]
000ac4ac  b       #0xac446
000ac4ae  movs    r3, #0xc8
000ac4b0  mov     r0, r4
000ac4b2  str     r3, [r4, #0x1c]
000ac4b4  bl      #0xab6bc ; -> bossrandper
000ac4b8  ldr     r3, [r4, #0x5c]
000ac4ba  cmp     r3, #0
000ac4bc  bne     #0xac570
000ac4be  mov.w   r3, #0x100
000ac4c2  str     r3, [r4, #0x44]
000ac4c4  subs    r3, #0x30
000ac4c6  str     r3, [r4, #0x48]
000ac4c8  ldr.w   r3, [r5, #0xa4]
000ac4cc  mov.w   r2, #0x1ac
000ac4d0  adds    r3, #1
000ac4d2  str.w   r2, [r5, r3, lsl #3]
000ac4d6  ldr.w   r3, [r5, #0xa4]
000ac4da  adds    r2, r3, #1
000ac4dc  ldr     r3, [pc, #0xe8]
000ac4de  str.w   r2, [r5, #0xa4]
000ac4e2  add     r3, pc ; -> 0x000f3414  t_d_stalk_a11
000ac4e4  ldr     r1, [r3]
000ac4e6  lsls    r3, r2, #3
000ac4e8  adds    r3, r3, r5
000ac4ea  movs    r0, #0
000ac4ec  str     r1, [r3, #4]
000ac4ee  ldr.w   r3, [r5, #0xa4]
000ac4f2  adds    r3, #1
000ac4f4  str.w   r0, [r5, r3, lsl #3]
000ac4f8  b       #0xac446
000ac4fa  mov     r0, r4
000ac4fc  bl      #0xa8e88 ; -> q_ok_motaro_sweep
000ac500  ldr     r3, [r4, #0x5c]
000ac502  cbnz    r3, #0xac52e
000ac504  mov.w   r3, #0x100
000ac508  str     r3, [r4, #0x44]
000ac50a  subs    r3, #0xb8
000ac50c  str     r3, [r4, #0x48]
000ac50e  ldr.w   r3, [r5, #0xa4]
000ac512  movw    r2, #0x1b9
000ac516  adds    r3, #1
000ac518  str.w   r2, [r5, r3, lsl #3]
000ac51c  ldr.w   r3, [r5, #0xa4]
000ac520  adds    r2, r3, #1
000ac522  ldr.w   r3, [pc, #0xa8]
000ac526  str.w   r2, [r5, #0xa4]
000ac52a  add     r3, pc ; -> 0x000f3414  t_d_stalk_a11
000ac52c  b       #0xac4e4
000ac52e  movs    r3, #0xc8
000ac530  mov     r0, r4
000ac532  str     r3, [r4, #0x1c]
000ac534  bl      #0xab6bc ; -> bossrandper
000ac538  ldr     r3, [r4, #0x5c]
000ac53a  cmp     r3, #0
000ac53c  beq     #0xac504
000ac53e  ldr     r2, [pc, #0x90]
000ac540  add     r2, pc ; -> 0x000aa211  t_motaro_sweep
000ac542  b       #0xac558
000ac544  mov     r0, r4
000ac546  bl      #0x54e38 ; -> get_his_action
000ac54a  ldr     r0, [r4, #0x20]
000ac54c  cmp.w   r0, #0x308
000ac550  beq     #0xac5a2
000ac552  ldr.w   r2, [pc, #0x80]
000ac556  add     r2, pc ; -> 0x000a86fd  t_boss_wait_land
000ac558  ldr.w   r3, [r5, #0xa4]
000ac55c  movs    r0, #0
000ac55e  lsls    r3, r3, #3
000ac560  adds    r3, r3, r5
000ac562  str     r2, [r3, #4]
000ac564  ldr.w   r3, [r5, #0xa4]
000ac568  adds    r3, #1
000ac56a  str.w   r0, [r5, r3, lsl #3]
000ac56e  b       #0xac446
000ac570  movs    r3, #0x40
000ac572  mov     r0, r4
000ac574  str     r3, [r4, #0x1c]
000ac576  subs    r3, #0x30
000ac578  str     r3, [r4, #0x20]
000ac57a  bl      #0x58764 ; -> randu_minimum
000ac57e  ldr     r3, [r4, #0x1c]
000ac580  mov.w   r2, #0x1a6
000ac584  str     r3, [r4, #0x44]
000ac586  ldr.w   r3, [r5, #0xa4]
000ac58a  adds    r3, #1
000ac58c  str.w   r2, [r5, r3, lsl #3]
000ac590  ldr.w   r3, [r5, #0xa4]
000ac594  adds    r2, r3, #1
000ac596  ldr.w   r3, [pc, #0x40]
000ac59a  str.w   r2, [r5, #0xa4]
000ac59e  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000ac5a0  b       #0xac4e4
000ac5a2  ldr.w   r3, [r5, #0xa4]
000ac5a6  ldr     r2, [pc, #0x34]
000ac5a8  sub.w   r0, r0, #0x308
000ac5ac  lsls    r3, r3, #3
000ac5ae  adds    r3, r3, r5
000ac5b0  add     r2, pc ; -> 0x000ab779  t_boss_counter_angle
000ac5b2  str     r2, [r3, #4]
000ac5b4  ldr.w   r3, [r5, #0xa4]
000ac5b8  adds    r3, #1
000ac5ba  str.w   r0, [r5, r3, lsl #3]
000ac5be  b       #0xac446
000ac5c0  bmi     #0xac602
