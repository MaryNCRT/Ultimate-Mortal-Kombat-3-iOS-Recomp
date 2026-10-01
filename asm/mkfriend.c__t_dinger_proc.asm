========================================================================
t_dinger_proc  0x000a5d9c  220 bytes   mkfriend.c
========================================================================

000a5d9c  push    {r4, r5, r6, r7, lr}
000a5d9e  add     r7, sp, #0xc
000a5da0  str     r8, [sp, #-0x4]!
000a5da4  ldr.w   r2, [r0, #0xa4]
000a5da8  movw    r8, #0x404
000a5dac  mov     r4, r0
000a5dae  adds    r3, r2, #1
000a5db0  ldr.w   r6, [r0, #0x108]
000a5db4  ldr.w   r5, [r0, r3, lsl #3]
000a5db8  cmp     r5, r8
000a5dba  beq     #0xa5e36
000a5dbc  ble     #0xa5dd6
000a5dbe  movw    r3, #0x405
000a5dc2  cmp     r5, r3
000a5dc4  beq     #0xa5e46
000a5dc6  adds    r3, #2
000a5dc8  cmp     r5, r3
000a5dca  beq     #0xa5e1c
000a5dcc  mvn     r0, #2
000a5dd0  ldr     r8, [sp], #4
000a5dd4  pop     {r4, r5, r6, r7, pc}
000a5dd6  cmp     r5, #0
000a5dd8  bne     #0xa5dcc
000a5dda  mov     r0, r6
000a5ddc  movs    r3, #0x21
000a5dde  str     r3, [r6, #0x1c]
000a5de0  bl      #0x57be4 ; -> ochar_sound
000a5de4  ldr     r3, [pc, #0x80]
000a5de6  mov     r0, r5
000a5de8  add     r3, pc ; -> 0x00177c44  a_dinger
000a5dea  str     r3, [r6, #0x40]
000a5dec  movs    r3, #4
000a5dee  str     r3, [r6, #0x1c]
000a5df0  ldr.w   r3, [r4, #0xa4]
000a5df4  adds    r3, #1
000a5df6  str.w   r8, [r4, r3, lsl #3]
000a5dfa  ldr.w   r3, [r4, #0xa4]
000a5dfe  adds    r2, r3, #1
000a5e00  ldr     r3, [pc, #0x68]
000a5e02  str.w   r2, [r4, #0xa4]
000a5e06  add     r3, pc ; -> 0x000f37cc  t_mframew
000a5e08  ldr     r1, [r3]
000a5e0a  lsls    r3, r2, #3
000a5e0c  adds    r3, r3, r4
000a5e0e  str     r1, [r3, #4]
000a5e10  ldr.w   r3, [r4, #0xa4]
000a5e14  adds    r3, #1
000a5e16  str.w   r5, [r4, r3, lsl #3]
000a5e1a  b       #0xa5dd0
000a5e1c  ldr     r3, [pc, #0x50]
000a5e1e  add     r3, pc ; -> 0x000f3724  t_wait_forever
000a5e20  ldr     r1, [r3]
000a5e22  lsls    r3, r2, #3
000a5e24  adds    r3, r3, r4
000a5e26  movs    r0, #0
000a5e28  str     r1, [r3, #4]
000a5e2a  ldr.w   r3, [r4, #0xa4]
000a5e2e  adds    r3, #1
000a5e30  str.w   r0, [r4, r3, lsl #3]
000a5e34  b       #0xa5dd0
000a5e36  movw    r2, #0x405
000a5e3a  str.w   r2, [r0, r3, lsl #3]
000a5e3e  movs    r0, #0x40
000a5e40  str.w   r0, [r4, #0xfc]
000a5e44  b       #0xa5dd0
000a5e46  movs    r3, #4
000a5e48  str     r3, [r6, #0x1c]
000a5e4a  ldr.w   r3, [r0, #0xa4]
000a5e4e  movw    r2, #0x407
000a5e52  adds    r3, #1
000a5e54  str.w   r2, [r0, r3, lsl #3]
000a5e58  ldr.w   r3, [r0, #0xa4]
000a5e5c  adds    r2, r3, #1
000a5e5e  ldr     r3, [pc, #0x14]
000a5e60  str.w   r2, [r0, #0xa4]
000a5e64  add     r3, pc ; -> 0x000f37cc  t_mframew
000a5e66  b       #0xa5e20
000a5e68  subs    r0, r3, #1
000a5e6a  movs    r5, r1
000a5e6c  bls     #0xa5df4
000a5e6e  movs    r4, r0
000a5e70  bls     #0xa5e78 ; -> t_f_sz
000a5e72  movs    r4, r0
000a5e74  bls     #0xa5f40
000a5e76  movs    r4, r0
