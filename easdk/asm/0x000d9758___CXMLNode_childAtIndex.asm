========================================================================
-[CXMLNode childAtIndex  0x000d9758  216 bytes   CXMLNode.m
========================================================================

000d9758  push    {r4, r5, r6, r7, lr}
000d975a  add     r7, sp, #0xc
000d975c  push.w  {r8, sl, fp}
000d9760  sub     sp, #0x20
000d9762  ldr     r3, [pc, #0xa0]
000d9764  mov     r6, r0
000d9766  mov     r8, r1
000d9768  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d976a  mov     r4, r2
000d976c  ldr     r3, [r3]
000d976e  ldr     r5, [r0, r3]
000d9770  cbnz    r5, #0xd97c2
000d9772  ldr     r0, [pc, #0x94]
000d9774  ldr     r1, [pc, #0x94]
000d9776  add     r0, pc ; -> 0x000fdcd4  
000d9778  add     r1, pc ; -> 0x000fd860  
000d977a  ldr     r0, [r0]
000d977c  ldr     r1, [r1]
000d977e  blx     #0xddbfc ; -> objc_msgSend
000d9782  ldr     r1, [pc, #0x8c]
000d9784  ldr     r2, [pc, #0x8c]
000d9786  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d9788  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d978a  ldr.w   sl, [r1]
000d978e  ldr     r1, [pc, #0x88]
000d9790  add     r1, pc ; -> 0x000fd77c  
000d9792  ldr     r1, [r1]
000d9794  mov     fp, r0
000d9796  ldr     r0, [pc, #0x84]
000d9798  add     r0, pc ; -> 0x000fdb5c  
000d979a  ldr     r0, [r0]
000d979c  blx     #0xddbfc ; -> objc_msgSend
000d97a0  ldr     r3, [pc, #0x7c]
000d97a2  movs    r2, #0xb7
000d97a4  mov     r1, sl
000d97a6  add     r3, pc ; -> 0x00182684  
000d97a8  str     r2, [sp, #4]
000d97aa  str     r3, [sp, #8]
000d97ac  mov     r2, r8
000d97ae  mov     r3, r6
000d97b0  str     r5, [sp, #0xc]
000d97b2  str     r5, [sp, #0x10]
000d97b4  str     r5, [sp, #0x14]
000d97b6  str     r5, [sp, #0x18]
000d97b8  str     r5, [sp, #0x1c]
000d97ba  str     r0, [sp]
000d97bc  mov     r0, fp
000d97be  blx     #0xddbfc ; -> objc_msgSend
000d97c2  ldr     r3, [pc, #0x60]
000d97c4  movs    r1, #0
000d97c6  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d97c8  ldr     r0, [r3]
000d97ca  ldr     r0, [r6, r0]
000d97cc  ldr     r2, [r0, #0xc]
000d97ce  b       #0xd97d4
000d97d0  ldr     r2, [r2, #0x18]
000d97d2  adds    r1, #1
000d97d4  subs    r0, r2, #0
000d97d6  it      ne
000d97d8  movne   r0, #1
000d97da  cmp     r1, r4
000d97dc  ite     eq
000d97de  moveq   r3, #0
000d97e0  andne   r3, r0, #1
000d97e4  cmp     r3, #0
000d97e6  bne     #0xd97d0
000d97e8  cbz     r0, #0xd97fa
000d97ea  ldr     r0, [pc, #0x3c]
000d97ec  ldr     r1, [pc, #0x3c]
000d97ee  add     r0, pc ; -> 0x000fdcd8  
000d97f0  add     r1, pc ; -> 0x000fd84c  
000d97f2  ldr     r0, [r0]
000d97f4  ldr     r1, [r1]
000d97f6  blx     #0xddbfc ; -> objc_msgSend
000d97fa  sub.w   sp, r7, #0x18
000d97fe  pop.w   {r8, sl, fp}
000d9802  pop     {r4, r5, r6, r7, pc}
000d9804  cmp     r0, #0xbc
000d9806  movs    r2, r0
000d9808  cmp     r2, fp
000d980a  movs    r2, r0
000d980c  lsrs    r4, r4
000d980e  movs    r2, r0
000d9810  lsrs    r2, r2
000d9812  movs    r2, r0
000d9814  subs    r7, #0x74
000d9816  movs    r1, r0
000d9818  subs    r7, #0xe8
000d981a  movs    r2, r0
000d981c  mvns    r0, r0
000d981e  movs    r2, r0
000d9820  ldrh    r2, [r3, #0x36]
000d9822  movs    r2, r1
000d9824  cmp     r0, #0x5e
000d9826  movs    r2, r0
000d9828  add     lr, ip
000d982a  movs    r2, r0
000d982c  eors    r0, r3
000d982e  movs    r2, r0
