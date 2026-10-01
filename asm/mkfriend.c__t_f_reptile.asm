========================================================================
t_f_reptile  0x000a70ec  136 bytes   mkfriend.c
========================================================================

000a70ec  push    {r4, r5, r7, lr}
000a70ee  add     r7, sp, #8
000a70f0  mov     r4, r0
000a70f2  ldr.w   r3, [r4, #0xa4]
000a70f6  ldr.w   r0, [r0, #0x108]
000a70fa  adds    r3, #1
000a70fc  ldr.w   r5, [r4, r3, lsl #3]
000a7100  cbnz    r5, #0xa7134
000a7102  bl      #0x54f10 ; -> clear_inviso
000a7106  ldr.w   r3, [r4, #0xa4]
000a710a  movs    r2, #0xfa
000a710c  mov     r0, r5
000a710e  adds    r3, #1
000a7110  str.w   r2, [r4, r3, lsl #3]
000a7114  ldr.w   r3, [r4, #0xa4]
000a7118  ldr     r2, [pc, #0x4c]
000a711a  adds    r3, #1
000a711c  str.w   r3, [r4, #0xa4]
000a7120  lsls    r3, r3, #3
000a7122  adds    r3, r3, r4
000a7124  add     r2, pc ; -> 0x000a6d6d  t_jax_n_box_start
000a7126  str     r2, [r3, #4]
000a7128  ldr.w   r3, [r4, #0xa4]
000a712c  adds    r3, #1
000a712e  str.w   r5, [r4, r3, lsl #3]
000a7132  pop     {r4, r5, r7, pc}
000a7134  cmp     r5, #0xfa
000a7136  it      ne
000a7138  mvnne   r0, #2
000a713c  bne     #0xa7132
000a713e  movw    r3, #0x1433
000a7142  str     r3, [r0, #0x30]
000a7144  ldr     r3, [pc, #0x24]
000a7146  ldr     r2, [pc, #0x28]
000a7148  add     r3, pc ; -> 0x001778a4  a_snake_in_da_box
000a714a  str     r3, [r0, #0x40]
000a714c  ldr.w   r3, [r4, #0xa4]
000a7150  add     r2, pc ; -> 0x000a7175  t_pop_up_my_toy
000a7152  movs    r0, #0
000a7154  lsls    r3, r3, #3
000a7156  adds    r3, r3, r4
000a7158  str     r2, [r3, #4]
000a715a  ldr.w   r3, [r4, #0xa4]
000a715e  adds    r3, #1
000a7160  str.w   r0, [r4, r3, lsl #3]
000a7164  b       #0xa7132
000a7166  nop     
000a7168  mcrr2   p15, #0xf, pc, r5, c15
000a716c  lsls    r0, r3, #0x1d
000a716e  movs    r5, r1
000a7170  movs    r1, r4
000a7172  movs    r0, r0
