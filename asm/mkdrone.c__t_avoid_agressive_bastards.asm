========================================================================
t_avoid_agressive_bastards  0x0006d3c0  256 bytes   mkdrone.c
========================================================================

0006d3c0  push    {r4, r5, r7, lr}
0006d3c2  add     r7, sp, #8
0006d3c4  ldr.w   r3, [r0, #0xa4]
0006d3c8  mov     r4, r0
0006d3ca  ldr.w   r5, [r0, #0x108]
0006d3ce  adds    r3, #1
0006d3d0  ldr.w   r0, [r0, r3, lsl #3]
0006d3d4  cbz     r0, #0x6d3dc
0006d3d6  mvn     r0, #2
0006d3da  pop     {r4, r5, r7, pc}
0006d3dc  ldr     r3, [pc, #0xc8]
0006d3de  add     r3, pc ; -> 0x000f357c  G
0006d3e0  ldr     r3, [r3]
0006d3e2  ldrsh.w r3, [r3, #0x44c]
0006d3e6  cmp     r3, #1
0006d3e8  str     r3, [r5, #0x1c]
0006d3ea  ble     #0x6d45c
0006d3ec  ldr     r3, [r5]
0006d3ee  movw    r2, #0x309
0006d3f2  ldr     r3, [r3, #0x18]
0006d3f4  cmp     r3, r2
0006d3f6  str     r3, [r5, #0x1c]
0006d3f8  beq     #0x6d40a
0006d3fa  ldr.w   r3, [r4, #0xa4]
0006d3fe  cmp     r3, #0
0006d400  ble     #0x6d46c
0006d402  subs    r3, #1
0006d404  str.w   r3, [r4, #0xa4]
0006d408  b       #0x6d3da
0006d40a  ldr.w   r3, [r4, #0xa4]
0006d40e  cmp     r3, #0
0006d410  ble     #0x6d48c
0006d412  subs    r3, #1
0006d414  str.w   r3, [r4, #0xa4]
0006d418  ldr.w   r1, [r4, #0xa4]
0006d41c  adds    r3, r1, #1
0006d41e  lsls    r2, r3, #3
0006d420  adds    r2, r2, r4
0006d422  ldr     r0, [r2, #4]
0006d424  adds    r2, r3, #1
0006d426  ldr.w   r2, [r4, r2, lsl #3]
0006d42a  str.w   r2, [r4, r3, lsl #3]
0006d42e  lsls    r3, r1, #3
0006d430  adds    r3, r3, r4
0006d432  str     r0, [r3, #4]
0006d434  mov     r0, r5
0006d436  bl      #0x2f3a0 ; -> get_x_dist
0006d43a  ldr     r0, [r5, #0x28]
0006d43c  cmp     r0, #0x47
0006d43e  bgt     #0x6d486
0006d440  ldr     r2, [pc, #0x68]
0006d442  add     r2, pc ; -> 0x0006f4e5  t_d_slam
0006d444  ldr.w   r3, [r4, #0xa4]
0006d448  movs    r0, #0
0006d44a  lsls    r3, r3, #3
0006d44c  adds    r3, r3, r4
0006d44e  str     r2, [r3, #4]
0006d450  ldr.w   r3, [r4, #0xa4]
0006d454  adds    r3, #1
0006d456  str.w   r0, [r4, r3, lsl #3]
0006d45a  b       #0x6d3da
0006d45c  ldr.w   r3, [r4, #0xa4]
0006d460  cmp     r3, #0
0006d462  bgt     #0x6d402
0006d464  ldr.w   r2, [pc, #0x48]
0006d468  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006d46a  b       #0x6d472
0006d46c  ldr.w   r2, [pc, #0x44]
0006d470  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006d472  ldr     r2, [r2]
0006d474  lsls    r3, r3, #3
0006d476  adds    r3, r3, r4
0006d478  str     r2, [r3, #4]
0006d47a  ldr.w   r3, [r4, #0xa4]
0006d47e  adds    r3, #1
0006d480  str.w   r0, [r4, r3, lsl #3]
0006d484  b       #0x6d3da
0006d486  ldr     r2, [pc, #0x30]
0006d488  add     r2, pc ; -> 0x0006c821  t_d_sweep_kick
0006d48a  b       #0x6d444
0006d48c  ldr.w   r2, [pc, #0x2c]
0006d490  lsls    r3, r3, #3
0006d492  adds    r3, r3, r4
0006d494  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006d496  ldr     r2, [r2]
0006d498  str     r2, [r3, #4]
0006d49a  ldr.w   r3, [r4, #0xa4]
0006d49e  adds    r3, #1
0006d4a0  str.w   r0, [r4, r3, lsl #3]
0006d4a4  b       #0x6d418
0006d4a6  nop     
0006d4a8  str     r2, [r3, #0x18]
0006d4aa  movs    r0, r1
0006d4ac  movs    r0, #0x9f
0006d4ae  movs    r0, r0
0006d4b0  str     r4, [r3, #0x28]
0006d4b2  movs    r0, r1
0006d4b4  str     r4, [r2, #0x28]
0006d4b6  movs    r0, r1
0006d4b8  bl      #0x4034ba
0006d4bc  str     r0, [r6, #0x24]
0006d4be  movs    r0, r1
