========================================================================
t_joy_lo_kick  0x0002fd58  220 bytes   joy.c
========================================================================

0002fd58  push    {r4, r5, r6, r7, lr}
0002fd5a  add     r7, sp, #0xc
0002fd5c  mov     r4, r0
0002fd5e  ldr.w   r2, [r4, #0xa4]
0002fd62  movw    r6, #0x236
0002fd66  ldr.w   r0, [r0, #0x108]
0002fd6a  adds    r3, r2, #1
0002fd6c  ldr.w   r5, [r4, r3, lsl #3]
0002fd70  cmp     r5, r6
0002fd72  beq     #0x2fdce
0002fd74  movw    r3, #0x23d
0002fd78  cmp     r5, r3
0002fd7a  beq     #0x2fdb4
0002fd7c  cbz     r5, #0x2fd84
0002fd7e  mvn     r0, #2
0002fd82  pop     {r4, r5, r6, r7, pc}
0002fd84  bl      #0x2ec68 ; -> disable_all_buttons
0002fd88  ldr.w   r3, [r4, #0xa4]
0002fd8c  ldr     r2, [pc, #0x94]
0002fd8e  mov     r0, r5
0002fd90  adds    r3, #1
0002fd92  add     r2, pc ; -> 0x0002f9d5  t_knee_check
0002fd94  str.w   r6, [r4, r3, lsl #3]
0002fd98  ldr.w   r3, [r4, #0xa4]
0002fd9c  adds    r3, #1
0002fd9e  str.w   r3, [r4, #0xa4]
0002fda2  lsls    r3, r3, #3
0002fda4  adds    r3, r3, r4
0002fda6  str     r2, [r3, #4]
0002fda8  ldr.w   r3, [r4, #0xa4]
0002fdac  adds    r3, #1
0002fdae  str.w   r5, [r4, r3, lsl #3]
0002fdb2  b       #0x2fd82
0002fdb4  ldr.w   r1, [pc, #0x70]
0002fdb8  lsls    r3, r2, #3
0002fdba  adds    r3, r3, r4
0002fdbc  add     r1, pc ; -> 0x00030061  t_local_reaction_exit
0002fdbe  str     r1, [r3, #4]
0002fdc0  ldr.w   r3, [r4, #0xa4]
0002fdc4  movs    r0, #0
0002fdc6  adds    r3, #1
0002fdc8  str.w   r0, [r4, r3, lsl #3]
0002fdcc  b       #0x2fd82
0002fdce  bl      #0x55df0 ; -> is_stick_away
0002fdd2  cbz     r0, #0x2fdf2
0002fdd4  ldr.w   r3, [r4, #0xa4]
0002fdd8  ldr.w   r2, [pc, #0x50]
0002fddc  movs    r0, #0
0002fdde  lsls    r3, r3, #3
0002fde0  adds    r3, r3, r4
0002fde2  add     r2, pc ; -> 0x0002f1b5  t_joy_sweep_kick
0002fde4  str     r2, [r3, #4]
0002fde6  ldr.w   r3, [r4, #0xa4]
0002fdea  adds    r3, #1
0002fdec  str.w   r0, [r4, r3, lsl #3]
0002fdf0  b       #0x2fd82
0002fdf2  ldr.w   r3, [r4, #0xa4]
0002fdf6  movw    r2, #0x23d
0002fdfa  adds    r3, #1
0002fdfc  str.w   r2, [r4, r3, lsl #3]
0002fe00  ldr.w   r3, [r4, #0xa4]
0002fe04  adds    r2, r3, #1
0002fe06  ldr     r3, [pc, #0x28]
0002fe08  str.w   r2, [r4, #0xa4]
0002fe0c  add     r3, pc ; -> 0x000f3858  t_stat_do_lo_kick
0002fe0e  ldr     r1, [r3]
0002fe10  lsls    r3, r2, #3
0002fe12  adds    r3, r3, r4
0002fe14  str     r1, [r3, #4]
0002fe16  ldr.w   r3, [r4, #0xa4]
0002fe1a  adds    r3, #1
0002fe1c  str.w   r0, [r4, r3, lsl #3]
0002fe20  b       #0x2fd82
0002fe22  nop     
0002fe24  ldc2    p15, c15, [pc], #-0x3fc
0002fe28  lsls    r1, r4, #0xa
0002fe2a  movs    r0, r0
0002fe2c  bl      #0x3ffe2e
0002fe30  subs    r2, #0x48
0002fe32  movs    r4, r1
