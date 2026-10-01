========================================================================
motaro_randper  0x000ab804  36 bytes   mkboss.c
========================================================================

000ab804  push    {r4, r7, lr}
000ab806  add     r7, sp, #4
000ab808  mov     r4, r0
000ab80a  bl      #0xa9ea0 ; -> q_is_this_a_joke
000ab80e  ldr     r3, [r4, #0x5c]
000ab810  cbz     r3, #0xab81a
000ab812  mov     r0, r4
000ab814  bl      #0xab7f4 ; -> motaro_joke_randper
000ab818  pop     {r4, r7, pc}
000ab81a  mov.w   r3, #0x1f4
000ab81e  mov     r0, r4
000ab820  str     r3, [r4, #0x1c]
000ab822  bl      #0xab6bc ; -> bossrandper
000ab826  b       #0xab818
