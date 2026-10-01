========================================================================
t_hangout_check  0x00067950  224 bytes   mkdrone.c
========================================================================

00067950  ldr.w   r2, [r0, #0xa4]
00067954  ldr.w   ip, [r0, #0x108]
00067958  adds    r3, r2, #1
0006795a  ldr.w   r1, [r0, r3, lsl #3]
0006795e  cbnz    r1, #0x67984
00067960  ldr     r3, [pc, #0xb8]
00067962  add     r3, pc ; -> 0x000f357c  G
00067964  ldr     r2, [r3]
00067966  ldrsh.w r3, [r2, #0x44c]
0006796a  cmp     r3, #4
0006796c  str.w   r3, [ip, #0x1c]
00067970  ble     #0x679a0
00067972  ldr.w   r3, [r0, #0xa4]
00067976  cmp     r3, #0
00067978  ble     #0x67a10
0006797a  subs    r3, #1
0006797c  str.w   r3, [r0, #0xa4]
00067980  mov     r0, r1
00067982  bx      lr
00067984  movw    r3, #0x2d2
00067988  cmp     r1, r3
0006798a  it      ne
0006798c  mvnne   r0, #2
00067990  bne     #0x67982
00067992  cmp     r2, #0
00067994  ble     #0x679b0
00067996  subs    r3, r2, #1
00067998  str.w   r3, [r0, #0xa4]
0006799c  movs    r0, #0
0006799e  b       #0x67982
000679a0  ldr.w   r3, [r2, #0x448]
000679a4  str.w   r3, [ip, #0x1c]
000679a8  cbnz    r3, #0x679ce
000679aa  ldr.w   r2, [r0, #0xa4]
000679ae  b       #0x67992
000679b0  ldr.w   r3, [pc, #0x6c]
000679b4  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
000679b6  ldr     r1, [r3]
000679b8  lsls    r3, r2, #3
000679ba  adds    r3, r3, r0
000679bc  str     r1, [r3, #4]
000679be  ldr.w   r3, [r0, #0xa4]
000679c2  movs    r1, #0
000679c4  adds    r3, #1
000679c6  str.w   r1, [r0, r3, lsl #3]
000679ca  mov     r0, r1
000679cc  b       #0x67982
000679ce  movs    r3, #0xc8
000679d0  str.w   r3, [ip, #0x64]
000679d4  ldr.w   r3, [pc, #0x4c]
000679d8  movw    r2, #0x2d2
000679dc  add     r3, pc ; -> 0x00072225  t_d_hang_out
000679de  str.w   r3, [ip, #0x68]
000679e2  ldr.w   r3, [r0, #0xa4]
000679e6  adds    r3, #1
000679e8  str.w   r2, [r0, r3, lsl #3]
000679ec  ldr.w   r2, [pc, #0x38]
000679f0  ldr.w   r3, [r0, #0xa4]
000679f4  add     r2, pc ; -> 0x0006ced9  t_chance_do
000679f6  adds    r3, #1
000679f8  str.w   r3, [r0, #0xa4]
000679fc  lsls    r3, r3, #3
000679fe  adds    r3, r3, r0
00067a00  str     r2, [r3, #4]
00067a02  ldr.w   r3, [r0, #0xa4]
00067a06  adds    r3, #1
00067a08  str.w   r1, [r0, r3, lsl #3]
00067a0c  mov     r0, r1
00067a0e  b       #0x67982
00067a10  ldr.w   r2, [pc, #0x18]
00067a14  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
00067a16  ldr     r2, [r2]
00067a18  b       #0x679fc
00067a1a  nop     
00067a1c  pop     {r1, r2, r4}
00067a1e  movs    r0, r1
00067a20  pop     {r4, r6, pc}
00067a22  movs    r0, r1
00067a24  add     r0, sp, #0x114
00067a26  movs    r0, r0
00067a28  strb    r1, [r4, r3]
00067a2a  movs    r0, r0
00067a2c  pop     {r4, r5, r6, r7}
00067a2e  movs    r0, r1
