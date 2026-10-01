========================================================================
c_superk_sd  0x0006ac78  164 bytes   mkdrone.c
========================================================================

0006ac78  push    {lr}
0006ac7a  ldr.w   r1, [r0, #0xa4]
0006ac7e  movw    lr, #0x107a
0006ac82  ldr.w   ip, [r0, #0x108]
0006ac86  adds    r3, r1, #1
0006ac88  ldr.w   r2, [r0, r3, lsl #3]
0006ac8c  cmp     r2, lr
0006ac8e  beq     #0x6acf2
0006ac90  movw    r3, #0x107b
0006ac94  cmp     r2, r3
0006ac96  beq     #0x6acd8
0006ac98  cbz     r2, #0x6aca0
0006ac9a  mvn     r0, #2
0006ac9e  pop     {pc}
0006aca0  movs    r3, #0x30
0006aca2  str.w   r3, [ip, #0x44]
0006aca6  adds    r3, #0x18
0006aca8  str.w   r3, [ip, #0x48]
0006acac  ldr.w   r3, [r0, #0xa4]
0006acb0  ldr     r1, [pc, #0x5c]
0006acb2  adds    r3, #1
0006acb4  add     r1, pc ; -> 0x00072b95  t_d_stalk_a11
0006acb6  str.w   lr, [r0, r3, lsl #3]
0006acba  ldr.w   r3, [r0, #0xa4]
0006acbe  adds    r3, #1
0006acc0  str.w   r3, [r0, #0xa4]
0006acc4  lsls    r3, r3, #3
0006acc6  adds    r3, r3, r0
0006acc8  str     r1, [r3, #4]
0006acca  ldr.w   r3, [r0, #0xa4]
0006acce  adds    r3, #1
0006acd0  str.w   r2, [r0, r3, lsl #3]
0006acd4  mov     r0, r2
0006acd6  b       #0x6ac9e
0006acd8  ldr     r2, [pc, #0x38]
0006acda  lsls    r3, r1, #3
0006acdc  add     r2, pc ; -> 0x000687ad  t_d_rapid_lo
0006acde  adds    r3, r3, r0
0006ace0  str     r2, [r3, #4]
0006ace2  ldr.w   r3, [r0, #0xa4]
0006ace6  movs    r2, #0
0006ace8  adds    r3, #1
0006acea  str.w   r2, [r0, r3, lsl #3]
0006acee  mov     r0, r2
0006acf0  b       #0x6ac9e
0006acf2  movw    r2, #0x107b
0006acf6  str.w   r2, [r0, r3, lsl #3]
0006acfa  ldr.w   r3, [r0, #0xa4]
0006acfe  ldr.w   r2, [pc, #0x18]
0006ad02  adds    r3, #1
0006ad04  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006ad06  str.w   r3, [r0, #0xa4]
0006ad0a  lsls    r3, r3, #3
0006ad0c  b       #0x6acde
0006ad0e  nop     
0006ad10  ldrb    r5, [r3, #0x1b]
0006ad12  movs    r0, r0
0006ad14  bge     #0x6acb2
