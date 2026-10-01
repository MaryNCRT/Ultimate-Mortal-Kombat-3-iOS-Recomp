========================================================================
q_is_this_a_joke  0x000a9ea0  68 bytes   mkboss.c
========================================================================

000a9ea0  push    {r4, r7, lr}
000a9ea2  add     r7, sp, #4
000a9ea4  mov     r4, r0
000a9ea6  bl      #0x550e4 ; -> get_my_matchw
000a9eaa  ldr     r3, [r4, #0x1c]
000a9eac  cbz     r3, #0xa9eb8
000a9eae  mov     r0, r4
000a9eb0  bl      #0x550fc ; -> get_his_matchw
000a9eb4  ldr     r3, [r4, #0x1c]
000a9eb6  cbz     r3, #0xa9ec0
000a9eb8  mov     r0, r4
000a9eba  bl      #0xa85d4 ; -> q_no
000a9ebe  pop     {r4, r7, pc}
000a9ec0  mov     r0, r4
000a9ec2  bl      #0x550c4 ; -> get_his_strength
000a9ec6  ldr     r3, [r4, #0x1c]
000a9ec8  mov     r0, r4
000a9eca  str     r3, [r4, #0x30]
000a9ecc  bl      #0x550b0 ; -> get_my_strength
000a9ed0  ldr     r3, [r4, #0x30]
000a9ed2  ldr     r2, [r4, #0x1c]
000a9ed4  cmp     r2, r3
000a9ed6  blt     #0xa9eb8
000a9ed8  cmp     r3, #0x53
000a9eda  bgt     #0xa9eb8
000a9edc  mov     r0, r4
000a9ede  bl      #0xa85cc ; -> q_yes
000a9ee2  b       #0xa9ebe
