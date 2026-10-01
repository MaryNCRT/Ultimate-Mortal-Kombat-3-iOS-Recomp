========================================================================
t_death_slam_pause  0x00049a64  204 bytes   mkreact.c
========================================================================

00049a64  push    {r4, r5, r7, lr}
00049a66  add     r7, sp, #8
00049a68  ldr.w   r3, [r0, #0xa4]
00049a6c  mov     r4, r0
00049a6e  ldr.w   r5, [r0, #0x108]
00049a72  adds    r3, #1
00049a74  ldr.w   r3, [r0, r3, lsl #3]
00049a78  cmp     r3, #0
00049a7a  bne     #0x49ae8
00049a7c  mov     r0, r5
00049a7e  bl      #0x34fc4 ; -> death_scream
00049a82  mov     r0, r5
00049a84  movs    r3, #0x1e
00049a86  str     r3, [r5, #0x40]
00049a88  bl      #0x55474 ; -> find_ani_part2
00049a8c  mov     r0, r5
00049a8e  bl      #0x55428 ; -> find_last_frame
00049a92  mov     r0, r5
00049a94  bl      #0x59e24 ; -> do_next_a9_frame
00049a98  ldr.w   r1, [r4, #0xf8]
00049a9c  ldr     r2, [r5, #0x48]
00049a9e  mov     r0, r5
00049aa0  lsls    r3, r1, #2
00049aa2  adds    r3, r3, r4
00049aa4  str.w   r2, [r3, #0xa8]
00049aa8  adds    r3, r1, #1
00049aaa  str.w   r3, [r4, #0xf8]
00049aae  ldr     r3, [pc, #0x78]
00049ab0  str     r3, [r5, #0x48]
00049ab2  bl      #0x581e0 ; -> shake_a11
00049ab6  ldr.w   r3, [r4, #0xf8]
00049aba  mov     r0, r5
00049abc  movs    r1, #0x81
00049abe  subs    r3, #1
00049ac0  str.w   r3, [r4, #0xf8]
00049ac4  lsls    r3, r3, #2
00049ac6  adds    r3, r3, r4
00049ac8  ldr.w   r3, [r3, #0xa8]
00049acc  str     r3, [r5, #0x48]
00049ace  bl      #0x57dd0 ; -> tsound_func
00049ad2  ldr.w   r3, [r4, #0xa4]
00049ad6  mov.w   r2, #0x1e4
00049ada  movs    r0, #3
00049adc  adds    r3, #1
00049ade  str.w   r2, [r4, r3, lsl #3]
00049ae2  str.w   r0, [r4, #0xfc]
00049ae6  pop     {r4, r5, r7, pc}
00049ae8  cmp.w   r3, #0x1e4
00049aec  it      ne
00049aee  mvnne   r0, #2
00049af2  bne     #0x49ae6
00049af4  mov     r0, r5
00049af6  bl      #0x47ad8 ; -> pose_stumble_frame_1
00049afa  ldr.w   r3, [r4, #0xa4]
00049afe  cmp     r3, #0
00049b00  ble     #0x49b0c
00049b02  subs    r3, #1
00049b04  movs    r0, #0
00049b06  str.w   r3, [r4, #0xa4]
00049b0a  b       #0x49ae6
00049b0c  ldr.w   r2, [pc, #0x1c]
00049b10  lsls    r3, r3, #3
00049b12  adds    r3, r3, r4
00049b14  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00049b16  movs    r0, #0
00049b18  ldr     r2, [r2]
00049b1a  str     r2, [r3, #4]
00049b1c  ldr.w   r3, [r4, #0xa4]
00049b20  adds    r3, #1
00049b22  str.w   r0, [r4, r3, lsl #3]
00049b26  b       #0x49ae6
00049b28  movs    r5, r0
00049b2a  movs    r0, r1
00049b2c  ldr     r3, [sp, #0x3c0]
00049b2e  movs    r2, r1
