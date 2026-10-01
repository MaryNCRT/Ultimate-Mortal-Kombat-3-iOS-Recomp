========================================================================
should_i_promove  0x0006c9f4  20 bytes   mkdrone.c
========================================================================

0006c9f4  push    {r7, lr}
0006c9f6  add     r7, sp, #0
0006c9f8  ldr     r3, [pc, #8]
0006c9fa  add     r3, pc ; -> 0x00171fa8  rpt_counter
0006c9fc  str     r3, [r0, #0x1c]
0006c9fe  bl      #0x6c9c8 ; -> ask_mr_diff
0006ca02  pop     {r7, pc}
0006ca04  strb    r2, [r5, r6]
0006ca06  movs    r0, r2
