========================================================================
t_d_attack  0x000711a4  172 bytes   mkdrone.c
========================================================================

000711a4  push    {r4, r5, r6, r7, lr}
000711a6  add     r7, sp, #0xc
000711a8  str     r8, [sp, #-0x4]!
000711ac  ldr.w   r3, [r0, #0xa4]
000711b0  mov     r5, r0
000711b2  ldr.w   r4, [r0, #0x108]
000711b6  adds    r3, #1
000711b8  ldr.w   r6, [r0, r3, lsl #3]
000711bc  cbnz    r6, #0x711ea
000711be  mov     r0, r4
000711c0  bl      #0x70f58 ; -> q_am_i_cornered
000711c4  ldr.w   r8, [r4, #0x5c]
000711c8  cmp.w   r8, #0
000711cc  beq     #0x711f4
000711ce  ldr.w   r3, [r5, #0xa4]
000711d2  ldr     r2, [pc, #0x68]
000711d4  mov     r0, r6
000711d6  lsls    r3, r3, #3
000711d8  adds    r3, r3, r5
000711da  add     r2, pc ; -> 0x0006cd3d  t_cornered_attack
000711dc  str     r2, [r3, #4]
000711de  ldr.w   r3, [r5, #0xa4]
000711e2  adds    r3, #1
000711e4  str.w   r6, [r5, r3, lsl #3]
000711e8  b       #0x711ee
000711ea  mvn     r0, #2
000711ee  ldr     r8, [sp], #4
000711f2  pop     {r4, r5, r6, r7, pc}
000711f4  mov     r0, r4
000711f6  bl      #0x2f3a0 ; -> get_x_dist
000711fa  ldr     r0, [r4, #0x28]
000711fc  cmp     r0, #0x44
000711fe  bgt     #0x7121e
00071200  ldr.w   r2, [pc, #0x3c]
00071204  add     r2, pc ; -> 0x0006f681  t_d_attack_very_close
00071206  ldr.w   r3, [r5, #0xa4]
0007120a  mov     r0, r8
0007120c  lsls    r3, r3, #3
0007120e  adds    r3, r3, r5
00071210  str     r2, [r3, #4]
00071212  ldr.w   r3, [r5, #0xa4]
00071216  adds    r3, #1
00071218  str.w   r8, [r5, r3, lsl #3]
0007121c  b       #0x711ee
0007121e  cmp     r0, #0x77
00071220  ble     #0x7122e
00071222  cmp     r0, #0xef
00071224  bgt     #0x71234
00071226  ldr.w   r2, [pc, #0x1c]
0007122a  add     r2, pc ; -> 0x0006f845  t_d_attack_far
0007122c  b       #0x71206
0007122e  ldr     r2, [pc, #0x18]
00071230  add     r2, pc ; -> 0x0006f775  t_d_attack_close
00071232  b       #0x71206
00071234  ldr     r2, [pc, #0x14]
00071236  add     r2, pc ; -> 0x00070bf5  t_d_attack_very_far
00071238  b       #0x71206
0007123a  nop     
0007123c  cbnz    r7, #0x71296
