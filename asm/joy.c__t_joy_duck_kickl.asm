========================================================================
t_joy_duck_kickl  0x0002fc5c  252 bytes   joy.c
========================================================================

0002fc5c  push    {r4, r5, r7, lr}
0002fc5e  add     r7, sp, #8
0002fc60  ldr.w   r3, [r0, #0xa4]
0002fc64  mov     r4, r0
0002fc66  ldr.w   r5, [r0, #0x108]
0002fc6a  adds    r3, #1
0002fc6c  ldr.w   r0, [r0, r3, lsl #3]
0002fc70  cmp.w   r0, #0x1aa
0002fc74  beq     #0x2fce0
0002fc76  ble     #0x2fc8c
0002fc78  movw    r3, #0x1b3
0002fc7c  cmp     r0, r3
0002fc7e  beq     #0x2fd16
0002fc80  cmp.w   r0, #0x1b6
0002fc84  beq     #0x2fcba
0002fc86  mvn     r0, #2
0002fc8a  pop     {r4, r5, r7, pc}
0002fc8c  cmp     r0, #0
0002fc8e  bne     #0x2fc86
0002fc90  mov.w   r2, #0x1aa
0002fc94  str.w   r2, [r4, r3, lsl #3]
0002fc98  ldr.w   r3, [r4, #0xa4]
0002fc9c  adds    r2, r3, #1
0002fc9e  ldr     r3, [pc, #0xac]
0002fca0  str.w   r2, [r4, #0xa4]
0002fca4  add     r3, pc ; -> 0x000f389c  t_stat_do_duck_kickl
0002fca6  ldr     r1, [r3]
0002fca8  lsls    r3, r2, #3
0002fcaa  adds    r3, r3, r4
0002fcac  str     r1, [r3, #4]
0002fcae  ldr.w   r3, [r4, #0xa4]
0002fcb2  adds    r3, #1
0002fcb4  str.w   r0, [r4, r3, lsl #3]
0002fcb8  b       #0x2fc8a
0002fcba  ldr     r0, [r5]
0002fcbc  ldr.w   r2, [pc, #0x90]
0002fcc0  ldr     r3, [r0, #0x14]
0002fcc2  add     r2, pc ; -> 0x000302d5  t_post_joy_duck_kick
0002fcc4  adds    r3, #8
0002fcc6  str     r3, [r0, #0x14]
0002fcc8  ldr.w   r3, [r4, #0xa4]
0002fccc  movs    r0, #0
0002fcce  lsls    r3, r3, #3
0002fcd0  adds    r3, r3, r4
0002fcd2  str     r2, [r3, #4]
0002fcd4  ldr.w   r3, [r4, #0xa4]
0002fcd8  adds    r3, #1
0002fcda  str.w   r0, [r4, r3, lsl #3]
0002fcde  b       #0x2fc8a
0002fce0  ldr     r2, [r5]
0002fce2  mov     r0, r5
0002fce4  movw    r3, #0x60b
0002fce8  str     r3, [r5, #0x1c]
0002fcea  str     r3, [r2, #0x18]
0002fcec  movs    r3, #6
0002fcee  str     r3, [r5, #0x54]
0002fcf0  bl      #0x5507c ; -> is_he_joy
0002fcf4  cbnz    r0, #0x2fcfa
0002fcf6  movs    r3, #0xa
0002fcf8  str     r3, [r5, #0x54]
0002fcfa  ldr     r3, [r5, #0x54]
0002fcfc  movw    r2, #0x1b3
0002fd00  str     r3, [r5, #0x1c]
0002fd02  ldr.w   r3, [r4, #0xa4]
0002fd06  adds    r3, #1
0002fd08  str.w   r2, [r4, r3, lsl #3]
0002fd0c  ldr     r3, [r5, #0x1c]
0002fd0e  str.w   r3, [r4, #0xfc]
0002fd12  ldr     r0, [r5, #0x1c]
0002fd14  b       #0x2fc8a
0002fd16  movs    r3, #2
0002fd18  str     r3, [r5, #0x1c]
0002fd1a  ldr.w   r3, [r4, #0xa4]
0002fd1e  mov.w   r2, #0x1b6
0002fd22  movs    r0, #0
0002fd24  adds    r3, #1
0002fd26  str.w   r2, [r4, r3, lsl #3]
0002fd2a  ldr.w   r3, [r4, #0xa4]
0002fd2e  adds    r2, r3, #1
0002fd30  ldr     r3, [pc, #0x20]
0002fd32  str.w   r2, [r4, #0xa4]
0002fd36  add     r3, pc ; -> 0x000f38c8  t_retract_strike
0002fd38  ldr     r1, [r3]
0002fd3a  lsls    r3, r2, #3
0002fd3c  adds    r3, r3, r4
0002fd3e  str     r1, [r3, #4]
0002fd40  ldr.w   r3, [r4, #0xa4]
0002fd44  adds    r3, #1
0002fd46  str.w   r0, [r4, r3, lsl #3]
0002fd4a  b       #0x2fc8a
0002fd4c  subs    r3, #0xf4
0002fd4e  movs    r4, r1
0002fd50  lsls    r7, r1, #0x18
0002fd52  movs    r0, r0
0002fd54  subs    r3, #0x8e
0002fd56  movs    r4, r1
