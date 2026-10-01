========================================================================
-[CXMLDocument rootElement]  0x000d9210  52 bytes   CXMLDocument.m
========================================================================

000d9210  push    {r7, lr}
000d9212  add     r7, sp, #0
000d9214  ldr     r3, [pc, #0x20]
000d9216  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d9218  ldr     r3, [r3]
000d921a  ldr     r3, [r3]
000d921c  ldr     r0, [r0, r3]
000d921e  blx     #0xdde6c ; -> xmlDocGetRootElement
000d9222  ldr     r1, [pc, #0x18]
000d9224  movs    r3, #0
000d9226  add     r1, pc ; -> 0x000fd84c  
000d9228  ldr     r1, [r1]
000d922a  mov     r2, r0
000d922c  ldr     r0, [pc, #0x10]
000d922e  add     r0, pc ; -> 0x000fdcd8  
000d9230  ldr     r0, [r0]
000d9232  blx     #0xddbfc ; -> objc_msgSend
000d9236  pop     {r7, pc}
000d9238  adr     r1, #0xd8
000d923a  movs    r1, r0
000d923c  mov     r2, r4
000d923e  movs    r2, r0
000d9240  ldr     r2, [pc, #0x298]
000d9242  movs    r2, r0
