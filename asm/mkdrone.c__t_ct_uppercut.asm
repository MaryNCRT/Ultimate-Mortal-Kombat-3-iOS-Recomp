========================================================================
t_ct_uppercut  0x0006bb04  240 bytes   mkdrone.c
========================================================================

0006bb04  push    {lr}
0006bb06  ldr.w   ip, [r0, #0xa4]
0006bb0a  movw    lr, #0x1332
0006bb0e  ldr.w   r1, [r0, #0x108]
0006bb12  add.w   r2, ip, #1
0006bb16  ldr.w   r3, [r0, r2, lsl #3]
0006bb1a  cmp     r3, lr
0006bb1c  beq     #0x6bba8
0006bb1e  ble     #0x6bb36
0006bb20  movw    r1, #0x1333
0006bb24  cmp     r3, r1
0006bb26  beq     #0x6bbc2
0006bb28  movw    r2, #0x1334
0006bb2c  cmp     r3, r2
0006bb2e  beq     #0x6bb9c
0006bb30  mvn     r0, #2
0006bb34  pop     {pc}
0006bb36  cbz     r3, #0x6bb72
0006bb38  movw    r2, #0x1330
0006bb3c  cmp     r3, r2
0006bb3e  bne     #0x6bb30
0006bb40  movs    r3, #0x80
0006bb42  str     r3, [r1, #0x1c]
0006bb44  ldr.w   r3, [r0, #0xa4]
0006bb48  ldr     r2, [pc, #0x94]
0006bb4a  adds    r3, #1
0006bb4c  add     r2, pc ; -> 0x0006c77d  t_d_wait_nonattack
0006bb4e  str.w   lr, [r0, r3, lsl #3]
0006bb52  ldr.w   r3, [r0, #0xa4]
0006bb56  adds    r3, #1
0006bb58  str.w   r3, [r0, #0xa4]
0006bb5c  lsls    r3, r3, #3
0006bb5e  adds    r3, r3, r0
0006bb60  str     r2, [r3, #4]
0006bb62  ldr.w   r3, [r0, #0xa4]
0006bb66  adds    r2, r3, #1
0006bb68  movs    r3, #0
0006bb6a  str.w   r3, [r0, r2, lsl #3]
0006bb6e  mov     r0, r3
0006bb70  b       #0x6bb34
0006bb72  movw    r1, #0x1330
0006bb76  str.w   r1, [r0, r2, lsl #3]
0006bb7a  ldr.w   r2, [r0, #0xa4]
0006bb7e  ldr     r1, [pc, #0x64]
0006bb80  adds    r2, #1
0006bb82  str.w   r2, [r0, #0xa4]
0006bb86  lsls    r2, r2, #3
0006bb88  adds    r2, r2, r0
0006bb8a  add     r1, pc ; -> 0x000715b5  t_d_duck_fast
0006bb8c  str     r1, [r2, #4]
0006bb8e  ldr.w   r2, [r0, #0xa4]
0006bb92  adds    r2, #1
0006bb94  str.w   r3, [r0, r2, lsl #3]
0006bb98  mov     r0, r3
0006bb9a  b       #0x6bb34
0006bb9c  ldr     r3, [pc, #0x48]
0006bb9e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
0006bba0  ldr     r2, [r3]
0006bba2  lsl.w   r3, ip, #3
0006bba6  b       #0x6bb5e
0006bba8  movw    r3, #0x1333
0006bbac  str.w   r3, [r0, r2, lsl #3]
0006bbb0  ldr.w   r3, [r0, #0xa4]
0006bbb4  ldr     r2, [pc, #0x34]
0006bbb6  adds    r3, #1
0006bbb8  add     r2, pc ; -> 0x00068c89  t_nr_uppercut_if_u_can
0006bbba  str.w   r3, [r0, #0xa4]
0006bbbe  lsls    r3, r3, #3
0006bbc0  b       #0x6bb5e
0006bbc2  movw    r3, #0x1334
0006bbc6  str.w   r3, [r0, r2, lsl #3]
0006bbca  ldr.w   r3, [r0, #0xa4]
0006bbce  ldr.w   r2, [pc, #0x20]
0006bbd2  adds    r3, #1
0006bbd4  add     r2, pc ; -> 0x00068c45  t_nr_sweep_if_u_can
0006bbd6  str.w   r3, [r0, #0xa4]
0006bbda  lsls    r3, r3, #3
0006bbdc  b       #0x6bb5e
0006bbde  nop     
0006bbe0  lsrs    r5, r5, #0x10
0006bbe2  movs    r0, r0
0006bbe4  ldrh    r7, [r4, r0]
0006bbe6  movs    r0, r0
0006bbe8  ldrb    r6, [r4, #0xd]
0006bbea  movs    r0, r1
0006bbec  beq     #0x6bb8a
