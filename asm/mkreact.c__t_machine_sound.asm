========================================================================
t_machine_sound  0x00047984  104 bytes   mkreact.c
========================================================================

00047984  push    {r4, r7, lr}
00047986  add     r7, sp, #4
00047988  mov     r4, r0
0004798a  ldr.w   r3, [r4, #0xa4]
0004798e  ldr.w   r0, [r0, #0x108]
00047992  adds    r3, #1
00047994  ldr.w   r3, [r4, r3, lsl #3]
00047998  cbnz    r3, #0x479ba
0004799a  movs    r3, #6
0004799c  str     r3, [r0, #0x44]
0004799e  movs    r1, #0x22
000479a0  bl      #0x57dd0 ; -> tsound_func
000479a4  ldr.w   r3, [r4, #0xa4]
000479a8  movw    r2, #0x9ac
000479ac  movs    r0, #0x10
000479ae  adds    r3, #1
000479b0  str.w   r2, [r4, r3, lsl #3]
000479b4  str.w   r0, [r4, #0xfc]
000479b8  pop     {r4, r7, pc}
000479ba  movw    r2, #0x9ac
000479be  cmp     r3, r2
000479c0  it      ne
000479c2  mvnne   r0, #2
000479c6  bne     #0x479b8
000479c8  ldr     r3, [r0, #0x44]
000479ca  subs    r3, #1
000479cc  str     r3, [r0, #0x44]
000479ce  cmp     r3, #0
000479d0  bne     #0x4799e
000479d2  ldr.w   r3, [r4, #0xa4]
000479d6  ldr     r0, [pc, #0x10]
000479d8  mov.w   r2, #0x9b0
000479dc  adds    r3, #1
000479de  str.w   r2, [r4, r3, lsl #3]
000479e2  str.w   r0, [r4, #0xfc]
000479e6  b       #0x479b8
000479e8  str     r2, [r4, #0x44]
000479ea  movs    r1, r0
