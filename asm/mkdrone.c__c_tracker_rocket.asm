========================================================================
c_tracker_rocket  0x0006e198  240 bytes   mkdrone.c
========================================================================

0006e198  push    {r4, r5, r7, lr}
0006e19a  add     r7, sp, #8
0006e19c  ldr.w   r1, [r0, #0xa4]
0006e1a0  mov     r4, r0
0006e1a2  ldr.w   r5, [r0, #0x108]
0006e1a6  adds    r3, r1, #1
0006e1a8  movw    r2, #0xdd2
0006e1ac  ldr.w   r0, [r0, r3, lsl #3]
0006e1b0  cmp     r0, r2
0006e1b2  beq     #0x6e20c
0006e1b4  ble     #0x6e1ca
0006e1b6  movw    r3, #0xdd7
0006e1ba  cmp     r0, r3
0006e1bc  beq     #0x6e224
0006e1be  adds    r3, #4
0006e1c0  cmp     r0, r3
0006e1c2  beq     #0x6e1f2
0006e1c4  mvn     r0, #2
0006e1c8  pop     {r4, r5, r7, pc}
0006e1ca  cmp     r0, #0
0006e1cc  bne     #0x6e1c4
0006e1ce  str.w   r2, [r4, r3, lsl #3]
0006e1d2  ldr.w   r3, [r4, #0xa4]
0006e1d6  ldr     r2, [pc, #0x98]
0006e1d8  adds    r3, #1
0006e1da  str.w   r3, [r4, #0xa4]
0006e1de  lsls    r3, r3, #3
0006e1e0  adds    r3, r3, r4
0006e1e2  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006e1e4  str     r2, [r3, #4]
0006e1e6  ldr.w   r3, [r4, #0xa4]
0006e1ea  adds    r3, #1
0006e1ec  str.w   r0, [r4, r3, lsl #3]
0006e1f0  b       #0x6e1c8
0006e1f2  ldr.w   r2, [pc, #0x80]
0006e1f6  lsls    r3, r1, #3
0006e1f8  add     r2, pc ; -> 0x00067895  t_run_in_close
0006e1fa  adds    r3, r3, r4
0006e1fc  movs    r0, #0
0006e1fe  str     r2, [r3, #4]
0006e200  ldr.w   r3, [r4, #0xa4]
0006e204  adds    r3, #1
0006e206  str.w   r0, [r4, r3, lsl #3]
0006e20a  b       #0x6e1c8
0006e20c  mov     r0, r5
0006e20e  bl      #0x2f3a0 ; -> get_x_dist
0006e212  ldr     r0, [r5, #0x28]
0006e214  cmp     r0, #0xdf
0006e216  bgt     #0x6e24e
0006e218  ldr.w   r3, [r4, #0xa4]
0006e21c  ldr     r2, [pc, #0x58]
0006e21e  lsls    r3, r3, #3
0006e220  add     r2, pc ; -> 0x00067895  t_run_in_close
0006e222  b       #0x6e1fa
0006e224  ldr     r3, [pc, #0x54]
0006e226  movw    r2, #0xddb
0006e22a  add     r3, pc ; -> 0x000701d9  q_is_tracker_close
0006e22c  str     r3, [r5, #0x48]
0006e22e  movs    r3, #0x70
0006e230  str     r3, [r5, #0x44]
0006e232  ldr.w   r3, [r4, #0xa4]
0006e236  adds    r3, #1
0006e238  str.w   r2, [r4, r3, lsl #3]
0006e23c  ldr.w   r3, [r4, #0xa4]
0006e240  ldr     r2, [pc, #0x3c]
0006e242  adds    r3, #1
0006e244  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006e246  str.w   r3, [r4, #0xa4]
0006e24a  lsls    r3, r3, #3
0006e24c  b       #0x6e1fa
0006e24e  ldr.w   r3, [r4, #0xa4]
0006e252  movw    r2, #0xdd7
0006e256  adds    r3, #1
0006e258  str.w   r2, [r4, r3, lsl #3]
0006e25c  ldr.w   r3, [r4, #0xa4]
0006e260  ldr     r2, [pc, #0x20]
0006e262  adds    r3, #1
0006e264  add     r2, pc ; -> 0x0006847d  t_stw_proj_proc
0006e266  str.w   r3, [r4, #0xa4]
0006e26a  lsls    r3, r3, #3
0006e26c  b       #0x6e1fa
0006e26e  nop     
0006e270  add     r2, sp, #0x17c
0006e272  vqshlu.s64 d25, d9, #0x3f
