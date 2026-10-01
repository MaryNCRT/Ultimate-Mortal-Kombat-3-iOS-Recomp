========================================================================
get_mhe_word  0x000a8d4c  24 bytes   mkboss.c
========================================================================

000a8d4c  push    {r4, r7, lr}
000a8d4e  add     r7, sp, #4
000a8d50  mov     r4, r0
000a8d52  bl      #0x57674 ; -> ladderorder_a1
000a8d56  ldr     r3, [r4, #0x1c]
000a8d58  ldr     r2, [r4, #0x20]
000a8d5a  ldrsh.w r3, [r3, r2, lsl #1]
000a8d5e  str     r3, [r4, #0x1c]
000a8d60  pop     {r4, r7, pc}
000a8d62  nop     
