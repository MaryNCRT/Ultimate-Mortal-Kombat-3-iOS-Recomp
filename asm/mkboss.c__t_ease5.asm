========================================================================
t_ease5  0x000a9810  136 bytes   mkboss.c
========================================================================

000a9810  push    {r4, r5, r6, r7, lr}
000a9812  add     r7, sp, #0xc
000a9814  ldr.w   r2, [r0, #0xa4]
000a9818  mov     r4, r0
000a981a  ldr.w   r5, [r0, #0x108]
000a981e  adds    r3, r2, #1
000a9820  ldr.w   r6, [r0, r3, lsl #3]
000a9824  cbnz    r6, #0xa9868
000a9826  mov     r0, r5
000a9828  movs    r3, #0x10
000a982a  str     r3, [r5, #0x1c]
000a982c  str     r3, [r5, #0x20]
000a982e  bl      #0x58764 ; -> randu_minimum
000a9832  ldr     r3, [r5, #0x1c]
000a9834  movw    r2, #0x473
000a9838  mov     r0, r6
000a983a  str     r3, [r5, #0x44]
000a983c  ldr.w   r3, [r4, #0xa4]
000a9840  adds    r3, #1
000a9842  str.w   r2, [r4, r3, lsl #3]
000a9846  ldr.w   r3, [r4, #0xa4]
000a984a  adds    r2, r3, #1
000a984c  ldr     r3, [pc, #0x40]
000a984e  str.w   r2, [r4, #0xa4]
000a9852  add     r3, pc ; -> 0x000f33fc  t_d_stance_pause
000a9854  ldr     r1, [r3]
000a9856  lsls    r3, r2, #3
000a9858  adds    r3, r3, r4
000a985a  str     r1, [r3, #4]
000a985c  ldr.w   r3, [r4, #0xa4]
000a9860  adds    r3, #1
000a9862  str.w   r6, [r4, r3, lsl #3]
000a9866  pop     {r4, r5, r6, r7, pc}
000a9868  movw    r3, #0x473
000a986c  cmp     r6, r3
000a986e  it      ne
000a9870  mvnne   r0, #2
000a9874  bne     #0xa9866
000a9876  ldr     r3, [pc, #0x1c]
000a9878  movs    r0, #0
000a987a  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000a987c  ldr     r1, [r3]
000a987e  lsls    r3, r2, #3
000a9880  adds    r3, r3, r4
000a9882  str     r1, [r3, #4]
000a9884  ldr.w   r3, [r4, #0xa4]
000a9888  adds    r3, #1
000a988a  str.w   r0, [r4, r3, lsl #3]
000a988e  b       #0xa9866
000a9890  ldr     r3, [sp, #0x298]
000a9892  movs    r4, r0
000a9894  ldr     r6, [sp, #0x228]
000a9896  movs    r4, r0
