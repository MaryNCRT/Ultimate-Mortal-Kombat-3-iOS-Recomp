========================================================================
t_ind_delayed_axe  0x00069d18  176 bytes   mkdrone.c
========================================================================

00069d18  push    {lr}
00069d1a  ldr.w   r1, [r0, #0xa4]
00069d1e  movw    lr, #0xd2d
00069d22  ldr.w   ip, [r0, #0x108]
00069d26  adds    r3, r1, #1
00069d28  ldr.w   r2, [r0, r3, lsl #3]
00069d2c  cmp     r2, lr
00069d2e  beq     #0x69d98
00069d30  movw    r3, #0xd2e
00069d34  cmp     r2, r3
00069d36  beq     #0x69d7c
00069d38  cbz     r2, #0x69d40
00069d3a  mvn     r0, #2
00069d3e  pop     {pc}
00069d40  movs    r3, #0x40
00069d42  str.w   r3, [ip, #0x44]
00069d46  ldr     r3, [pc, #0x70]
00069d48  ldr.w   r1, [pc, #0x70]
00069d4c  add     r3, pc ; -> 0x0006e421  q_is_he_axe_close
00069d4e  str.w   r3, [ip, #0x48]
00069d52  ldr.w   r3, [r0, #0xa4]
00069d56  add     r1, pc ; -> 0x00072a2d  t_stalk_wait_yes
00069d58  adds    r3, #1
00069d5a  str.w   lr, [r0, r3, lsl #3]
00069d5e  ldr.w   r3, [r0, #0xa4]
00069d62  adds    r3, #1
00069d64  str.w   r3, [r0, #0xa4]
00069d68  lsls    r3, r3, #3
00069d6a  adds    r3, r3, r0
00069d6c  str     r1, [r3, #4]
00069d6e  ldr.w   r3, [r0, #0xa4]
00069d72  adds    r3, #1
00069d74  str.w   r2, [r0, r3, lsl #3]
00069d78  mov     r0, r2
00069d7a  b       #0x69d3e
00069d7c  ldr     r3, [pc, #0x40]
00069d7e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00069d80  ldr     r2, [r3]
00069d82  lsls    r3, r1, #3
00069d84  adds    r3, r3, r0
00069d86  str     r2, [r3, #4]
00069d88  ldr.w   r3, [r0, #0xa4]
00069d8c  movs    r2, #0
00069d8e  adds    r3, #1
00069d90  str.w   r2, [r0, r3, lsl #3]
00069d94  mov     r0, r2
00069d96  b       #0x69d3e
00069d98  movw    r2, #0xd2e
00069d9c  str.w   r2, [r0, r3, lsl #3]
00069da0  ldr.w   r3, [r0, #0xa4]
00069da4  adds    r2, r3, #1
00069da6  ldr     r3, [pc, #0x1c]
00069da8  str.w   r2, [r0, #0xa4]
00069dac  add     r3, pc ; -> 0x000f303c  t_do_axe_up
00069dae  ldr     r1, [r3]
00069db0  lsls    r3, r2, #3
00069db2  adds    r3, r3, r0
00069db4  str     r1, [r3, #4]
00069db6  b       #0x69d88
00069db8  mov     sb, sl
00069dba  movs    r0, r0
00069dbc  ldrh    r3, [r2, #0x26]
00069dbe  movs    r0, r0
00069dc0  ldr     r1, [sp, #0x218]
00069dc2  movs    r0, r1
00069dc4  str     r2, [sp, #0x230]
00069dc6  movs    r0, r1
