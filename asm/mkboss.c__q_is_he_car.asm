========================================================================
q_is_he_car  0x000a8d64  40 bytes   mkboss.c
========================================================================

000a8d64  push    {r4, r7, lr}
000a8d66  add     r7, sp, #4
000a8d68  mov     r4, r0
000a8d6a  bl      #0x708a8 ; -> q_is_he_cornered
000a8d6e  ldr     r3, [r4, #0x5c]
000a8d70  cbz     r3, #0xa8d7c
000a8d72  mov     r0, r4
000a8d74  bl      #0x6c7fc ; -> q_is_he_reacting
000a8d78  ldr     r3, [r4, #0x5c]
000a8d7a  cbnz    r3, #0xa8d84
000a8d7c  mov     r0, r4
000a8d7e  bl      #0xa85d4 ; -> q_no
000a8d82  pop     {r4, r7, pc}
000a8d84  mov     r0, r4
000a8d86  bl      #0xa85cc ; -> q_yes
000a8d8a  b       #0xa8d82
