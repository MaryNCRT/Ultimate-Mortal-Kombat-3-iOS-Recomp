========================================================================
t_ct_kicks  0x0006e940  132 bytes   mkdrone.c
========================================================================

0006e940  push    {r4, r5, r6, r7, lr}
0006e942  add     r7, sp, #0xc
0006e944  ldr.w   r3, [r0, #0xa4]
0006e948  mov     r4, r0
0006e94a  ldr.w   r5, [r0, #0x108]
0006e94e  adds    r3, #1
0006e950  ldr.w   r6, [r0, r3, lsl #3]
0006e954  cbnz    r6, #0x6e978
0006e956  mov     r0, r5
0006e958  bl      #0x54e38 ; -> get_his_action
0006e95c  ldr     r3, [r5, #0x20]
0006e95e  cmp.w   r3, #0x104
0006e962  beq     #0x6e97e
0006e964  mov     r0, r5
0006e966  movs    r3, #8
0006e968  str     r3, [r5, #0x1c]
0006e96a  bl      #0x595d8 ; -> strike_check_a0_test
0006e96e  ldr     r0, [r5, #0x5c]
0006e970  cbz     r0, #0x6e99c
0006e972  ldr     r2, [pc, #0x44]
0006e974  add     r2, pc ; -> 0x00068b5d  t_d_duck_then_uppercut
0006e976  b       #0x6e984
0006e978  mvn     r0, #2
0006e97c  pop     {r4, r5, r6, r7, pc}
0006e97e  ldr.w   r2, [pc, #0x3c]
0006e982  add     r2, pc ; -> 0x00068ab9  t_d_duck
0006e984  ldr.w   r3, [r4, #0xa4]
0006e988  mov     r0, r6
0006e98a  lsls    r3, r3, #3
0006e98c  adds    r3, r3, r4
0006e98e  str     r2, [r3, #4]
0006e990  ldr.w   r3, [r4, #0xa4]
0006e994  adds    r3, #1
0006e996  str.w   r6, [r4, r3, lsl #3]
0006e99a  b       #0x6e97c
0006e99c  ldr.w   r3, [r4, #0xa4]
0006e9a0  ldr     r2, [pc, #0x1c]
0006e9a2  lsls    r3, r3, #3
0006e9a4  adds    r3, r3, r4
0006e9a6  add     r2, pc ; -> 0x0006c821  t_d_sweep_kick
0006e9a8  str     r2, [r3, #4]
0006e9aa  ldr.w   r3, [r4, #0xa4]
0006e9ae  adds    r3, #1
0006e9b0  str.w   r0, [r4, r3, lsl #3]
0006e9b4  b       #0x6e97c
0006e9b6  nop     
0006e9b8  adr     r1, #0x394
0006e9ba  vsra.u32 d26, d19, #1
