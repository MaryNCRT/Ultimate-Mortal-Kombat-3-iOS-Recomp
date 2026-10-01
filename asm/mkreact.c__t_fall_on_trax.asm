========================================================================
t_fall_on_trax  0x000480e0  188 bytes   mkreact.c
========================================================================

000480e0  push    {r4, r7, lr}
000480e2  add     r7, sp, #4
000480e4  ldr.w   r1, [r0, #0xa4]
000480e8  mov     r4, r0
000480ea  ldr.w   ip, [r0, #0x108]
000480ee  adds    r3, r1, #1
000480f0  movw    r2, #0xa99
000480f4  ldr.w   r0, [r0, r3, lsl #3]
000480f8  cmp     r0, r2
000480fa  beq     #0x48154
000480fc  ble     #0x48112
000480fe  movw    r3, #0xa9b
00048102  cmp     r0, r3
00048104  beq     #0x48178
00048106  adds    r3, #0x4a
00048108  cmp     r0, r3
0004810a  beq     #0x4813a
0004810c  mvn     r0, #2
00048110  pop     {r4, r7, pc}
00048112  cmp     r0, #0
00048114  bne     #0x4810c
00048116  str.w   r2, [r4, r3, lsl #3]
0004811a  ldr.w   r3, [r4, #0xa4]
0004811e  ldr     r2, [pc, #0x74]
00048120  adds    r3, #1
00048122  str.w   r3, [r4, #0xa4]
00048126  lsls    r3, r3, #3
00048128  adds    r3, r3, r4
0004812a  add     r2, pc ; -> 0x00047fe9  t_up_2_ceiling
0004812c  str     r2, [r3, #4]
0004812e  ldr.w   r3, [r4, #0xa4]
00048132  adds    r3, #1
00048134  str.w   r0, [r4, r3, lsl #3]
00048138  b       #0x48110
0004813a  ldr     r3, [pc, #0x5c]
0004813c  movs    r0, #0
0004813e  add     r3, pc ; -> 0x000f3724  t_wait_forever
00048140  ldr     r2, [r3]
00048142  lsls    r3, r1, #3
00048144  adds    r3, r3, r4
00048146  str     r2, [r3, #4]
00048148  ldr.w   r3, [r4, #0xa4]
0004814c  adds    r3, #1
0004814e  str.w   r0, [r4, r3, lsl #3]
00048152  b       #0x48110
00048154  ldr.w   r0, [ip, #8]
00048158  movw    r2, #0xa9b
0004815c  ldr     r3, [r0, #0x24]
0004815e  add.w   r3, r3, #0x1b80
00048162  adds    r3, #0x28
00048164  str     r3, [r0, #0x2c]
00048166  ldr.w   r3, [r4, #0xa4]
0004816a  movs    r0, #0xb4
0004816c  adds    r3, #1
0004816e  str.w   r2, [r4, r3, lsl #3]
00048172  str.w   r0, [r4, #0xfc]
00048176  b       #0x48110
00048178  mov     r0, ip
0004817a  bl      #0x336e8 ; -> death_blow_complete
0004817e  ldr.w   r3, [r4, #0xa4]
00048182  movs    r0, #0x20
00048184  movw    r2, #0xae5
00048188  adds    r3, #1
0004818a  str.w   r2, [r4, r3, lsl #3]
0004818e  str.w   r0, [r4, #0xfc]
00048192  b       #0x48110
00048194  mrc2    p15, #5, apsr_nzcv, c11, c15, #7
00048198  push    {r1, r5, r6, r7, lr}
0004819a  movs    r2, r1
