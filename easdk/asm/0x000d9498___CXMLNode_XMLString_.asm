========================================================================
-[CXMLNode XMLString]  0x000d9498  24 bytes   CXMLNode.m
========================================================================

000d9498  push    {r7, lr}
000d949a  add     r7, sp, #0
000d949c  ldr     r1, [pc, #0xc]
000d949e  movs    r2, #0
000d94a0  add     r1, pc ; -> 0x000fda04  
000d94a2  ldr     r1, [r1]
000d94a4  blx     #0xddbfc ; -> objc_msgSend
000d94a8  pop     {r7, pc}
000d94aa  nop     
000d94ac  cmp     r0, ip
000d94ae  movs    r2, r0
