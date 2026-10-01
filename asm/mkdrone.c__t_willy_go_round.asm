========================================================================
t_willy_go_round  0x0006b008  184 bytes   mkdrone.c
========================================================================

0006b008  push    {lr}
0006b00a  ldr.w   ip, [r0, #0xa4]
0006b00e  movw    lr, #0x1112
0006b012  ldr.w   r1, [r0, #0x108]
0006b016  add.w   r3, ip, #1
0006b01a  ldr.w   r2, [r0, r3, lsl #3]
0006b01e  cmp     r2, lr
0006b020  beq     #0x6b082
0006b022  movw    r3, #0x1116
0006b026  cmp     r2, r3
0006b028  beq     #0x6b066
0006b02a  cbz     r2, #0x6b032
0006b02c  mvn     r0, #2
0006b030  pop     {pc}
0006b032  movs    r3, #0x30
0006b034  str     r3, [r1, #0x44]
0006b036  adds    r3, #0x10
0006b038  str     r3, [r1, #0x48]
0006b03a  ldr.w   r3, [r0, #0xa4]
0006b03e  ldr     r1, [pc, #0x70]
0006b040  adds    r3, #1
0006b042  add     r1, pc ; -> 0x00072b95  t_d_stalk_a11
0006b044  str.w   lr, [r0, r3, lsl #3]
0006b048  ldr.w   r3, [r0, #0xa4]
0006b04c  adds    r3, #1
0006b04e  str.w   r3, [r0, #0xa4]
0006b052  lsls    r3, r3, #3
0006b054  adds    r3, r3, r0
0006b056  str     r1, [r3, #4]
0006b058  ldr.w   r3, [r0, #0xa4]
0006b05c  adds    r3, #1
0006b05e  str.w   r2, [r0, r3, lsl #3]
0006b062  mov     r0, r2
0006b064  b       #0x6b030
0006b066  ldr     r2, [pc, #0x4c]
0006b068  lsl.w   r3, ip, #3
0006b06c  add     r2, pc ; -> 0x000676a1  t_d_uppercut
0006b06e  adds    r3, r3, r0
0006b070  str     r2, [r3, #4]
0006b072  ldr.w   r3, [r0, #0xa4]
0006b076  movs    r2, #0
0006b078  adds    r3, #1
0006b07a  str.w   r2, [r0, r3, lsl #3]
0006b07e  mov     r0, r2
0006b080  b       #0x6b030
0006b082  movs    r3, #0x30
0006b084  str     r3, [r1, #0x44]
0006b086  ldr.w   r3, [pc, #0x30]
0006b08a  movw    r2, #0x1116
0006b08e  add     r3, pc ; -> 0x0006ef05  q_willy_uppercut
0006b090  str     r3, [r1, #0x48]
0006b092  ldr.w   r3, [r0, #0xa4]
0006b096  adds    r3, #1
0006b098  str.w   r2, [r0, r3, lsl #3]
0006b09c  ldr.w   r3, [r0, #0xa4]
0006b0a0  ldr.w   r2, [pc, #0x18]
0006b0a4  adds    r3, #1
0006b0a6  add     r2, pc ; -> 0x00071fe5  t_stance_wait_yes
0006b0a8  str.w   r3, [r0, #0xa4]
0006b0ac  lsls    r3, r3, #3
0006b0ae  b       #0x6b06e
0006b0b0  ldrb    r7, [r1, #0xd]
0006b0b2  movs    r0, r0
0006b0b4  stm     r6!, {r0, r4, r5}
