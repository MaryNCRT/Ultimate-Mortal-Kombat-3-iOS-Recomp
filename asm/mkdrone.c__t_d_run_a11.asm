========================================================================
t_d_run_a11  0x0006fcf4  296 bytes   mkdrone.c
========================================================================

0006fcf4  push    {r4, r5, r7, lr}
0006fcf6  add     r7, sp, #8
0006fcf8  ldr.w   r3, [r0, #0xa4]
0006fcfc  mov     r4, r0
0006fcfe  ldr.w   r5, [r0, #0x108]
0006fd02  adds    r3, #1
0006fd04  ldr.w   r3, [r0, r3, lsl #3]
0006fd08  cmp.w   r3, #0x210
0006fd0c  beq     #0x6fd6a
0006fd0e  ble     #0x6fd24
0006fd10  movw    r2, #0x212
0006fd14  cmp     r3, r2
0006fd16  beq     #0x6fda4
0006fd18  adds    r2, #3
0006fd1a  cmp     r3, r2
0006fd1c  beq     #0x6fd52
0006fd1e  mvn     r0, #2
0006fd22  pop     {r4, r5, r7, pc}
0006fd24  cmp     r3, #0
0006fd26  bne     #0x6fd1e
0006fd28  mov     r0, r5
0006fd2a  bl      #0x30fbc ; -> run_setup
0006fd2e  mov     r0, r5
0006fd30  bl      #0x551f0 ; -> am_i_facing_him
0006fd34  cmp     r0, #0
0006fd36  bne     #0x6fddc
0006fd38  ldr.w   r3, [r4, #0xa4]
0006fd3c  ldr     r2, [pc, #0xc8]
0006fd3e  lsls    r3, r3, #3
0006fd40  adds    r3, r3, r4
0006fd42  add     r2, pc ; -> 0x00070675  t_d_turnaround
0006fd44  str     r2, [r3, #4]
0006fd46  ldr.w   r3, [r4, #0xa4]
0006fd4a  adds    r3, #1
0006fd4c  str.w   r0, [r4, r3, lsl #3]
0006fd50  b       #0x6fd22
0006fd52  mov     r0, r5
0006fd54  bl      #0x2f3a0 ; -> get_x_dist
0006fd58  ldr     r2, [r5, #0x28]
0006fd5a  ldr     r3, [r5, #0x48]
0006fd5c  cmp     r2, r3
0006fd5e  bge     #0x6fdf2
0006fd60  ldr     r2, [pc, #0xa8]
0006fd62  ldr.w   r3, [r4, #0xa4]
0006fd66  add     r2, pc ; -> 0x0006eda5  t_dist_retp
0006fd68  b       #0x6fdc8
0006fd6a  mov     r0, r5
0006fd6c  bl      #0x30820 ; -> reduce_turbo_bar
0006fd70  ldr.w   r3, [r4, #0xa4]
0006fd74  movw    r2, #0x212
0006fd78  movs    r0, #0
0006fd7a  adds    r3, #1
0006fd7c  str.w   r2, [r4, r3, lsl #3]
0006fd80  ldr.w   r3, [r4, #0xa4]
0006fd84  adds    r2, r3, #1
0006fd86  ldr.w   r3, [pc, #0x88]
0006fd8a  str.w   r2, [r4, #0xa4]
0006fd8e  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
0006fd90  ldr     r1, [r3]
0006fd92  lsls    r3, r2, #3
0006fd94  adds    r3, r3, r4
0006fd96  str     r1, [r3, #4]
0006fd98  ldr.w   r3, [r4, #0xa4]
0006fd9c  adds    r3, #1
0006fd9e  str.w   r0, [r4, r3, lsl #3]
0006fda2  b       #0x6fd22
0006fda4  mov     r0, r5
0006fda6  bl      #0x5a680 ; -> next_anirate
0006fdaa  ldr.w   r3, [r4, #0xa4]
0006fdae  movw    r2, #0x215
0006fdb2  adds    r3, #1
0006fdb4  str.w   r2, [r4, r3, lsl #3]
0006fdb8  ldr.w   r2, [pc, #0x58]
0006fdbc  ldr.w   r3, [r4, #0xa4]
0006fdc0  add     r2, pc ; -> 0x0006c40d  t_d_beware
0006fdc2  adds    r3, #1
0006fdc4  str.w   r3, [r4, #0xa4]
0006fdc8  lsls    r3, r3, #3
0006fdca  adds    r3, r3, r4
0006fdcc  movs    r0, #0
0006fdce  str     r2, [r3, #4]
0006fdd0  ldr.w   r3, [r4, #0xa4]
0006fdd4  adds    r3, #1
0006fdd6  str.w   r0, [r4, r3, lsl #3]
0006fdda  b       #0x6fd22
0006fddc  ldr.w   r3, [r4, #0xa4]
0006fde0  movs    r0, #1
0006fde2  mov.w   r2, #0x210
0006fde6  adds    r3, #1
0006fde8  str.w   r2, [r4, r3, lsl #3]
0006fdec  str.w   r0, [r4, #0xfc]
0006fdf0  b       #0x6fd22
0006fdf2  ldr     r3, [r5, #0x44]
0006fdf4  subs    r3, #1
0006fdf6  cmp     r3, #0
0006fdf8  str     r3, [r5, #0x44]
0006fdfa  bgt     #0x6fd2e
0006fdfc  ldr.w   r2, [pc, #0x18]
0006fe00  ldr.w   r3, [r4, #0xa4]
0006fe04  add     r2, pc ; -> 0x0006eda5  t_dist_retp
0006fe06  b       #0x6fdc8
0006fe08  lsrs    r7, r5, #4
0006fe0a  movs    r0, r0
0006fe0c  bl      #0xabe0e
0006fe10  subs    r2, #0x16
0006fe12  movs    r0, r1
0006fe14  stm     r6!, {r0, r3, r6}
