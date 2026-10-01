========================================================================
t_d_post_block  0x0006c6dc  160 bytes   mkdrone.c
========================================================================

0006c6dc  push    {r4, r5, r6, r7, lr}
0006c6de  add     r7, sp, #0xc
0006c6e0  ldr.w   r2, [r0, #0xa4]
0006c6e4  mov     r4, r0
0006c6e6  ldr.w   r5, [r0, #0x108]
0006c6ea  adds    r3, r2, #1
0006c6ec  ldr.w   r6, [r0, r3, lsl #3]
0006c6f0  cmp     r6, #0
0006c6f2  bne     #0x6c73e
0006c6f4  mov     r0, r5
0006c6f6  bl      #0x6c6b0 ; -> is_he_attacking
0006c6fa  ldr     r3, [r5, #0x5c]
0006c6fc  cmp     r3, #0
0006c6fe  beq     #0x6c764
0006c700  ldr     r2, [r5]
0006c702  mov.w   r3, #0x700
0006c706  str     r3, [r2, #0x18]
0006c708  sub.w   r3, r3, #0x680
0006c70c  str     r3, [r5, #0x1c]
0006c70e  ldr.w   r3, [r4, #0xa4]
0006c712  mov.w   r2, #0x790
0006c716  adds    r3, #1
0006c718  str.w   r2, [r4, r3, lsl #3]
0006c71c  ldr     r2, [pc, #0x50]
0006c71e  ldr.w   r3, [r4, #0xa4]
0006c722  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
0006c724  adds    r3, #1
0006c726  str.w   r3, [r4, #0xa4]
0006c72a  lsls    r3, r3, #3
0006c72c  adds    r3, r3, r4
0006c72e  mov     r0, r6
0006c730  str     r2, [r3, #4]
0006c732  ldr.w   r3, [r4, #0xa4]
0006c736  adds    r3, #1
0006c738  str.w   r6, [r4, r3, lsl #3]
0006c73c  pop     {r4, r5, r6, r7, pc}
0006c73e  cmp.w   r6, #0x790
0006c742  it      ne
0006c744  mvnne   r0, #2
0006c748  bne     #0x6c73c
0006c74a  ldr.w   r1, [pc, #0x28]
0006c74e  lsls    r3, r2, #3
0006c750  adds    r3, r3, r4
0006c752  add     r1, pc ; -> 0x000717d5  t_d_unblock
0006c754  str     r1, [r3, #4]
0006c756  ldr.w   r3, [r4, #0xa4]
0006c75a  movs    r0, #0
0006c75c  adds    r3, #1
0006c75e  str.w   r0, [r4, r3, lsl #3]
0006c762  b       #0x6c73c
0006c764  ldr     r2, [pc, #0x10]
0006c766  ldr.w   r3, [r4, #0xa4]
0006c76a  add     r2, pc ; -> 0x000717d5  t_d_unblock
0006c76c  b       #0x6c72a
0006c76e  nop     
0006c770  lsls    r7, r2, #1
0006c772  movs    r0, r0
0006c774  str     r7, [r7, r1]
0006c776  movs    r0, r0
0006c778  str     r7, [r4, r1]
0006c77a  movs    r0, r0
