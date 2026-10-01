========================================================================
c_sky_pro  0x0006a3e0  176 bytes   mkdrone.c
========================================================================

0006a3e0  push    {lr}
0006a3e2  ldr.w   ip, [r0, #0xa4]
0006a3e6  ldr.w   lr, [r0, #0x108]
0006a3ea  add.w   r1, ip, #1
0006a3ee  ldr.w   r2, [r0, r1, lsl #3]
0006a3f2  cmp.w   r2, #0xe20
0006a3f6  beq     #0x6a44e
0006a3f8  movw    r3, #0xe23
0006a3fc  cmp     r2, r3
0006a3fe  beq     #0x6a432
0006a400  cbz     r2, #0x6a408
0006a402  mvn     r0, #2
0006a406  pop     {pc}
0006a408  mov.w   r3, #0xe20
0006a40c  str.w   r3, [r0, r1, lsl #3]
0006a410  ldr.w   r3, [r0, #0xa4]
0006a414  ldr     r1, [pc, #0x68]
0006a416  adds    r3, #1
0006a418  str.w   r3, [r0, #0xa4]
0006a41c  lsls    r3, r3, #3
0006a41e  adds    r3, r3, r0
0006a420  add     r1, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006a422  str     r1, [r3, #4]
0006a424  ldr.w   r3, [r0, #0xa4]
0006a428  adds    r3, #1
0006a42a  str.w   r2, [r0, r3, lsl #3]
0006a42e  mov     r0, r2
0006a430  b       #0x6a406
0006a432  ldr     r2, [pc, #0x50]
0006a434  lsl.w   r3, ip, #3
0006a438  add     r2, pc ; -> 0x00067895  t_run_in_close
0006a43a  adds    r3, r3, r0
0006a43c  str     r2, [r3, #4]
0006a43e  ldr.w   r3, [r0, #0xa4]
0006a442  movs    r2, #0
0006a444  adds    r3, #1
0006a446  str.w   r2, [r0, r3, lsl #3]
0006a44a  mov     r0, r2
0006a44c  b       #0x6a406
0006a44e  ldr     r3, [pc, #0x38]
0006a450  movw    r2, #0xe23
0006a454  add     r3, pc ; -> 0x00070179  q_is_proj_gone
0006a456  str.w   r3, [lr, #0x48]
0006a45a  movs    r3, #0x30
0006a45c  str.w   r3, [lr, #0x44]
0006a460  ldr.w   r3, [r0, #0xa4]
0006a464  adds    r3, #1
0006a466  str.w   r2, [r0, r3, lsl #3]
0006a46a  ldr.w   r3, [r0, #0xa4]
0006a46e  ldr.w   r2, [pc, #0x1c]
0006a472  adds    r3, #1
0006a474  add     r2, pc ; -> 0x00071ee5  t_stance_wait_no
0006a476  str.w   r3, [r0, #0xa4]
0006a47a  lsls    r3, r3, #3
0006a47c  b       #0x6a43a
0006a47e  nop     
