========================================================================
-[CXMLNode children]  0x000d9830  252 bytes   CXMLNode.m
========================================================================

000d9830  push    {r4, r5, r6, r7, lr}
000d9832  add     r7, sp, #0xc
000d9834  push.w  {r8, sl}
000d9838  sub     sp, #0x20
000d983a  ldr     r3, [pc, #0xb8]
000d983c  mov     r5, r0
000d983e  mov     r6, r1
000d9840  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d9842  ldr     r3, [r3]
000d9844  ldr     r4, [r0, r3]
000d9846  cbnz    r4, #0xd9898
000d9848  ldr     r0, [pc, #0xac]
000d984a  ldr     r1, [pc, #0xb0]
000d984c  add     r0, pc ; -> 0x000fdcd4  
000d984e  add     r1, pc ; -> 0x000fd860  
000d9850  ldr     r0, [r0]
000d9852  ldr     r1, [r1]
000d9854  blx     #0xddbfc ; -> objc_msgSend
000d9858  ldr     r1, [pc, #0xa4]
000d985a  ldr     r2, [pc, #0xa8]
000d985c  add     r1, pc ; -> 0x000fd85c  'J\x10\x0f'
000d985e  add     r2, pc ; -> 0x000ed700  '/Users/dchuang/P4/Clean/eamtx_iphone/DL/main/Source/TouchXML/CXMLNode.m'
000d9860  ldr.w   r8, [r1]
000d9864  ldr     r1, [pc, #0xa0]
000d9866  add     r1, pc ; -> 0x000fd77c  
000d9868  ldr     r1, [r1]
000d986a  mov     sl, r0
000d986c  ldr     r0, [pc, #0x9c]
000d986e  add     r0, pc ; -> 0x000fdb5c  
000d9870  ldr     r0, [r0]
000d9872  blx     #0xddbfc ; -> objc_msgSend
000d9876  ldr     r3, [pc, #0x98]
000d9878  movs    r2, #0xa8
000d987a  mov     r1, r8
000d987c  add     r3, pc ; -> 0x00182684  
000d987e  str     r2, [sp, #4]
000d9880  str     r3, [sp, #8]
000d9882  mov     r2, r6
000d9884  mov     r3, r5
000d9886  str     r4, [sp, #0xc]
000d9888  str     r4, [sp, #0x10]
000d988a  str     r4, [sp, #0x14]
000d988c  str     r4, [sp, #0x18]
000d988e  str     r4, [sp, #0x1c]
000d9890  str     r0, [sp]
000d9892  mov     r0, sl
000d9894  blx     #0xddbfc ; -> objc_msgSend
000d9898  ldr     r0, [pc, #0x78]
000d989a  ldr     r1, [pc, #0x7c]
000d989c  add     r0, pc ; -> 0x000fdb70  
000d989e  add     r1, pc ; -> 0x000fcd24  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x3ac
000d98a0  ldr     r0, [r0]
000d98a2  ldr     r1, [r1]
000d98a4  blx     #0xddbfc ; -> objc_msgSend
000d98a8  ldr     r3, [pc, #0x70]
000d98aa  ldr     r1, [pc, #0x74]
000d98ac  add     r3, pc ; -> 0x000fc028  OBJC_IVAR_$_CXMLNode._node
000d98ae  add     r1, pc ; -> 0x000fd84c  
000d98b0  ldr     r6, [r1]
000d98b2  ldr     r1, [pc, #0x70]
000d98b4  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000d98b6  mov     sl, r0
000d98b8  ldr     r0, [r3]
000d98ba  ldr     r0, [r5, r0]
000d98bc  ldr     r5, [r1]
000d98be  ldr     r4, [r0, #0xc]
000d98c0  ldr     r0, [pc, #0x64]
000d98c2  add     r0, pc ; -> 0x000fdcd8  
000d98c4  ldr.w   r8, [r0]
000d98c8  b       #0xd98e2
000d98ca  mov     r2, r4
000d98cc  mov     r1, r6
000d98ce  movs    r3, #0
000d98d0  mov     r0, r8
000d98d2  blx     #0xddbfc ; -> objc_msgSend
000d98d6  mov     r1, r5
000d98d8  mov     r2, r0
000d98da  mov     r0, sl
000d98dc  blx     #0xddbfc ; -> objc_msgSend
000d98e0  ldr     r4, [r4, #0x18]
000d98e2  cmp     r4, #0
000d98e4  bne     #0xd98ca
000d98e6  mov     r0, sl
000d98e8  sub.w   sp, r7, #0x14
000d98ec  pop.w   {r8, sl}
000d98f0  pop     {r4, r5, r6, r7, pc}
000d98f2  nop     
000d98f4  movs    r7, #0xe4
000d98f6  movs    r2, r0
000d98f8  add     ip, r0
000d98fa  movs    r2, r0
000d98fc  ands    r6, r1
000d98fe  movs    r2, r0
000d9900  subs    r7, #0xfc
000d9902  movs    r2, r0
000d9904  subs    r6, #0x9e
000d9906  movs    r1, r0
000d9908  subs    r7, #0x12
000d990a  movs    r2, r0
000d990c  cmn     r2, r5
000d990e  movs    r2, r0
000d9910  ldrh    r4, [r0, #0x30]
000d9912  movs    r2, r1
000d9914  cmn     r0, r2
000d9916  movs    r2, r0
000d9918  adds    r4, #0x82
000d991a  movs    r2, r0
000d991c  movs    r7, #0x78
000d991e  movs    r2, r0
000d9920  subs    r7, #0x9a
000d9922  movs    r2, r0
000d9924  adds    r1, #0xcc
000d9926  movs    r2, r0
000d9928  add     r2, r2
000d992a  movs    r2, r0
