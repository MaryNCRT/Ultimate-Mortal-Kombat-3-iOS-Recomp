========================================================================
-[CXMLDocument XMLData]  0x000d8e44  24 bytes   CXMLDocument.m
========================================================================

000d8e44  push    {r7, lr}
000d8e46  add     r7, sp, #0
000d8e48  ldr     r1, [pc, #0xc]
000d8e4a  movs    r2, #0
000d8e4c  add     r1, pc ; -> 0x000fd848  
000d8e4e  ldr     r1, [r1]
000d8e50  blx     #0xddbfc ; -> objc_msgSend
000d8e54  pop     {r7, pc}
000d8e56  nop     
000d8e58  ldr     r1, [pc, #0x3e0]
000d8e5a  movs    r2, r0
