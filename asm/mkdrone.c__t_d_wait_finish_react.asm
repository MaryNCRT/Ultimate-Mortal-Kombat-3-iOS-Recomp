========================================================================
t_d_wait_finish_react  0x0006e810  164 bytes   mkdrone.c
========================================================================

0006e810  push    {r4, r5, r6, r7, lr}
0006e812  add     r7, sp, #0xc
0006e814  ldr.w   r2, [r0, #0xa4]
0006e818  mov     r4, r0
0006e81a  ldr.w   r5, [r0, #0x108]
0006e81e  adds    r3, r2, #1
0006e820  ldr.w   r6, [r0, r3, lsl #3]
0006e824  cmp     r6, #0
0006e826  bne     #0x6e86e
0006e828  mov     r0, r5
0006e82a  bl      #0x2f3a0 ; -> get_x_dist
0006e82e  ldr     r3, [r5, #0x28]
0006e830  cmp     r3, #0x5f
0006e832  ble     #0x6e898
0006e834  ldr     r3, [pc, #0x6c]
0006e836  movw    r2, #0x4bb
0006e83a  add     r3, pc ; -> 0x0006c7fd  q_is_he_reacting
0006e83c  str     r3, [r5, #0x48]
0006e83e  movs    r3, #0x60
0006e840  str     r3, [r5, #0x44]
0006e842  ldr.w   r3, [r4, #0xa4]
0006e846  adds    r3, #1
0006e848  str.w   r2, [r4, r3, lsl #3]
0006e84c  ldr     r2, [pc, #0x58]
0006e84e  ldr.w   r3, [r4, #0xa4]
0006e852  add     r2, pc ; -> 0x00071ee5  t_stance_wait_no
0006e854  adds    r3, #1
0006e856  str.w   r3, [r4, #0xa4]
0006e85a  lsls    r3, r3, #3
0006e85c  adds    r3, r3, r4
0006e85e  mov     r0, r6
0006e860  str     r2, [r3, #4]
0006e862  ldr.w   r3, [r4, #0xa4]
0006e866  adds    r3, #1
0006e868  str.w   r6, [r4, r3, lsl #3]
0006e86c  pop     {r4, r5, r6, r7, pc}
0006e86e  movw    r3, #0x4bb
0006e872  cmp     r6, r3
0006e874  it      ne
0006e876  mvnne   r0, #2
0006e87a  bne     #0x6e86c
0006e87c  ldr.w   r3, [pc, #0x2c]
0006e880  movs    r0, #0
0006e882  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006e884  ldr     r1, [r3]
0006e886  lsls    r3, r2, #3
0006e888  adds    r3, r3, r4
0006e88a  str     r1, [r3, #4]
0006e88c  ldr.w   r3, [r4, #0xa4]
0006e890  adds    r3, #1
0006e892  str.w   r0, [r4, r3, lsl #3]
0006e896  b       #0x6e86c
0006e898  ldr.w   r2, [pc, #0x14]
0006e89c  ldr.w   r3, [r4, #0xa4]
0006e8a0  add     r2, pc ; -> 0x00067a31  t_d_backoff_a_bit
0006e8a2  b       #0x6e85a
0006e8a4  svc     #0xbf
