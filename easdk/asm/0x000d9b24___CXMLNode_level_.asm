========================================================================
-[CXMLNode level]  0x000d9b24  176 bytes   CXMLNode.m
========================================================================

000d9b24  push    {r4, r5, r6, r7, lr}
000d9b26  add     r7, sp, #0xc
000d9b28  push.w  {r8, sl}
000d9b2c  sub     sp, #0x20
000d9b2e  ldr     r3, [pc, #0x80]
000d9b30  mov     r5, r0
000d9b32  mov     r6, r1
000d9b34  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9b36  ldr     r3, [r3]
000d9b38  ldr     r4, [r0, r3]
000d9b3a  cbnz    r4, #0xd9b8c
000d9b3c  ldr     r0, [pc, #0x74]
000d9b3e  ldr     r1, [pc, #0x78]
000d9b40  add     r0, pc ; -> 0x000fdcd4  
000d9b42  add     r1, pc ; -> 0x000fd860  
000d9b44  ldr     r0, [r0]
000d9b46  ldr     r1, [r1]
000d9b48  blx     #0xddbfc ; -> objc_msgSend
000d9b4c  ldr     r1, [pc, #0x6c]
000d9b4e  ldr     r2, [pc, #0x70]
000d9b50  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9b52  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9b54  ldr.w   r8, [r1]
000d9b58  ldr     r1, [pc, #0x68]
000d9b5a  add     r1, pc ; -> 0x000fd77c  
000d9b5c  ldr     r1, [r1]
000d9b5e  mov     sl, r0
000d9b60  ldr     r0, [pc, #0x64]
000d9b62  add     r0, pc ; -> 0x000fdb5c  
000d9b64  ldr     r0, [r0]
000d9b66  blx     #0xddbfc ; -> objc_msgSend
000d9b6a  ldr     r3, [pc, #0x60]
000d9b6c  movs    r2, #0x81
000d9b6e  mov     r1, r8
000d9b70  add     r3, pc ; -> 0x00182684  
000d9b72  str     r2, [sp, #4]
000d9b74  str     r3, [sp, #8]
000d9b76  mov     r2, r6
000d9b78  mov     r3, r5
000d9b7a  str     r4, [sp, #0xc]
000d9b7c  str     r4, [sp, #0x10]
000d9b7e  str     r4, [sp, #0x14]
000d9b80  str     r4, [sp, #0x18]
000d9b82  str     r4, [sp, #0x1c]
000d9b84  str     r0, [sp]
000d9b86  mov     r0, sl
000d9b88  blx     #0xddbfc ; -> objc_msgSend
000d9b8c  ldr     r3, [pc, #0x40]
000d9b8e  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9b90  ldr     r0, [r3]
000d9b92  movs    r3, #0
000d9b94  ldr     r0, [r5, r0]
000d9b96  ldr     r0, [r0, #0x14]
000d9b98  b       #0xd9b9e
000d9b9a  ldr     r0, [r0, #0x14]
000d9b9c  adds    r3, #1
000d9b9e  cmp     r0, #0
000d9ba0  bne     #0xd9b9a
000d9ba2  mov     r0, r3
000d9ba4  sub.w   sp, r7, #0x14
000d9ba8  pop.w   {r8, sl}
000d9bac  pop     {r4, r5, r6, r7, pc}
000d9bae  nop     
000d9bb0  movs    r4, #0xf0
000d9bb2  movs    r2, r0
000d9bb4  sbcs    r0, r2
000d9bb6  movs    r2, r0
000d9bb8  subs    r5, #0x1a
000d9bba  movs    r2, r0
000d9bbc  subs    r5, #8
000d9bbe  movs    r2, r0
000d9bc0  subs    r3, #0xaa
000d9bc2  movs    r1, r0
000d9bc4  subs    r4, #0x1e
000d9bc6  movs    r2, r0
000d9bc8  subs    r7, #0xf6
000d9bca  movs    r2, r0
000d9bcc  ldrh    r0, [r2, #0x18]
000d9bce  movs    r2, r1
000d9bd0  movs    r4, #0x96
000d9bd2  movs    r2, r0
