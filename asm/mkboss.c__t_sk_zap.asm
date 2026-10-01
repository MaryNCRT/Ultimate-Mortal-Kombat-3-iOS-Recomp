========================================================================
t_sk_zap  0x000a9018  132 bytes   mkboss.c
========================================================================

000a9018  push    {r4, r5, r6, r7, lr}
000a901a  add     r7, sp, #0xc
000a901c  ldr.w   r2, [r0, #0xa4]
000a9020  mov     r4, r0
000a9022  ldr.w   r5, [r0, #0x108]
000a9026  adds    r3, r2, #1
000a9028  ldr.w   r6, [r0, r3, lsl #3]
000a902c  cbnz    r6, #0xa906c
000a902e  mov     r0, r5
000a9030  str     r6, [r5, #0x1c]
000a9032  bl      #0x580a4 ; -> group_sound
000a9036  movs    r3, #0x1d
000a9038  str     r3, [r5, #0x1c]
000a903a  ldr.w   r3, [r4, #0xa4]
000a903e  movw    r2, #0x2e1
000a9042  mov     r0, r6
000a9044  adds    r3, #1
000a9046  str.w   r2, [r4, r3, lsl #3]
000a904a  ldr.w   r3, [r4, #0xa4]
000a904e  adds    r2, r3, #1
000a9050  ldr     r3, [pc, #0x40]
000a9052  str.w   r2, [r4, #0xa4]
000a9056  add     r3, pc ; -> 0x000f314c  t_do_zap
000a9058  ldr     r1, [r3]
000a905a  lsls    r3, r2, #3
000a905c  adds    r3, r3, r4
000a905e  str     r1, [r3, #4]
000a9060  ldr.w   r3, [r4, #0xa4]
000a9064  adds    r3, #1
000a9066  str.w   r6, [r4, r3, lsl #3]
000a906a  pop     {r4, r5, r6, r7, pc}
000a906c  movw    r3, #0x2e1
000a9070  cmp     r6, r3
000a9072  it      ne
000a9074  mvnne   r0, #2
000a9078  bne     #0xa906a
000a907a  ldr     r3, [pc, #0x1c]
000a907c  movs    r0, #0
000a907e  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a9080  ldr     r1, [r3]
000a9082  lsls    r3, r2, #3
000a9084  adds    r3, r3, r4
000a9086  str     r1, [r3, #4]
000a9088  ldr.w   r3, [r4, #0xa4]
000a908c  adds    r3, #1
000a908e  str.w   r0, [r4, r3, lsl #3]
000a9092  b       #0xa906a
000a9094  adr     r0, #0x3c8
000a9096  movs    r4, r0
000a9098  adr     r6, #0x218
000a909a  movs    r4, r0
