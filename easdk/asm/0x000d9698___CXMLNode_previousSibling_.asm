========================================================================
-[CXMLNode previousSibling]  0x000d9698  192 bytes   CXMLNode.m
========================================================================

000d9698  push    {r4, r5, r6, r7, lr}
000d969a  add     r7, sp, #0xc
000d969c  push.w  {r8, sl}
000d96a0  sub     sp, #0x20
000d96a2  ldr     r3, [pc, #0x88]
000d96a4  mov     r5, r0
000d96a6  mov     r6, r1
000d96a8  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d96aa  ldr     r3, [r3]
000d96ac  ldr     r4, [r0, r3]
000d96ae  cbnz    r4, #0xd9700
000d96b0  ldr     r0, [pc, #0x7c]
000d96b2  ldr     r1, [pc, #0x80]
000d96b4  add     r0, pc ; -> 0x000fdcd4  
000d96b6  add     r1, pc ; -> 0x000fd860  
000d96b8  ldr     r0, [r0]
000d96ba  ldr     r1, [r1]
000d96bc  blx     #0xddbfc ; -> objc_msgSend
000d96c0  ldr     r1, [pc, #0x74]
000d96c2  ldr     r2, [pc, #0x78]
000d96c4  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d96c6  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d96c8  ldr.w   r8, [r1]
000d96cc  ldr     r1, [pc, #0x70]
000d96ce  add     r1, pc ; -> 0x000fd77c  
000d96d0  ldr     r1, [r1]
000d96d2  mov     sl, r0
000d96d4  ldr     r0, [pc, #0x6c]
000d96d6  add     r0, pc ; -> 0x000fdb5c  
000d96d8  ldr     r0, [r0]
000d96da  blx     #0xddbfc ; -> objc_msgSend
000d96de  ldr     r3, [pc, #0x68]
000d96e0  movs    r2, #0xc4
000d96e2  mov     r1, r8
000d96e4  add     r3, pc ; -> 0x00182684  
000d96e6  str     r2, [sp, #4]
000d96e8  str     r3, [sp, #8]
000d96ea  mov     r2, r6
000d96ec  mov     r3, r5
000d96ee  str     r4, [sp, #0xc]
000d96f0  str     r4, [sp, #0x10]
000d96f2  str     r4, [sp, #0x14]
000d96f4  str     r4, [sp, #0x18]
000d96f6  str     r4, [sp, #0x1c]
000d96f8  str     r0, [sp]
000d96fa  mov     r0, sl
000d96fc  blx     #0xddbfc ; -> objc_msgSend
000d9700  ldr     r3, [pc, #0x48]
000d9702  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9704  ldr     r0, [r3]
000d9706  ldr     r0, [r5, r0]
000d9708  ldr     r2, [r0, #0x1c]
000d970a  cbnz    r2, #0xd9710
000d970c  mov     r0, r2
000d970e  b       #0xd9722
000d9710  ldr     r0, [pc, #0x3c]
000d9712  ldr     r1, [pc, #0x40]
000d9714  movs    r3, #0
000d9716  add     r0, pc ; -> 0x000fdcd8  
000d9718  add     r1, pc ; -> 0x000fd84c  
000d971a  ldr     r0, [r0]
000d971c  ldr     r1, [r1]
000d971e  blx     #0xddbfc ; -> objc_msgSend
000d9722  sub.w   sp, r7, #0x14
000d9726  pop.w   {r8, sl}
000d972a  pop     {r4, r5, r6, r7, pc}
000d972c  cmp     r1, #0x7c
000d972e  movs    r2, r0
000d9730  mov     r4, r3
000d9732  movs    r2, r0
000d9734  sbcs    r6, r4
000d9736  movs    r2, r0
000d9738  sbcs    r4, r2
000d973a  movs    r2, r0
000d973c  ands    r6, r6
000d973e  movs    r1, r0
000d9740  lsls    r2, r5
000d9742  movs    r2, r0
000d9744  add     sl, r0
000d9746  movs    r2, r0
000d9748  ldrh    r4, [r3, #0x3c]
000d974a  movs    r2, r1
000d974c  cmp     r1, #0x22
000d974e  movs    r2, r0
000d9750  cmp     lr, r7
000d9752  movs    r2, r0
000d9754  asrs    r0, r6
000d9756  movs    r2, r0
