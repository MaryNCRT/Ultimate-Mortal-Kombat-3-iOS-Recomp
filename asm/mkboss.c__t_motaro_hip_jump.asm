========================================================================
t_motaro_hip_jump  0x000a8890  152 bytes   mkboss.c
========================================================================

000a8890  push    {lr}
000a8892  ldr.w   ip, [r0, #0xa4]
000a8896  movw    lr, #0x4c1
000a889a  add.w   r3, ip, #1
000a889e  ldr.w   r1, [r0, r3, lsl #3]
000a88a2  cmp     r1, lr
000a88a4  beq     #0xa8902
000a88a6  movw    r2, #0x4c3
000a88aa  cmp     r1, r2
000a88ac  beq     #0xa88e2
000a88ae  cbz     r1, #0xa88b6
000a88b0  mvn     r0, #2
000a88b4  pop     {pc}
000a88b6  str.w   lr, [r0, r3, lsl #3]
000a88ba  ldr.w   r3, [r0, #0xa4]
000a88be  adds    r2, r3, #1
000a88c0  ldr     r3, [pc, #0x58]
000a88c2  str.w   r2, [r0, #0xa4]
000a88c6  add     r3, pc ; -> 0x000f37a8  t_check_winner_status
000a88c8  ldr.w   ip, [r3]
000a88cc  lsls    r3, r2, #3
000a88ce  adds    r3, r3, r0
000a88d0  str.w   ip, [r3, #4]
000a88d4  ldr.w   r3, [r0, #0xa4]
000a88d8  adds    r3, #1
000a88da  str.w   r1, [r0, r3, lsl #3]
000a88de  mov     r0, r1
000a88e0  b       #0xa88b4
000a88e2  ldr.w   r3, [pc, #0x3c]
000a88e6  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a88e8  ldr     r2, [r3]
000a88ea  lsl.w   r3, ip, #3
000a88ee  adds    r3, r3, r0
000a88f0  movs    r1, #0
000a88f2  str     r2, [r3, #4]
000a88f4  ldr.w   r3, [r0, #0xa4]
000a88f8  adds    r3, #1
000a88fa  str.w   r1, [r0, r3, lsl #3]
000a88fe  mov     r0, r1
000a8900  b       #0xa88b4
000a8902  movw    r2, #0x4c3
000a8906  str.w   r2, [r0, r3, lsl #3]
000a890a  ldr.w   r3, [r0, #0xa4]
000a890e  ldr     r2, [pc, #0x14]
000a8910  adds    r3, #1
000a8912  add     r2, pc ; -> 0x000aa331  t_motaro_hip_jsrp
000a8914  str.w   r3, [r0, #0xa4]
000a8918  lsls    r3, r3, #3
000a891a  b       #0xa88ee
000a891c  add     r6, sp, #0x378
000a891e  movs    r4, r0
000a8920  add     r6, sp, #0x78
000a8922  movs    r4, r0
000a8924  subs    r3, r3, r0
000a8926  movs    r0, r0
