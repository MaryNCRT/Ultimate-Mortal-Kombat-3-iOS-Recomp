========================================================================
t_bonus_count_draw  0x0007cc4c  108 bytes   mkbonus.c
========================================================================

0007cc4c  push    {r4, r5, r7, lr}
0007cc4e  add     r7, sp, #8
0007cc50  ldr.w   r2, [r0, #0xa4]
0007cc54  mov     r4, r0
0007cc56  ldr.w   r5, [r0, #0x108]
0007cc5a  adds    r3, r2, #1
0007cc5c  ldr.w   r3, [r0, r3, lsl #3]
0007cc60  cbnz    r3, #0x7cc8c
0007cc62  ldr     r3, [pc, #0x4c]
0007cc64  mov     r0, r5
0007cc66  add     r3, pc ; -> 0x00174b80  txt_tie
0007cc68  ldr     r3, [r3]
0007cc6a  str     r3, [r5, #0x3c]
0007cc6c  bl      #0x7cc38 ; -> do_winner_text
0007cc70  mov     r0, r5
0007cc72  movs    r1, #1
0007cc74  bl      #0x7cc0c ; -> do_winner_char
0007cc78  ldr.w   r3, [r4, #0xa4]
0007cc7c  movs    r2, #0xfd
0007cc7e  movs    r0, #0x40
0007cc80  adds    r3, #1
0007cc82  str.w   r2, [r4, r3, lsl #3]
0007cc86  str.w   r0, [r4, #0xfc]
0007cc8a  pop     {r4, r5, r7, pc}
0007cc8c  cmp     r3, #0xfd
0007cc8e  it      ne
0007cc90  mvnne   r0, #2
0007cc94  bne     #0x7cc8a
0007cc96  ldr     r1, [pc, #0x1c]
0007cc98  lsls    r3, r2, #3
0007cc9a  adds    r3, r3, r4
0007cc9c  add     r1, pc ; -> 0x0007cb3d  t_bonus_exit
0007cc9e  str     r1, [r3, #4]
0007cca0  ldr.w   r3, [r4, #0xa4]
0007cca4  movs    r0, #0
0007cca6  adds    r3, #1
0007cca8  str.w   r0, [r4, r3, lsl #3]
0007ccac  b       #0x7cc8a
0007ccae  nop     
0007ccb0  ldrb    r6, [r2, #0x1c]
0007ccb2  movs    r7, r1
0007ccb4  mrc2    p15, #4, apsr_nzcv, c13, c15, #7
