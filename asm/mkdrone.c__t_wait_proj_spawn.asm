========================================================================
t_wait_proj_spawn  0x000700dc  156 bytes   mkdrone.c
========================================================================

000700dc  push    {r4, r5, r7, lr}
000700de  add     r7, sp, #8
000700e0  ldr.w   r3, [r0, #0xa4]
000700e4  mov     r4, r0
000700e6  ldr.w   r5, [r0, #0x108]
000700ea  adds    r3, #1
000700ec  ldr.w   r3, [r0, r3, lsl #3]
000700f0  cbnz    r3, #0x7010c
000700f2  movs    r3, #0x20
000700f4  str     r3, [r5, #0x44]
000700f6  ldr.w   r3, [r4, #0xa4]
000700fa  movw    r2, #0xf9b
000700fe  movs    r0, #1
00070100  adds    r3, #1
00070102  str.w   r2, [r4, r3, lsl #3]
00070106  str.w   r0, [r4, #0xfc]
0007010a  pop     {r4, r5, r7, pc}
0007010c  movw    r2, #0xf9b
00070110  cmp     r3, r2
00070112  it      ne
00070114  mvnne   r0, #2
00070118  bne     #0x7010a
0007011a  ldr     r3, [r5, #0x44]
0007011c  subs    r3, #1
0007011e  str     r3, [r5, #0x44]
00070120  cbnz    r3, #0x70134
00070122  ldr.w   r3, [r4, #0xa4]
00070126  cmp     r3, #0
00070128  ble     #0x7015a
0007012a  subs    r3, #1
0007012c  movs    r0, #0
0007012e  str.w   r3, [r4, #0xa4]
00070132  b       #0x7010a
00070134  mov     r0, r5
00070136  bl      #0x6ff18 ; -> get_his_proj_proc
0007013a  ldr     r3, [r5, #0x1c]
0007013c  cmp     r3, #0
0007013e  bne     #0x70122
00070140  mov     r0, r5
00070142  bl      #0x54e38 ; -> get_his_action
00070146  ldr     r0, [r5, #0x20]
00070148  movw    r3, #0x604
0007014c  cmp     r0, r3
0007014e  beq     #0x70122
00070150  cmp     r0, #0
00070152  beq     #0x70122
00070154  cmp     r0, #0xff
00070156  ble     #0x700f6
00070158  b       #0x70122
0007015a  ldr     r2, [pc, #0x18]
0007015c  lsls    r3, r3, #3
0007015e  adds    r3, r3, r4
00070160  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00070162  movs    r0, #0
00070164  ldr     r2, [r2]
00070166  str     r2, [r3, #4]
00070168  ldr.w   r3, [r4, #0xa4]
0007016c  adds    r3, #1
0007016e  str.w   r0, [r4, r3, lsl #3]
00070172  b       #0x7010a
00070174  adds    r5, #0xa4
00070176  movs    r0, r1
