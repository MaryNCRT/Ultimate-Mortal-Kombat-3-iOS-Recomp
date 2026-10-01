========================================================================
ZNK4midp6String8hashCodeEv  0x0009dc8c  76 bytes   JString.cpp
========================================================================

0009dc8c  push    {r4, r5, r6, r7, lr}
0009dc8e  add     r7, sp, #0xc
0009dc90  str     r8, [sp, #-0x4]!
0009dc94  ldrb    r5, [r0, #0xc]
0009dc96  mov     r6, r0
0009dc98  cbz     r5, #0x9dca2
0009dc9a  ldr     r0, [r6, #0x10]
0009dc9c  ldr     r8, [sp], #4
0009dca0  pop     {r4, r5, r6, r7, pc}
0009dca2  bl      #0x9d9f0 ; -> ZNK4midp6String6lengthEv
0009dca6  adds.w  r4, r0, #-1
0009dcaa  it      mi
0009dcac  movmi   r8, r5
0009dcae  bmi     #0x9dcce
0009dcb0  mov     r8, r5
0009dcb2  movs    r5, #1
0009dcb4  mov     r1, r4
0009dcb6  mov     r0, r6
0009dcb8  bl      #0x9dc80 ; -> ZNK4midp6String6charAtEi
0009dcbc  subs    r4, #1
0009dcbe  lsls    r3, r5, #5
0009dcc0  cmp.w   r4, #-1
0009dcc4  mla     r8, r5, r0, r8
0009dcc8  rsb     r5, r5, r3
0009dccc  bne     #0x9dcb4
0009dcce  movs    r3, #1
0009dcd0  str.w   r8, [r6, #0x10]
0009dcd4  strb    r3, [r6, #0xc]
0009dcd6  b       #0x9dc9a
