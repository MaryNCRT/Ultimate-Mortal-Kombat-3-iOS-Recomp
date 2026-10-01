========================================================================
t_dist_retp  0x0006eda4  80 bytes   mkdrone.c
========================================================================

0006eda4  push    {r4, r5, r7, lr}
0006eda6  add     r7, sp, #8
0006eda8  mov     r4, r0
0006edaa  ldr.w   r3, [r4, #0xa4]
0006edae  ldr.w   r0, [r0, #0x108]
0006edb2  adds    r3, #1
0006edb4  ldr.w   r5, [r4, r3, lsl #3]
0006edb8  cbnz    r5, #0x6edd0
0006edba  bl      #0x55c04 ; -> stop_me_player
0006edbe  ldr.w   r3, [r4, #0xa4]
0006edc2  cmp     r3, #0
0006edc4  ble     #0x6edd6
0006edc6  subs    r3, #1
0006edc8  mov     r0, r5
0006edca  str.w   r3, [r4, #0xa4]
0006edce  b       #0x6edd4
0006edd0  mvn     r0, #2
0006edd4  pop     {r4, r5, r7, pc}
0006edd6  ldr     r2, [pc, #0x18]
0006edd8  lsls    r3, r3, #3
0006edda  adds    r3, r3, r4
0006eddc  add     r2, pc ; -> 0x000f3708  t_local_reaction_exit
0006edde  mov     r0, r5
0006ede0  ldr     r2, [r2]
0006ede2  str     r2, [r3, #4]
0006ede4  ldr.w   r3, [r4, #0xa4]
0006ede8  adds    r3, #1
0006edea  str.w   r5, [r4, r3, lsl #3]
0006edee  b       #0x6edd4
0006edf0  ldr     r1, [pc, #0xa0]
0006edf2  movs    r0, r1
