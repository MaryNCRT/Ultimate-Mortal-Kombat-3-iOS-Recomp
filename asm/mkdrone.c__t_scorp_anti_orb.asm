========================================================================
t_scorp_anti_orb  0x0006dc4c  104 bytes   mkdrone.c
========================================================================

0006dc4c  push    {r4, r5, r6, r7, lr}
0006dc4e  add     r7, sp, #0xc
0006dc50  ldr.w   r3, [r0, #0xa4]
0006dc54  mov     r4, r0
0006dc56  ldr.w   r5, [r0, #0x108]
0006dc5a  adds    r3, #1
0006dc5c  ldr.w   r6, [r0, r3, lsl #3]
0006dc60  cbnz    r6, #0x6dc8a
0006dc62  mov     r0, r5
0006dc64  bl      #0x2f3a0 ; -> get_x_dist
0006dc68  ldr     r3, [r5, #0x28]
0006dc6a  cmp     r3, #0xaf
0006dc6c  bgt     #0x6dc90
0006dc6e  ldr     r2, [pc, #0x38]
0006dc70  add     r2, pc ; -> 0x0006a979  t_run_in_and_slam
0006dc72  ldr.w   r3, [r4, #0xa4]
0006dc76  mov     r0, r6
0006dc78  lsls    r3, r3, #3
0006dc7a  adds    r3, r3, r4
0006dc7c  str     r2, [r3, #4]
0006dc7e  ldr.w   r3, [r4, #0xa4]
0006dc82  adds    r3, #1
0006dc84  str.w   r6, [r4, r3, lsl #3]
0006dc88  b       #0x6dc8e
0006dc8a  mvn     r0, #2
0006dc8e  pop     {r4, r5, r6, r7, pc}
0006dc90  mov     r0, r5
0006dc92  bl      #0x2f3a0 ; -> get_x_dist
0006dc96  ldr     r0, [r5, #0x28]
0006dc98  cmp     r0, #0xf0
0006dc9a  ble     #0x6dca2
0006dc9c  ldr     r2, [pc, #0xc]
0006dc9e  add     r2, pc ; -> 0x00067f19  t_d_propell_attack_now
0006dca0  b       #0x6dc72
0006dca2  ldr     r2, [pc, #0xc]
0006dca4  add     r2, pc ; -> 0x0006f935  t_block_orb
0006dca6  b       #0x6dc72
0006dca8  ldm     r5!, {r0, r2}
