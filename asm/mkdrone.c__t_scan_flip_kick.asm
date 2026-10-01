========================================================================
t_scan_flip_kick  0x00070408  124 bytes   mkdrone.c
========================================================================

00070408  push    {r4, r5, r7, lr}
0007040a  add     r7, sp, #8
0007040c  ldr.w   r2, [r0, #0xa4]
00070410  mov     r4, r0
00070412  adds    r3, r2, #1
00070414  ldr.w   r5, [r0, r3, lsl #3]
00070418  cbnz    r5, #0x70450
0007041a  bl      #0x2ebdc ; -> reset_proc_stack
0007041e  ldr.w   r3, [r4, #0xa4]
00070422  movw    r2, #0x6a4
00070426  mov     r0, r5
00070428  adds    r3, #1
0007042a  str.w   r2, [r4, r3, lsl #3]
0007042e  ldr.w   r3, [r4, #0xa4]
00070432  adds    r2, r3, #1
00070434  ldr     r3, [pc, #0x44]
00070436  str.w   r2, [r4, #0xa4]
0007043a  add     r3, pc ; -> 0x000f3890  t_do_flip_kick
0007043c  ldr     r1, [r3]
0007043e  lsls    r3, r2, #3
00070440  adds    r3, r3, r4
00070442  str     r1, [r3, #4]
00070444  ldr.w   r3, [r4, #0xa4]
00070448  adds    r3, #1
0007044a  str.w   r5, [r4, r3, lsl #3]
0007044e  pop     {r4, r5, r7, pc}
00070450  movw    r3, #0x6a4
00070454  cmp     r5, r3
00070456  it      ne
00070458  mvnne   r0, #2
0007045c  bne     #0x7044e
0007045e  ldr.w   r3, [pc, #0x20]
00070462  movs    r0, #0
00070464  add     r3, pc ; -> 0x000f3708  t_local_reaction_exit
00070466  ldr     r1, [r3]
00070468  lsls    r3, r2, #3
0007046a  adds    r3, r3, r4
0007046c  str     r1, [r3, #4]
0007046e  ldr.w   r3, [r4, #0xa4]
00070472  adds    r3, #1
00070474  str.w   r0, [r4, r3, lsl #3]
00070478  b       #0x7044e
0007047a  nop     
0007047c  adds    r4, #0x52
0007047e  movs    r0, r1
00070480  adds    r2, #0xa0
00070482  movs    r0, r1
