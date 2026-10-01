========================================================================
t_flipp_scan  0x00070484  188 bytes   mkdrone.c
========================================================================

00070484  push    {r4, r5, r6, r7, lr}
00070486  add     r7, sp, #0xc
00070488  ldr.w   r2, [r0, #0xa4]
0007048c  mov     r4, r0
0007048e  ldr.w   r5, [r0, #0x108]
00070492  adds    r3, r2, #1
00070494  ldr.w   r6, [r0, r3, lsl #3]
00070498  cbnz    r6, #0x704b8
0007049a  mov     r0, r5
0007049c  bl      #0x2f3a0 ; -> get_x_dist
000704a0  ldr     r0, [r5, #0x28]
000704a2  cmp     r0, #0x80
000704a4  ble     #0x704e0
000704a6  ldr.w   r3, [r4, #0xa4]
000704aa  cmp     r3, #0
000704ac  ble     #0x70518
000704ae  mov     r0, r6
000704b0  subs    r3, #1
000704b2  str.w   r3, [r4, #0xa4]
000704b6  pop     {r4, r5, r6, r7, pc}
000704b8  movw    r3, #0x683
000704bc  cmp     r6, r3
000704be  it      ne
000704c0  mvnne   r0, #2
000704c4  bne     #0x704b6
000704c6  ldr     r3, [pc, #0x6c]
000704c8  movs    r0, #0
000704ca  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000704cc  ldr     r1, [r3]
000704ce  lsls    r3, r2, #3
000704d0  adds    r3, r3, r4
000704d2  str     r1, [r3, #4]
000704d4  ldr.w   r3, [r4, #0xa4]
000704d8  adds    r3, #1
000704da  str.w   r0, [r4, r3, lsl #3]
000704de  b       #0x704b6
000704e0  mov     r0, r4
000704e2  bl      #0x2ebdc ; -> reset_proc_stack
000704e6  ldr.w   r3, [r4, #0xa4]
000704ea  movw    r2, #0x683
000704ee  mov     r0, r6
000704f0  adds    r3, #1
000704f2  str.w   r2, [r4, r3, lsl #3]
000704f6  ldr.w   r3, [r4, #0xa4]
000704fa  adds    r2, r3, #1
000704fc  ldr     r3, [pc, #0x38]
000704fe  str.w   r2, [r4, #0xa4]
00070502  add     r3, pc ; -> 0x000f37e4  t_do_flip_punch
00070504  ldr     r1, [r3]
00070506  lsls    r3, r2, #3
00070508  adds    r3, r3, r4
0007050a  str     r1, [r3, #4]
0007050c  ldr.w   r3, [r4, #0xa4]
00070510  adds    r3, #1
00070512  str.w   r6, [r4, r3, lsl #3]
00070516  b       #0x704b6
00070518  ldr.w   r2, [pc, #0x20]
0007051c  lsls    r3, r3, #3
0007051e  adds    r3, r3, r4
00070520  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00070522  mov     r0, r6
00070524  ldr     r2, [r2]
00070526  str     r2, [r3, #4]
00070528  ldr.w   r3, [r4, #0xa4]
0007052c  adds    r3, #1
0007052e  str.w   r6, [r4, r3, lsl #3]
00070532  b       #0x704b6
00070534  adds    r2, #0x3a
00070536  movs    r0, r1
00070538  adds    r2, #0xde
0007053a  movs    r0, r1
0007053c  adds    r1, #0xe4
0007053e  movs    r0, r1
