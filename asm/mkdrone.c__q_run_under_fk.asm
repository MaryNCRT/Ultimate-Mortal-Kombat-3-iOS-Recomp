========================================================================
q_run_under_fk  0x0006efa4  32 bytes   mkdrone.c
========================================================================

0006efa4  push    {r4, r7, lr}
0006efa6  add     r7, sp, #4
0006efa8  mov     r4, r0
0006efaa  bl      #0x551f0 ; -> am_i_facing_him
0006efae  ldr     r3, [r4, #0x5c]
0006efb0  cbz     r3, #0x6efba
0006efb2  mov     r0, r4
0006efb4  bl      #0x67514 ; -> vq_no
0006efb8  pop     {r4, r7, pc}
0006efba  mov     r0, r4
0006efbc  bl      #0x6751c ; -> vq_yes
0006efc0  b       #0x6efb8
0006efc2  nop     
