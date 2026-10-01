========================================================================
c_lao_tele  0x0006d71c  224 bytes   mkdrone.c
========================================================================

0006d71c  push    {r4, r5, r6, r7, lr}
0006d71e  add     r7, sp, #0xc
0006d720  ldr.w   r3, [r0, #0xa4]
0006d724  mov     r4, r0
0006d726  ldr.w   r5, [r0, #0x108]
0006d72a  adds    r3, #1
0006d72c  ldr.w   r6, [r0, r3, lsl #3]
0006d730  cbnz    r6, #0x6d760
0006d732  ldr     r3, [pc, #0xa8]
0006d734  mov     r0, r5
0006d736  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006d738  str     r3, [r5, #0x1c]
0006d73a  bl      #0x6c9c8 ; -> ask_mr_diff
0006d73e  ldr     r3, [r5, #0x5c]
0006d740  cmp     r3, #0
0006d742  bne     #0x6d7ac
0006d744  ldr     r2, [pc, #0x98]
0006d746  ldr.w   r3, [r4, #0xa4]
0006d74a  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d74c  lsls    r3, r3, #3
0006d74e  adds    r3, r3, r4
0006d750  mov     r0, r6
0006d752  str     r2, [r3, #4]
0006d754  ldr.w   r3, [r4, #0xa4]
0006d758  adds    r3, #1
0006d75a  str.w   r6, [r4, r3, lsl #3]
0006d75e  pop     {r4, r5, r6, r7, pc}
0006d760  movw    r3, #0x1196
0006d764  cmp     r6, r3
0006d766  it      ne
0006d768  mvnne   r0, #2
0006d76c  bne     #0x6d75e
0006d76e  mov     r0, r5
0006d770  bl      #0x2f3a0 ; -> get_x_dist
0006d774  ldr     r3, [r5, #0x28]
0006d776  cmp     r3, #0x70
0006d778  bgt     #0x6d7a6
0006d77a  ldr     r3, [pc, #0x68]
0006d77c  add     r3, pc ; -> 0x000f357c  G
0006d77e  ldr     r3, [r3]
0006d780  ldrsh.w r3, [r3, #0x44c]
0006d784  cmp     r3, #4
0006d786  str     r3, [r5, #0x1c]
0006d788  ble     #0x6d7d4
0006d78a  ldr     r2, [pc, #0x5c]
0006d78c  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0006d78e  ldr.w   r3, [r4, #0xa4]
0006d792  movs    r0, #0
0006d794  lsls    r3, r3, #3
0006d796  adds    r3, r3, r4
0006d798  str     r2, [r3, #4]
0006d79a  ldr.w   r3, [r4, #0xa4]
0006d79e  adds    r3, #1
0006d7a0  str.w   r0, [r4, r3, lsl #3]
0006d7a4  b       #0x6d75e
0006d7a6  ldr     r2, [pc, #0x44]
0006d7a8  add     r2, pc ; -> 0x00067635  t_d_lo_kick
0006d7aa  b       #0x6d78e
0006d7ac  ldr     r3, [pc, #0x40]
0006d7ae  movw    r2, #0x1196
0006d7b2  add     r3, pc ; -> 0x00068e75  q_is_he_below_ground
0006d7b4  str     r3, [r5, #0x48]
0006d7b6  movs    r3, #0x50
0006d7b8  str     r3, [r5, #0x44]
0006d7ba  ldr.w   r3, [r4, #0xa4]
0006d7be  adds    r3, #1
0006d7c0  str.w   r2, [r4, r3, lsl #3]
0006d7c4  ldr     r2, [pc, #0x2c]
0006d7c6  ldr.w   r3, [r4, #0xa4]
0006d7ca  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006d7cc  adds    r3, #1
0006d7ce  str.w   r3, [r4, #0xa4]
0006d7d2  b       #0x6d74c
0006d7d4  ldr.w   r2, [pc, #0x20]
0006d7d8  add     r2, pc ; -> 0x00067635  t_d_lo_kick
0006d7da  b       #0x6d78e
0006d7dc  ldr     r0, [pc, #0x1b8]
0006d7de  movs    r0, r2
0006d7e0  bics.w  pc, r7, pc, ror #31
0006d7e4  ldrb    r4, [r7, r7]
0006d7e6  movs    r0, r1
0006d7e8  ldr     r7, [sp, #0x44]
