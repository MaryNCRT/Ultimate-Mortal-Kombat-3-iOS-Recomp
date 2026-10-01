========================================================================
t_fall_in_lava  0x0004819c  160 bytes   mkreact.c
========================================================================

0004819c  push    {r4, r7, lr}
0004819e  add     r7, sp, #4
000481a0  ldr.w   r3, [r0, #0xa4]
000481a4  mov     r4, r0
000481a6  ldr.w   ip, [r0, #0x108]
000481aa  adds    r2, r3, #1
000481ac  movw    r1, #0xa46
000481b0  ldr.w   r0, [r0, r2, lsl #3]
000481b4  cmp     r0, r1
000481b6  beq     #0x48210
000481b8  movw    r3, #0xa48
000481bc  cmp     r0, r3
000481be  beq     #0x481ec
000481c0  cbz     r0, #0x481c8
000481c2  mvn     r0, #2
000481c6  pop     {r4, r7, pc}
000481c8  str.w   r1, [r4, r2, lsl #3]
000481cc  ldr.w   r3, [r4, #0xa4]
000481d0  ldr     r2, [pc, #0x60]
000481d2  adds    r3, #1
000481d4  str.w   r3, [r4, #0xa4]
000481d8  lsls    r3, r3, #3
000481da  adds    r3, r3, r4
000481dc  add     r2, pc ; -> 0x00047fe9  t_up_2_ceiling
000481de  str     r2, [r3, #4]
000481e0  ldr.w   r3, [r4, #0xa4]
000481e4  adds    r3, #1
000481e6  str.w   r0, [r4, r3, lsl #3]
000481ea  b       #0x481c6
000481ec  mov     r0, ip
000481ee  bl      #0x336e8 ; -> death_blow_complete
000481f2  ldr     r3, [pc, #0x44]
000481f4  movs    r0, #0
000481f6  add     r3, pc ; -> 0x000f3724  t_wait_forever
000481f8  ldr     r2, [r3]
000481fa  ldr.w   r3, [r4, #0xa4]
000481fe  lsls    r3, r3, #3
00048200  adds    r3, r3, r4
00048202  str     r2, [r3, #4]
00048204  ldr.w   r3, [r4, #0xa4]
00048208  adds    r3, #1
0004820a  str.w   r0, [r4, r3, lsl #3]
0004820e  b       #0x481c6
00048210  ldr.w   r0, [ip, #8]
00048214  movw    r2, #0xa48
00048218  ldr     r3, [r0, #0x24]
0004821a  add.w   r3, r3, #0x1bc0
0004821e  adds    r3, #6
00048220  str     r3, [r0, #0x2c]
00048222  ldr.w   r3, [r4, #0xa4]
00048226  movs    r0, #0xb4
00048228  adds    r3, #1
0004822a  str.w   r2, [r4, r3, lsl #3]
0004822e  str.w   r0, [r4, #0xfc]
00048232  b       #0x481c6
00048234  mcr2    p15, #0, pc, c9, c15, #7
00048238  push    {r1, r3, r5, lr}
0004823a  movs    r2, r1
