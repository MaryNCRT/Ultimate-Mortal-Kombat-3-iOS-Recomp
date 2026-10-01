========================================================================
t_motaro_grab_punch_now  0x000aa4f0  772 bytes   mkboss.c
========================================================================

000aa4f0  push    {r4, r5, r6, r7, lr}
000aa4f2  add     r7, sp, #0xc
000aa4f4  str     r8, [sp, #-0x4]!
000aa4f8  ldr.w   r2, [r0, #0xa4]
000aa4fc  movw    r1, #0x546
000aa500  mov     r6, r0
000aa502  adds    r3, r2, #1
000aa504  ldr.w   r5, [r0, #0x108]
000aa508  ldr.w   r4, [r0, r3, lsl #3]
000aa50c  cmp     r4, r1
000aa50e  beq.w   #0xaa67c
000aa512  ble     #0xaa53c
000aa514  movw    r8, #0x552
000aa518  cmp     r4, r8
000aa51a  beq.w   #0xaa72e
000aa51e  bgt     #0xaa59c
000aa520  movw    r3, #0x549
000aa524  cmp     r4, r3
000aa526  beq.w   #0xaa792
000aa52a  adds    r3, #5
000aa52c  cmp     r4, r3
000aa52e  beq.w   #0xaa772
000aa532  mvn     r0, #2
000aa536  ldr     r8, [sp], #4
000aa53a  pop     {r4, r5, r6, r7, pc}
000aa53c  cmp.w   r4, #0x518
000aa540  beq     #0xaa636
000aa542  bgt     #0xaa5c4
000aa544  cmp     r4, #0
000aa546  bne     #0xaa532
000aa548  mov     r0, r5
000aa54a  movs    r3, #2
000aa54c  str     r3, [r5, #0x1c]
000aa54e  bl      #0x57be4 ; -> ochar_sound
000aa552  mov     r0, r5
000aa554  bl      #0x2ec24 ; -> me_in_front
000aa558  mov     r0, r5
000aa55a  bl      #0x3361c ; -> wfe_him
000aa55e  mov     r0, r5
000aa560  bl      #0x55c20 ; -> stop_him
000aa564  ldr     r3, [pc, #0x260]
000aa566  mov.w   r2, #0x518
000aa56a  str     r3, [r5, #0x40]
000aa56c  ldr.w   r3, [r6, #0xa4]
000aa570  adds    r3, #1
000aa572  str.w   r2, [r6, r3, lsl #3]
000aa576  ldr.w   r3, [r6, #0xa4]
000aa57a  adds    r2, r3, #1
000aa57c  ldr.w   r3, [pc, #0x24c]
000aa580  str.w   r2, [r6, #0xa4]
000aa584  add     r3, pc ; -> 0x000f36d0  t_animate_a9
000aa586  ldr     r1, [r3]
000aa588  lsls    r3, r2, #3
000aa58a  adds    r3, r3, r6
000aa58c  mov     r0, r4
000aa58e  str     r1, [r3, #4]
000aa590  ldr.w   r3, [r6, #0xa4]
000aa594  adds    r3, #1
000aa596  str.w   r4, [r6, r3, lsl #3]
000aa59a  b       #0xaa536
000aa59c  movw    r3, #0x55b
000aa5a0  cmp     r4, r3
000aa5a2  beq     #0xaa608
000aa5a4  cmp.w   r4, #0x560
000aa5a8  bne     #0xaa532
000aa5aa  ldr     r3, [pc, #0x224]
000aa5ac  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aa5ae  ldr     r1, [r3]
000aa5b0  lsls    r3, r2, #3
000aa5b2  adds    r3, r3, r6
000aa5b4  movs    r0, #0
000aa5b6  str     r1, [r3, #4]
000aa5b8  ldr.w   r3, [r6, #0xa4]
000aa5bc  adds    r3, #1
000aa5be  str.w   r0, [r6, r3, lsl #3]
000aa5c2  b       #0xaa536
000aa5c4  cmp.w   r4, #0x528
000aa5c8  beq     #0xaa6b2
000aa5ca  movw    r3, #0x543
000aa5ce  cmp     r4, r3
000aa5d0  bne     #0xaa532
000aa5d2  movs    r3, #0x23
000aa5d4  str     r3, [r5, #0x1c]
000aa5d6  subs    r3, #0x53
000aa5d8  str     r3, [r5, #0x20]
000aa5da  ldr.w   r3, [r0, #0xa4]
000aa5de  ldr.w   r2, [pc, #0x1f4]
000aa5e2  adds    r3, #1
000aa5e4  add     r2, pc ; -> 0x000aa7f5  t_grab_ani
000aa5e6  str.w   r1, [r0, r3, lsl #3]
000aa5ea  ldr.w   r3, [r0, #0xa4]
000aa5ee  adds    r3, #1
000aa5f0  str.w   r3, [r0, #0xa4]
000aa5f4  lsls    r3, r3, #3
000aa5f6  adds    r3, r3, r0
000aa5f8  str     r2, [r3, #4]
000aa5fa  ldr.w   r3, [r0, #0xa4]
000aa5fe  movs    r0, #0
000aa600  adds    r3, #1
000aa602  str.w   r0, [r6, r3, lsl #3]
000aa606  b       #0xaa536
000aa608  mov     r0, r5
000aa60a  movs    r4, #0
000aa60c  str     r4, [r5, #0x1c]
000aa60e  bl      #0x594c8 ; -> strike_check_a0
000aa612  movs    r3, #5
000aa614  str     r3, [r5, #0x1c]
000aa616  ldr.w   r3, [r6, #0xa4]
000aa61a  mov.w   r2, #0x560
000aa61e  adds    r3, #1
000aa620  str.w   r2, [r6, r3, lsl #3]
000aa624  ldr.w   r3, [r6, #0xa4]
000aa628  adds    r2, r3, #1
000aa62a  ldr.w   r3, [pc, #0x1ac]
000aa62e  str.w   r2, [r6, #0xa4]
000aa632  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa634  b       #0xaa586
000aa636  mov     r0, r5
000aa638  bl      #0x54d78 ; -> sans_repell_3
000aa63c  mov     r0, r5
000aa63e  movs    r3, #0x20
000aa640  str     r3, [r5, #0x40]
000aa642  bl      #0x5a050 ; -> pose_him_a9
000aa646  mov     r0, r5
000aa648  movs    r3, #0
000aa64a  str     r3, [r5, #0x38]
000aa64c  bl      #0x708a8 ; -> q_is_he_cornered
000aa650  ldr     r3, [r5, #0x5c]
000aa652  cmp     r3, #0
000aa654  bne.w   #0xaa7be
000aa658  ldr     r3, [r5, #0x38]
000aa65a  mov     r0, r5
000aa65c  str     r3, [r5, #0x1c]
000aa65e  bl      #0x55ab0 ; -> away_x_vel
000aa662  movs    r3, #6
000aa664  str     r3, [r5, #0x44]
000aa666  ldr.w   r3, [r6, #0xa4]
000aa66a  movs    r0, #1
000aa66c  mov.w   r2, #0x528
000aa670  adds    r3, #1
000aa672  str.w   r2, [r6, r3, lsl #3]
000aa676  str.w   r0, [r6, #0xfc]
000aa67a  b       #0xaa536
000aa67c  movs    r0, #0
000aa67e  str     r0, [r5, #0x1c]
000aa680  str     r0, [r5, #0x20]
000aa682  ldr.w   r3, [r6, #0xa4]
000aa686  movw    r2, #0x549
000aa68a  adds    r3, #1
000aa68c  str.w   r2, [r6, r3, lsl #3]
000aa690  ldr.w   r3, [r6, #0xa4]
000aa694  ldr.w   r2, [pc, #0x144]
000aa698  adds    r3, #1
000aa69a  str.w   r3, [r6, #0xa4]
000aa69e  lsls    r3, r3, #3
000aa6a0  adds    r3, r3, r6
000aa6a2  add     r2, pc ; -> 0x000aa7f5  t_grab_ani
000aa6a4  str     r2, [r3, #4]
000aa6a6  ldr.w   r3, [r6, #0xa4]
000aa6aa  adds    r3, #1
000aa6ac  str.w   r0, [r6, r3, lsl #3]
000aa6b0  b       #0xaa536
000aa6b2  mov     r0, r5
000aa6b4  bl      #0x570e0 ; -> match_him_with_me_f
000aa6b8  mov     r0, r5
000aa6ba  mvn     r3, #0x4f
000aa6be  str     r3, [r5, #0x1c]
000aa6c0  adds    r3, #0x60
000aa6c2  str     r3, [r5, #0x20]
000aa6c4  bl      #0x57080 ; -> adjust_him_xy
000aa6c8  mov     r0, r5
000aa6ca  bl      #0x54d78 ; -> sans_repell_3
000aa6ce  ldr     r3, [r5, #0x44]
000aa6d0  subs    r4, r3, #1
000aa6d2  str     r4, [r5, #0x44]
000aa6d4  cmp     r4, #0
000aa6d6  bne     #0xaa666
000aa6d8  mov     r0, r5
000aa6da  bl      #0x55c04 ; -> stop_me_player
000aa6de  mov     r0, r5
000aa6e0  movs    r3, #4
000aa6e2  str     r3, [r5, #0x40]
000aa6e4  bl      #0x55474 ; -> find_ani_part2
000aa6e8  ldr     r3, [pc, #0xf4]
000aa6ea  movs    r2, #0x60
000aa6ec  str     r2, [r5, #0x38]
000aa6ee  add     r3, pc ; -> 0x000f357c  G
000aa6f0  mov     r0, r4
000aa6f2  ldr     r3, [r3]
000aa6f4  strh.w  r2, [r3, #0x456]
000aa6f8  movs    r3, #0x20
000aa6fa  str     r3, [r5, #0x1c]
000aa6fc  subs    r3, #0x30
000aa6fe  str     r3, [r5, #0x20]
000aa700  ldr.w   r3, [r6, #0xa4]
000aa704  movw    r2, #0x543
000aa708  adds    r3, #1
000aa70a  str.w   r2, [r6, r3, lsl #3]
000aa70e  ldr.w   r3, [r6, #0xa4]
000aa712  ldr     r2, [pc, #0xd0]
000aa714  adds    r3, #1
000aa716  str.w   r3, [r6, #0xa4]
000aa71a  lsls    r3, r3, #3
000aa71c  adds    r3, r3, r6
000aa71e  add     r2, pc ; -> 0x000aa7f5  t_grab_ani
000aa720  str     r2, [r3, #4]
000aa722  ldr.w   r3, [r6, #0xa4]
000aa726  adds    r3, #1
000aa728  str.w   r4, [r6, r3, lsl #3]
000aa72c  b       #0xaa536
000aa72e  mov     r0, r5
000aa730  mov.w   r3, #0x20000
000aa734  str     r3, [r5, #0x1c]
000aa736  bl      #0x55acc ; -> away_x_vel_him
000aa73a  movs    r3, #4
000aa73c  mov     r0, r5
000aa73e  str     r3, [r5, #0x40]
000aa740  subs    r3, #1
000aa742  str     r3, [r5, #0x54]
000aa744  bl      #0x554a8 ; -> find_ani_part_a14
000aa748  mov     r0, r5
000aa74a  bl      #0x2ec24 ; -> me_in_front
000aa74e  movs    r3, #2
000aa750  str     r3, [r5, #0x1c]
000aa752  ldr.w   r3, [r6, #0xa4]
000aa756  movw    r2, #0x55b
000aa75a  adds    r3, #1
000aa75c  str.w   r2, [r6, r3, lsl #3]
000aa760  ldr.w   r3, [r6, #0xa4]
000aa764  adds    r2, r3, #1
000aa766  ldr.w   r3, [pc, #0x80]
000aa76a  str.w   r2, [r6, #0xa4]
000aa76e  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa770  b       #0xaa5ae
000aa772  ldr     r3, [pc, #0x78]
000aa774  mov     r0, r5
000aa776  add     r3, pc ; -> 0x000f3424  t_drop_down_land_jump
000aa778  ldr     r3, [r3]
000aa77a  str     r3, [r5, #0x38]
000aa77c  bl      #0x58954 ; -> takeover_him
000aa780  ldr.w   r3, [r6, #0xa4]
000aa784  movs    r0, #1
000aa786  adds    r3, #1
000aa788  str.w   r8, [r6, r3, lsl #3]
000aa78c  str.w   r0, [r6, #0xfc]
000aa790  b       #0xaa536
000aa792  movs    r3, #4
000aa794  str     r3, [r5, #0x1c]
000aa796  subs    r3, #1
000aa798  str     r3, [r5, #0x20]
000aa79a  subs    r3, #1
000aa79c  str     r3, [r5, #0x24]
000aa79e  ldr.w   r3, [r0, #0xa4]
000aa7a2  movw    r2, #0x54e
000aa7a6  adds    r3, #1
000aa7a8  str.w   r2, [r0, r3, lsl #3]
000aa7ac  ldr.w   r3, [r0, #0xa4]
000aa7b0  adds    r2, r3, #1
000aa7b2  ldr.w   r3, [pc, #0x3c]
000aa7b6  str.w   r2, [r0, #0xa4]
000aa7ba  add     r3, pc ; -> 0x000f36a4  t_shake_him_up
000aa7bc  b       #0xaa5ae
000aa7be  mov.w   r3, #0x30000
000aa7c2  str     r3, [r5, #0x38]
000aa7c4  b       #0xaa658
000aa7c6  nop     
000aa7c8  movs    r4, r0
000aa7ca  movs    r3, r0
000aa7cc  str     r1, [sp, #0x120]
000aa7ce  movs    r4, r0
000aa7d0  str     r1, [sp, #0x160]
000aa7d2  movs    r4, r0
000aa7d4  lsls    r5, r1, #8
000aa7d6  movs    r0, r0
000aa7d8  str     r1, [sp, #0x258]
000aa7da  movs    r4, r0
000aa7dc  lsls    r7, r1, #5
000aa7de  movs    r0, r0
000aa7e0  ldrh    r2, [r1, #0x34]
000aa7e2  movs    r4, r0
000aa7e4  lsls    r3, r2, #3
000aa7e6  movs    r0, r0
000aa7e8  str     r0, [sp, #0x168]
000aa7ea  movs    r4, r0
000aa7ec  ldrh    r2, [r5, #0x24]
000aa7ee  movs    r4, r0
000aa7f0  ldrh    r6, [r4, #0x36]
000aa7f2  movs    r4, r0
