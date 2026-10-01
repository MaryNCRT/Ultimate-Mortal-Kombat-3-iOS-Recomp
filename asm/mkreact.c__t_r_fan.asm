========================================================================
t_r_fan  0x00046ce8  196 bytes   mkreact.c
========================================================================

00046ce8  push    {r4, r5, r6, r7, lr}
00046cea  add     r7, sp, #0xc
00046cec  ldr.w   r3, [r0, #0xa4]
00046cf0  mov     r5, r0
00046cf2  ldr.w   r4, [r0, #0x108]
00046cf6  adds    r3, #1
00046cf8  ldr.w   r6, [r0, r3, lsl #3]
00046cfc  cbnz    r6, #0x46d3c
00046cfe  movs    r3, #1
00046d00  mov     r0, r4
00046d02  str     r3, [r4, #0x34]
00046d04  bl      #0x41354 ; -> if_shao_then_pass
00046d08  str     r6, [r4, #0x30]
00046d0a  str     r6, [r4, #0x38]
00046d0c  ldr.w   r3, [r5, #0xa4]
00046d10  mov.w   r2, #0x3d4
00046d14  mov     r0, r6
00046d16  adds    r3, #1
00046d18  str.w   r2, [r5, r3, lsl #3]
00046d1c  ldr.w   r3, [r5, #0xa4]
00046d20  ldr     r2, [pc, #0x80]
00046d22  adds    r3, #1
00046d24  str.w   r3, [r5, #0xa4]
00046d28  lsls    r3, r3, #3
00046d2a  adds    r3, r3, r5
00046d2c  add     r2, pc ; -> 0x00044b85  t_reaction_start
00046d2e  str     r2, [r3, #4]
00046d30  ldr.w   r3, [r5, #0xa4]
00046d34  adds    r3, #1
00046d36  str.w   r6, [r5, r3, lsl #3]
00046d3a  pop     {r4, r5, r6, r7, pc}
00046d3c  cmp.w   r6, #0x3d4
00046d40  it      ne
00046d42  mvnne   r0, #2
00046d46  bne     #0x46d3a
00046d48  mov     r0, r4
00046d4a  bl      #0x54f40 ; -> set_half_damage
00046d4e  mov     r0, r4
00046d50  movs    r3, #2
00046d52  str     r3, [r4, #0x1c]
00046d54  bl      #0x580a4 ; -> group_sound
00046d58  mov     r0, r4
00046d5a  movs    r3, #1
00046d5c  str     r3, [r4, #0x1c]
00046d5e  bl      #0x57b94 ; -> his_ochar_sound
00046d62  mov     r0, r4
00046d64  movs    r3, #0x20
00046d66  str     r3, [r4, #0x40]
00046d68  bl      #0x55474 ; -> find_ani_part2
00046d6c  mov     r0, r4
00046d6e  mov.w   r3, #0x30000
00046d72  str     r3, [r4, #0x1c]
00046d74  bl      #0x55ab0 ; -> away_x_vel
00046d78  mov     r0, r4
00046d7a  movs    r3, #6
00046d7c  str     r3, [r4, #0x1c]
00046d7e  bl      #0x553a0 ; -> init_anirate
00046d82  movs    r3, #0x24
00046d84  str     r3, [r4, #0x44]
00046d86  ldr.w   r3, [r5, #0xa4]
00046d8a  ldr     r2, [pc, #0x1c]
00046d8c  movs    r0, #0
00046d8e  lsls    r3, r3, #3
00046d90  adds    r3, r3, r5
00046d92  add     r2, pc ; -> 0x00044bf1  t_rhat_wake
00046d94  str     r2, [r3, #4]
00046d96  ldr.w   r3, [r5, #0xa4]
00046d9a  adds    r3, #1
00046d9c  str.w   r0, [r5, r3, lsl #3]
00046da0  b       #0x46d3a
00046da2  nop     
00046da4  udf     #0x55
