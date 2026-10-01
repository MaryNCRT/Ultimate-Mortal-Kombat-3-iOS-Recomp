========================================================================
get_last_button  0x000308c4  24 bytes   joy.c
========================================================================

000308c4  push    {r4, r7, lr}
000308c6  add     r7, sp, #4
000308c8  ldr     r3, [r0]
000308ca  mov     r4, r0
000308cc  ldr     r1, [r3, #8]
000308ce  bl      #0x560e8 ; -> get_bcq_next_pointer_idx
000308d2  mov     r0, r4
000308d4  bl      #0x56138 ; -> previous_q_entry
000308d8  pop     {r4, r7, pc}
000308da  nop     
