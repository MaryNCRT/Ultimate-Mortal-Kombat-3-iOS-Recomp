========================================================================
t_f_scorpion  0x000a539c  124 bytes   mkfriend.c
========================================================================

000a539c  ldr.w   r3, [r0, #0xa4]
000a53a0  ldr.w   r1, [r0, #0x108]
000a53a4  adds    r3, #1
000a53a6  ldr.w   r2, [r0, r3, lsl #3]
000a53aa  cbnz    r2, #0xa53d4
000a53ac  movs    r1, #0xf1
000a53ae  str.w   r1, [r0, r3, lsl #3]
000a53b2  ldr.w   r3, [r0, #0xa4]
000a53b6  ldr     r1, [pc, #0x54]
000a53b8  adds    r3, #1
000a53ba  str.w   r3, [r0, #0xa4]
000a53be  lsls    r3, r3, #3
000a53c0  adds    r3, r3, r0
000a53c2  add     r1, pc ; -> 0x000a6d6d  t_jax_n_box_start
000a53c4  str     r1, [r3, #4]
000a53c6  ldr.w   r3, [r0, #0xa4]
000a53ca  adds    r3, #1
000a53cc  str.w   r2, [r0, r3, lsl #3]
000a53d0  mov     r0, r2
000a53d2  bx      lr
000a53d4  cmp     r2, #0xf1
000a53d6  it      ne
000a53d8  mvnne   r0, #2
000a53dc  bne     #0xa53d2
000a53de  mov.w   r3, #0x9a0
000a53e2  str     r3, [r1, #0x30]
000a53e4  ldr.w   r3, [pc, #0x28]
000a53e8  ldr     r2, [pc, #0x28]
000a53ea  add     r3, pc ; -> 0x00177834  a_skull_in_da_box
000a53ec  str     r3, [r1, #0x40]
000a53ee  ldr.w   r3, [r0, #0xa4]
000a53f2  add     r2, pc ; -> 0x000a7175  t_pop_up_my_toy
000a53f4  lsls    r3, r3, #3
000a53f6  adds    r3, r3, r0
000a53f8  str     r2, [r3, #4]
000a53fa  ldr.w   r3, [r0, #0xa4]
000a53fe  movs    r2, #0
000a5400  adds    r3, #1
000a5402  str.w   r2, [r0, r3, lsl #3]
000a5406  mov     r0, r2
000a5408  b       #0xa53d2
000a540a  nop     
000a540c  adds    r7, r4, r6
000a540e  movs    r0, r0
000a5410  movs    r4, #0x46
000a5412  movs    r5, r1
000a5414  adds    r7, r7, #5
000a5416  movs    r0, r0
