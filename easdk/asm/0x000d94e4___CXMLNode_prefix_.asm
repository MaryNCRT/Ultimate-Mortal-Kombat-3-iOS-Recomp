========================================================================
-[CXMLNode prefix]  0x000d94e4  52 bytes   CXMLNode.m
========================================================================

000d94e4  push    {r7, lr}
000d94e6  add     r7, sp, #0
000d94e8  ldr     r3, [pc, #0x20]
000d94ea  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d94ec  ldr     r3, [r3]
000d94ee  ldr     r3, [r0, r3]
000d94f0  ldr     r3, [r3, #0x24]
000d94f2  cbnz    r3, #0xd94f8
000d94f4  mov     r0, r3
000d94f6  b       #0xd950a
000d94f8  ldr     r0, [pc, #0x14]
000d94fa  ldr     r1, [pc, #0x18]
000d94fc  ldr     r2, [r3, #0xc]
000d94fe  add     r0, pc ; -> 0x000fdb5c  
000d9500  add     r1, pc ; -> 0x000fd77c  
000d9502  ldr     r0, [r0]
000d9504  ldr     r1, [r1]
000d9506  blx     #0xddbfc ; -> objc_msgSend
000d950a  pop     {r7, pc}
000d950c  cmp     r3, #0x3a
000d950e  movs    r2, r0
000d9510  mov     r2, fp
000d9512  movs    r2, r0
000d9514  rsbs    r0, r7, #0
000d9516  movs    r2, r0
