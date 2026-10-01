========================================================================
tl_do_lia_anglez  0x0007b2b8  420 bytes   mkzap.c
========================================================================

0007b2b8  push    {r4, r5, r6, r7, lr}
0007b2ba  add     r7, sp, #0xc
0007b2bc  push.w  {r8, sl}
0007b2c0  ldr.w   r3, [r0, #0xa4]
0007b2c4  movw    r8, #0xe46
0007b2c8  mov     r5, r0
0007b2ca  adds    r3, #1
0007b2cc  ldr.w   r4, [r0, #0x108]
0007b2d0  ldr.w   r6, [r0, r3, lsl #3]
0007b2d4  cmp     r6, r8
0007b2d6  beq     #0x7b390
0007b2d8  ble     #0x7b2f4
0007b2da  movw    r3, #0xe59
0007b2de  cmp     r6, r3
0007b2e0  beq.w   #0x7b3f6
0007b2e4  adds    r3, #3
0007b2e6  cmp     r6, r3
0007b2e8  beq     #0x7b35a
0007b2ea  mvn     r0, #2
0007b2ee  pop.w   {r8, sl}
0007b2f2  pop     {r4, r5, r6, r7, pc}
0007b2f4  cmp     r6, #0
0007b2f6  bne     #0x7b2ea
0007b2f8  ldr     r3, [r4]
0007b2fa  mov     r0, r4
0007b2fc  mov.w   sl, #2
0007b300  ldr     r2, [r3, #0x18]
0007b302  str     r2, [r3, #0x38]
0007b304  str     r6, [r4, #0x44]
0007b306  bl      #0x7b2a4 ; -> zap_air_init_special
0007b30a  ldr     r3, [r4]
0007b30c  mov     r0, r4
0007b30e  movs    r2, #0xb
0007b310  str     r2, [r4, #0x20]
0007b312  str     r2, [r3, #0x18]
0007b314  str.w   sl, [r4, #0x1c]
0007b318  bl      #0x57be4 ; -> ochar_sound
0007b31c  mov     r0, r4
0007b31e  movs    r3, #7
0007b320  str     r3, [r4, #0x40]
0007b322  bl      #0x55228 ; -> get_char_ani2
0007b326  str.w   sl, [r4, #0x1c]
0007b32a  ldr.w   r3, [r5, #0xa4]
0007b32e  adds    r3, #1
0007b330  str.w   r8, [r5, r3, lsl #3]
0007b334  ldr.w   r3, [r5, #0xa4]
0007b338  adds    r2, r3, #1
0007b33a  ldr.w   r3, [pc, #0x104]
0007b33e  str.w   r2, [r5, #0xa4]
0007b342  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b344  ldr     r1, [r3]
0007b346  lsls    r3, r2, #3
0007b348  adds    r3, r3, r5
0007b34a  mov     r0, r6
0007b34c  str     r1, [r3, #4]
0007b34e  ldr.w   r3, [r5, #0xa4]
0007b352  adds    r3, #1
0007b354  str.w   r6, [r5, r3, lsl #3]
0007b358  b       #0x7b2ee
0007b35a  ldr     r3, [r4, #8]
0007b35c  mov.w   r2, #0x10000
0007b360  str     r2, [r4, #0x1c]
0007b362  str     r2, [r3, #0x1c]
0007b364  ldr     r3, [r4]
0007b366  movw    r2, #0x203
0007b36a  ldr     r3, [r3, #0x38]
0007b36c  cmp     r3, r2
0007b36e  str     r3, [r4, #0x1c]
0007b370  beq     #0x7b432
0007b372  ldr     r3, [pc, #0xd0]
0007b374  add     r3, pc ; -> 0x000f3778  t_land_on_yer_feet
0007b376  ldr     r2, [r3]
0007b378  ldr.w   r3, [r5, #0xa4]
0007b37c  movs    r0, #0
0007b37e  lsls    r3, r3, #3
0007b380  adds    r3, r3, r5
0007b382  str     r2, [r3, #4]
0007b384  ldr.w   r3, [r5, #0xa4]
0007b388  adds    r3, #1
0007b38a  str.w   r0, [r5, r3, lsl #3]
0007b38e  b       #0x7b2ee
0007b390  ldr     r3, [r4]
0007b392  movs    r6, #0
0007b394  mov     r0, r4
0007b396  ldr     r2, [r3, #0x68]
0007b398  ldr.w   r8, [r3, #0x64]
0007b39c  str     r2, [r4, #0x48]
0007b39e  str     r6, [r3, #0x64]
0007b3a0  ldr     r3, [r4]
0007b3a2  str     r6, [r3, #0x68]
0007b3a4  ldr     r3, [pc, #0xa0]
0007b3a6  add     r3, pc ; -> 0x00076159  t_angle_zap_proc
0007b3a8  str     r3, [r4, #0x38]
0007b3aa  bl      #0x75964 ; -> create_proj_proc
0007b3ae  ldr     r2, [r4]
0007b3b0  ldr     r3, [r4, #0x48]
0007b3b2  mov     r0, r4
0007b3b4  str     r3, [r2, #0x68]
0007b3b6  ldr     r3, [r4]
0007b3b8  str.w   r8, [r3, #0x64]
0007b3bc  ldr     r3, [pc, #0x8c]
0007b3be  add     r3, pc ; -> 0x000f357c  G
0007b3c0  ldr     r3, [r3]
0007b3c2  add.w   r3, r3, #0x400
0007b3c6  adds    r3, #4
0007b3c8  str     r3, [r4, #0x1c]
0007b3ca  bl      #0x5742c ; -> update_tsl
0007b3ce  mov     r0, r4
0007b3d0  bl      #0x758b0 ; -> i_am_a_sitting_duck
0007b3d4  movs    r3, #5
0007b3d6  str     r3, [r4, #0x1c]
0007b3d8  ldr.w   r3, [r5, #0xa4]
0007b3dc  movw    r2, #0xe59
0007b3e0  adds    r3, #1
0007b3e2  str.w   r2, [r5, r3, lsl #3]
0007b3e6  ldr.w   r3, [r5, #0xa4]
0007b3ea  adds    r2, r3, #1
0007b3ec  ldr     r3, [pc, #0x60]
0007b3ee  str.w   r2, [r5, #0xa4]
0007b3f2  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b3f4  b       #0x7b344
0007b3f6  mov     r0, r4
0007b3f8  bl      #0x56d20 ; -> delete_slave
0007b3fc  movs    r3, #2
0007b3fe  str     r3, [r4, #0x1c]
0007b400  ldr.w   r3, [r5, #0xa4]
0007b404  movw    r2, #0xe5c
0007b408  movs    r0, #0
0007b40a  adds    r3, #1
0007b40c  str.w   r2, [r5, r3, lsl #3]
0007b410  ldr.w   r3, [r5, #0xa4]
0007b414  adds    r2, r3, #1
0007b416  ldr     r3, [pc, #0x3c]
0007b418  str.w   r2, [r5, #0xa4]
0007b41c  add     r3, pc ; -> 0x000f37cc  t_mframew
0007b41e  ldr     r1, [r3]
0007b420  lsls    r3, r2, #3
0007b422  adds    r3, r3, r5
0007b424  str     r1, [r3, #4]
0007b426  ldr.w   r3, [r5, #0xa4]
0007b42a  adds    r3, #1
0007b42c  str.w   r0, [r5, r3, lsl #3]
0007b430  b       #0x7b2ee
0007b432  movs    r3, #0xb
0007b434  str     r3, [r4, #0x1c]
0007b436  ldr.w   r3, [pc, #0x20]
0007b43a  add     r3, pc ; -> 0x000f31a0  t_do_body_propell
0007b43c  b       #0x7b376
0007b43e  nop     
0007b440  strh    r6, [r0, #0x24]
0007b442  movs    r7, r0
0007b444  strh    r0, [r0, #0x20]
0007b446  movs    r7, r0
0007b448  add     r5, sp, #0x2bc
0007b44a  vsra.u64 d24, d26, #1
0007b44e  movs    r7, r0
0007b450  strh    r6, [r2, #0x1e]
0007b452  movs    r7, r0
0007b454  strh    r4, [r5, #0x1c]
0007b456  movs    r7, r0
0007b458  ldrb    r2, [r4, #0x15]
0007b45a  movs    r7, r0
