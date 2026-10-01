========================================================================
-[CXMLDocument description]  0x000d929c  340 bytes   CXMLDocument.m
========================================================================

000d929c  push    {r4, r5, r6, r7, lr}
000d929e  add     r7, sp, #0xc
000d92a0  push.w  {r8, sl, fp}
000d92a4  sub     sp, #0x28
000d92a6  ldr     r3, [pc, #0x100]
000d92a8  mov     r5, r0
000d92aa  mov     r6, r1
000d92ac  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d92ae  ldr.w   sl, [r3]
000d92b2  ldr.w   r3, [sl]
000d92b6  ldr     r4, [r0, r3]
000d92b8  cbnz    r4, #0xd930a
000d92ba  ldr     r0, [pc, #0xf0]
000d92bc  ldr     r1, [pc, #0xf0]
000d92be  add     r0, pc ; -> 0x000fdcd4  
000d92c0  add     r1, pc ; -> 0x000fd860  
000d92c2  ldr     r0, [r0]
000d92c4  ldr     r1, [r1]
000d92c6  blx     #0xddbfc ; -> objc_msgSend
000d92ca  ldr     r1, [pc, #0xe8]
000d92cc  ldr     r2, [pc, #0xe8]
000d92ce  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d92d0  add     r2, pc ; -> 0x000ec400  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLDocument.m'
000d92d2  ldr.w   r8, [r1]
000d92d6  ldr     r1, [pc, #0xe4]
000d92d8  add     r1, pc ; -> 0x000fd77c  
000d92da  ldr     r1, [r1]
000d92dc  mov     fp, r0
000d92de  ldr     r0, [pc, #0xe0]
000d92e0  add     r0, pc ; -> 0x000fdb5c  
000d92e2  ldr     r0, [r0]
000d92e4  blx     #0xddbfc ; -> objc_msgSend
000d92e8  ldr     r3, [pc, #0xd8]
000d92ea  movs    r2, #0xeb
000d92ec  mov     r1, r8
000d92ee  add     r3, pc ; -> 0x00181f34  
000d92f0  str     r2, [sp, #4]
000d92f2  str     r3, [sp, #8]
000d92f4  mov     r2, r6
000d92f6  mov     r3, r5
000d92f8  str     r4, [sp, #0xc]
000d92fa  str     r4, [sp, #0x10]
000d92fc  str     r4, [sp, #0x14]
000d92fe  str     r4, [sp, #0x18]
000d9300  str     r4, [sp, #0x1c]
000d9302  str     r0, [sp]
000d9304  mov     r0, fp
000d9306  blx     #0xddbfc ; -> objc_msgSend
000d930a  ldr     r1, [pc, #0xbc]
000d930c  ldr     r0, [pc, #0xbc]
000d930e  ldr     r4, [pc, #0xc0]
000d9310  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d9312  add     r0, pc ; -> 0x000fdbf8  
000d9314  ldr     r6, [r1]
000d9316  ldr     r1, [pc, #0xbc]
000d9318  ldr.w   r8, [r0]
000d931c  mov     r0, r5
000d931e  add     r1, pc ; -> 0x000fca0c  '@\t\x0e'
000d9320  add     r4, pc ; -> 0x00181f54  
000d9322  ldr     r1, [r1]
000d9324  blx     #0xddbfc ; -> objc_msgSend
000d9328  blx     #0xdd404 ; -> NSStringFromClass
000d932c  str     r5, [sp]
000d932e  ldr.w   r2, [sl]
000d9332  mov     r1, r6
000d9334  ldr     r2, [r5, r2]
000d9336  str     r2, [sp, #4]
000d9338  mov     r2, r4
000d933a  mov     r3, r0
000d933c  mov     r0, r8
000d933e  blx     #0xddbfc ; -> objc_msgSend
000d9342  add     r2, sp, #0x20
000d9344  movs    r3, #1
000d9346  add     r1, sp, #0x24
000d9348  mov     r6, r0
000d934a  ldr.w   r0, [sl]
000d934e  ldr     r0, [r5, r0]
000d9350  blx     #0xdde54 ; -> xmlDocDumpFormatMemory
000d9354  ldr     r0, [pc, #0x80]
000d9356  ldr     r1, [pc, #0x84]
000d9358  add     r0, pc ; -> 0x000fdb5c  
000d935a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d935c  ldr     r0, [r0]
000d935e  ldr     r1, [r1]
000d9360  blx     #0xddbfc ; -> objc_msgSend
000d9364  ldr     r1, [pc, #0x78]
000d9366  ldr     r2, [sp, #0x24]
000d9368  movs    r3, #4
000d936a  add     r1, pc ; -> 0x000fd83c  
000d936c  str     r3, [sp]
000d936e  ldr     r1, [r1]
000d9370  ldr     r3, [sp, #0x20]
000d9372  blx     #0xddbfc ; -> objc_msgSend
000d9376  ldr     r1, [pc, #0x6c]
000d9378  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000d937a  ldr     r1, [r1]
000d937c  blx     #0xddbfc ; -> objc_msgSend
000d9380  ldr     r3, [pc, #0x64]
000d9382  add     r3, pc ; -> 0x000f334c  0x0
000d9384  ldr     r3, [r3]
000d9386  ldr     r3, [r3]
000d9388  mov     r4, r0
000d938a  ldr     r0, [sp, #0x24]
000d938c  blx     r3
000d938e  ldr     r1, [pc, #0x5c]
000d9390  mov     r0, r6
000d9392  mov     r2, r4
000d9394  add     r1, pc ; -> 0x000fce7c  'N=\x0e'
000d9396  ldr     r1, [r1]
000d9398  blx     #0xddbfc ; -> objc_msgSend
000d939c  mov     r0, r6
000d939e  sub.w   sp, r7, #0x18
000d93a2  pop.w   {r8, sl, fp}
000d93a6  pop     {r4, r5, r6, r7, pc}
000d93a8  adr     r0, #0x280
000d93aa  movs    r1, r0
000d93ac  ldr     r2, [pc, #0x48]
000d93ae  movs    r2, r0
000d93b0  cmp     ip, r3
000d93b2  movs    r2, r0
000d93b4  cmp     sl, r1
000d93b6  movs    r2, r0
000d93b8  adds    r1, #0x2c
000d93ba  movs    r1, r0
000d93bc  add     r8, r4
000d93be  movs    r2, r0
000d93c0  ldr     r0, [pc, #0x1e0]
000d93c2  movs    r2, r0
000d93c4  ldrh    r2, [r0, #0x22]
000d93c6  movs    r2, r1
000d93c8  adds    r7, #0x8c
000d93ca  movs    r2, r0
000d93cc  ldr     r0, [pc, #0x388]
000d93ce  movs    r2, r0
000d93d0  ldrh    r0, [r6, #0x20]
000d93d2  movs    r2, r1
000d93d4  adds    r6, #0xea
000d93d6  movs    r2, r0
000d93d8  ldr     r0, [pc, #0]
000d93da  movs    r2, r0
000d93dc  adds    r6, #0x26
000d93de  movs    r2, r0
000d93e0  add     lr, sb
000d93e2  movs    r2, r0
000d93e4  adds    r6, #0xdc
000d93e6  movs    r2, r0
000d93e8  ldr     r7, [sp, #0x318]
000d93ea  movs    r1, r0
000d93ec  subs    r2, #0xe4
000d93ee  movs    r2, r0
