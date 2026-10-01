========================================================================
-[CXMLNode nextSibling]  0x000d95d8  192 bytes   CXMLNode.m
========================================================================

000d95d8  push    {r4, r5, r6, r7, lr}
000d95da  add     r7, sp, #0xc
000d95dc  push.w  {r8, sl}
000d95e0  sub     sp, #0x20
000d95e2  ldr     r3, [pc, #0x88]
000d95e4  mov     r5, r0
000d95e6  mov     r6, r1
000d95e8  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d95ea  ldr     r3, [r3]
000d95ec  ldr     r4, [r0, r3]
000d95ee  cbnz    r4, #0xd9640
000d95f0  ldr     r0, [pc, #0x7c]
000d95f2  ldr     r1, [pc, #0x80]
000d95f4  add     r0, pc ; -> 0x000fdcd4  
000d95f6  add     r1, pc ; -> 0x000fd860  
000d95f8  ldr     r0, [r0]
000d95fa  ldr     r1, [r1]
000d95fc  blx     #0xddbfc ; -> objc_msgSend
000d9600  ldr     r1, [pc, #0x74]
000d9602  ldr     r2, [pc, #0x78]
000d9604  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9606  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9608  ldr.w   r8, [r1]
000d960c  ldr     r1, [pc, #0x70]
000d960e  add     r1, pc ; -> 0x000fd77c  
000d9610  ldr     r1, [r1]
000d9612  mov     sl, r0
000d9614  ldr     r0, [pc, #0x6c]
000d9616  add     r0, pc ; -> 0x000fdb5c  
000d9618  ldr     r0, [r0]
000d961a  blx     #0xddbfc ; -> objc_msgSend
000d961e  ldr     r3, [pc, #0x68]
000d9620  movs    r2, #0xce
000d9622  mov     r1, r8
000d9624  add     r3, pc ; -> 0x00182684  
000d9626  str     r2, [sp, #4]
000d9628  str     r3, [sp, #8]
000d962a  mov     r2, r6
000d962c  mov     r3, r5
000d962e  str     r4, [sp, #0xc]
000d9630  str     r4, [sp, #0x10]
000d9632  str     r4, [sp, #0x14]
000d9634  str     r4, [sp, #0x18]
000d9636  str     r4, [sp, #0x1c]
000d9638  str     r0, [sp]
000d963a  mov     r0, sl
000d963c  blx     #0xddbfc ; -> objc_msgSend
000d9640  ldr     r3, [pc, #0x48]
000d9642  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9644  ldr     r0, [r3]
000d9646  ldr     r0, [r5, r0]
000d9648  ldr     r2, [r0, #0x18]
000d964a  cbnz    r2, #0xd9650
000d964c  mov     r0, r2
000d964e  b       #0xd9662
000d9650  ldr     r0, [pc, #0x3c]
000d9652  ldr     r1, [pc, #0x40]
000d9654  movs    r3, #0
000d9656  add     r0, pc ; -> 0x000fdcd8  
000d9658  add     r1, pc ; -> 0x000fd84c  
000d965a  ldr     r0, [r0]
000d965c  ldr     r1, [r1]
000d965e  blx     #0xddbfc ; -> objc_msgSend
000d9662  sub.w   sp, r7, #0x14
000d9666  pop.w   {r8, sl}
000d966a  pop     {r4, r5, r6, r7, pc}
000d966c  cmp     r2, #0x3c
000d966e  movs    r2, r0
000d9670  mov     ip, fp
000d9672  movs    r2, r0
000d9674  rsbs    r6, r4, #0
000d9676  movs    r2, r0
000d9678  rsbs    r4, r2, #0
000d967a  movs    r2, r0
000d967c  lsrs    r6, r6
000d967e  movs    r1, r0
000d9680  adcs    r2, r5
000d9682  movs    r2, r0
000d9684  cmp     r2, r8
000d9686  movs    r2, r0
000d9688  str     r0, [sp, #0x170]
000d968a  movs    r2, r1
000d968c  cmp     r1, #0xe2
000d968e  movs    r2, r0
000d9690  mov     r6, pc
000d9692  movs    r2, r0
000d9694  rors    r0, r6
000d9696  movs    r2, r0
