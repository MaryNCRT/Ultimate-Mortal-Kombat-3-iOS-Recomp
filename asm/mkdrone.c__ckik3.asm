========================================================================
ckik3  0x0006ea94  132 bytes   mkdrone.c
========================================================================

0006ea94  push    {r4, r5, r6, r7, lr}
0006ea96  add     r7, sp, #0xc
0006ea98  ldr.w   r3, [r0, #0xa4]
0006ea9c  mov     r4, r0
0006ea9e  ldr.w   r5, [r0, #0x108]
0006eaa2  adds    r3, #1
0006eaa4  ldr.w   r6, [r0, r3, lsl #3]
0006eaa8  cbnz    r6, #0x6eafe
0006eaaa  ldr.w   r1, [r0, #0xf8]
0006eaae  ldr     r2, [r5, #0x20]
0006eab0  lsls    r3, r1, #2
0006eab2  adds    r3, r3, r0
0006eab4  str.w   r2, [r3, #0xa8]
0006eab8  adds    r3, r1, #1
0006eaba  str.w   r3, [r0, #0xf8]
0006eabe  mov     r0, r5
0006eac0  bl      #0x6e9c4 ; -> q_will_he_reach_me
0006eac4  ldr.w   r3, [r4, #0xf8]
0006eac8  subs    r3, #1
0006eaca  str.w   r3, [r4, #0xf8]
0006eace  lsls    r3, r3, #2
0006ead0  adds    r3, r3, r4
0006ead2  ldr.w   r3, [r3, #0xa8]
0006ead6  str     r3, [r5, #0x20]
0006ead8  ldr     r3, [r5, #0x5c]
0006eada  cbz     r3, #0x6eb04
0006eadc  ldr     r2, [pc, #0x2c]
0006eade  ldr     r3, [pc, #0x30]
0006eae0  add     r2, pc ; -> 0x0006cbdd  t_react_jump_table
0006eae2  add     r3, pc ; -> 0x00172390  funcs.14030
0006eae4  str     r3, [r5, #0x68]
0006eae6  ldr.w   r3, [r4, #0xa4]
0006eaea  mov     r0, r6
0006eaec  lsls    r3, r3, #3
0006eaee  adds    r3, r3, r4
0006eaf0  str     r2, [r3, #4]
0006eaf2  ldr.w   r3, [r4, #0xa4]
0006eaf6  adds    r3, #1
0006eaf8  str.w   r6, [r4, r3, lsl #3]
0006eafc  b       #0x6eb02
0006eafe  mvn     r0, #2
0006eb02  pop     {r4, r5, r6, r7, pc}
0006eb04  ldr     r2, [pc, #0xc]
0006eb06  add     r2, pc ; -> 0x0006be5d  t_kick_will_miss
0006eb08  b       #0x6eae6
0006eb0a  nop     
0006eb0c  b       #0x6ed02
0006eb0e  vtbl.8  d19, {d31}, d26
0006eb12  movs    r0, r2
0006eb14  blo     #0x6ebbe
