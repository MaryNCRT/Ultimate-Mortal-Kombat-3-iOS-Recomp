========================================================================
tl_do_tusk_zap  0x0007b45c  348 bytes   mkzap.c
========================================================================

0007b45c  push    {r4, r5, r6, r7, lr}
0007b45e  add     r7, sp, #0xc
0007b460  str     r8, [sp, #-0x4]!
0007b464  ldr.w   r2, [r0, #0xa4]
0007b468  movw    r8, #0xbef
0007b46c  mov     r5, r0
0007b46e  adds    r3, r2, #1
0007b470  ldr.w   r4, [r0, #0x108]
0007b474  ldr.w   r6, [r0, r3, lsl #3]
0007b478  cmp     r6, r8
0007b47a  beq     #0x7b4dc
0007b47c  ble     #0x7b496
0007b47e  movw    r3, #0xc09
0007b482  cmp     r6, r3
0007b484  beq     #0x7b520
0007b486  adds    r3, #4
0007b488  cmp     r6, r3
0007b48a  beq     #0x7b4c0
0007b48c  mvn     r0, #2
0007b490  ldr     r8, [sp], #4
0007b494  pop     {r4, r5, r6, r7, pc}
0007b496  cmp     r6, #0
0007b498  bne     #0x7b48c
0007b49a  mov     r0, r4
0007b49c  bl      #0x55070 ; -> am_i_airborn
0007b4a0  cmp     r0, #0
0007b4a2  bne     #0x7b550
0007b4a4  ldr.w   r3, [r5, #0xa4]
0007b4a8  ldr     r2, [pc, #0xf8]
0007b4aa  mov     r0, r6
0007b4ac  lsls    r3, r3, #3
0007b4ae  adds    r3, r3, r5
0007b4b0  add     r2, pc ; -> 0x0007a09d  tl_tusk_ground_zap
0007b4b2  str     r2, [r3, #4]
0007b4b4  ldr.w   r3, [r5, #0xa4]
0007b4b8  adds    r3, #1
0007b4ba  str.w   r6, [r5, r3, lsl #3]
0007b4be  b       #0x7b490
0007b4c0  ldr.w   r3, [pc, #0xe4]
0007b4c4  add     r3, pc ; -> 0x000f33d4  t_drop_down_land
0007b4c6  ldr     r1, [r3]
0007b4c8  lsls    r3, r2, #3
0007b4ca  adds    r3, r3, r5
0007b4cc  movs    r0, #0
0007b4ce  str     r1, [r3, #4]
0007b4d0  ldr.w   r3, [r5, #0xa4]
0007b4d4  adds    r3, #1
0007b4d6  str.w   r0, [r5, r3, lsl #3]
0007b4da  b       #0x7b490
0007b4dc  ldr.w   r3, [pc, #0xcc]
0007b4e0  mov     r0, r4
0007b4e2  add     r3, pc ; -> 0x000769b1  t_photon_proc
0007b4e4  str     r3, [r4, #0x38]
0007b4e6  bl      #0x75964 ; -> create_proj_proc
0007b4ea  cbz     r0, #0x7b4fe
0007b4ec  ldr     r0, [r0, #8]
0007b4ee  movs    r3, #0
0007b4f0  str     r3, [r4, #0x1c]
0007b4f2  adds    r3, #0x10
0007b4f4  str     r0, [r4, #0x30]
0007b4f6  mov     r0, r4
0007b4f8  str     r3, [r4, #0x20]
0007b4fa  bl      #0x570bc ; -> adjust_xy_a5
0007b4fe  mov     r0, r4
0007b500  mov.w   r3, #0x60000
0007b504  str     r3, [r4, #0x1c]
0007b506  bl      #0x55ab0 ; -> away_x_vel
0007b50a  ldr.w   r3, [r5, #0xa4]
0007b50e  movs    r0, #6
0007b510  movw    r2, #0xc09
0007b514  adds    r3, #1
0007b516  str.w   r2, [r5, r3, lsl #3]
0007b51a  str.w   r0, [r5, #0xfc]
0007b51e  b       #0x7b490
0007b520  mov     r0, r4
0007b522  mov.w   r3, #0x40000
0007b526  str     r3, [r4, #0x1c]
0007b528  bl      #0x55ab0 ; -> away_x_vel
0007b52c  movs    r3, #4
0007b52e  str     r3, [r4, #0x1c]
0007b530  ldr.w   r3, [r5, #0xa4]
0007b534  movw    r2, #0xc0d
0007b538  adds    r3, #1
0007b53a  str.w   r2, [r5, r3, lsl #3]
0007b53e  ldr.w   r3, [r5, #0xa4]
0007b542  adds    r2, r3, #1
0007b544  ldr.w   r3, [pc, #0x68]
0007b548  str.w   r2, [r5, #0xa4]
0007b54c  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b54e  b       #0x7b4c6
0007b550  mov     r0, r4
0007b552  str     r6, [r4, #0x44]
0007b554  bl      #0x7b2a4 ; -> zap_air_init_special
0007b558  ldr     r3, [r4]
0007b55a  mov     r0, r4
0007b55c  movs    r2, #0x16
0007b55e  str     r2, [r4, #0x20]
0007b560  str     r2, [r3, #0x18]
0007b562  movs    r3, #1
0007b564  str     r3, [r4, #0x1c]
0007b566  bl      #0x57be4 ; -> ochar_sound
0007b56a  mov     r0, r4
0007b56c  str     r6, [r4, #0x40]
0007b56e  bl      #0x55228 ; -> get_char_ani2
0007b572  movs    r3, #2
0007b574  str     r3, [r4, #0x1c]
0007b576  ldr.w   r3, [r5, #0xa4]
0007b57a  mov     r0, r6
0007b57c  adds    r3, #1
0007b57e  str.w   r8, [r5, r3, lsl #3]
0007b582  ldr.w   r3, [r5, #0xa4]
0007b586  adds    r2, r3, #1
0007b588  ldr     r3, [pc, #0x28]
0007b58a  str.w   r2, [r5, #0xa4]
0007b58e  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b590  ldr     r1, [r3]
0007b592  lsls    r3, r2, #3
0007b594  adds    r3, r3, r5
0007b596  str     r1, [r3, #4]
0007b598  ldr.w   r3, [r5, #0xa4]
0007b59c  adds    r3, #1
0007b59e  str.w   r6, [r5, r3, lsl #3]
0007b5a2  b       #0x7b490
