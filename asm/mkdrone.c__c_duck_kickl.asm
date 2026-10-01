========================================================================
c_duck_kickl  0x000708bc  132 bytes   mkdrone.c
========================================================================

000708bc  push    {r4, r5, r6, r7, lr}
000708be  add     r7, sp, #0xc
000708c0  ldr.w   r3, [r0, #0xa4]
000708c4  mov     r4, r0
000708c6  ldr.w   r5, [r0, #0x108]
000708ca  adds    r3, #1
000708cc  ldr.w   r6, [r0, r3, lsl #3]
000708d0  cbnz    r6, #0x708f8
000708d2  mov     r0, r5
000708d4  bl      #0x6e9c4 ; -> q_will_he_reach_me
000708d8  ldr     r3, [r5, #0x5c]
000708da  cbnz    r3, #0x708fe
000708dc  ldr     r2, [pc, #0x50]
000708de  add     r2, pc ; -> 0x0006c185  t_return_to_beware
000708e0  ldr.w   r3, [r4, #0xa4]
000708e4  mov     r0, r6
000708e6  lsls    r3, r3, #3
000708e8  adds    r3, r3, r4
000708ea  str     r2, [r3, #4]
000708ec  ldr.w   r3, [r4, #0xa4]
000708f0  adds    r3, #1
000708f2  str.w   r6, [r4, r3, lsl #3]
000708f6  b       #0x708fc
000708f8  mvn     r0, #2
000708fc  pop     {r4, r5, r6, r7, pc}
000708fe  mov     r0, r5
00070900  bl      #0x708a8 ; -> q_is_he_cornered
00070904  ldr     r0, [r5, #0x5c]
00070906  cbz     r0, #0x7090e
00070908  ldr     r2, [pc, #0x28]
0007090a  add     r2, pc ; -> 0x000686c5  t_d_crossover_kick
0007090c  b       #0x708e0
0007090e  ldr     r3, [pc, #0x28]
00070910  ldr     r2, [pc, #0x28]
00070912  add     r3, pc ; -> 0x001723b0  funcs.13699
00070914  str     r3, [r5, #0x68]
00070916  ldr.w   r3, [r4, #0xa4]
0007091a  add     r2, pc ; -> 0x0006c5ad  t_react_jump_table_act
0007091c  lsls    r3, r3, #3
0007091e  adds    r3, r3, r4
00070920  str     r2, [r3, #4]
00070922  ldr.w   r3, [r4, #0xa4]
00070926  adds    r3, #1
00070928  str.w   r0, [r4, r3, lsl #3]
0007092c  b       #0x708fc
0007092e  nop     
