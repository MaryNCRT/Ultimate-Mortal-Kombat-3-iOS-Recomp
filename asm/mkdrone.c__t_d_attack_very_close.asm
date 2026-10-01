========================================================================
t_d_attack_very_close  0x0006f680  244 bytes   mkdrone.c
========================================================================

0006f680  push    {r4, r5, r6, r7, lr}
0006f682  add     r7, sp, #0xc
0006f684  str     r8, [sp, #-0x4]!
0006f688  ldr.w   r2, [r0, #0xa4]
0006f68c  movw    r8, #0x41c
0006f690  mov     r4, r0
0006f692  adds    r3, r2, #1
0006f694  ldr.w   r6, [r0, #0x108]
0006f698  ldr.w   r5, [r0, r3, lsl #3]
0006f69c  cmp     r5, r8
0006f69e  beq     #0x6f6f6
0006f6a0  movw    r3, #0x423
0006f6a4  cmp     r5, r3
0006f6a6  beq     #0x6f6dc
0006f6a8  cbz     r5, #0x6f6b4
0006f6aa  mvn     r0, #2
0006f6ae  ldr     r8, [sp], #4
0006f6b2  pop     {r4, r5, r6, r7, pc}
0006f6b4  mov     r0, r6
0006f6b6  bl      #0x6f660 ; -> q_airborn_counter
0006f6ba  ldr     r0, [r6, #0x5c]
0006f6bc  cmp     r0, #0
0006f6be  beq     #0x6f734
0006f6c0  ldr.w   r3, [r4, #0xa4]
0006f6c4  ldr     r2, [pc, #0x98]
0006f6c6  mov     r0, r5
0006f6c8  lsls    r3, r3, #3
0006f6ca  adds    r3, r3, r4
0006f6cc  add     r2, pc ; -> 0x00067e29  t_very_close_airborn
0006f6ce  str     r2, [r3, #4]
0006f6d0  ldr.w   r3, [r4, #0xa4]
0006f6d4  adds    r3, #1
0006f6d6  str.w   r5, [r4, r3, lsl #3]
0006f6da  b       #0x6f6ae
0006f6dc  ldr.w   r1, [pc, #0x84]
0006f6e0  lsls    r3, r2, #3
0006f6e2  adds    r3, r3, r0
0006f6e4  add     r1, pc ; -> 0x00067e29  t_very_close_airborn
0006f6e6  str     r1, [r3, #4]
0006f6e8  ldr.w   r3, [r0, #0xa4]
0006f6ec  movs    r0, #0
0006f6ee  adds    r3, #1
0006f6f0  str.w   r0, [r4, r3, lsl #3]
0006f6f4  b       #0x6f6ae
0006f6f6  ldr.w   r3, [pc, #0x70]
0006f6fa  movw    r2, #0x423
0006f6fe  add     r3, pc ; -> 0x0017249c  funcs.8266
0006f700  str     r3, [r6, #0x68]
0006f702  movs    r3, #4
0006f704  str     r3, [r6, #0x64]
0006f706  ldr.w   r3, [r0, #0xa4]
0006f70a  adds    r3, #1
0006f70c  str.w   r2, [r0, r3, lsl #3]
0006f710  ldr.w   r3, [r0, #0xa4]
0006f714  ldr.w   r2, [pc, #0x54]
0006f718  adds    r3, #1
0006f71a  str.w   r3, [r0, #0xa4]
0006f71e  lsls    r3, r3, #3
0006f720  adds    r3, r3, r0
0006f722  add     r2, pc ; -> 0x00072e4d  t_random_do
0006f724  str     r2, [r3, #4]
0006f726  ldr.w   r3, [r0, #0xa4]
0006f72a  movs    r0, #0
0006f72c  adds    r3, #1
0006f72e  str.w   r0, [r4, r3, lsl #3]
0006f732  b       #0x6f6ae
0006f734  ldr.w   r3, [r4, #0xa4]
0006f738  ldr     r2, [pc, #0x34]
0006f73a  adds    r3, #1
0006f73c  add     r2, pc ; -> 0x0006cdad  t_nr_drone_zone
0006f73e  str.w   r8, [r4, r3, lsl #3]
0006f742  ldr.w   r3, [r4, #0xa4]
0006f746  adds    r3, #1
0006f748  str.w   r3, [r4, #0xa4]
0006f74c  lsls    r3, r3, #3
0006f74e  adds    r3, r3, r4
0006f750  str     r2, [r3, #4]
0006f752  ldr.w   r3, [r4, #0xa4]
0006f756  adds    r3, #1
0006f758  str.w   r0, [r4, r3, lsl #3]
0006f75c  b       #0x6f6ae
0006f75e  nop     
0006f760  strh    r1, [r3, #0x3a]
