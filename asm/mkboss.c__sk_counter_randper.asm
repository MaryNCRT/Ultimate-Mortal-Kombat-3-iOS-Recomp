========================================================================
sk_counter_randper  0x000abcc4  28 bytes   mkboss.c
========================================================================

000abcc4  push    {r4, r7, lr}
000abcc6  add     r7, sp, #4
000abcc8  ldr     r3, [pc, #0x10]
000abcca  mov     r4, r0
000abccc  add     r3, pc ; -> 0x0017b3d2  mhe_sk_counter_randpers
000abcce  str     r3, [r0, #0x1c]
000abcd0  bl      #0xa8d4c ; -> get_mhe_word
000abcd4  mov     r0, r4
000abcd6  bl      #0xab6bc ; -> bossrandper
000abcda  pop     {r4, r7, pc}
