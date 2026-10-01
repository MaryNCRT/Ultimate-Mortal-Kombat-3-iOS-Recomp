========================================================================
c_proj_sd  0x0006d8d8  104 bytes   mkdrone.c
========================================================================

0006d8d8  push    {r4, r5, r6, r7, lr}
0006d8da  add     r7, sp, #0xc
0006d8dc  ldr.w   r3, [r0, #0xa4]
0006d8e0  mov     r4, r0
0006d8e2  ldr.w   r5, [r0, #0x108]
0006d8e6  adds    r3, #1
0006d8e8  ldr.w   r6, [r0, r3, lsl #3]
0006d8ec  cbnz    r6, #0x6d914
0006d8ee  mov     r0, r5
0006d8f0  bl      #0x6c9f4 ; -> should_i_promove
0006d8f4  ldr     r3, [r5, #0x5c]
0006d8f6  cbnz    r3, #0x6d91a
0006d8f8  ldr     r2, [pc, #0x38]
0006d8fa  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006d8fc  ldr.w   r3, [r4, #0xa4]
0006d900  mov     r0, r6
0006d902  lsls    r3, r3, #3
0006d904  adds    r3, r3, r4
0006d906  str     r2, [r3, #4]
0006d908  ldr.w   r3, [r4, #0xa4]
0006d90c  adds    r3, #1
0006d90e  str.w   r6, [r4, r3, lsl #3]
0006d912  b       #0x6d918
0006d914  mvn     r0, #2
0006d918  pop     {r4, r5, r6, r7, pc}
0006d91a  mov     r0, r5
0006d91c  bl      #0x2f3a0 ; -> get_x_dist
0006d920  ldr     r0, [r5, #0x28]
0006d922  cmp     r0, #0x9f
0006d924  bgt     #0x6d92c
0006d926  ldr     r2, [pc, #0x10]
0006d928  add     r2, pc ; -> 0x0006aedd  t_attack_closeup_sd
0006d92a  b       #0x6d8fc
0006d92c  ldr     r2, [pc, #0xc]
0006d92e  add     r2, pc ; -> 0x0006ae75  t_drone_sweep_closeup_sd
0006d930  b       #0x6d8fc
0006d932  nop     
