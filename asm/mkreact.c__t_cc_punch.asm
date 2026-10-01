========================================================================
t_cc_punch  0x00041bec  136 bytes   mkreact.c
========================================================================

00041bec  ldr.w   r2, [r0, #0xa4]
00041bf0  ldr.w   ip, [r0, #0x108]
00041bf4  adds    r3, r2, #1
00041bf6  ldr.w   r1, [r0, r3, lsl #3]
00041bfa  cbnz    r1, #0x41c32
00041bfc  movs    r3, #3
00041bfe  str.w   r3, [ip, #0x20]
00041c02  ldr.w   r3, [r0, #0xa4]
00041c06  movw    r2, #0x137c
00041c0a  adds    r3, #1
00041c0c  str.w   r2, [r0, r3, lsl #3]
00041c10  ldr.w   r3, [r0, #0xa4]
00041c14  ldr     r2, [pc, #0x54]
00041c16  adds    r3, #1
00041c18  str.w   r3, [r0, #0xa4]
00041c1c  lsls    r3, r3, #3
00041c1e  adds    r3, r3, r0
00041c20  add     r2, pc ; -> 0x00041c75  t_avoid_corner_trap_b
00041c22  str     r2, [r3, #4]
00041c24  ldr.w   r3, [r0, #0xa4]
00041c28  adds    r3, #1
00041c2a  str.w   r1, [r0, r3, lsl #3]
00041c2e  mov     r0, r1
00041c30  bx      lr
00041c32  movw    r3, #0x137c
00041c36  cmp     r1, r3
00041c38  it      ne
00041c3a  mvnne   r0, #2
00041c3e  bne     #0x41c30
00041c40  cmp     r2, #0
00041c42  ble     #0x41c4e
00041c44  subs    r3, r2, #1
00041c46  str.w   r3, [r0, #0xa4]
00041c4a  movs    r0, #0
00041c4c  b       #0x41c30
00041c4e  ldr.w   r3, [pc, #0x20]
00041c52  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00041c54  ldr     r1, [r3]
00041c56  lsls    r3, r2, #3
00041c58  adds    r3, r3, r0
00041c5a  str     r1, [r3, #4]
00041c5c  ldr.w   r3, [r0, #0xa4]
00041c60  movs    r1, #0
00041c62  adds    r3, #1
00041c64  str.w   r1, [r0, r3, lsl #3]
00041c68  mov     r0, r1
00041c6a  b       #0x41c30
00041c6c  lsls    r1, r2, #1
00041c6e  movs    r0, r0
00041c70  subs    r2, r6, r2
00041c72  movs    r3, r1
