========================================================================
t_nr_attack_sd  0x0006ca08  192 bytes   mkdrone.c
========================================================================

0006ca08  push    {r4, r5, r6, r7, lr}
0006ca0a  add     r7, sp, #0xc
0006ca0c  ldr.w   r3, [r0, #0xa4]
0006ca10  mov     r4, r0
0006ca12  ldr.w   r5, [r0, #0x108]
0006ca16  adds    r3, #1
0006ca18  ldr.w   r6, [r0, r3, lsl #3]
0006ca1c  cbnz    r6, #0x6ca70
0006ca1e  mov     r0, r5
0006ca20  bl      #0x6c9f4 ; -> should_i_promove
0006ca24  ldr     r0, [r5, #0x5c]
0006ca26  cmp     r0, #0
0006ca28  bne     #0x6ca76
0006ca2a  ldr.w   r3, [r4, #0xa4]
0006ca2e  cmp     r3, #0
0006ca30  ble     #0x6caa4
0006ca32  subs    r3, #1
0006ca34  str.w   r3, [r4, #0xa4]
0006ca38  ldr.w   r1, [r4, #0xa4]
0006ca3c  adds    r3, r1, #1
0006ca3e  lsls    r2, r3, #3
0006ca40  adds    r2, r2, r4
0006ca42  ldr     r0, [r2, #4]
0006ca44  adds    r2, r3, #1
0006ca46  ldr.w   r2, [r4, r2, lsl #3]
0006ca4a  str.w   r2, [r4, r3, lsl #3]
0006ca4e  lsls    r3, r1, #3
0006ca50  adds    r3, r3, r4
0006ca52  ldr     r2, [pc, #0x68]
0006ca54  str     r0, [r3, #4]
0006ca56  ldr.w   r3, [r4, #0xa4]
0006ca5a  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006ca5c  movs    r0, #0
0006ca5e  lsls    r3, r3, #3
0006ca60  adds    r3, r3, r4
0006ca62  str     r2, [r3, #4]
0006ca64  ldr.w   r3, [r4, #0xa4]
0006ca68  adds    r3, #1
0006ca6a  str.w   r0, [r4, r3, lsl #3]
0006ca6e  b       #0x6ca74
0006ca70  mvn     r0, #2
0006ca74  pop     {r4, r5, r6, r7, pc}
0006ca76  ldr.w   r3, [r4, #0xa4]
0006ca7a  cmp     r3, #0
0006ca7c  ble     #0x6ca88
0006ca7e  subs    r3, #1
0006ca80  mov     r0, r6
0006ca82  str.w   r3, [r4, #0xa4]
0006ca86  b       #0x6ca74
0006ca88  ldr.w   r2, [pc, #0x34]
0006ca8c  lsls    r3, r3, #3
0006ca8e  adds    r3, r3, r4
0006ca90  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006ca92  mov     r0, r6
0006ca94  ldr     r2, [r2]
0006ca96  str     r2, [r3, #4]
0006ca98  ldr.w   r3, [r4, #0xa4]
0006ca9c  adds    r3, #1
0006ca9e  str.w   r6, [r4, r3, lsl #3]
0006caa2  b       #0x6ca74
0006caa4  ldr     r2, [pc, #0x1c]
0006caa6  lsls    r3, r3, #3
0006caa8  adds    r3, r3, r4
0006caaa  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006caac  ldr     r2, [r2]
0006caae  str     r2, [r3, #4]
0006cab0  ldr.w   r3, [r4, #0xa4]
0006cab4  adds    r3, #1
0006cab6  str.w   r6, [r4, r3, lsl #3]
0006caba  b       #0x6ca38
0006cabc  bl      #0xfff94abe
0006cac0  ldr     r4, [r6, #0x44]
0006cac2  movs    r0, r1
0006cac4  ldr     r2, [r3, #0x44]
0006cac6  movs    r0, r1
