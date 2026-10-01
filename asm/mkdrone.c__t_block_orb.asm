========================================================================
t_block_orb  0x0006f934  236 bytes   mkdrone.c
========================================================================

0006f934  push    {r4, r5, r6, r7, lr}
0006f936  add     r7, sp, #0xc
0006f938  mov     r4, r0
0006f93a  ldr.w   r2, [r4, #0xa4]
0006f93e  movw    r6, #0xf3b
0006f942  ldr.w   r0, [r0, #0x108]
0006f946  adds    r3, r2, #1
0006f948  ldr.w   r5, [r4, r3, lsl #3]
0006f94c  cmp     r5, r6
0006f94e  beq     #0x6f9b6
0006f950  ble     #0x6f966
0006f952  movw    r3, #0xf3c
0006f956  cmp     r5, r3
0006f958  beq     #0x6f9e0
0006f95a  adds    r3, #3
0006f95c  cmp     r5, r3
0006f95e  beq     #0x6f99c
0006f960  mvn     r0, #2
0006f964  pop     {r4, r5, r6, r7, pc}
0006f966  cmp     r5, #0
0006f968  bne     #0x6f960
0006f96a  bl      #0x55388 ; -> face_opponent
0006f96e  ldr.w   r3, [r4, #0xa4]
0006f972  mov     r0, r5
0006f974  adds    r3, #1
0006f976  str.w   r6, [r4, r3, lsl #3]
0006f97a  ldr.w   r3, [r4, #0xa4]
0006f97e  adds    r2, r3, #1
0006f980  ldr     r3, [pc, #0x88]
0006f982  str.w   r2, [r4, #0xa4]
0006f986  add     r3, pc ; -> 0x000f37d8  t_do_block_hi
0006f988  ldr     r1, [r3]
0006f98a  lsls    r3, r2, #3
0006f98c  adds    r3, r3, r4
0006f98e  str     r1, [r3, #4]
0006f990  ldr.w   r3, [r4, #0xa4]
0006f994  adds    r3, #1
0006f996  str.w   r5, [r4, r3, lsl #3]
0006f99a  b       #0x6f964
0006f99c  ldr     r3, [pc, #0x70]
0006f99e  movs    r0, #0
0006f9a0  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006f9a2  ldr     r1, [r3]
0006f9a4  lsls    r3, r2, #3
0006f9a6  adds    r3, r3, r4
0006f9a8  str     r1, [r3, #4]
0006f9aa  ldr.w   r3, [r4, #0xa4]
0006f9ae  adds    r3, #1
0006f9b0  str.w   r0, [r4, r3, lsl #3]
0006f9b4  b       #0x6f964
0006f9b6  movw    r2, #0xf3c
0006f9ba  str.w   r2, [r4, r3, lsl #3]
0006f9be  ldr     r2, [pc, #0x54]
0006f9c0  ldr.w   r3, [r4, #0xa4]
0006f9c4  add     r2, pc ; -> 0x000700dd  t_wait_proj_spawn
0006f9c6  adds    r3, #1
0006f9c8  str.w   r3, [r4, #0xa4]
0006f9cc  lsls    r3, r3, #3
0006f9ce  adds    r3, r3, r4
0006f9d0  movs    r0, #0
0006f9d2  str     r2, [r3, #4]
0006f9d4  ldr.w   r3, [r4, #0xa4]
0006f9d8  adds    r3, #1
0006f9da  str.w   r0, [r4, r3, lsl #3]
0006f9de  b       #0x6f964
0006f9e0  ldr.w   r3, [pc, #0x34]
0006f9e4  movw    r2, #0xf3f
0006f9e8  add     r3, pc ; -> 0x00070179  q_is_proj_gone
0006f9ea  str     r3, [r0, #0x48]
0006f9ec  movs    r3, #0x50
0006f9ee  str     r3, [r0, #0x44]
0006f9f0  ldr.w   r3, [r4, #0xa4]
0006f9f4  adds    r3, #1
0006f9f6  str.w   r2, [r4, r3, lsl #3]
0006f9fa  ldr.w   r2, [pc, #0x20]
0006f9fe  ldr.w   r3, [r4, #0xa4]
0006fa02  add     r2, pc ; -> 0x000684c1  t_d_wait_yes_still
0006fa04  adds    r3, #1
0006fa06  str.w   r3, [r4, #0xa4]
0006fa0a  b       #0x6f9cc
0006fa0c  subs    r6, #0x4e
0006fa0e  movs    r0, r1
0006fa10  subs    r5, #0x64
0006fa12  movs    r0, r1
0006fa14  lsls    r5, r2, #0x1c
0006fa16  movs    r0, r0
0006fa18  lsls    r5, r1, #0x1e
0006fa1a  movs    r0, r0
0006fa1c  ldrh    r3, [r7, #0x14]
