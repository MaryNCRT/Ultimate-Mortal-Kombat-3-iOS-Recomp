========================================================================
is_run_pressed  0x0002f344  92 bytes   joy.c
========================================================================

0002f344  ldr     r3, [r0]
0002f346  ldr     r1, [r3, #8]
0002f348  ldr     r3, [pc, #0x4c]
0002f34a  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
0002f34c  ldr     r3, [r3]
0002f34e  ldr     r3, [r3, #0x1c]
0002f350  str     r3, [r0, #0x28]
0002f352  cbnz    r1, #0x2f388
0002f354  mov.w   r3, #0x40000
0002f358  str     r3, [r0, #0x44]
0002f35a  ldr     r2, [r0, #0x28]
0002f35c  ldr     r3, [r0, #0x44]
0002f35e  and.w   r3, r2, r3
0002f362  str     r3, [r0, #0x28]
0002f364  cbz     r3, #0x2f380
0002f366  ldr     r3, [pc, #0x34]
0002f368  add     r3, pc ; -> 0x0016564c  bt_jump+0x28
0002f36a  ldr     r2, [r3]
0002f36c  lsls    r3, r1, #2
0002f36e  add     r2, r3
0002f370  ldr.w   r3, [r2, #0x378]
0002f374  str     r3, [r0, #0x1c]
0002f376  cbnz    r3, #0x2f390
0002f378  movs    r3, #0x28
0002f37a  str     r3, [r0, #0x1c]
0002f37c  str.w   r3, [r2, #0x388]
0002f380  movs    r3, #0
0002f382  str     r3, [r0, #0x5c]
0002f384  mov     r0, r3
0002f386  bx      lr
0002f388  mov.w   r3, #0x400000
0002f38c  str     r3, [r0, #0x44]
0002f38e  b       #0x2f35a
0002f390  movs    r3, #1
0002f392  str     r3, [r0, #0x5c]
0002f394  mov     r0, r3
0002f396  b       #0x2f386
0002f398  str     r6, [r7, #0x2c]
0002f39a  movs    r3, r2
0002f39c  str     r0, [r4, #0x2c]
0002f39e  movs    r3, r2
