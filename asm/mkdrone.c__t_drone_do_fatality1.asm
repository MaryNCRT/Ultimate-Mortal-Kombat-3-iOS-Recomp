========================================================================
t_drone_do_fatality1  0x000694d4  240 bytes   mkdrone.c
========================================================================

000694d4  push    {lr}
000694d6  ldr.w   r1, [r0, #0xa4]
000694da  movw    lr, #0xa33
000694de  ldr.w   ip, [r0, #0x108]
000694e2  adds    r3, r1, #1
000694e4  ldr.w   r2, [r0, r3, lsl #3]
000694e8  cmp     r2, lr
000694ea  beq     #0x6955e
000694ec  movw    r3, #0xa36
000694f0  cmp     r2, r3
000694f2  beq     #0x6953c
000694f4  cbz     r2, #0x694fc
000694f6  mvn     r0, #2
000694fa  pop     {pc}
000694fc  ldr.w   r3, [ip, #8]
00069500  ldr     r1, [pc, #0xa8]
00069502  ldr     r3, [r3, #0x24]
00069504  add     r1, pc ; -> 0x00171dfc  ochar_fatality_distances
00069506  ldrh.w  r3, [r1, r3, lsl #2]
0006950a  ldr.w   r1, [pc, #0xa4]
0006950e  str.w   r3, [ip, #0x1c]
00069512  ldr.w   r3, [r0, #0xa4]
00069516  add     r1, pc ; -> 0x000724d9  t_fatality_align
00069518  adds    r3, #1
0006951a  str.w   lr, [r0, r3, lsl #3]
0006951e  ldr.w   r3, [r0, #0xa4]
00069522  adds    r3, #1
00069524  str.w   r3, [r0, #0xa4]
00069528  lsls    r3, r3, #3
0006952a  adds    r3, r3, r0
0006952c  str     r1, [r3, #4]
0006952e  ldr.w   r3, [r0, #0xa4]
00069532  adds    r3, #1
00069534  str.w   r2, [r0, r3, lsl #3]
00069538  mov     r0, r2
0006953a  b       #0x694fa
0006953c  ldr.w   r2, [ip, #0x5c]
00069540  cbnz    r2, #0x695a0
00069542  ldr.w   ip, [pc, #0x70]
00069546  lsls    r3, r1, #3
00069548  adds    r3, r3, r0
0006954a  add     ip, pc ; -> 0x000703c9  t_d_fatality_abort
0006954c  str.w   ip, [r3, #4]
00069550  ldr.w   r3, [r0, #0xa4]
00069554  adds    r3, #1
00069556  str.w   r2, [r0, r3, lsl #3]
0006955a  mov     r0, r2
0006955c  b       #0x694fa
0006955e  ldr     r3, [pc, #0x58]
00069560  movw    r2, #0xa36
00069564  add     r3, pc ; -> 0x00068ea1  q_is_he_dizzy
00069566  str.w   r3, [ip, #0x48]
0006956a  movs    r3, #0x40
0006956c  str.w   r3, [ip, #0x44]
00069570  ldr.w   r3, [r0, #0xa4]
00069574  adds    r3, #1
00069576  str.w   r2, [r0, r3, lsl #3]
0006957a  ldr.w   r3, [r0, #0xa4]
0006957e  ldr.w   r2, [pc, #0x3c]
00069582  adds    r3, #1
00069584  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
00069586  str.w   r3, [r0, #0xa4]
0006958a  lsls    r3, r3, #3
0006958c  adds    r3, r3, r0
0006958e  str     r2, [r3, #4]
00069590  ldr.w   r3, [r0, #0xa4]
00069594  movs    r2, #0
00069596  adds    r3, #1
00069598  str.w   r2, [r0, r3, lsl #3]
0006959c  mov     r0, r2
0006959e  b       #0x694fa
000695a0  ldr     r3, [pc, #0x1c]
000695a2  add     r3, pc ; -> 0x000f3150  t_do_fatality_1
000695a4  ldr     r2, [r3]
000695a6  lsls    r3, r1, #3
000695a8  b       #0x6958c
000695aa  nop     
000695ac  ldrh    r4, [r6, #6]
000695ae  movs    r0, r2
000695b0  ldrh    r7, [r7, #0x3c]
000695b2  movs    r0, r0
000695b4  ldr     r3, [r7, #0x64]
000695b6  movs    r0, r0
000695b8  ldrsh   pc, [sb, #0xff]!
000695bc  ldrh    r5, [r3, #0x12]
000695be  movs    r0, r0
000695c0  ldr     r3, [sp, #0x2a8]
000695c2  movs    r0, r1
