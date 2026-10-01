========================================================================
t_av_lao_angle  0x0006c610  160 bytes   mkdrone.c
========================================================================

0006c610  push    {r4, r5, r7, lr}
0006c612  add     r7, sp, #8
0006c614  ldr.w   r3, [r0, #0xa4]
0006c618  mov     r4, r0
0006c61a  ldr.w   r5, [r0, #0x108]
0006c61e  adds    r3, #1
0006c620  ldr.w   r0, [r0, r3, lsl #3]
0006c624  cbnz    r0, #0x6c65e
0006c626  ldr     r3, [pc, #0x78]
0006c628  movw    r2, #0x11fa
0006c62c  add     r3, pc ; -> 0x0006d699  lao_angle_wait
0006c62e  str     r3, [r5, #0x48]
0006c630  movs    r3, #0x30
0006c632  str     r3, [r5, #0x44]
0006c634  ldr.w   r3, [r4, #0xa4]
0006c638  adds    r3, #1
0006c63a  str.w   r2, [r4, r3, lsl #3]
0006c63e  ldr.w   r3, [r4, #0xa4]
0006c642  ldr     r2, [pc, #0x60]
0006c644  adds    r3, #1
0006c646  str.w   r3, [r4, #0xa4]
0006c64a  lsls    r3, r3, #3
0006c64c  adds    r3, r3, r4
0006c64e  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006c650  str     r2, [r3, #4]
0006c652  ldr.w   r3, [r4, #0xa4]
0006c656  adds    r3, #1
0006c658  str.w   r0, [r4, r3, lsl #3]
0006c65c  pop     {r4, r5, r7, pc}
0006c65e  movw    r3, #0x11fa
0006c662  cmp     r0, r3
0006c664  it      ne
0006c666  mvnne   r0, #2
0006c66a  bne     #0x6c65c
0006c66c  mov     r0, r5
0006c66e  bl      #0x54e38 ; -> get_his_action
0006c672  ldr     r0, [r5, #0x20]
0006c674  cmp.w   r0, #0x20c
0006c678  beq     #0x6c698
0006c67a  ldr     r3, [pc, #0x2c]
0006c67c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006c67e  ldr     r2, [r3]
0006c680  ldr.w   r3, [r4, #0xa4]
0006c684  movs    r0, #0
0006c686  lsls    r3, r3, #3
0006c688  adds    r3, r3, r4
0006c68a  str     r2, [r3, #4]
0006c68c  ldr.w   r3, [r4, #0xa4]
0006c690  adds    r3, #1
0006c692  str.w   r0, [r4, r3, lsl #3]
0006c696  b       #0x6c65c
0006c698  ldr.w   r2, [pc, #0x10]
0006c69c  add     r2, pc ; -> 0x0006fa21  t_d_block
0006c69e  b       #0x6c680
0006c6a0  asrs    r1, r5, #1
0006c6a2  movs    r0, r0
0006c6a4  ldr     r3, [r2, r6]
0006c6a6  movs    r0, r0
0006c6a8  strb    r0, [r1, #2]
0006c6aa  movs    r0, r1
0006c6ac  adds    r3, #0x81
0006c6ae  movs    r0, r0
