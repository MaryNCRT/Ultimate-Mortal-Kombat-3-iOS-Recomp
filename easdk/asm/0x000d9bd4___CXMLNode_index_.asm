========================================================================
-[CXMLNode index]  0x000d9bd4  176 bytes   CXMLNode.m
========================================================================

000d9bd4  push    {r4, r5, r6, r7, lr}
000d9bd6  add     r7, sp, #0xc
000d9bd8  push.w  {r8, sl}
000d9bdc  sub     sp, #0x20
000d9bde  ldr     r3, [pc, #0x80]
000d9be0  mov     r5, r0
000d9be2  mov     r6, r1
000d9be4  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9be6  ldr     r3, [r3]
000d9be8  ldr     r4, [r0, r3]
000d9bea  cbnz    r4, #0xd9c3c
000d9bec  ldr     r0, [pc, #0x74]
000d9bee  ldr     r1, [pc, #0x78]
000d9bf0  add     r0, pc ; -> 0x000fdcd4  
000d9bf2  add     r1, pc ; -> 0x000fd860  
000d9bf4  ldr     r0, [r0]
000d9bf6  ldr     r1, [r1]
000d9bf8  blx     #0xddbfc ; -> objc_msgSend
000d9bfc  ldr     r1, [pc, #0x6c]
000d9bfe  ldr     r2, [pc, #0x70]
000d9c00  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9c02  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9c04  ldr.w   r8, [r1]
000d9c08  ldr     r1, [pc, #0x68]
000d9c0a  add     r1, pc ; -> 0x000fd77c  
000d9c0c  ldr     r1, [r1]
000d9c0e  mov     sl, r0
000d9c10  ldr     r0, [pc, #0x64]
000d9c12  add     r0, pc ; -> 0x000fdb5c  
000d9c14  ldr     r0, [r0]
000d9c16  blx     #0xddbfc ; -> objc_msgSend
000d9c1a  ldr     r3, [pc, #0x60]
000d9c1c  movs    r2, #0x76
000d9c1e  mov     r1, r8
000d9c20  add     r3, pc ; -> 0x00182684  
000d9c22  str     r2, [sp, #4]
000d9c24  str     r3, [sp, #8]
000d9c26  mov     r2, r6
000d9c28  mov     r3, r5
000d9c2a  str     r4, [sp, #0xc]
000d9c2c  str     r4, [sp, #0x10]
000d9c2e  str     r4, [sp, #0x14]
000d9c30  str     r4, [sp, #0x18]
000d9c32  str     r4, [sp, #0x1c]
000d9c34  str     r0, [sp]
000d9c36  mov     r0, sl
000d9c38  blx     #0xddbfc ; -> objc_msgSend
000d9c3c  ldr     r3, [pc, #0x40]
000d9c3e  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9c40  ldr     r0, [r3]
000d9c42  movs    r3, #0
000d9c44  ldr     r0, [r5, r0]
000d9c46  ldr     r0, [r0, #0x1c]
000d9c48  b       #0xd9c4e
000d9c4a  ldr     r0, [r0, #0x1c]
000d9c4c  adds    r3, #1
000d9c4e  cmp     r0, #0
000d9c50  bne     #0xd9c4a
000d9c52  mov     r0, r3
000d9c54  sub.w   sp, r7, #0x14
000d9c58  pop.w   {r8, sl}
000d9c5c  pop     {r4, r5, r6, r7, pc}
000d9c5e  nop     
000d9c60  movs    r4, #0x40
000d9c62  movs    r2, r0
000d9c64  lsrs    r0, r4
000d9c66  movs    r2, r0
000d9c68  subs    r4, #0x6a
000d9c6a  movs    r2, r0
000d9c6c  subs    r4, #0x58
000d9c6e  movs    r2, r0
000d9c70  subs    r2, #0xfa
000d9c72  movs    r1, r0
000d9c74  subs    r3, #0x6e
000d9c76  movs    r2, r0
000d9c78  subs    r7, #0x46
000d9c7a  movs    r2, r0
000d9c7c  ldrh    r0, [r4, #0x12]
000d9c7e  movs    r2, r1
000d9c80  movs    r3, #0xe6
000d9c82  movs    r2, r0
