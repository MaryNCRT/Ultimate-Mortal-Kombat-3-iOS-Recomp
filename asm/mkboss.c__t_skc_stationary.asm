========================================================================
t_skc_stationary  0x000abd88  104 bytes   mkboss.c
========================================================================

000abd88  push    {r4, r5, r6, r7, lr}
000abd8a  add     r7, sp, #0xc
000abd8c  ldr.w   r3, [r0, #0xa4]
000abd90  mov     r4, r0
000abd92  ldr.w   r5, [r0, #0x108]
000abd96  adds    r3, #1
000abd98  ldr.w   r6, [r0, r3, lsl #3]
000abd9c  cbnz    r6, #0xabdc6
000abd9e  mov     r0, r5
000abda0  bl      #0xabcf0 ; -> sk_randper
000abda4  ldr     r3, [r5, #0x5c]
000abda6  cbnz    r3, #0xabdcc
000abda8  ldr     r3, [pc, #0x38]
000abdaa  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abdac  ldr     r2, [r3]
000abdae  ldr.w   r3, [r4, #0xa4]
000abdb2  mov     r0, r6
000abdb4  lsls    r3, r3, #3
000abdb6  adds    r3, r3, r4
000abdb8  str     r2, [r3, #4]
000abdba  ldr.w   r3, [r4, #0xa4]
000abdbe  adds    r3, #1
000abdc0  str.w   r6, [r4, r3, lsl #3]
000abdc4  b       #0xabdca
000abdc6  mvn     r0, #2
000abdca  pop     {r4, r5, r6, r7, pc}
000abdcc  mov     r0, r5
000abdce  bl      #0x2f3a0 ; -> get_x_dist
000abdd2  ldr     r0, [r5, #0x28]
000abdd4  cmp     r0, #0x70
000abdd6  ble     #0xabdde
000abdd8  ldr     r2, [pc, #0xc]
000abdda  add     r2, pc ; -> 0x000a858d  t_b_return_to_beware_4get
000abddc  b       #0xabdae
000abdde  ldr     r3, [pc, #0xc]
000abde0  add     r3, pc ; -> 0x000f3418  t_d_block
000abde2  b       #0xabdac
000abde4  strb    r2, [r7, #0x19]
000abde6  movs    r4, r0
000abde8  stm     r7!, {r0, r1, r2, r3, r5, r7}
000abdea  vqshlu.s32 d23, d20, #0x1f
000abdee  movs    r4, r0
