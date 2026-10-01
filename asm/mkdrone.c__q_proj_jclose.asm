========================================================================
q_proj_jclose  0x0006ff80  84 bytes   mkdrone.c
========================================================================

0006ff80  push    {r4, r7, lr}
0006ff82  add     r7, sp, #4
0006ff84  mov     r4, r0
0006ff86  bl      #0x6ff34 ; -> his_proj_front_x
0006ff8a  movs    r3, #0xc0
0006ff8c  str     r3, [r4, #0x30]
0006ff8e  ldr     r3, [r4]
0006ff90  ldr     r3, [r3, #4]
0006ff92  ldr     r3, [r3, #0x24]
0006ff94  cmp     r3, #0xe
0006ff96  ite     ne
0006ff98  movne   r2, #0
0006ff9a  moveq   r2, #1
0006ff9c  cmp     r3, #0x12
0006ff9e  it      eq
0006ffa0  orreq   r2, r2, #1
0006ffa4  str     r3, [r4, #0x24]
0006ffa6  cbnz    r2, #0x6ffb0
0006ffa8  cmp     r3, #0x16
0006ffaa  beq     #0x6ffb0
0006ffac  movs    r3, #0x90
0006ffae  str     r3, [r4, #0x30]
0006ffb0  ldr     r3, [r4, #8]
0006ffb2  ldr     r2, [r4, #0x28]
0006ffb4  ldrsh.w r3, [r3, #0xe]
0006ffb8  str     r3, [r4, #0x24]
0006ffba  subs    r3, r3, r2
0006ffbc  ldr     r2, [r4, #0x30]
0006ffbe  str     r3, [r4, #0x28]
0006ffc0  cmp     r3, r2
0006ffc2  ble     #0x6ffcc
0006ffc4  mov     r0, r4
0006ffc6  bl      #0x67514 ; -> vq_no
0006ffca  pop     {r4, r7, pc}
0006ffcc  mov     r0, r4
0006ffce  bl      #0x6751c ; -> vq_yes
0006ffd2  b       #0x6ffca
