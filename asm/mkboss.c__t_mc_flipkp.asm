========================================================================
t_mc_flipkp  0x000a9ee4  220 bytes   mkboss.c
========================================================================

000a9ee4  push    {r4, r5, r6, r7, lr}
000a9ee6  add     r7, sp, #0xc
000a9ee8  str     r8, [sp, #-0x4]!
000a9eec  ldr.w   r3, [r0, #0xa4]
000a9ef0  mov     r4, r0
000a9ef2  ldr.w   r6, [r0, #0x108]
000a9ef6  adds    r3, #1
000a9ef8  ldr.w   r5, [r0, r3, lsl #3]
000a9efc  cbnz    r5, #0xa9f2c
000a9efe  mov     r0, r6
000a9f00  bl      #0xa9ea0 ; -> q_is_this_a_joke
000a9f04  ldr.w   r8, [r6, #0x5c]
000a9f08  cmp.w   r8, #0
000a9f0c  beq     #0xa9f36
000a9f0e  ldr     r3, [pc, #0x9c]
000a9f10  mov     r0, r5
000a9f12  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000a9f14  ldr     r2, [r3]
000a9f16  ldr.w   r3, [r4, #0xa4]
000a9f1a  lsls    r3, r3, #3
000a9f1c  adds    r3, r3, r4
000a9f1e  str     r2, [r3, #4]
000a9f20  ldr.w   r3, [r4, #0xa4]
000a9f24  adds    r3, #1
000a9f26  str.w   r5, [r4, r3, lsl #3]
000a9f2a  b       #0xa9f30
000a9f2c  mvn     r0, #2
000a9f30  ldr     r8, [sp], #4
000a9f34  pop     {r4, r5, r6, r7, pc}
000a9f36  mov     r0, r6
000a9f38  bl      #0x70940 ; -> is_towards_me
000a9f3c  ldr     r3, [r6, #0x5c]
000a9f3e  cbnz    r3, #0xa9f5c
000a9f40  ldr     r2, [pc, #0x6c]
000a9f42  add     r2, pc ; -> 0x000a8d8d  t_mc_flipk_away
000a9f44  ldr.w   r3, [r4, #0xa4]
000a9f48  mov     r0, r8
000a9f4a  lsls    r3, r3, #3
000a9f4c  adds    r3, r3, r4
000a9f4e  str     r2, [r3, #4]
000a9f50  ldr.w   r3, [r4, #0xa4]
000a9f54  adds    r3, #1
000a9f56  str.w   r8, [r4, r3, lsl #3]
000a9f5a  b       #0xa9f30
000a9f5c  mov     r0, r6
000a9f5e  bl      #0x2f3a0 ; -> get_x_dist
000a9f62  ldr     r3, [r6, #0x28]
000a9f64  cmp     r3, #0x70
000a9f66  ble     #0xa9f6e
000a9f68  ldr     r2, [pc, #0x48]
000a9f6a  add     r2, pc ; -> 0x000a858d  t_b_return_to_beware_4get
000a9f6c  b       #0xa9f44
000a9f6e  ldr     r3, [pc, #0x48]
000a9f70  movw    r2, #0x711
000a9f74  mov     r0, r8
000a9f76  add     r3, pc ; -> 0x0017b924  funcs.6406
000a9f78  str     r3, [r6, #0x68]
000a9f7a  movs    r3, #2
000a9f7c  str     r3, [r6, #0x64]
000a9f7e  ldr.w   r3, [r4, #0xa4]
000a9f82  adds    r3, #1
000a9f84  str.w   r2, [r4, r3, lsl #3]
000a9f88  ldr.w   r3, [r4, #0xa4]
000a9f8c  adds    r2, r3, #1
000a9f8e  ldr     r3, [pc, #0x2c]
000a9f90  str.w   r2, [r4, #0xa4]
000a9f94  add     r3, pc ; -> 0x000f3404  t_random_do
000a9f96  ldr     r1, [r3]
000a9f98  lsls    r3, r2, #3
000a9f9a  adds    r3, r3, r4
000a9f9c  str     r1, [r3, #4]
000a9f9e  ldr.w   r3, [r4, #0xa4]
000a9fa2  adds    r3, #1
000a9fa4  str.w   r8, [r4, r3, lsl #3]
000a9fa8  b       #0xa9f30
000a9faa  nop     
000a9fac  str     r5, [sp, #0x48]
000a9fae  movs    r4, r0
000a9fb0  mcr     p15, #2, pc, c7, c15, #7
000a9fb4  b       #0xa9bf6
