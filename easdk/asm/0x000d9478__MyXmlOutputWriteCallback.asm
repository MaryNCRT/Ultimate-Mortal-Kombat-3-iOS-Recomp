========================================================================
MyXmlOutputWriteCallback  0x000d9478  32 bytes   CXMLNode.m
========================================================================

000d9478  push    {r4, r7, lr}
000d947a  add     r7, sp, #4
000d947c  mov     r3, r1
000d947e  ldr     r1, [pc, #0x14]
000d9480  mov     r4, r2
000d9482  mov     r2, r3
000d9484  add     r1, pc ; -> 0x000fd124  
000d9486  mov     r3, r4
000d9488  ldr     r1, [r1]
000d948a  blx     #0xddbfc ; -> objc_msgSend
000d948e  mov     r0, r4
000d9490  pop     {r4, r7, pc}
000d9492  nop     
000d9494  subs    r4, #0x9c
000d9496  movs    r2, r0
