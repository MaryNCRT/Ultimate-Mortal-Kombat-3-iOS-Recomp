========================================================================
t_drfp1  0x00071be8  380 bytes   mkdrone.c
========================================================================

00071be8  push    {r4, r5, r6, r7, lr}
00071bea  add     r7, sp, #0xc
00071bec  ldr.w   r2, [r0, #0xa4]
00071bf0  mov     r4, r0
00071bf2  ldr.w   r5, [r0, #0x108]
00071bf6  adds    r3, r2, #1
00071bf8  movw    r6, #0x706
00071bfc  ldr.w   r0, [r0, r3, lsl #3]
00071c00  cmp     r0, r6
00071c02  beq     #0x71cc2
00071c04  ble     #0x71c1a
00071c06  movw    r3, #0x709
00071c0a  cmp     r0, r3
00071c0c  beq     #0x71ca4
00071c0e  adds    r3, #0xd
00071c10  cmp     r0, r3
00071c12  beq     #0x71c8c
00071c14  mvn     r0, #2
00071c18  pop     {r4, r5, r6, r7, pc}
00071c1a  cbz     r0, #0x71c56
00071c1c  cmp.w   r0, #0x6f8
00071c20  bne     #0x71c14
00071c22  ldr.w   r3, [r4, #0xf8]
00071c26  mov     r0, r5
00071c28  lsls    r3, r3, #2
00071c2a  adds    r3, r3, r4
00071c2c  ldr.w   r3, [r3, #0x98]
00071c30  str     r3, [r5, #0x1c]
00071c32  bl      #0x594c8 ; -> strike_check_a0
00071c36  ldr     r0, [r5, #0x5c]
00071c38  cmp     r0, #0
00071c3a  bne     #0x71ce8
00071c3c  ldr     r2, [pc, #0x108]
00071c3e  add     r2, pc ; -> 0x00071b29  t_drfp3
00071c40  ldr.w   r3, [r4, #0xa4]
00071c44  lsls    r3, r3, #3
00071c46  adds    r3, r3, r4
00071c48  str     r2, [r3, #4]
00071c4a  ldr.w   r3, [r4, #0xa4]
00071c4e  adds    r3, #1
00071c50  str.w   r0, [r4, r3, lsl #3]
00071c54  b       #0x71c18
00071c56  movs    r3, #3
00071c58  str     r3, [r5, #0x1c]
00071c5a  ldr.w   r3, [r4, #0xa4]
00071c5e  mov.w   r2, #0x6f8
00071c62  adds    r3, #1
00071c64  str.w   r2, [r4, r3, lsl #3]
00071c68  ldr.w   r3, [r4, #0xa4]
00071c6c  adds    r2, r3, #1
00071c6e  ldr.w   r3, [pc, #0xdc]
00071c72  str.w   r2, [r4, #0xa4]
00071c76  add     r3, pc ; -> 0x000f37cc  t_mframew
00071c78  ldr     r1, [r3]
00071c7a  lsls    r3, r2, #3
00071c7c  adds    r3, r3, r4
00071c7e  str     r1, [r3, #4]
00071c80  ldr.w   r3, [r4, #0xa4]
00071c84  adds    r3, #1
00071c86  str.w   r0, [r4, r3, lsl #3]
00071c8a  b       #0x71c18
00071c8c  ldr     r1, [pc, #0xc0]
00071c8e  add     r1, pc ; -> 0x00071be9  t_drfp1
00071c90  lsls    r3, r2, #3
00071c92  adds    r3, r3, r4
00071c94  movs    r0, #0
00071c96  str     r1, [r3, #4]
00071c98  ldr.w   r3, [r4, #0xa4]
00071c9c  adds    r3, #1
00071c9e  str.w   r0, [r4, r3, lsl #3]
00071ca2  b       #0x71c18
00071ca4  ldr.w   r3, [r4, #0xf8]
00071ca8  mov     r0, r5
00071caa  lsls    r3, r3, #2
00071cac  adds    r3, r3, r4
00071cae  ldr.w   r3, [r3, #0x98]
00071cb2  str     r3, [r5, #0x1c]
00071cb4  bl      #0x594c8 ; -> strike_check_a0
00071cb8  ldr     r0, [r5, #0x5c]
00071cba  cbnz    r0, #0x71cf8
00071cbc  ldr     r2, [pc, #0x94]
00071cbe  add     r2, pc ; -> 0x00071b85  t_drfp2
00071cc0  b       #0x71c40
00071cc2  movs    r3, #3
00071cc4  str     r3, [r5, #0x1c]
00071cc6  ldr.w   r3, [r4, #0xa4]
00071cca  movw    r2, #0x709
00071cce  adds    r3, #1
00071cd0  str.w   r2, [r4, r3, lsl #3]
00071cd4  ldr.w   r3, [r4, #0xa4]
00071cd8  adds    r2, r3, #1
00071cda  ldr.w   r3, [pc, #0x7c]
00071cde  str.w   r2, [r4, #0xa4]
00071ce2  add     r3, pc ; -> 0x000f37cc  t_mframew
00071ce4  ldr     r1, [r3]
00071ce6  b       #0x71c90
00071ce8  ldr     r2, [r5]
00071cea  ldr     r3, [r2, #0x60]
00071cec  subs    r0, r3, #1
00071cee  str     r0, [r5, #0x1c]
00071cf0  cbnz    r0, #0x71d2a
00071cf2  ldr     r2, [pc, #0x68]
00071cf4  add     r2, pc ; -> 0x00071b29  t_drfp3
00071cf6  b       #0x71c40
00071cf8  ldr     r2, [r5]
00071cfa  ldr     r3, [r2, #0x60]
00071cfc  subs    r0, r3, #1
00071cfe  str     r0, [r5, #0x1c]
00071d00  cbnz    r0, #0x71d0a
00071d02  ldr.w   r2, [pc, #0x5c]
00071d06  add     r2, pc ; -> 0x00071b85  t_drfp2
00071d08  b       #0x71c40
00071d0a  str     r0, [r2, #0x60]
00071d0c  ldr     r3, [r5]
00071d0e  movw    r2, #0x716
00071d12  ldr     r3, [r3, #0x1c]
00071d14  str     r3, [r5, #0x1c]
00071d16  ldr.w   r3, [r4, #0xa4]
00071d1a  adds    r3, #1
00071d1c  str.w   r2, [r4, r3, lsl #3]
00071d20  ldr     r3, [r5, #0x1c]
00071d22  str.w   r3, [r4, #0xfc]
00071d26  ldr     r0, [r5, #0x1c]
00071d28  b       #0x71c18
00071d2a  str     r0, [r2, #0x60]
00071d2c  ldr     r3, [r5]
00071d2e  ldr     r3, [r3, #0x1c]
00071d30  str     r3, [r5, #0x1c]
00071d32  ldr.w   r3, [r4, #0xa4]
00071d36  adds    r3, #1
00071d38  str.w   r6, [r4, r3, lsl #3]
00071d3c  ldr     r3, [r5, #0x1c]
00071d3e  str.w   r3, [r4, #0xfc]
00071d42  ldr     r0, [r5, #0x1c]
00071d44  b       #0x71c18
00071d46  nop     
00071d48  mcr2    p15, #7, pc, c7, c15, #7
00071d4c  subs    r2, r2, r5
00071d4e  movs    r0, r1
