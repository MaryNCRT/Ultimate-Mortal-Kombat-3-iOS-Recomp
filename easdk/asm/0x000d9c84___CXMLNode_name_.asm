========================================================================
-[CXMLNode name]  0x000d9c84  192 bytes   CXMLNode.m
========================================================================

000d9c84  push    {r4, r5, r6, r7, lr}
000d9c86  add     r7, sp, #0xc
000d9c88  push.w  {r8, sl}
000d9c8c  sub     sp, #0x20
000d9c8e  ldr     r3, [pc, #0x88]
000d9c90  mov     r5, r0
000d9c92  mov     r6, r1
000d9c94  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9c96  ldr     r3, [r3]
000d9c98  ldr     r4, [r0, r3]
000d9c9a  cbnz    r4, #0xd9cec
000d9c9c  ldr     r0, [pc, #0x7c]
000d9c9e  ldr     r1, [pc, #0x80]
000d9ca0  add     r0, pc ; -> 0x000fdcd4  
000d9ca2  add     r1, pc ; -> 0x000fd860  
000d9ca4  ldr     r0, [r0]
000d9ca6  ldr     r1, [r1]
000d9ca8  blx     #0xddbfc ; -> objc_msgSend
000d9cac  ldr     r1, [pc, #0x74]
000d9cae  ldr     r2, [pc, #0x78]
000d9cb0  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9cb2  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9cb4  ldr.w   r8, [r1]
000d9cb8  ldr     r1, [pc, #0x70]
000d9cba  add     r1, pc ; -> 0x000fd77c  
000d9cbc  ldr     r1, [r1]
000d9cbe  mov     sl, r0
000d9cc0  ldr     r0, [pc, #0x6c]
000d9cc2  add     r0, pc ; -> 0x000fdb5c  
000d9cc4  ldr     r0, [r0]
000d9cc6  blx     #0xddbfc ; -> objc_msgSend
000d9cca  ldr     r3, [pc, #0x68]
000d9ccc  movs    r2, #0x52
000d9cce  mov     r1, r8
000d9cd0  add     r3, pc ; -> 0x00182684  
000d9cd2  str     r2, [sp, #4]
000d9cd4  str     r3, [sp, #8]
000d9cd6  mov     r2, r6
000d9cd8  mov     r3, r5
000d9cda  str     r4, [sp, #0xc]
000d9cdc  str     r4, [sp, #0x10]
000d9cde  str     r4, [sp, #0x14]
000d9ce0  str     r4, [sp, #0x18]
000d9ce2  str     r4, [sp, #0x1c]
000d9ce4  str     r0, [sp]
000d9ce6  mov     r0, sl
000d9ce8  blx     #0xddbfc ; -> objc_msgSend
000d9cec  ldr     r3, [pc, #0x48]
000d9cee  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9cf0  ldr     r0, [r3]
000d9cf2  ldr     r0, [r5, r0]
000d9cf4  ldr     r2, [r0, #8]
000d9cf6  cbnz    r2, #0xd9cfc
000d9cf8  mov     r0, r2
000d9cfa  b       #0xd9d0c
000d9cfc  ldr     r0, [pc, #0x3c]
000d9cfe  ldr     r1, [pc, #0x40]
000d9d00  add     r0, pc ; -> 0x000fdb5c  
000d9d02  add     r1, pc ; -> 0x000fd77c  
000d9d04  ldr     r0, [r0]
000d9d06  ldr     r1, [r1]
000d9d08  blx     #0xddbfc ; -> objc_msgSend
000d9d0c  sub.w   sp, r7, #0x14
000d9d10  pop.w   {r8, sl}
000d9d14  pop     {r4, r5, r6, r7, pc}
000d9d16  nop     
000d9d18  movs    r3, #0x90
000d9d1a  movs    r2, r0
000d9d1c  ands    r0, r6
000d9d1e  movs    r2, r0
000d9d20  subs    r3, #0xba
000d9d22  movs    r2, r0
000d9d24  subs    r3, #0xa8
000d9d26  movs    r2, r0
000d9d28  subs    r2, #0x4a
000d9d2a  movs    r1, r0
000d9d2c  subs    r2, #0xbe
000d9d2e  movs    r2, r0
000d9d30  subs    r6, #0x96
000d9d32  movs    r2, r0
000d9d34  ldrh    r0, [r6, #0xc]
000d9d36  movs    r2, r1
000d9d38  movs    r3, #0x36
000d9d3a  movs    r2, r0
000d9d3c  subs    r6, #0x58
000d9d3e  movs    r2, r0
000d9d40  subs    r2, #0x76
000d9d42  movs    r2, r0
