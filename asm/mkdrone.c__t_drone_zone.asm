========================================================================
t_drone_zone  0x0006e8b4  140 bytes   mkdrone.c
========================================================================

0006e8b4  push    {r4, r7, lr}
0006e8b6  add     r7, sp, #4
0006e8b8  ldr.w   r3, [r0, #0xa4]
0006e8bc  mov     r4, r0
0006e8be  ldr.w   r2, [r0, #0x108]
0006e8c2  adds    r3, #1
0006e8c4  ldr.w   r0, [r0, r3, lsl #3]
0006e8c8  cbnz    r0, #0x6e902
0006e8ca  ldr     r3, [pc, #0x68]
0006e8cc  add     r3, pc ; -> 0x000714a5  q_drone_zone
0006e8ce  str     r3, [r2, #0x48]
0006e8d0  movs    r3, #0x80
0006e8d2  str     r3, [r2, #0x44]
0006e8d4  ldr.w   r3, [r4, #0xa4]
0006e8d8  movw    r2, #0x47c
0006e8dc  adds    r3, #1
0006e8de  str.w   r2, [r4, r3, lsl #3]
0006e8e2  ldr.w   r3, [r4, #0xa4]
0006e8e6  ldr     r2, [pc, #0x50]
0006e8e8  adds    r3, #1
0006e8ea  str.w   r3, [r4, #0xa4]
0006e8ee  lsls    r3, r3, #3
0006e8f0  adds    r3, r3, r4
0006e8f2  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006e8f4  str     r2, [r3, #4]
0006e8f6  ldr.w   r3, [r4, #0xa4]
0006e8fa  adds    r3, #1
0006e8fc  str.w   r0, [r4, r3, lsl #3]
0006e900  pop     {r4, r7, pc}
0006e902  movw    r3, #0x47c
0006e906  cmp     r0, r3
0006e908  it      ne
0006e90a  mvnne   r0, #2
0006e90e  bne     #0x6e900
0006e910  mov     r0, r2
0006e912  bl      #0x2f3a0 ; -> get_x_dist
0006e916  ldr.w   r3, [r4, #0xa4]
0006e91a  ldr     r2, [pc, #0x20]
0006e91c  movs    r0, #0
0006e91e  lsls    r3, r3, #3
0006e920  adds    r3, r3, r4
0006e922  add     r2, pc ; -> 0x00067895  t_run_in_close
0006e924  str     r2, [r3, #4]
0006e926  ldr.w   r3, [r4, #0xa4]
0006e92a  adds    r3, #1
0006e92c  str.w   r0, [r4, r3, lsl #3]
0006e930  b       #0x6e900
0006e932  nop     
0006e934  cmp     r3, #0xd5
0006e936  movs    r0, r0
0006e938  adds    r6, #0xef
0006e93a  movs    r0, r0
0006e93c  ldrh    r7, [r5, #0x3a]
