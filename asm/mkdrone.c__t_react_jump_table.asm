========================================================================
t_react_jump_table  0x0006cbdc  208 bytes   mkdrone.c
========================================================================

0006cbdc  push    {r4, r5, r6, r7, lr}
0006cbde  add     r7, sp, #0xc
0006cbe0  ldr.w   r3, [r0, #0xa4]
0006cbe4  mov     r5, r0
0006cbe6  ldr.w   r4, [r0, #0x108]
0006cbea  adds    r3, #1
0006cbec  ldr.w   r6, [r0, r3, lsl #3]
0006cbf0  cbz     r6, #0x6cbf8
0006cbf2  mvn     r0, #2
0006cbf6  pop     {r4, r5, r6, r7, pc}
0006cbf8  ldr     r3, [r4, #0x38]
0006cbfa  cmp     r3, #3
0006cbfc  ble     #0x6cc02
0006cbfe  movs    r3, #3
0006cc00  str     r3, [r4, #0x38]
0006cc02  mov     r0, r4
0006cc04  bl      #0x6c8e0 ; -> count_q_repeats
0006cc08  ldr     r3, [pc, #0x8c]
0006cc0a  add     r3, pc ; -> 0x000f357c  G
0006cc0c  ldr     r1, [r3]
0006cc0e  ldr     r3, [pc, #0x8c]
0006cc10  ldrsh.w r2, [r1, #0x44c]
0006cc14  add     r3, pc ; -> 0x00171fd0  repeat_table
0006cc16  str     r2, [r4, #0x54]
0006cc18  ldrsh.w r3, [r3, r2, lsl #1]
0006cc1c  ldr     r2, [r4, #0x28]
0006cc1e  cmp     r3, r2
0006cc20  str     r3, [r4, #0x1c]
0006cc22  bgt     #0x6cc42
0006cc24  ldr     r3, [r4, #0x68]
0006cc26  ldr     r2, [r3, #4]
0006cc28  str     r2, [r4, #0x24]
0006cc2a  ldr.w   r3, [r5, #0xa4]
0006cc2e  mov     r0, r6
0006cc30  lsls    r3, r3, #3
0006cc32  adds    r3, r3, r5
0006cc34  str     r2, [r3, #4]
0006cc36  ldr.w   r3, [r5, #0xa4]
0006cc3a  adds    r3, #1
0006cc3c  str.w   r6, [r5, r3, lsl #3]
0006cc40  b       #0x6cbf6
0006cc42  ldr     r3, [pc, #0x5c]
0006cc44  ldrsh.w r2, [r1, #0x44c]
0006cc48  mov     r0, r4
0006cc4a  add     r3, pc ; -> 0x00171fbc  d_randpers
0006cc4c  str     r2, [r4, #0x54]
0006cc4e  ldrsh.w r3, [r3, r2, lsl #1]
0006cc52  str     r3, [r4, #0x1c]
0006cc54  bl      #0x586dc ; -> randper
0006cc58  ldr     r3, [r4, #0x5c]
0006cc5a  cbnz    r3, #0x6cc62
0006cc5c  ldr     r2, [pc, #0x44]
0006cc5e  add     r2, pc ; -> 0x0006c185  t_return_to_beware
0006cc60  b       #0x6cc2a
0006cc62  ldr     r3, [pc, #0x44]
0006cc64  mov     r0, r4
0006cc66  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006cc68  str     r3, [r4, #0x1c]
0006cc6a  bl      #0x6c9c8 ; -> ask_mr_diff
0006cc6e  ldr     r3, [r4, #0x5c]
0006cc70  ldr     r2, [r4, #0x68]
0006cc72  cbnz    r3, #0x6cc92
0006cc74  ldr     r3, [r2]
0006cc76  str     r3, [r4, #0x24]
0006cc78  ldr.w   r3, [r5, #0xa4]
0006cc7c  ldr     r0, [r4, #0x24]
0006cc7e  lsls    r3, r3, #3
0006cc80  adds    r3, r3, r5
0006cc82  str     r0, [r3, #4]
0006cc84  ldr.w   r3, [r5, #0xa4]
0006cc88  movs    r0, #0
0006cc8a  adds    r3, #1
0006cc8c  str.w   r0, [r5, r3, lsl #3]
0006cc90  b       #0x6cbf6
0006cc92  ldr     r3, [r2, #4]
0006cc94  str     r3, [r4, #0x24]
0006cc96  b       #0x6cc78
0006cc98  ldr     r6, [r5, #0x14]
0006cc9a  movs    r0, r1
0006cc9c  strh    r0, [r7, r6]
0006cc9e  movs    r0, r2
0006cca0  strh    r6, [r5, r5]
0006cca2  movs    r0, r2
0006cca4  bl      #0xffd90ca6
0006cca8  strh    r6, [r7, r4]
0006ccaa  movs    r0, r2
