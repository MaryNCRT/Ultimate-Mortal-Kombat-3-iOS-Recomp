========================================================================
t_saw_strike_check  0x0007c398  364 bytes   mkzap.c
========================================================================

0007c398  push    {r4, r5, r6, r7, lr}
0007c39a  add     r7, sp, #0xc
0007c39c  str     r8, [sp, #-0x4]!
0007c3a0  ldr.w   r3, [r0, #0xa4]
0007c3a4  mov     r4, r0
0007c3a6  ldr.w   r5, [r0, #0x108]
0007c3aa  adds    r3, #1
0007c3ac  ldr.w   r6, [r0, r3, lsl #3]
0007c3b0  movw    r3, #0x719
0007c3b4  cmp     r6, r3
0007c3b6  beq     #0x7c438
0007c3b8  adds    r3, #9
0007c3ba  cmp     r6, r3
0007c3bc  beq     #0x7c3e6
0007c3be  cbz     r6, #0x7c3ca
0007c3c0  mvn     r0, #2
0007c3c4  ldr     r8, [sp], #4
0007c3c8  pop     {r4, r5, r6, r7, pc}
0007c3ca  mov     r0, r5
0007c3cc  bl      #0x68e20 ; -> q_is_he_a_boss
0007c3d0  ldr     r3, [r5, #0x5c]
0007c3d2  cbz     r3, #0x7c40c
0007c3d4  ldr.w   r3, [r4, #0xa4]
0007c3d8  cmp     r3, #0
0007c3da  ble     #0x7c4c2
0007c3dc  subs    r3, #1
0007c3de  mov     r0, r6
0007c3e0  str.w   r3, [r4, #0xa4]
0007c3e4  b       #0x7c3c4
0007c3e6  mov     r0, r5
0007c3e8  bl      #0x5a680 ; -> next_anirate
0007c3ec  mov     r0, r5
0007c3ee  bl      #0x75714 ; -> proj_onscreen_test
0007c3f2  ldr     r0, [r5, #0x5c]
0007c3f4  cbz     r0, #0x7c41c
0007c3f6  ldr.w   r3, [r4, #0xa4]
0007c3fa  movs    r0, #1
0007c3fc  movw    r2, #0x722
0007c400  adds    r3, #1
0007c402  str.w   r2, [r4, r3, lsl #3]
0007c406  str.w   r0, [r4, #0xfc]
0007c40a  b       #0x7c3c4
0007c40c  ldr     r3, [r5]
0007c40e  ldr     r3, [r3, #0x28]
0007c410  str     r3, [r5, #0x1c]
0007c412  ldr     r3, [r3, #0x10]
0007c414  ands    r8, r3, #4
0007c418  str     r3, [r5, #0x2c]
0007c41a  beq     #0x7c46c
0007c41c  ldr.w   r3, [r4, #0xa4]
0007c420  ldr     r2, [pc, #0xd4]
0007c422  movs    r0, #0
0007c424  lsls    r3, r3, #3
0007c426  adds    r3, r3, r4
0007c428  add     r2, pc ; -> 0x00075665  tl_delete_proj_and_die
0007c42a  str     r2, [r3, #4]
0007c42c  ldr.w   r3, [r4, #0xa4]
0007c430  adds    r3, #1
0007c432  str.w   r0, [r4, r3, lsl #3]
0007c436  b       #0x7c3c4
0007c438  mov     r0, r5
0007c43a  bl      #0x5a680 ; -> next_anirate
0007c43e  mov     r0, r5
0007c440  bl      #0x6c7fc ; -> q_is_he_reacting
0007c444  ldr     r3, [r5, #0x5c]
0007c446  cbz     r3, #0x7c45e
0007c448  ldr.w   r3, [r4, #0xa4]
0007c44c  movs    r0, #1
0007c44e  movw    r2, #0x719
0007c452  adds    r3, #1
0007c454  str.w   r2, [r4, r3, lsl #3]
0007c458  str.w   r0, [r4, #0xfc]
0007c45c  b       #0x7c3c4
0007c45e  add.w   r3, r3, #0x100000
0007c462  mov     r0, r5
0007c464  str     r3, [r5, #0x1c]
0007c466  bl      #0x75d6c ; -> set_proj_vel
0007c46a  b       #0x7c3f6
0007c46c  mov     r0, r5
0007c46e  movs    r3, #0x13
0007c470  str     r3, [r5, #0x1c]
0007c472  bl      #0x594c8 ; -> strike_check_a0
0007c476  ldr     r3, [r5, #0x5c]
0007c478  cmp     r3, #0
0007c47a  beq     #0x7c3d4
0007c47c  ldr.w   r3, [r4, #0xa4]
0007c480  cmp     r3, #0
0007c482  ble     #0x7c4de
0007c484  subs    r3, #1
0007c486  str.w   r3, [r4, #0xa4]
0007c48a  ldr.w   r1, [r4, #0xa4]
0007c48e  adds    r3, r1, #1
0007c490  lsls    r2, r3, #3
0007c492  adds    r2, r2, r4
0007c494  ldr     r0, [r2, #4]
0007c496  adds    r2, r3, #1
0007c498  ldr.w   r2, [r4, r2, lsl #3]
0007c49c  str.w   r2, [r4, r3, lsl #3]
0007c4a0  lsls    r3, r1, #3
0007c4a2  adds    r3, r3, r4
0007c4a4  str     r0, [r3, #4]
0007c4a6  ldr     r2, [r5, #4]
0007c4a8  mov     r0, r5
0007c4aa  movw    r3, #0x207
0007c4ae  str.w   r3, [r2, #0x104]
0007c4b2  movs    r3, #5
0007c4b4  str     r3, [r5, #0x1c]
0007c4b6  bl      #0x57be4 ; -> ochar_sound
0007c4ba  ldr     r0, [r5, #8]
0007c4bc  bl      #0x55a60 ; -> stop_a8
0007c4c0  b       #0x7c448
0007c4c2  ldr.w   r2, [pc, #0x38]
0007c4c6  lsls    r3, r3, #3
0007c4c8  adds    r3, r3, r4
0007c4ca  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007c4cc  mov     r0, r6
0007c4ce  ldr     r2, [r2]
0007c4d0  str     r2, [r3, #4]
0007c4d2  ldr.w   r3, [r4, #0xa4]
0007c4d6  adds    r3, #1
0007c4d8  str.w   r6, [r4, r3, lsl #3]
0007c4dc  b       #0x7c3c4
0007c4de  ldr.w   r2, [pc, #0x20]
0007c4e2  lsls    r3, r3, #3
0007c4e4  adds    r3, r3, r4
0007c4e6  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007c4e8  ldr     r2, [r2]
0007c4ea  str     r2, [r3, #4]
0007c4ec  ldr.w   r3, [r4, #0xa4]
0007c4f0  adds    r3, #1
0007c4f2  str.w   r8, [r4, r3, lsl #3]
0007c4f6  b       #0x7c48a
0007c4f8  str     r2, [sp, #0xe4]
0007c4fa  vrshr.u32 d23, d26, #1
0007c4fe  movs    r7, r0
0007c500  strb    r6, [r3, #8]
0007c502  movs    r7, r0
