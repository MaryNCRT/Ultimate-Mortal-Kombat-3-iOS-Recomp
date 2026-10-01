========================================================================
-[CXMLNode URI]  0x000d94b0  52 bytes   CXMLNode.m
========================================================================

000d94b0  push    {r7, lr}
000d94b2  add     r7, sp, #0
000d94b4  ldr     r3, [pc, #0x20]
000d94b6  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d94b8  ldr     r3, [r3]
000d94ba  ldr     r3, [r0, r3]
000d94bc  ldr     r3, [r3, #0x24]
000d94be  cbnz    r3, #0xd94c4
000d94c0  mov     r0, r3
000d94c2  b       #0xd94d6
000d94c4  ldr     r0, [pc, #0x14]
000d94c6  ldr     r1, [pc, #0x18]
000d94c8  ldr     r2, [r3, #8]
000d94ca  add     r0, pc ; -> 0x000fdb5c  
000d94cc  add     r1, pc ; -> 0x000fd77c  
000d94ce  ldr     r0, [r0]
000d94d0  ldr     r1, [r1]
000d94d2  blx     #0xddbfc ; -> objc_msgSend
000d94d6  pop     {r7, pc}
000d94d8  cmp     r3, #0x6e
000d94da  movs    r2, r0
000d94dc  mov     lr, r1
000d94de  movs    r2, r0
000d94e0  cmp     r4, r5
000d94e2  movs    r2, r0
