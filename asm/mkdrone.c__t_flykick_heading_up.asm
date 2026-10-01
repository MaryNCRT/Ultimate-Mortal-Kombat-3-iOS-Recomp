========================================================================
t_flykick_heading_up  0x0006edf4  272 bytes   mkdrone.c
========================================================================

0006edf4  push    {r4, r5, r6, r7, lr}
0006edf6  add     r7, sp, #0xc
0006edf8  str     r8, [sp, #-0x4]!
0006edfc  ldr.w   r1, [r0, #0xa4]
0006ee00  movw    r8, #0x12f9
0006ee04  mov     r4, r0
0006ee06  adds    r3, r1, #1
0006ee08  ldr.w   r6, [r0, #0x108]
0006ee0c  ldr.w   r5, [r0, r3, lsl #3]
0006ee10  cmp     r5, r8
0006ee12  beq     #0x6ee76
0006ee14  ble     #0x6ee30
0006ee16  movw    r2, #0x12fc
0006ee1a  cmp     r5, r2
0006ee1c  beq     #0x6eea4
0006ee1e  movw    r3, #0x12fe
0006ee22  cmp     r5, r3
0006ee24  beq     #0x6ee5c
0006ee26  mvn     r0, #2
0006ee2a  ldr     r8, [sp], #4
0006ee2e  pop     {r4, r5, r6, r7, pc}
0006ee30  cmp     r5, #0
0006ee32  bne     #0x6ee26
0006ee34  mov     r0, r6
0006ee36  bl      #0x57828 ; -> get_his_dog
0006ee3a  ldr     r0, [r6, #0x1c]
0006ee3c  cmp     r0, #0x38
0006ee3e  ble     #0x6eebe
0006ee40  ldr.w   r3, [r4, #0xa4]
0006ee44  ldr     r2, [pc, #0xa4]
0006ee46  mov     r0, r5
0006ee48  lsls    r3, r3, #3
0006ee4a  adds    r3, r3, r4
0006ee4c  add     r2, pc ; -> 0x0006ba41  t_run_under_flykick
0006ee4e  str     r2, [r3, #4]
0006ee50  ldr.w   r3, [r4, #0xa4]
0006ee54  adds    r3, #1
0006ee56  str.w   r5, [r4, r3, lsl #3]
0006ee5a  b       #0x6ee2a
0006ee5c  ldr.w   r2, [pc, #0x90]
0006ee60  lsls    r3, r1, #3
0006ee62  add     r2, pc ; -> 0x000722c9  t_run_in_close_now
0006ee64  adds    r3, r3, r4
0006ee66  movs    r0, #0
0006ee68  str     r2, [r3, #4]
0006ee6a  ldr.w   r3, [r4, #0xa4]
0006ee6e  adds    r3, #1
0006ee70  str.w   r0, [r4, r3, lsl #3]
0006ee74  b       #0x6ee2a
0006ee76  ldr.w   r3, [pc, #0x7c]
0006ee7a  movw    r2, #0x12fc
0006ee7e  add     r3, pc ; -> 0x0006f1f1  q_is_kick_over
0006ee80  str     r3, [r6, #0x48]
0006ee82  movs    r3, #0x30
0006ee84  str     r3, [r6, #0x44]
0006ee86  ldr.w   r3, [r0, #0xa4]
0006ee8a  adds    r3, #1
0006ee8c  str.w   r2, [r0, r3, lsl #3]
0006ee90  ldr.w   r3, [r0, #0xa4]
0006ee94  ldr.w   r2, [pc, #0x60]
0006ee98  adds    r3, #1
0006ee9a  add     r2, pc ; -> 0x000684c1  t_d_wait_yes_still
0006ee9c  str.w   r3, [r0, #0xa4]
0006eea0  lsls    r3, r3, #3
0006eea2  b       #0x6ee64
0006eea4  movw    r2, #0x12fe
0006eea8  str.w   r2, [r0, r3, lsl #3]
0006eeac  ldr.w   r3, [r0, #0xa4]
0006eeb0  ldr     r2, [pc, #0x48]
0006eeb2  adds    r3, #1
0006eeb4  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006eeb6  str.w   r3, [r0, #0xa4]
0006eeba  lsls    r3, r3, #3
0006eebc  b       #0x6ee64
0006eebe  ldr.w   r3, [r4, #0xa4]
0006eec2  mov     r0, r5
0006eec4  adds    r3, #1
0006eec6  str.w   r8, [r4, r3, lsl #3]
0006eeca  ldr.w   r3, [r4, #0xa4]
0006eece  adds    r2, r3, #1
0006eed0  ldr     r3, [pc, #0x2c]
0006eed2  str.w   r2, [r4, #0xa4]
0006eed6  add     r3, pc ; -> 0x000f3884  t_do_duck
0006eed8  ldr     r1, [r3]
0006eeda  lsls    r3, r2, #3
0006eedc  adds    r3, r3, r4
0006eede  str     r1, [r3, #4]
0006eee0  ldr.w   r3, [r4, #0xa4]
0006eee4  adds    r3, #1
0006eee6  str.w   r5, [r4, r3, lsl #3]
0006eeea  b       #0x6ee2a
0006eeec  ldm     r3!, {r0, r4, r5, r6, r7}
