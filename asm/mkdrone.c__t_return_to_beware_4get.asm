========================================================================
t_return_to_beware_4get  0x0006c148  60 bytes   mkdrone.c
========================================================================

0006c148  ldr.w   r3, [r0, #0xa4]
0006c14c  ldr.w   r1, [r0, #0x108]
0006c150  adds    r3, #1
0006c152  ldr.w   r2, [r0, r3, lsl #3]
0006c156  cbz     r2, #0x6c15e
0006c158  mvn     r0, #2
0006c15c  bx      lr
0006c15e  ldr     r3, [r1]
0006c160  str     r2, [r1, #0x1c]
0006c162  ldr     r1, [pc, #0x1c]
0006c164  str     r2, [r3, #0x5c]
0006c166  ldr.w   r3, [r0, #0xa4]
0006c16a  add     r1, pc ; -> 0x0006c185  t_return_to_beware
0006c16c  lsls    r3, r3, #3
0006c16e  adds    r3, r3, r0
0006c170  str     r1, [r3, #4]
0006c172  ldr.w   r3, [r0, #0xa4]
0006c176  adds    r3, #1
0006c178  str.w   r2, [r0, r3, lsl #3]
0006c17c  mov     r0, r2
0006c17e  b       #0x6c15c
0006c180  movs    r7, r2
0006c182  movs    r0, r0
