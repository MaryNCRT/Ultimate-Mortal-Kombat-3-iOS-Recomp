========================================================================
t_motaro_sweep  0x000aa210  288 bytes   mkboss.c
========================================================================

000aa210  push    {r4, r5, r6, r7, lr}
000aa212  add     r7, sp, #0xc
000aa214  push.w  {r8, sl}
000aa218  ldr.w   r2, [r0, #0xa4]
000aa21c  movw    sl, #0x41a
000aa220  mov     r4, r0
000aa222  adds    r3, r2, #1
000aa224  ldr.w   r5, [r0, #0x108]
000aa228  ldr.w   r6, [r0, r3, lsl #3]
000aa22c  cmp     r6, sl
000aa22e  beq     #0xaa2b6
000aa230  ble     #0xaa24a
000aa232  movw    r3, #0x41f
000aa236  cmp     r6, r3
000aa238  beq     #0xaa2c0
000aa23a  adds    r3, #2
000aa23c  cmp     r6, r3
000aa23e  beq     #0xaa29c
000aa240  mvn     r0, #2
000aa244  pop.w   {r8, sl}
000aa248  pop     {r4, r5, r6, r7, pc}
000aa24a  cmp     r6, #0
000aa24c  bne     #0xaa240
000aa24e  mov     r0, r5
000aa250  mov.w   r8, #2
000aa254  str.w   r8, [r5, #0x1c]
000aa258  bl      #0x57be4 ; -> ochar_sound
000aa25c  movs    r3, #0x14
000aa25e  str     r6, [r5, #0x20]
000aa260  str     r3, [r5, #0x40]
000aa262  str.w   r8, [r5, #0x44]
000aa266  str.w   r8, [r5, #0x48]
000aa26a  subs    r3, #0x11
000aa26c  str     r3, [r5, #0x1c]
000aa26e  ldr.w   r3, [r4, #0xa4]
000aa272  mov     r0, r6
000aa274  adds    r3, #1
000aa276  str.w   sl, [r4, r3, lsl #3]
000aa27a  ldr.w   r3, [r4, #0xa4]
000aa27e  adds    r2, r3, #1
000aa280  ldr     r3, [pc, #0x98]
000aa282  str.w   r2, [r4, #0xa4]
000aa286  add     r3, pc ; -> 0x000f3880  t_striker
000aa288  ldr     r1, [r3]
000aa28a  lsls    r3, r2, #3
000aa28c  adds    r3, r3, r4
000aa28e  str     r1, [r3, #4]
000aa290  ldr.w   r3, [r4, #0xa4]
000aa294  adds    r3, #1
000aa296  str.w   r6, [r4, r3, lsl #3]
000aa29a  b       #0xaa244
000aa29c  ldr     r3, [pc, #0x80]
000aa29e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000aa2a0  ldr     r1, [r3]
000aa2a2  lsls    r3, r2, #3
000aa2a4  adds    r3, r3, r4
000aa2a6  movs    r0, #0
000aa2a8  str     r1, [r3, #4]
000aa2aa  ldr.w   r3, [r4, #0xa4]
000aa2ae  adds    r3, #1
000aa2b0  str.w   r0, [r4, r3, lsl #3]
000aa2b4  b       #0xaa244
000aa2b6  ldr     r0, [r5, #0x5c]
000aa2b8  cbz     r0, #0xaa2e6
000aa2ba  ldr     r1, [pc, #0x68]
000aa2bc  add     r1, pc ; -> 0x000ac001  t_mot_sweep_hit
000aa2be  b       #0xaa2a2
000aa2c0  movs    r3, #4
000aa2c2  str     r3, [r5, #0x1c]
000aa2c4  ldr.w   r3, [r0, #0xa4]
000aa2c8  movw    r2, #0x421
000aa2cc  adds    r3, #1
000aa2ce  str.w   r2, [r0, r3, lsl #3]
000aa2d2  ldr.w   r3, [r0, #0xa4]
000aa2d6  adds    r2, r3, #1
000aa2d8  ldr.w   r3, [pc, #0x4c]
000aa2dc  str.w   r2, [r0, #0xa4]
000aa2e0  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa2e2  ldr     r1, [r3]
000aa2e4  b       #0xaa2a2
000aa2e6  movs    r3, #4
000aa2e8  str     r3, [r5, #0x1c]
000aa2ea  ldr.w   r3, [r4, #0xa4]
000aa2ee  movw    r2, #0x41f
000aa2f2  adds    r3, #1
000aa2f4  str.w   r2, [r4, r3, lsl #3]
000aa2f8  ldr.w   r3, [r4, #0xa4]
000aa2fc  adds    r2, r3, #1
000aa2fe  ldr     r3, [pc, #0x2c]
000aa300  str.w   r2, [r4, #0xa4]
000aa304  add     r3, pc ; -> 0x000f37cc  t_mframew
000aa306  ldr     r1, [r3]
000aa308  lsls    r3, r2, #3
000aa30a  adds    r3, r3, r4
000aa30c  str     r1, [r3, #4]
000aa30e  ldr.w   r3, [r4, #0xa4]
000aa312  adds    r3, #1
000aa314  str.w   r0, [r4, r3, lsl #3]
000aa318  b       #0xaa244
000aa31a  nop     
000aa31c  str     r5, [sp, #0x3d8]
000aa31e  movs    r4, r0
000aa320  str     r4, [sp, #0x198]
000aa322  movs    r4, r0
000aa324  adds    r1, r0, #5
000aa326  movs    r0, r0
000aa328  str     r4, [sp, #0x3a0]
000aa32a  movs    r4, r0
000aa32c  str     r4, [sp, #0x310]
000aa32e  movs    r4, r0
