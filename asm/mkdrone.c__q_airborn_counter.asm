========================================================================
q_airborn_counter  0x0006f660  32 bytes   mkdrone.c
========================================================================

0006f660  push    {r4, r7, lr}
0006f662  add     r7, sp, #4
0006f664  mov     r4, r0
0006f666  bl      #0x55060 ; -> is_he_airborn
0006f66a  ldr     r3, [r4, #0x5c]
0006f66c  cbz     r3, #0x6f67a
0006f66e  ldr     r3, [pc, #0xc]
0006f670  mov     r0, r4
0006f672  add     r3, pc ; -> 0x00171c48  rpt_counter_airborns
0006f674  str     r3, [r4, #0x1c]
0006f676  bl      #0x6c9c8 ; -> ask_mr_diff
0006f67a  pop     {r4, r7, pc}
0006f67c  movs    r5, #0xd2
0006f67e  movs    r0, r2
