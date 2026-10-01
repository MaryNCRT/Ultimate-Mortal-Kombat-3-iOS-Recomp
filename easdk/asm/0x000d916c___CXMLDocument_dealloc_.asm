========================================================================
-[CXMLDocument dealloc]  0x000d916c  164 bytes   CXMLDocument.m
========================================================================

000d916c  push    {r4, r5, r6, r7, lr}
000d916e  add     r7, sp, #0xc
000d9170  push.w  {r8, sl}
000d9174  sub     sp, #8
000d9176  ldr     r1, [pc, #0x78]
000d9178  mov     r6, r0
000d917a  ldr     r0, [pc, #0x78]
000d917c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d917e  ldr     r4, [pc, #0x78]
000d9180  add     r0, pc ; -> 0x000fdb3c  
000d9182  ldr     r1, [r1]
000d9184  ldr     r0, [r0]
000d9186  blx     #0xddbfc ; -> objc_msgSend
000d918a  ldr     r1, [pc, #0x70]
000d918c  add     r4, pc ; -> 0x000fbe98  OBJC_IVAR_$_CXMLDocument.nodePool
000d918e  mov.w   sl, #0
000d9192  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000d9194  ldr     r1, [r1]
000d9196  blx     #0xddbfc ; -> objc_msgSend
000d919a  ldr     r1, [pc, #0x64]
000d919c  ldr     r3, [r4]
000d919e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000d91a0  ldr     r5, [r1]
000d91a2  mov     r1, r5
000d91a4  mov     r8, r0
000d91a6  ldr     r0, [r6, r3]
000d91a8  blx     #0xddbfc ; -> objc_msgSend
000d91ac  ldr     r3, [r4]
000d91ae  mov     r1, r5
000d91b0  mov     r0, r8
000d91b2  str.w   sl, [r6, r3]
000d91b6  blx     #0xddbfc ; -> objc_msgSend
000d91ba  ldr     r3, [pc, #0x48]
000d91bc  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d91be  ldr     r4, [r3]
000d91c0  ldr     r3, [r4]
000d91c2  ldr     r0, [r6, r3]
000d91c4  blx     #0xdde78 ; -> xmlFreeDoc
000d91c8  ldr     r3, [r4]
000d91ca  ldr     r1, [pc, #0x3c]
000d91cc  mov     r0, sp
000d91ce  str     r6, [sp]
000d91d0  str.w   sl, [r6, r3]
000d91d4  ldr     r3, [pc, #0x34]
000d91d6  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000d91d8  add     r3, pc ; -> 0x000fddf4  
000d91da  ldr     r1, [r1]
000d91dc  ldr     r3, [r3]
000d91de  str     r3, [sp, #4]
000d91e0  blx     #0xddc08 ; -> objc_msgSendSuper2
000d91e4  sub.w   sp, r7, #0x14
000d91e8  pop.w   {r8, sl}
000d91ec  pop     {r4, r5, r6, r7, pc}
000d91ee  nop     
000d91f0  subs    r0, #4
000d91f2  movs    r2, r0
000d91f4  ldr     r1, [pc, #0x2e0]
000d91f6  movs    r2, r0
000d91f8  cmp     r5, #8
000d91fa  movs    r2, r0
000d91fc  adds    r7, #0xea
000d91fe  movs    r2, r0
000d9200  adds    r7, #0xda
000d9202  movs    r2, r0
000d9204  adr     r1, #0x240
000d9206  movs    r1, r0
000d9208  adds    r7, #0xc6
000d920a  movs    r2, r0
000d920c  ldr     r4, [pc, #0x60]
000d920e  movs    r2, r0
