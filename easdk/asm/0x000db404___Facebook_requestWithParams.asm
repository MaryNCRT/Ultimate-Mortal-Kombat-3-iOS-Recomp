========================================================================
-[Facebook requestWithParams  0x000db404  136 bytes   Facebook.m
========================================================================

000db404  push    {r4, r5, r6, r7, lr}
000db406  add     r7, sp, #0xc
000db408  push.w  {r8, sl}
000db40c  sub     sp, #8
000db40e  ldr     r1, [pc, #0x64]
000db410  ldr     r4, [pc, #0x64]
000db412  mov     sl, r0
000db414  add     r1, pc ; -> 0x000fcad4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x15c
000db416  add     r4, pc ; -> 0x0017eae4  
000db418  ldr     r5, [r1]
000db41a  mov     r6, r2
000db41c  mov     r0, r2
000db41e  mov     r2, r4
000db420  mov     r1, r5
000db422  mov     r8, r3
000db424  blx     #0xddbfc ; -> objc_msgSend
000db428  cbnz    r0, #0xdb434
000db42a  ldr     r0, [pc, #0x50]
000db42c  add     r0, pc ; -> 0x00182a64  
000db42e  blx     #0xdd3e0 ; -> NSLog
000db432  b       #0xdb468
000db434  mov     r1, r5
000db436  mov     r2, r4
000db438  mov     r0, r6
000db43a  blx     #0xddbfc ; -> objc_msgSend
000db43e  ldr     r1, [pc, #0x40]
000db440  mov     r2, r4
000db442  add     r1, pc ; -> 0x000fcefc  '\x11B\x0e'
000db444  ldr     r1, [r1]
000db446  mov     r5, r0
000db448  mov     r0, r6
000db44a  blx     #0xddbfc ; -> objc_msgSend
000db44e  ldr     r1, [pc, #0x34]
000db450  ldr     r3, [pc, #0x34]
000db452  mov     r0, sl
000db454  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000db456  add     r3, pc ; -> 0x0017ea14  
000db458  ldr     r1, [r1]
000db45a  str     r3, [sp]
000db45c  mov     r2, r5
000db45e  mov     r3, r6
000db460  str.w   r8, [sp, #4]
000db464  blx     #0xddbfc ; -> objc_msgSend
000db468  sub.w   sp, r7, #0x14
000db46c  pop.w   {r8, sl}
000db470  pop     {r4, r5, r6, r7, pc}
000db472  nop     
000db474  asrs    r4, r7, #0x1a
000db476  movs    r2, r0
000db478  adds    r6, #0xca
000db47a  movs    r2, r1
000db47c  strb    r4, [r6, #0x18]
000db47e  movs    r2, r1
000db480  subs    r6, r6, r2
000db482  movs    r2, r0
000db484  movs    r5, #0x7c
000db486  movs    r2, r0
000db488  adds    r5, #0xba
000db48a  movs    r2, r1
