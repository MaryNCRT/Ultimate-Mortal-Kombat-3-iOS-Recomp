========================================================================
t_return_to_beware  0x0006c184  76 bytes   mkdrone.c
========================================================================

0006c184  push    {r4}
0006c186  ldr.w   r3, [r0, #0xa4]
0006c18a  ldr.w   r1, [r0, #0x108]
0006c18e  adds    r3, #1
0006c190  ldr.w   r4, [r0, r3, lsl #3]
0006c194  cbz     r4, #0x6c19e
0006c196  mvn     r0, #2
0006c19a  pop     {r4}
0006c19c  bx      lr
0006c19e  ldr.w   ip, [r1]
0006c1a2  ldr.w   r3, [ip, #0x74]
0006c1a6  str     r3, [r1, #0x44]
0006c1a8  ldr.w   r3, [ip, #0x78]
0006c1ac  str     r3, [r1, #0x48]
0006c1ae  ldr.w   r3, [r0, #0xa4]
0006c1b2  lsls    r3, r3, #3
0006c1b4  add.w   r2, r3, r0
0006c1b8  ldr.w   r3, [ip, #0x6c]
0006c1bc  str     r3, [r2, #4]
0006c1be  ldr.w   r3, [r0, #0xa4]
0006c1c2  adds    r2, r3, #1
0006c1c4  ldr     r3, [r1]
0006c1c6  ldr     r3, [r3, #0x70]
0006c1c8  str.w   r3, [r0, r2, lsl #3]
0006c1cc  mov     r0, r4
0006c1ce  b       #0x6c19a
