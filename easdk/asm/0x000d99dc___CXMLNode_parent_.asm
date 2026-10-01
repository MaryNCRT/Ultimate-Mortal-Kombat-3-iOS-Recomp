========================================================================
-[CXMLNode parent]  0x000d99dc  164 bytes   CXMLNode.m
========================================================================

000d99dc  push    {r4, r5, r6, r7, lr}
000d99de  add     r7, sp, #0xc
000d99e0  push.w  {r8, sl}
000d99e4  sub     sp, #0x20
000d99e6  ldr     r3, [pc, #0x74]
000d99e8  mov     r5, r0
000d99ea  mov     r6, r1
000d99ec  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d99ee  ldr     r3, [r3]
000d99f0  ldr     r4, [r0, r3]
000d99f2  cbnz    r4, #0xd9a44
000d99f4  ldr     r0, [pc, #0x68]
000d99f6  ldr     r1, [pc, #0x6c]
000d99f8  add     r0, pc ; -> 0x000fdcd4  
000d99fa  add     r1, pc ; -> 0x000fd860  
000d99fc  ldr     r0, [r0]
000d99fe  ldr     r1, [r1]
000d9a00  blx     #0xddbfc ; -> objc_msgSend
000d9a04  ldr     r1, [pc, #0x60]
000d9a06  ldr     r2, [pc, #0x64]
000d9a08  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9a0a  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9a0c  ldr.w   r8, [r1]
000d9a10  ldr     r1, [pc, #0x5c]
000d9a12  add     r1, pc ; -> 0x000fd77c  
000d9a14  ldr     r1, [r1]
000d9a16  mov     sl, r0
000d9a18  ldr     r0, [pc, #0x58]
000d9a1a  add     r0, pc ; -> 0x000fdb5c  
000d9a1c  ldr     r0, [r0]
000d9a1e  blx     #0xddbfc ; -> objc_msgSend
000d9a22  ldr     r3, [pc, #0x54]
000d9a24  movs    r2, #0x93
000d9a26  mov     r1, r8
000d9a28  add     r3, pc ; -> 0x00182684  
000d9a2a  str     r2, [sp, #4]
000d9a2c  str     r3, [sp, #8]
000d9a2e  mov     r2, r6
000d9a30  mov     r3, r5
000d9a32  str     r4, [sp, #0xc]
000d9a34  str     r4, [sp, #0x10]
000d9a36  str     r4, [sp, #0x14]
000d9a38  str     r4, [sp, #0x18]
000d9a3a  str     r4, [sp, #0x1c]
000d9a3c  str     r0, [sp]
000d9a3e  mov     r0, sl
000d9a40  blx     #0xddbfc ; -> objc_msgSend
000d9a44  ldr     r3, [pc, #0x34]
000d9a46  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9a48  ldr     r0, [r3]
000d9a4a  ldr     r0, [r5, r0]
000d9a4c  ldr     r0, [r0, #0x14]
000d9a4e  cbz     r0, #0xd9a52
000d9a50  ldr     r0, [r0]
000d9a52  sub.w   sp, r7, #0x14
000d9a56  pop.w   {r8, sl}
000d9a5a  pop     {r4, r5, r6, r7, pc}
000d9a5c  movs    r6, #0x38
000d9a5e  movs    r2, r0
000d9a60  cmn     r0, r3
000d9a62  movs    r2, r0
000d9a64  subs    r6, #0x62
000d9a66  movs    r2, r0
000d9a68  subs    r6, #0x50
000d9a6a  movs    r2, r0
000d9a6c  subs    r4, #0xf2
000d9a6e  movs    r1, r0
000d9a70  subs    r5, #0x66
000d9a72  movs    r2, r0
000d9a74  asrs    r6, r7
000d9a76  movs    r2, r0
000d9a78  ldrh    r0, [r3, #0x22]
000d9a7a  movs    r2, r1
000d9a7c  movs    r5, #0xde
000d9a7e  movs    r2, r0
