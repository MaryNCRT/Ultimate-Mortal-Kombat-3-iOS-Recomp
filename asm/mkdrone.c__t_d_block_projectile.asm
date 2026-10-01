========================================================================
t_d_block_projectile  0x00068ccc  248 bytes   mkdrone.c
========================================================================

00068ccc  push    {lr}
00068cce  ldr.w   ip, [r0, #0xa4]
00068cd2  movw    lr, #0x851
00068cd6  ldr.w   r1, [r0, #0x108]
00068cda  add.w   r3, ip, #1
00068cde  ldr.w   r2, [r0, r3, lsl #3]
00068ce2  cmp     r2, lr
00068ce4  beq     #0x68d58
00068ce6  ble     #0x68cfc
00068ce8  movw    r3, #0x853
00068cec  cmp     r2, r3
00068cee  beq     #0x68d7a
00068cf0  adds    r3, #3
00068cf2  cmp     r2, r3
00068cf4  beq     #0x68d38
00068cf6  mvn     r0, #2
00068cfa  pop     {pc}
00068cfc  cmp     r2, #0
00068cfe  bne     #0x68cf6
00068d00  ldr     r3, [pc, #0xa8]
00068d02  add     r3, pc ; -> 0x00070179  q_is_proj_gone
00068d04  str     r3, [r1, #0x48]
00068d06  movs    r3, #0x30
00068d08  str     r3, [r1, #0x44]
00068d0a  ldr.w   r3, [r0, #0xa4]
00068d0e  ldr.w   r1, [pc, #0xa0]
00068d12  adds    r3, #1
00068d14  add     r1, pc ; -> 0x00071ee5  t_stance_wait_no
00068d16  str.w   lr, [r0, r3, lsl #3]
00068d1a  ldr.w   r3, [r0, #0xa4]
00068d1e  adds    r3, #1
00068d20  str.w   r3, [r0, #0xa4]
00068d24  lsls    r3, r3, #3
00068d26  adds    r3, r3, r0
00068d28  str     r1, [r3, #4]
00068d2a  ldr.w   r3, [r0, #0xa4]
00068d2e  adds    r3, #1
00068d30  str.w   r2, [r0, r3, lsl #3]
00068d34  mov     r0, r2
00068d36  b       #0x68cfa
00068d38  ldr.w   r3, [pc, #0x78]
00068d3c  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00068d3e  ldr     r2, [r3]
00068d40  lsl.w   r3, ip, #3
00068d44  adds    r3, r3, r0
00068d46  str     r2, [r3, #4]
00068d48  ldr.w   r3, [r0, #0xa4]
00068d4c  movs    r2, #0
00068d4e  adds    r3, #1
00068d50  str.w   r2, [r0, r3, lsl #3]
00068d54  mov     r0, r2
00068d56  b       #0x68cfa
00068d58  movw    r2, #0x853
00068d5c  str.w   r2, [r0, r3, lsl #3]
00068d60  ldr.w   r3, [r0, #0xa4]
00068d64  adds    r2, r3, #1
00068d66  ldr.w   r3, [pc, #0x50]
00068d6a  str.w   r2, [r0, #0xa4]
00068d6e  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
00068d70  ldr     r1, [r3]
00068d72  lsls    r3, r2, #3
00068d74  adds    r3, r3, r0
00068d76  str     r1, [r3, #4]
00068d78  b       #0x68d48
00068d7a  ldr     r3, [pc, #0x40]
00068d7c  movw    r2, #0x856
00068d80  add     r3, pc ; -> 0x00070179  q_is_proj_gone
00068d82  str     r3, [r1, #0x48]
00068d84  movs    r3, #0x50
00068d86  str     r3, [r1, #0x44]
00068d88  ldr.w   r3, [r0, #0xa4]
00068d8c  adds    r3, #1
00068d8e  str.w   r2, [r0, r3, lsl #3]
00068d92  ldr.w   r3, [r0, #0xa4]
00068d96  ldr.w   r2, [pc, #0x28]
00068d9a  adds    r3, #1
00068d9c  str.w   r3, [r0, #0xa4]
00068da0  lsls    r3, r3, #3
00068da2  adds    r3, r3, r0
00068da4  add     r2, pc ; -> 0x000684c1  t_d_wait_yes_still
00068da6  str     r2, [r3, #4]
00068da8  b       #0x68d48
00068daa  nop     
00068dac  strb    r3, [r6, #0x11]
00068dae  movs    r0, r0
00068db0  str     r1, [sp, #0x334]
00068db2  movs    r0, r0
00068db4  add     r1, sp, #0x320
00068db6  movs    r0, r1
00068db8  add     r2, sp, #0x198
00068dba  movs    r0, r1
00068dbc  strb    r5, [r6, #0xf]
00068dbe  movs    r0, r0
00068dc0  bl      #0xfff82dc2
