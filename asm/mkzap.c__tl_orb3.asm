========================================================================
tl_orb3  0x00075c78  244 bytes   mkzap.c
========================================================================

00075c78  push    {r4, r5, r7, lr}
00075c7a  add     r7, sp, #8
00075c7c  ldr.w   r2, [r0, #0xa4]
00075c80  mov     r4, r0
00075c82  ldr.w   r5, [r0, #0x108]
00075c86  adds    r3, r2, #1
00075c88  movw    r1, #0x505
00075c8c  ldr.w   r0, [r0, r3, lsl #3]
00075c90  cmp     r0, r1
00075c92  beq     #0x75cec
00075c94  ble     #0x75caa
00075c96  movw    r3, #0x50f
00075c9a  cmp     r0, r3
00075c9c  beq     #0x75d1a
00075c9e  adds    r3, #3
00075ca0  cmp     r0, r3
00075ca2  beq     #0x75cde
00075ca4  mvn     r0, #2
00075ca8  pop     {r4, r5, r7, pc}
00075caa  cmp     r0, #0
00075cac  bne     #0x75ca4
00075cae  ldr     r3, [pc, #0xa8]
00075cb0  str     r3, [r5, #0x40]
00075cb2  ldr.w   r3, [r4, #0xa4]
00075cb6  adds    r3, #1
00075cb8  str.w   r1, [r4, r3, lsl #3]
00075cbc  ldr.w   r3, [r4, #0xa4]
00075cc0  adds    r2, r3, #1
00075cc2  ldr     r3, [pc, #0x98]
00075cc4  str.w   r2, [r4, #0xa4]
00075cc8  add     r3, pc ; -> 0x000f36c0  t_animate2_a9
00075cca  ldr     r1, [r3]
00075ccc  lsls    r3, r2, #3
00075cce  adds    r3, r3, r4
00075cd0  str     r1, [r3, #4]
00075cd2  ldr.w   r3, [r4, #0xa4]
00075cd6  adds    r3, #1
00075cd8  str.w   r0, [r4, r3, lsl #3]
00075cdc  b       #0x75ca8
00075cde  cmp     r2, #0
00075ce0  ble     #0x75d52
00075ce2  subs    r3, r2, #1
00075ce4  movs    r0, #0
00075ce6  str.w   r3, [r4, #0xa4]
00075cea  b       #0x75ca8
00075cec  ldr     r3, [pc, #0x70]
00075cee  mov     r0, r5
00075cf0  add     r3, pc ; -> 0x0007ba11  t_orb_proc
00075cf2  str     r3, [r5, #0x38]
00075cf4  bl      #0x75964 ; -> create_proj_proc
00075cf8  cbz     r0, #0x75cfe
00075cfa  ldr     r3, [r5, #0x48]
00075cfc  str     r3, [r0, #0x44]
00075cfe  mov     r0, r5
00075d00  bl      #0x7568c ; -> detach_proj
00075d04  ldr.w   r3, [r4, #0xa4]
00075d08  movs    r0, #8
00075d0a  movw    r2, #0x50f
00075d0e  adds    r3, #1
00075d10  str.w   r2, [r4, r3, lsl #3]
00075d14  str.w   r0, [r4, #0xfc]
00075d18  b       #0x75ca8
00075d1a  movs    r3, #4
00075d1c  str     r3, [r5, #0x1c]
00075d1e  ldr.w   r3, [r4, #0xa4]
00075d22  movw    r2, #0x512
00075d26  adds    r3, #1
00075d28  str.w   r2, [r4, r3, lsl #3]
00075d2c  ldr.w   r3, [r4, #0xa4]
00075d30  adds    r2, r3, #1
00075d32  ldr.w   r3, [pc, #0x30]
00075d36  str.w   r2, [r4, #0xa4]
00075d3a  add     r3, pc ; -> 0x000f37cc  t_mframew
00075d3c  ldr     r1, [r3]
00075d3e  lsls    r3, r2, #3
00075d40  adds    r3, r3, r4
00075d42  movs    r0, #0
00075d44  str     r1, [r3, #4]
00075d46  ldr.w   r3, [r4, #0xa4]
00075d4a  adds    r3, #1
00075d4c  str.w   r0, [r4, r3, lsl #3]
00075d50  b       #0x75ca8
00075d52  ldr     r3, [pc, #0x14]
00075d54  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00075d56  b       #0x75d3c
00075d58  movs    r5, r0
00075d5a  movs    r3, r0
00075d5c  bls     #0x75d48
00075d5e  movs    r7, r0
00075d60  ldrb    r5, [r3, r4]
00075d62  movs    r0, r0
00075d64  bge     #0x75c84
00075d66  movs    r7, r0
00075d68  bls     #0x75ccc
00075d6a  movs    r7, r0
