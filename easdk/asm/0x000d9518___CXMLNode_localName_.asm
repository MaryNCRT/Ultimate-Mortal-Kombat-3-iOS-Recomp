========================================================================
-[CXMLNode localName]  0x000d9518  192 bytes   CXMLNode.m
========================================================================

000d9518  push    {r4, r5, r6, r7, lr}
000d951a  add     r7, sp, #0xc
000d951c  push.w  {r8, sl}
000d9520  sub     sp, #0x20
000d9522  ldr     r3, [pc, #0x88]
000d9524  mov     r5, r0
000d9526  mov     r6, r1
000d9528  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d952a  ldr     r3, [r3]
000d952c  ldr     r4, [r0, r3]
000d952e  cbnz    r4, #0xd9580
000d9530  ldr     r0, [pc, #0x7c]
000d9532  ldr     r1, [pc, #0x80]
000d9534  add     r0, pc ; -> 0x000fdcd4  
000d9536  add     r1, pc ; -> 0x000fd860  
000d9538  ldr     r0, [r0]
000d953a  ldr     r1, [r1]
000d953c  blx     #0xddbfc ; -> objc_msgSend
000d9540  ldr     r1, [pc, #0x74]
000d9542  ldr     r2, [pc, #0x78]
000d9544  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9546  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9548  ldr.w   r8, [r1]
000d954c  ldr     r1, [pc, #0x70]
000d954e  add     r1, pc ; -> 0x000fd77c  
000d9550  ldr     r1, [r1]
000d9552  mov     sl, r0
000d9554  ldr     r0, [pc, #0x6c]
000d9556  add     r0, pc ; -> 0x000fdb5c  
000d9558  ldr     r0, [r0]
000d955a  blx     #0xddbfc ; -> objc_msgSend
000d955e  ldr     r3, [pc, #0x68]
000d9560  movs    r2, #0xdc
000d9562  mov     r1, r8
000d9564  add     r3, pc ; -> 0x00182684  
000d9566  str     r2, [sp, #4]
000d9568  str     r3, [sp, #8]
000d956a  mov     r2, r6
000d956c  mov     r3, r5
000d956e  str     r4, [sp, #0xc]
000d9570  str     r4, [sp, #0x10]
000d9572  str     r4, [sp, #0x14]
000d9574  str     r4, [sp, #0x18]
000d9576  str     r4, [sp, #0x1c]
000d9578  str     r0, [sp]
000d957a  mov     r0, sl
000d957c  blx     #0xddbfc ; -> objc_msgSend
000d9580  ldr     r3, [pc, #0x48]
000d9582  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9584  ldr     r0, [r3]
000d9586  ldr     r0, [r5, r0]
000d9588  ldr     r2, [r0, #8]
000d958a  cbnz    r2, #0xd9590
000d958c  mov     r0, r2
000d958e  b       #0xd95a0
000d9590  ldr     r0, [pc, #0x3c]
000d9592  ldr     r1, [pc, #0x40]
000d9594  add     r0, pc ; -> 0x000fdb5c  
000d9596  add     r1, pc ; -> 0x000fd77c  
000d9598  ldr     r0, [r0]
000d959a  ldr     r1, [r1]
000d959c  blx     #0xddbfc ; -> objc_msgSend
000d95a0  sub.w   sp, r7, #0x14
000d95a4  pop.w   {r8, sl}
000d95a8  pop     {r4, r5, r6, r7, pc}
000d95aa  nop     
000d95ac  cmp     r2, #0xfc
000d95ae  movs    r2, r0
000d95b0  blxns   r3
000d95b2  movs    r2, r0
000d95b4  orrs    r6, r4
000d95b6  movs    r2, r0
000d95b8  orrs    r4, r2
000d95ba  movs    r2, r0
000d95bc  sbcs    r6, r6
000d95be  movs    r1, r0
000d95c0  tst     r2, r5
000d95c2  movs    r2, r0
000d95c4  mov     r2, r0
000d95c6  movs    r2, r0
000d95c8  str     r1, [sp, #0x70]
000d95ca  movs    r2, r1
000d95cc  cmp     r2, #0xa2
000d95ce  movs    r2, r0
000d95d0  cmp     ip, r8
000d95d2  movs    r2, r0
000d95d4  rors    r2, r4
000d95d6  movs    r2, r0
