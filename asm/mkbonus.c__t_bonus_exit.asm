========================================================================
t_bonus_exit  0x0007cb3c  68 bytes   mkbonus.c
========================================================================

0007cb3c  ldr.w   r2, [r0, #0xa4]
0007cb40  adds    r3, r2, #1
0007cb42  ldr.w   r1, [r0, r3, lsl #3]
0007cb46  cbz     r1, #0x7cb4e
0007cb48  mvn     r0, #2
0007cb4c  bx      lr
0007cb4e  cmp     r2, #0
0007cb50  ble     #0x7cb5c
0007cb52  subs    r3, r2, #1
0007cb54  str.w   r3, [r0, #0xa4]
0007cb58  mov     r0, r1
0007cb5a  b       #0x7cb4c
0007cb5c  ldr     r3, [pc, #0x1c]
0007cb5e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0007cb60  ldr.w   ip, [r3]
0007cb64  lsls    r3, r2, #3
0007cb66  adds    r3, r3, r0
0007cb68  str.w   ip, [r3, #4]
0007cb6c  ldr.w   r3, [r0, #0xa4]
0007cb70  adds    r3, #1
0007cb72  str.w   r1, [r0, r3, lsl #3]
0007cb76  mov     r0, r1
0007cb78  b       #0x7cb4c
0007cb7a  nop     
0007cb7c  ldr     r6, [r4, #0x38]
0007cb7e  movs    r7, r0
