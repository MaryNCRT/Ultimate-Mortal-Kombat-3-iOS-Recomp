========================================================================
t_av_tele_explode  0x0006efc4  244 bytes   mkdrone.c
========================================================================

0006efc4  push    {r4, r5, r7, lr}
0006efc6  add     r7, sp, #8
0006efc8  ldr.w   r2, [r0, #0xa4]
0006efcc  mov     r4, r0
0006efce  ldr.w   r5, [r0, #0x108]
0006efd2  adds    r3, r2, #1
0006efd4  movw    r1, #0x120d
0006efd8  ldr.w   r0, [r0, r3, lsl #3]
0006efdc  cmp     r0, r1
0006efde  beq     #0x6f046
0006efe0  ble     #0x6eff6
0006efe2  movw    r3, #0x1211
0006efe6  cmp     r0, r3
0006efe8  beq     #0x6f050
0006efea  adds    r3, #3
0006efec  cmp     r0, r3
0006efee  beq     #0x6f02e
0006eff0  mvn     r0, #2
0006eff4  pop     {r4, r5, r7, pc}
0006eff6  cmp     r0, #0
0006eff8  bne     #0x6eff0
0006effa  movs    r3, #0x10
0006effc  str     r3, [r5, #0x44]
0006effe  ldr     r3, [pc, #0xa4]
0006f000  ldr     r2, [pc, #0xa4]
0006f002  add     r3, pc ; -> 0x0006f1d9  q_my_back_to_him
0006f004  str     r3, [r5, #0x48]
0006f006  ldr.w   r3, [r4, #0xa4]
0006f00a  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006f00c  adds    r3, #1
0006f00e  str.w   r1, [r4, r3, lsl #3]
0006f012  ldr.w   r3, [r4, #0xa4]
0006f016  adds    r3, #1
0006f018  str.w   r3, [r4, #0xa4]
0006f01c  lsls    r3, r3, #3
0006f01e  adds    r3, r3, r4
0006f020  str     r2, [r3, #4]
0006f022  ldr.w   r3, [r4, #0xa4]
0006f026  adds    r3, #1
0006f028  str.w   r0, [r4, r3, lsl #3]
0006f02c  b       #0x6eff4
0006f02e  ldr     r1, [pc, #0x7c]
0006f030  lsls    r3, r2, #3
0006f032  adds    r3, r3, r4
0006f034  add     r1, pc ; -> 0x0006770d  t_d_hi_kick
0006f036  str     r1, [r3, #4]
0006f038  ldr.w   r3, [r4, #0xa4]
0006f03c  movs    r0, #0
0006f03e  adds    r3, #1
0006f040  str.w   r0, [r4, r3, lsl #3]
0006f044  b       #0x6eff4
0006f046  mov     r0, r5
0006f048  bl      #0x551f0 ; -> am_i_facing_him
0006f04c  ldr     r0, [r5, #0x5c]
0006f04e  cbz     r0, #0x6f084
0006f050  movs    r3, #0x10
0006f052  str     r3, [r5, #0x44]
0006f054  ldr.w   r3, [r4, #0xa4]
0006f058  movw    r2, #0x1214
0006f05c  movs    r0, #0
0006f05e  adds    r3, #1
0006f060  str.w   r2, [r4, r3, lsl #3]
0006f064  ldr.w   r3, [r4, #0xa4]
0006f068  ldr     r2, [pc, #0x44]
0006f06a  adds    r3, #1
0006f06c  str.w   r3, [r4, #0xa4]
0006f070  lsls    r3, r3, #3
0006f072  adds    r3, r3, r4
0006f074  add     r2, pc ; -> 0x000720d5  t_d_stance_pause
0006f076  str     r2, [r3, #4]
0006f078  ldr.w   r3, [r4, #0xa4]
0006f07c  adds    r3, #1
0006f07e  str.w   r0, [r4, r3, lsl #3]
0006f082  b       #0x6eff4
0006f084  ldr.w   r3, [r4, #0xa4]
0006f088  movw    r2, #0x1211
0006f08c  adds    r3, #1
0006f08e  str.w   r2, [r4, r3, lsl #3]
0006f092  ldr.w   r2, [pc, #0x20]
0006f096  ldr.w   r3, [r4, #0xa4]
0006f09a  add     r2, pc ; -> 0x000716d9  t_d_turnaround_jsrp
0006f09c  adds    r3, #1
0006f09e  str.w   r3, [r4, #0xa4]
0006f0a2  b       #0x6f01c
0006f0a4  lsls    r3, r2, #7
0006f0a6  movs    r0, r0
0006f0a8  cmp     r7, #0xd7
0006f0aa  movs    r0, r0
0006f0ac  strh    r5, [r2, #0x36]
