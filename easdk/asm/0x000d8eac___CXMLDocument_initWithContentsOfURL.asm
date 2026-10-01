========================================================================
-[CXMLDocument initWithContentsOfURL  0x000d8eac  36 bytes   CXMLDocument.m
========================================================================

000d8eac  push    {r7, lr}
000d8eae  add     r7, sp, #0
000d8eb0  sub     sp, #8
000d8eb2  ldr     r1, [pc, #0x18]
000d8eb4  str     r3, [sp]
000d8eb6  ldr     r3, [sp, #0x10]
000d8eb8  add     r1, pc ; -> 0x000fd854  
000d8eba  ldr     r1, [r1]
000d8ebc  str     r3, [sp, #4]
000d8ebe  movs    r3, #4
000d8ec0  blx     #0xddbfc ; -> objc_msgSend
000d8ec4  sub.w   sp, r7, #0
000d8ec8  pop     {r7, pc}
000d8eca  nop     
000d8ecc  ldr     r1, [pc, #0x260]
000d8ece  movs    r2, r0
