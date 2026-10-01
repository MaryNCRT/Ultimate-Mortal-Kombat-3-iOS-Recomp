========================================================================
t_nr_jump_over_proj  0x0006db74  216 bytes   mkdrone.c
========================================================================

0006db74  push    {r4, r5, r6, r7, lr}
0006db76  add     r7, sp, #0xc
0006db78  ldr.w   r3, [r0, #0xa4]
0006db7c  mov     r4, r0
0006db7e  ldr.w   r6, [r0, #0x108]
0006db82  adds    r3, #1
0006db84  ldr.w   r5, [r0, r3, lsl #3]
0006db88  cbnz    r5, #0x6dba8
0006db8a  mov     r0, r6
0006db8c  bl      #0x2f3a0 ; -> get_x_dist
0006db90  ldr     r3, [r6, #0x28]
0006db92  cmp     r3, #0xb5
0006db94  bgt     #0x6dbae
0006db96  ldr.w   r3, [r4, #0xa4]
0006db9a  cmp     r3, #0
0006db9c  ble     #0x6dc20
0006db9e  subs    r3, #1
0006dba0  mov     r0, r5
0006dba2  str.w   r3, [r4, #0xa4]
0006dba6  b       #0x6dbac
0006dba8  mvn     r0, #2
0006dbac  pop     {r4, r5, r6, r7, pc}
0006dbae  ldr.w   r3, [r4, #0xa4]
0006dbb2  cmp     r3, #0
0006dbb4  ble     #0x6dc08
0006dbb6  subs    r3, #1
0006dbb8  str.w   r3, [r4, #0xa4]
0006dbbc  ldr.w   r1, [r4, #0xa4]
0006dbc0  adds    r3, r1, #1
0006dbc2  lsls    r2, r3, #3
0006dbc4  adds    r2, r2, r4
0006dbc6  ldr     r0, [r2, #4]
0006dbc8  adds    r2, r3, #1
0006dbca  ldr.w   r2, [r4, r2, lsl #3]
0006dbce  str.w   r2, [r4, r3, lsl #3]
0006dbd2  lsls    r3, r1, #3
0006dbd4  adds    r3, r3, r4
0006dbd6  str     r0, [r3, #4]
0006dbd8  mov     r0, r6
0006dbda  bl      #0x2f3a0 ; -> get_x_dist
0006dbde  ldr     r0, [r6, #0x28]
0006dbe0  cmp     r0, #0xef
0006dbe2  bgt     #0x6dc00
0006dbe4  ldr     r2, [pc, #0x54]
0006dbe6  add     r2, pc ; -> 0x00068745  t_d_fflip_kick_jump
0006dbe8  ldr.w   r3, [r4, #0xa4]
0006dbec  movs    r0, #0
0006dbee  lsls    r3, r3, #3
0006dbf0  adds    r3, r3, r4
0006dbf2  str     r2, [r3, #4]
0006dbf4  ldr.w   r3, [r4, #0xa4]
0006dbf8  adds    r3, #1
0006dbfa  str.w   r0, [r4, r3, lsl #3]
0006dbfe  b       #0x6dbac
0006dc00  ldr.w   r2, [pc, #0x3c]
0006dc04  add     r2, pc ; -> 0x0006aac5  t_d_flipk_over_proj
0006dc06  b       #0x6dbe8
0006dc08  ldr     r2, [pc, #0x38]
0006dc0a  lsls    r3, r3, #3
0006dc0c  adds    r3, r3, r4
0006dc0e  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006dc10  ldr     r2, [r2]
0006dc12  str     r2, [r3, #4]
0006dc14  ldr.w   r3, [r4, #0xa4]
0006dc18  adds    r3, #1
0006dc1a  str.w   r5, [r4, r3, lsl #3]
0006dc1e  b       #0x6dbbc
0006dc20  ldr     r2, [pc, #0x24]
0006dc22  lsls    r3, r3, #3
0006dc24  adds    r3, r3, r4
0006dc26  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006dc28  mov     r0, r5
0006dc2a  ldr     r2, [r2]
0006dc2c  str     r2, [r3, #4]
0006dc2e  ldr.w   r3, [r4, #0xa4]
0006dc32  adds    r3, #1
0006dc34  str.w   r5, [r4, r3, lsl #3]
0006dc38  b       #0x6dbac
0006dc3a  nop     
0006dc3c  add     r3, sp, #0x16c
