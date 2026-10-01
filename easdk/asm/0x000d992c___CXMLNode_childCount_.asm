========================================================================
-[CXMLNode childCount]  0x000d992c  176 bytes   CXMLNode.m
========================================================================

000d992c  push    {r4, r5, r6, r7, lr}
000d992e  add     r7, sp, #0xc
000d9930  push.w  {r8, sl}
000d9934  sub     sp, #0x20
000d9936  ldr     r3, [pc, #0x80]
000d9938  mov     r5, r0
000d993a  mov     r6, r1
000d993c  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d993e  ldr     r3, [r3]
000d9940  ldr     r4, [r0, r3]
000d9942  cbnz    r4, #0xd9994
000d9944  ldr     r0, [pc, #0x74]
000d9946  ldr     r1, [pc, #0x78]
000d9948  add     r0, pc ; -> 0x000fdcd4  
000d994a  add     r1, pc ; -> 0x000fd860  
000d994c  ldr     r0, [r0]
000d994e  ldr     r1, [r1]
000d9950  blx     #0xddbfc ; -> objc_msgSend
000d9954  ldr     r1, [pc, #0x6c]
000d9956  ldr     r2, [pc, #0x70]
000d9958  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d995a  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d995c  ldr.w   r8, [r1]
000d9960  ldr     r1, [pc, #0x68]
000d9962  add     r1, pc ; -> 0x000fd77c  
000d9964  ldr     r1, [r1]
000d9966  mov     sl, r0
000d9968  ldr     r0, [pc, #0x64]
000d996a  add     r0, pc ; -> 0x000fdb5c  
000d996c  ldr     r0, [r0]
000d996e  blx     #0xddbfc ; -> objc_msgSend
000d9972  ldr     r3, [pc, #0x60]
000d9974  movs    r2, #0x9d
000d9976  mov     r1, r8
000d9978  add     r3, pc ; -> 0x00182684  
000d997a  str     r2, [sp, #4]
000d997c  str     r3, [sp, #8]
000d997e  mov     r2, r6
000d9980  mov     r3, r5
000d9982  str     r4, [sp, #0xc]
000d9984  str     r4, [sp, #0x10]
000d9986  str     r4, [sp, #0x14]
000d9988  str     r4, [sp, #0x18]
000d998a  str     r4, [sp, #0x1c]
000d998c  str     r0, [sp]
000d998e  mov     r0, sl
000d9990  blx     #0xddbfc ; -> objc_msgSend
000d9994  ldr     r3, [pc, #0x40]
000d9996  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9998  ldr     r0, [r3]
000d999a  movs    r3, #0
000d999c  ldr     r0, [r5, r0]
000d999e  ldr     r0, [r0, #0xc]
000d99a0  b       #0xd99a6
000d99a2  ldr     r0, [r0, #0x18]
000d99a4  adds    r3, #1
000d99a6  cmp     r0, #0
000d99a8  bne     #0xd99a2
000d99aa  mov     r0, r3
000d99ac  sub.w   sp, r7, #0x14
000d99b0  pop.w   {r8, sl}
000d99b4  pop     {r4, r5, r6, r7, pc}
000d99b6  nop     
000d99b8  movs    r6, #0xe8
000d99ba  movs    r2, r0
000d99bc  bics    r0, r1
000d99be  movs    r2, r0
000d99c0  subs    r7, #0x12
000d99c2  movs    r2, r0
000d99c4  subs    r7, #0
000d99c6  movs    r2, r0
000d99c8  subs    r5, #0xa2
000d99ca  movs    r1, r0
000d99cc  subs    r6, #0x16
000d99ce  movs    r2, r0
000d99d0  rors    r6, r5
000d99d2  movs    r2, r0
000d99d4  ldrh    r0, [r1, #0x28]
000d99d6  movs    r2, r1
000d99d8  movs    r6, #0x8e
000d99da  movs    r2, r0
