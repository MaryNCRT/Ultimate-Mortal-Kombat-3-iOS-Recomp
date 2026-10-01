========================================================================
t_stz1  0x0007a2c0  484 bytes   mkzap.c
========================================================================

0007a2c0  push    {r4, r5, r6, r7, lr}
0007a2c2  add     r7, sp, #0xc
0007a2c4  str     r8, [sp, #-0x4]!
0007a2c8  ldr.w   r3, [r0, #0xa4]
0007a2cc  movw    r2, #0xae2
0007a2d0  mov     r5, r0
0007a2d2  adds    r1, r3, #1
0007a2d4  ldr.w   r6, [r0, #0x108]
0007a2d8  ldr.w   r4, [r0, r1, lsl #3]
0007a2dc  cmp     r4, r2
0007a2de  beq     #0x7a3d4
0007a2e0  ble     #0x7a308
0007a2e2  movw    r2, #0xae9
0007a2e6  cmp     r4, r2
0007a2e8  beq.w   #0x7a45e
0007a2ec  bgt     #0x7a33e
0007a2ee  movw    r3, #0xae4
0007a2f2  cmp     r4, r3
0007a2f4  beq.w   #0x7a42c
0007a2f8  adds    r3, #1
0007a2fa  cmp     r4, r3
0007a2fc  beq     #0x7a398
0007a2fe  mvn     r0, #2
0007a302  ldr     r8, [sp], #4
0007a306  pop     {r4, r5, r6, r7, pc}
0007a308  movw    r8, #0xad6
0007a30c  cmp     r4, r8
0007a30e  beq     #0x7a3b4
0007a310  ble     #0x7a35c
0007a312  movw    r3, #0xada
0007a316  cmp     r4, r3
0007a318  beq.w   #0x7a43c
0007a31c  adds    r3, #3
0007a31e  cmp     r4, r3
0007a320  bne     #0x7a2fe
0007a322  ldr     r3, [r6, #0x48]
0007a324  subs    r3, #1
0007a326  str     r3, [r6, #0x48]
0007a328  cmp     r3, #0
0007a32a  beq     #0x7a398
0007a32c  ldr.w   r3, [r0, #0xa4]
0007a330  adds    r3, #1
0007a332  str.w   r2, [r0, r3, lsl #3]
0007a336  movs    r0, #8
0007a338  str.w   r0, [r5, #0xfc]
0007a33c  b       #0x7a302
0007a33e  movw    r2, #0xaef
0007a342  cmp     r4, r2
0007a344  beq     #0x7a40a
0007a346  adds    r2, #3
0007a348  cmp     r4, r2
0007a34a  bne     #0x7a2fe
0007a34c  cmp     r3, #0
0007a34e  ble.w   #0x7a48a
0007a352  subs    r3, #1
0007a354  str.w   r3, [r0, #0xa4]
0007a358  movs    r0, #0
0007a35a  b       #0x7a302
0007a35c  cmp     r4, #0
0007a35e  bne     #0x7a2fe
0007a360  mov     r0, r6
0007a362  str     r4, [r6, #0x44]
0007a364  bl      #0x79590 ; -> zap_init_special_act
0007a368  str     r4, [r6, #0x44]
0007a36a  ldr.w   r3, [r5, #0xa4]
0007a36e  ldr.w   r2, [pc, #0x124]
0007a372  mov     r0, r4
0007a374  adds    r3, #1
0007a376  add     r2, pc ; -> 0x0007659d  t_st_zap_jsrp
0007a378  str.w   r8, [r5, r3, lsl #3]
0007a37c  ldr.w   r3, [r5, #0xa4]
0007a380  adds    r3, #1
0007a382  str.w   r3, [r5, #0xa4]
0007a386  lsls    r3, r3, #3
0007a388  adds    r3, r3, r5
0007a38a  str     r2, [r3, #4]
0007a38c  ldr.w   r3, [r5, #0xa4]
0007a390  adds    r3, #1
0007a392  str.w   r4, [r5, r3, lsl #3]
0007a396  b       #0x7a302
0007a398  mov     r0, r6
0007a39a  bl      #0x758b0 ; -> i_am_a_sitting_duck
0007a39e  ldr.w   r3, [r5, #0xa4]
0007a3a2  movs    r0, #8
0007a3a4  movw    r2, #0xae9
0007a3a8  adds    r3, #1
0007a3aa  str.w   r2, [r5, r3, lsl #3]
0007a3ae  str.w   r0, [r5, #0xfc]
0007a3b2  b       #0x7a302
0007a3b4  ldr     r3, [r6, #0x48]
0007a3b6  subs    r3, #1
0007a3b8  str     r3, [r6, #0x48]
0007a3ba  cmp     r3, #0
0007a3bc  beq     #0x7a398
0007a3be  ldr.w   r3, [r0, #0xa4]
0007a3c2  movw    r2, #0xada
0007a3c6  adds    r3, #1
0007a3c8  str.w   r2, [r0, r3, lsl #3]
0007a3cc  movs    r0, #8
0007a3ce  str.w   r0, [r5, #0xfc]
0007a3d2  b       #0x7a302
0007a3d4  movs    r3, #0xc
0007a3d6  str     r3, [r6, #0x44]
0007a3d8  ldr.w   r3, [r0, #0xa4]
0007a3dc  movw    r2, #0xae4
0007a3e0  adds    r3, #1
0007a3e2  str.w   r2, [r0, r3, lsl #3]
0007a3e6  ldr.w   r2, [pc, #0xb0]
0007a3ea  ldr.w   r3, [r0, #0xa4]
0007a3ee  add     r2, pc ; -> 0x0007659d  t_st_zap_jsrp
0007a3f0  adds    r3, #1
0007a3f2  str.w   r3, [r0, #0xa4]
0007a3f6  lsls    r3, r3, #3
0007a3f8  adds    r3, r3, r5
0007a3fa  movs    r0, #0
0007a3fc  str     r2, [r3, #4]
0007a3fe  ldr.w   r3, [r5, #0xa4]
0007a402  adds    r3, #1
0007a404  str.w   r0, [r5, r3, lsl #3]
0007a408  b       #0x7a302
0007a40a  ldr     r3, [r6, #0x40]
0007a40c  mov     r0, r6
0007a40e  subs    r3, #8
0007a410  str     r3, [r6, #0x40]
0007a412  bl      #0x59e24 ; -> do_next_a9_frame
0007a416  ldr.w   r3, [r5, #0xa4]
0007a41a  movs    r0, #4
0007a41c  movw    r2, #0xaf2
0007a420  adds    r3, #1
0007a422  str.w   r2, [r5, r3, lsl #3]
0007a426  str.w   r0, [r5, #0xfc]
0007a42a  b       #0x7a302
0007a42c  movw    r3, #0xae5
0007a430  str.w   r3, [r0, r1, lsl #3]
0007a434  movs    r0, #8
0007a436  str.w   r0, [r5, #0xfc]
0007a43a  b       #0x7a302
0007a43c  movs    r3, #0xc
0007a43e  str     r3, [r6, #0x44]
0007a440  ldr.w   r3, [r0, #0xa4]
0007a444  movw    r2, #0xadd
0007a448  adds    r3, #1
0007a44a  str.w   r2, [r0, r3, lsl #3]
0007a44e  ldr     r2, [pc, #0x4c]
0007a450  ldr.w   r3, [r0, #0xa4]
0007a454  add     r2, pc ; -> 0x0007659d  t_st_zap_jsrp
0007a456  adds    r3, #1
0007a458  str.w   r3, [r0, #0xa4]
0007a45c  b       #0x7a3f6
0007a45e  mov     r0, r6
0007a460  movs    r3, #0x24
0007a462  str     r3, [r6, #0x40]
0007a464  bl      #0x5520c ; -> get_char_ani
0007a468  ldr     r3, [r6, #0x40]
0007a46a  mov     r0, r6
0007a46c  adds    r3, #4
0007a46e  str     r3, [r6, #0x40]
0007a470  bl      #0x59e24 ; -> do_next_a9_frame
0007a474  ldr.w   r3, [r5, #0xa4]
0007a478  movs    r0, #4
0007a47a  movw    r2, #0xaef
0007a47e  adds    r3, #1
0007a480  str.w   r2, [r5, r3, lsl #3]
0007a484  str.w   r0, [r5, #0xfc]
0007a488  b       #0x7a302
0007a48a  ldr.w   r2, [pc, #0x14]
0007a48e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0007a490  ldr     r2, [r2]
0007a492  b       #0x7a3f6
0007a494  stm     r2!, {r0, r1, r5}
