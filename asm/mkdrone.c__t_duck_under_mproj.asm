========================================================================
t_duck_under_mproj  0x0007021c  236 bytes   mkdrone.c
========================================================================

0007021c  push    {r4, r5, r6, r7, lr}
0007021e  add     r7, sp, #0xc
00070220  ldr.w   r2, [r0, #0xa4]
00070224  movw    r6, #0xf83
00070228  mov     r4, r0
0007022a  adds    r3, r2, #1
0007022c  ldr.w   r1, [r0, #0x108]
00070230  ldr.w   r5, [r0, r3, lsl #3]
00070234  cmp     r5, r6
00070236  beq     #0x7029c
00070238  ble     #0x7024e
0007023a  movw    r3, #0xf84
0007023e  cmp     r5, r3
00070240  beq     #0x702c6
00070242  adds    r3, #3
00070244  cmp     r5, r3
00070246  beq     #0x70284
00070248  mvn     r0, #2
0007024c  pop     {r4, r5, r6, r7, pc}
0007024e  cmp     r5, #0
00070250  bne     #0x70248
00070252  bl      #0x2ebdc ; -> reset_proc_stack
00070256  ldr.w   r3, [r4, #0xa4]
0007025a  mov     r0, r5
0007025c  adds    r3, #1
0007025e  str.w   r6, [r4, r3, lsl #3]
00070262  ldr.w   r3, [r4, #0xa4]
00070266  adds    r2, r3, #1
00070268  ldr     r3, [pc, #0x88]
0007026a  str.w   r2, [r4, #0xa4]
0007026e  add     r3, pc ; -> 0x000f3884  t_do_duck
00070270  ldr     r1, [r3]
00070272  lsls    r3, r2, #3
00070274  adds    r3, r3, r4
00070276  str     r1, [r3, #4]
00070278  ldr.w   r3, [r4, #0xa4]
0007027c  adds    r3, #1
0007027e  str.w   r5, [r4, r3, lsl #3]
00070282  b       #0x7024c
00070284  ldr     r1, [pc, #0x70]
00070286  lsls    r3, r2, #3
00070288  adds    r3, r3, r0
0007028a  add     r1, pc ; -> 0x000678e9  t_d_backup_jump
0007028c  str     r1, [r3, #4]
0007028e  ldr.w   r3, [r0, #0xa4]
00070292  movs    r0, #0
00070294  adds    r3, #1
00070296  str.w   r0, [r4, r3, lsl #3]
0007029a  b       #0x7024c
0007029c  movw    r2, #0xf84
000702a0  str.w   r2, [r0, r3, lsl #3]
000702a4  ldr     r2, [pc, #0x54]
000702a6  ldr.w   r3, [r0, #0xa4]
000702aa  add     r2, pc ; -> 0x000700dd  t_wait_proj_spawn
000702ac  adds    r3, #1
000702ae  str.w   r3, [r0, #0xa4]
000702b2  lsls    r3, r3, #3
000702b4  adds    r3, r3, r4
000702b6  movs    r0, #0
000702b8  str     r2, [r3, #4]
000702ba  ldr.w   r3, [r4, #0xa4]
000702be  adds    r3, #1
000702c0  str.w   r0, [r4, r3, lsl #3]
000702c4  b       #0x7024c
000702c6  ldr.w   r3, [pc, #0x38]
000702ca  movw    r2, #0xf87
000702ce  add     r3, pc ; -> 0x00070179  q_is_proj_gone
000702d0  str     r3, [r1, #0x48]
000702d2  movs    r3, #0x50
000702d4  str     r3, [r1, #0x44]
000702d6  ldr.w   r3, [r0, #0xa4]
000702da  adds    r3, #1
000702dc  str.w   r2, [r0, r3, lsl #3]
000702e0  ldr.w   r2, [pc, #0x20]
000702e4  ldr.w   r3, [r0, #0xa4]
000702e8  add     r2, pc ; -> 0x000684c1  t_d_wait_yes_still
000702ea  adds    r3, #1
000702ec  str.w   r3, [r0, #0xa4]
000702f0  b       #0x702b2
000702f2  nop     
000702f4  adds    r6, #0x12
000702f6  movs    r0, r1
000702f8  strb    r3, [r3, #0x19]
