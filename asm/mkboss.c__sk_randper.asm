========================================================================
sk_randper  0x000abcf0  48 bytes   mkboss.c
========================================================================

000abcf0  push    {r4, r7, lr}
000abcf2  add     r7, sp, #4
000abcf4  mov     r4, r0
000abcf6  bl      #0xa9ea0 ; -> q_is_this_a_joke
000abcfa  ldr     r3, [r4, #0x5c]
000abcfc  cbz     r3, #0xabd06
000abcfe  mov     r0, r4
000abd00  bl      #0xabce0 ; -> sk_counter_joke
000abd04  pop     {r4, r7, pc}
000abd06  ldr     r3, [pc, #0x14]
000abd08  mov     r0, r4
000abd0a  add     r3, pc ; -> 0x0017b3ca  mhe_sk_randpers
000abd0c  str     r3, [r4, #0x1c]
000abd0e  bl      #0xa8d4c ; -> get_mhe_word
000abd12  mov     r0, r4
000abd14  bl      #0xab6bc ; -> bossrandper
000abd18  b       #0xabd04
000abd1a  nop     
