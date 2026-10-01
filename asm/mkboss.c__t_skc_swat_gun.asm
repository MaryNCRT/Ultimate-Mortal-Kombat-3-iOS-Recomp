========================================================================
t_skc_swat_gun  0x000abd20  104 bytes   mkboss.c
========================================================================

000abd20  push    {r4, r5, r6, r7, lr}
000abd22  add     r7, sp, #0xc
000abd24  ldr.w   r3, [r0, #0xa4]
000abd28  mov     r4, r0
000abd2a  ldr.w   r5, [r0, #0x108]
000abd2e  adds    r3, #1
000abd30  ldr.w   r6, [r0, r3, lsl #3]
000abd34  cbnz    r6, #0xabd5e
000abd36  mov     r0, r5
000abd38  bl      #0xabcf0 ; -> sk_randper
000abd3c  ldr     r3, [r5, #0x5c]
000abd3e  cbnz    r3, #0xabd64
000abd40  ldr     r3, [pc, #0x38]
000abd42  add     r3, pc ; -> 0x000f3428  t_return_to_beware
000abd44  ldr     r2, [r3]
000abd46  ldr.w   r3, [r4, #0xa4]
000abd4a  mov     r0, r6
000abd4c  lsls    r3, r3, #3
000abd4e  adds    r3, r3, r4
000abd50  str     r2, [r3, #4]
000abd52  ldr.w   r3, [r4, #0xa4]
000abd56  adds    r3, #1
000abd58  str.w   r6, [r4, r3, lsl #3]
000abd5c  b       #0xabd62
000abd5e  mvn     r0, #2
000abd62  pop     {r4, r5, r6, r7, pc}
000abd64  mov     r0, r5
000abd66  bl      #0x2f3a0 ; -> get_x_dist
000abd6a  ldr     r0, [r5, #0x28]
000abd6c  cmp     r0, #0xd0
000abd6e  ble     #0xabd76
000abd70  ldr     r2, [pc, #0xc]
000abd72  add     r2, pc ; -> 0x000a9019  t_sk_zap
000abd74  b       #0xabd46
000abd76  ldr     r3, [pc, #0xc]
000abd78  add     r3, pc ; -> 0x000f3418  t_d_block
000abd7a  b       #0xabd44
000abd7c  strb    r2, [r4, #0x1b]
000abd7e  movs    r4, r0
000abd80  bhs     #0xabcca
000abd82  vqshlu.s64 d23, d12, #0x3f
000abd86  movs    r4, r0
