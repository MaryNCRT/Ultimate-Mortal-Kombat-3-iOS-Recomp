========================================================================
q_is_he_dropping  0x00068de4  28 bytes   mkdrone.c
========================================================================

00068de4  push    {r7, lr}
00068de6  add     r7, sp, #0
00068de8  ldr     r3, [r0]
00068dea  ldr     r3, [r3, #4]
00068dec  ldr     r3, [r3, #0x1c]
00068dee  cmp     r3, #0
00068df0  str     r3, [r0, #0x1c]
00068df2  ble     #0x68dfa
00068df4  bl      #0x6751c ; -> vq_yes
00068df8  pop     {r7, pc}
00068dfa  bl      #0x67514 ; -> vq_no
00068dfe  b       #0x68df8
