========================================================================
t_duck_under_proj  0x00070308  192 bytes   mkdrone.c
========================================================================

00070308  push    {r4, r5, r6, r7, lr}
0007030a  add     r7, sp, #0xc
0007030c  ldr.w   r1, [r0, #0xa4]
00070310  movw    r6, #0xe8e
00070314  mov     r4, r0
00070316  adds    r3, r1, #1
00070318  ldr.w   r5, [r0, r3, lsl #3]
0007031c  cmp     r5, r6
0007031e  beq     #0x70384
00070320  ble     #0x70336
00070322  movw    r2, #0xe8f
00070326  cmp     r5, r2
00070328  beq     #0x7039e
0007032a  cmp.w   r5, #0xe90
0007032e  beq     #0x7036c
00070330  mvn     r0, #2
00070334  pop     {r4, r5, r6, r7, pc}
00070336  cmp     r5, #0
00070338  bne     #0x70330
0007033a  bl      #0x2ebdc ; -> reset_proc_stack
0007033e  ldr.w   r3, [r4, #0xa4]
00070342  mov     r0, r5
00070344  adds    r3, #1
00070346  str.w   r6, [r4, r3, lsl #3]
0007034a  ldr.w   r3, [r4, #0xa4]
0007034e  adds    r2, r3, #1
00070350  ldr     r3, [pc, #0x64]
00070352  str.w   r2, [r4, #0xa4]
00070356  add     r3, pc ; -> 0x000f3884  t_do_duck
00070358  ldr     r1, [r3]
0007035a  lsls    r3, r2, #3
0007035c  adds    r3, r3, r4
0007035e  str     r1, [r3, #4]
00070360  ldr.w   r3, [r4, #0xa4]
00070364  adds    r3, #1
00070366  str.w   r5, [r4, r3, lsl #3]
0007036a  b       #0x70334
0007036c  ldr     r2, [pc, #0x4c]
0007036e  lsls    r3, r1, #3
00070370  add     r2, pc ; -> 0x000678e9  t_d_backup_jump
00070372  adds    r3, r3, r4
00070374  movs    r0, #0
00070376  str     r2, [r3, #4]
00070378  ldr.w   r3, [r4, #0xa4]
0007037c  adds    r3, #1
0007037e  str.w   r0, [r4, r3, lsl #3]
00070382  b       #0x70334
00070384  movw    r2, #0xe8f
00070388  str.w   r2, [r0, r3, lsl #3]
0007038c  ldr.w   r3, [r0, #0xa4]
00070390  ldr     r2, [pc, #0x2c]
00070392  adds    r3, #1
00070394  add     r2, pc ; -> 0x000700dd  t_wait_proj_spawn
00070396  str.w   r3, [r0, #0xa4]
0007039a  lsls    r3, r3, #3
0007039c  b       #0x70372
0007039e  mov.w   r2, #0xe90
000703a2  str.w   r2, [r0, r3, lsl #3]
000703a6  ldr.w   r3, [r0, #0xa4]
000703aa  ldr     r2, [pc, #0x18]
000703ac  adds    r3, #1
000703ae  add     r2, pc ; -> 0x0006ffd5  t_wait_proj_pass
000703b0  str.w   r3, [r0, #0xa4]
000703b4  lsls    r3, r3, #3
000703b6  b       #0x70372
000703b8  adds    r5, #0x2a
000703ba  movs    r0, r1
000703bc  strb    r5, [r6, #0x15]
