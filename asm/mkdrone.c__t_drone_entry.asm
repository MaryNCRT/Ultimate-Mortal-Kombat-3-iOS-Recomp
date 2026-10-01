========================================================================
t_drone_entry  0x00072ccc  384 bytes   mkdrone.c
========================================================================

00072ccc  push    {r4, r5, r6, r7, lr}
00072cce  add     r7, sp, #0xc
00072cd0  str     r8, [sp, #-0x4]!
00072cd4  ldr.w   r3, [r0, #0xa4]
00072cd8  mov     r4, r0
00072cda  ldr.w   r6, [r0, #0x108]
00072cde  adds    r2, r3, #1
00072ce0  ldr.w   r5, [r0, r2, lsl #3]
00072ce4  cmp.w   r5, #0x370
00072ce8  beq     #0x72db0
00072cea  ble     #0x72d08
00072cec  movw    r8, #0x37b
00072cf0  cmp     r5, r8
00072cf2  beq     #0x72d30
00072cf4  movw    r3, #0x381
00072cf8  cmp     r5, r3
00072cfa  beq     #0x72d9e
00072cfc  cmp.w   r5, #0x378
00072d00  beq     #0x72dda
00072d02  mvn     r0, #2
00072d06  b       #0x72d5a
00072d08  cmp     r5, #0
00072d0a  beq     #0x72d60
00072d0c  movw    r3, #0x36f
00072d10  cmp     r5, r3
00072d12  bne     #0x72d02
00072d14  mov.w   r3, #0x370
00072d18  str.w   r3, [r0, r2, lsl #3]
00072d1c  ldr     r2, [pc, #0x10c]
00072d1e  ldr.w   r3, [r0, #0xa4]
00072d22  add     r2, pc ; -> 0x0006c40d  t_d_beware
00072d24  adds    r3, #1
00072d26  str.w   r3, [r0, #0xa4]
00072d2a  b       #0x72d48
00072d2c  ldr.w   r3, [r4, #0xa4]
00072d30  adds    r3, #1
00072d32  movw    r2, #0x381
00072d36  str.w   r2, [r4, r3, lsl #3]
00072d3a  ldr     r2, [pc, #0xf4]
00072d3c  ldr.w   r3, [r4, #0xa4]
00072d40  add     r2, pc ; -> 0x00067951  t_hangout_check
00072d42  adds    r3, #1
00072d44  str.w   r3, [r4, #0xa4]
00072d48  lsls    r3, r3, #3
00072d4a  adds    r3, r3, r4
00072d4c  movs    r0, #0
00072d4e  str     r2, [r3, #4]
00072d50  ldr.w   r3, [r4, #0xa4]
00072d54  adds    r3, #1
00072d56  str.w   r0, [r4, r3, lsl #3]
00072d5a  ldr     r8, [sp], #4
00072d5e  pop     {r4, r5, r6, r7, pc}
00072d60  bl      #0x2ebdc ; -> reset_proc_stack
00072d64  mov     r0, r6
00072d66  bl      #0x72cb8 ; -> d_to_normal
00072d6a  ldr.w   r3, [r4, #0xa4]
00072d6e  movw    r2, #0x36f
00072d72  mov     r0, r5
00072d74  adds    r3, #1
00072d76  str.w   r2, [r4, r3, lsl #3]
00072d7a  ldr.w   r2, [pc, #0xb8]
00072d7e  ldr.w   r3, [r4, #0xa4]
00072d82  add     r2, pc ; -> 0x000f37a8  t_check_winner_status
00072d84  adds    r3, #1
00072d86  ldr     r2, [r2]
00072d88  str.w   r3, [r4, #0xa4]
00072d8c  lsls    r3, r3, #3
00072d8e  adds    r3, r3, r4
00072d90  str     r2, [r3, #4]
00072d92  ldr.w   r3, [r4, #0xa4]
00072d96  adds    r3, #1
00072d98  str.w   r5, [r4, r3, lsl #3]
00072d9c  b       #0x72d5a
00072d9e  mov     r0, r6
00072da0  bl      #0x6c7fc ; -> q_is_he_reacting
00072da4  cbz     r0, #0x72e00
00072da6  ldr     r2, [pc, #0x90]
00072da8  ldr.w   r3, [r4, #0xa4]
00072dac  add     r2, pc ; -> 0x0006e811  t_d_wait_finish_react
00072dae  b       #0x72d48
00072db0  mov     r0, r6
00072db2  bl      #0x553c4 ; -> stance_setup
00072db6  mov     r0, r6
00072db8  bl      #0x551f0 ; -> am_i_facing_him
00072dbc  cbnz    r0, #0x72e08
00072dbe  ldr.w   r2, [pc, #0x7c]
00072dc2  add     r2, pc ; -> 0x00070675  t_d_turnaround
00072dc4  ldr.w   r3, [r4, #0xa4]
00072dc8  lsls    r3, r3, #3
00072dca  adds    r3, r3, r4
00072dcc  str     r2, [r3, #4]
00072dce  ldr.w   r3, [r4, #0xa4]
00072dd2  adds    r3, #1
00072dd4  str.w   r0, [r4, r3, lsl #3]
00072dd8  b       #0x72d5a
00072dda  mov     r0, r6
00072ddc  bl      #0x55808 ; -> am_i_short
00072de0  cmp     r0, #0
00072de2  beq     #0x72d2c
00072de4  ldr.w   r3, [r4, #0xa4]
00072de8  ldr.w   r2, [pc, #0x54]
00072dec  adds    r3, #1
00072dee  add     r2, pc ; -> 0x000719fd  t_d_backup_jsrp
00072df0  str.w   r8, [r4, r3, lsl #3]
00072df4  ldr.w   r3, [r4, #0xa4]
00072df8  adds    r3, #1
00072dfa  str.w   r3, [r4, #0xa4]
00072dfe  b       #0x72d48
00072e00  ldr.w   r2, [pc, #0x40]
00072e04  add     r2, pc ; -> 0x000711a5  t_d_attack
00072e06  b       #0x72dc4
00072e08  movs    r3, #0x10
00072e0a  str     r3, [r6, #0x64]
00072e0c  ldr.w   r3, [r4, #0xa4]
00072e10  mov.w   r2, #0x378
00072e14  adds    r3, #1
00072e16  str.w   r2, [r4, r3, lsl #3]
00072e1a  ldr     r2, [pc, #0x2c]
00072e1c  ldr.w   r3, [r4, #0xa4]
00072e20  add     r2, pc ; -> 0x0006c2cd  t_boss_branch
00072e22  adds    r3, #1
00072e24  str.w   r3, [r4, #0xa4]
00072e28  b       #0x72d48
00072e2a  nop     
00072e2c  str     r6, [sp, #0x39c]
00072e2e  vdup.8  d20, d13[7]
00072e32  vtbl.8  d16, {d15, d16, d17}, d18
00072e36  movs    r0, r1
00072e38  rev16   r1, r4
00072e3a  vtbl.8  d29, {d31}, d31
00072e3e  vdup.8  d30, d11[7]
00072e42  vrsra.u64 d30, d13, #1
