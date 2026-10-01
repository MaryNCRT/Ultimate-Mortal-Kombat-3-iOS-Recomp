========================================================================
-[CXMLNode rootDocument]  0x000d9a80  164 bytes   CXMLNode.m
========================================================================

000d9a80  push    {r4, r5, r6, r7, lr}
000d9a82  add     r7, sp, #0xc
000d9a84  push.w  {r8, sl}
000d9a88  sub     sp, #0x20
000d9a8a  ldr     r3, [pc, #0x74]
000d9a8c  mov     r5, r0
000d9a8e  mov     r6, r1
000d9a90  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9a92  ldr     r3, [r3]
000d9a94  ldr     r4, [r0, r3]
000d9a96  cbnz    r4, #0xd9ae8
000d9a98  ldr     r0, [pc, #0x68]
000d9a9a  ldr     r1, [pc, #0x6c]
000d9a9c  add     r0, pc ; -> 0x000fdcd4  
000d9a9e  add     r1, pc ; -> 0x000fd860  
000d9aa0  ldr     r0, [r0]
000d9aa2  ldr     r1, [r1]
000d9aa4  blx     #0xddbfc ; -> objc_msgSend
000d9aa8  ldr     r1, [pc, #0x60]
000d9aaa  ldr     r2, [pc, #0x64]
000d9aac  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9aae  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9ab0  ldr.w   r8, [r1]
000d9ab4  ldr     r1, [pc, #0x5c]
000d9ab6  add     r1, pc ; -> 0x000fd77c  
000d9ab8  ldr     r1, [r1]
000d9aba  mov     sl, r0
000d9abc  ldr     r0, [pc, #0x58]
000d9abe  add     r0, pc ; -> 0x000fdb5c  
000d9ac0  ldr     r0, [r0]
000d9ac2  blx     #0xddbfc ; -> objc_msgSend
000d9ac6  ldr     r3, [pc, #0x54]
000d9ac8  movs    r2, #0x8c
000d9aca  mov     r1, r8
000d9acc  add     r3, pc ; -> 0x00182684  
000d9ace  str     r2, [sp, #4]
000d9ad0  str     r3, [sp, #8]
000d9ad2  mov     r2, r6
000d9ad4  mov     r3, r5
000d9ad6  str     r4, [sp, #0xc]
000d9ad8  str     r4, [sp, #0x10]
000d9ada  str     r4, [sp, #0x14]
000d9adc  str     r4, [sp, #0x18]
000d9ade  str     r4, [sp, #0x1c]
000d9ae0  str     r0, [sp]
000d9ae2  mov     r0, sl
000d9ae4  blx     #0xddbfc ; -> objc_msgSend
000d9ae8  ldr     r3, [pc, #0x34]
000d9aea  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9aec  ldr     r0, [r3]
000d9aee  ldr     r0, [r5, r0]
000d9af0  ldr     r0, [r0, #0x20]
000d9af2  ldr     r0, [r0]
000d9af4  sub.w   sp, r7, #0x14
000d9af8  pop.w   {r8, sl}
000d9afc  pop     {r4, r5, r6, r7, pc}
000d9afe  nop     
000d9b00  movs    r5, #0x94
000d9b02  movs    r2, r0
000d9b04  tst     r4, r6
000d9b06  movs    r2, r0
000d9b08  subs    r5, #0xbe
000d9b0a  movs    r2, r0
000d9b0c  subs    r5, #0xac
000d9b0e  movs    r2, r0
000d9b10  subs    r4, #0x4e
000d9b12  movs    r1, r0
000d9b14  subs    r4, #0xc2
000d9b16  movs    r2, r0
000d9b18  lsls    r2, r3
000d9b1a  movs    r2, r0
000d9b1c  ldrh    r4, [r6, #0x1c]
000d9b1e  movs    r2, r1
000d9b20  movs    r5, #0x3a
000d9b22  movs    r2, r0
