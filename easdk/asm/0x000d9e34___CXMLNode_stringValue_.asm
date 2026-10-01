========================================================================
-[CXMLNode stringValue]  0x000d9e34  240 bytes   CXMLNode.m
========================================================================

000d9e34  push    {r4, r5, r6, r7, lr}
000d9e36  add     r7, sp, #0xc
000d9e38  push.w  {r8, sl}
000d9e3c  sub     sp, #0x20
000d9e3e  ldr     r3, [pc, #0xb4]
000d9e40  mov     r5, r0
000d9e42  mov     r6, r1
000d9e44  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9e46  ldr     r3, [r3]
000d9e48  ldr     r4, [r0, r3]
000d9e4a  cbnz    r4, #0xd9e9c
000d9e4c  ldr     r0, [pc, #0xa8]
000d9e4e  ldr     r1, [pc, #0xac]
000d9e50  add     r0, pc ; -> 0x000fdcd4  
000d9e52  add     r1, pc ; -> 0x000fd860  
000d9e54  ldr     r0, [r0]
000d9e56  ldr     r1, [r1]
000d9e58  blx     #0xddbfc ; -> objc_msgSend
000d9e5c  ldr     r1, [pc, #0xa0]
000d9e5e  ldr     r2, [pc, #0xa4]
000d9e60  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9e62  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9e64  ldr.w   r8, [r1]
000d9e68  ldr     r1, [pc, #0x9c]
000d9e6a  add     r1, pc ; -> 0x000fd77c  
000d9e6c  ldr     r1, [r1]
000d9e6e  mov     sl, r0
000d9e70  ldr     r0, [pc, #0x98]
000d9e72  add     r0, pc ; -> 0x000fdb5c  
000d9e74  ldr     r0, [r0]
000d9e76  blx     #0xddbfc ; -> objc_msgSend
000d9e7a  ldr     r3, [pc, #0x94]
000d9e7c  movs    r2, #0x5c
000d9e7e  mov     r1, r8
000d9e80  add     r3, pc ; -> 0x00182684  
000d9e82  str     r2, [sp, #4]
000d9e84  str     r3, [sp, #8]
000d9e86  mov     r2, r6
000d9e88  mov     r3, r5
000d9e8a  str     r4, [sp, #0xc]
000d9e8c  str     r4, [sp, #0x10]
000d9e8e  str     r4, [sp, #0x14]
000d9e90  str     r4, [sp, #0x18]
000d9e92  str     r4, [sp, #0x1c]
000d9e94  str     r0, [sp]
000d9e96  mov     r0, sl
000d9e98  blx     #0xddbfc ; -> objc_msgSend
000d9e9c  ldr     r3, [pc, #0x74]
000d9e9e  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9ea0  ldr     r0, [r3]
000d9ea2  ldr     r2, [r5, r0]
000d9ea4  ldr     r3, [r2, #4]
000d9ea6  subs    r1, r3, #3
000d9ea8  cmp     r1, #1
000d9eaa  bhi     #0xd9eb2
000d9eac  ldr     r4, [r2, #0x28]
000d9eae  movs    r6, #0
000d9eb0  b       #0xd9ec0
000d9eb2  ldr     r0, [r2, #0x20]
000d9eb4  ldr     r1, [r2, #0xc]
000d9eb6  movs    r2, #1
000d9eb8  blx     #0xddea8 ; -> xmlNodeListGetString
000d9ebc  movs    r6, #1
000d9ebe  mov     r4, r0
000d9ec0  cbnz    r4, #0xd9ec6
000d9ec2  mov     r5, r4
000d9ec4  b       #0xd9ee8
000d9ec6  ldr     r0, [pc, #0x50]
000d9ec8  ldr     r1, [pc, #0x50]
000d9eca  mov     r2, r4
000d9ecc  add     r0, pc ; -> 0x000fdb5c  
000d9ece  add     r1, pc ; -> 0x000fd77c  
000d9ed0  ldr     r0, [r0]
000d9ed2  ldr     r1, [r1]
000d9ed4  blx     #0xddbfc ; -> objc_msgSend
000d9ed8  mov     r5, r0
000d9eda  cbz     r6, #0xd9ee8
000d9edc  ldr     r3, [pc, #0x40]
000d9ede  mov     r0, r4
000d9ee0  add     r3, pc ; -> 0x000f334c  0x0
000d9ee2  ldr     r3, [r3]
000d9ee4  ldr     r3, [r3]
000d9ee6  blx     r3
000d9ee8  mov     r0, r5
000d9eea  sub.w   sp, r7, #0x14
000d9eee  pop.w   {r8, sl}
000d9ef2  pop     {r4, r5, r6, r7, pc}
000d9ef4  movs    r1, #0xe0
000d9ef6  movs    r2, r0
000d9ef8  subs    r6, #0x80
000d9efa  movs    r2, r0
000d9efc  subs    r2, #0xa
000d9efe  movs    r2, r0
000d9f00  subs    r1, #0xf8
000d9f02  movs    r2, r0
000d9f04  subs    r0, #0x9a
000d9f06  movs    r1, r0
000d9f08  subs    r1, #0xe
000d9f0a  movs    r2, r0
000d9f0c  subs    r4, #0xe6
000d9f0e  movs    r2, r0
000d9f10  ldrh    r0, [r0]
000d9f12  movs    r2, r1
000d9f14  movs    r1, #0x86
000d9f16  movs    r2, r0
000d9f18  subs    r4, #0x8c
000d9f1a  movs    r2, r0
000d9f1c  subs    r0, #0xaa
000d9f1e  movs    r2, r0
000d9f20  str     r4, [sp, #0x1a0]
000d9f22  movs    r1, r0
