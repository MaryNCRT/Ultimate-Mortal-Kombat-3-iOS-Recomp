========================================================================
-[CXMLDocument XMLDataWithOptions  0x000d9244  88 bytes   CXMLDocument.m
========================================================================

000d9244  push    {r4, r7, lr}
000d9246  add     r7, sp, #4
000d9248  sub     sp, #8
000d924a  movs    r3, #0
000d924c  str     r3, [sp, #4]
000d924e  str     r3, [sp]
000d9250  ldr     r3, [pc, #0x38]
000d9252  add     r1, sp, #4
000d9254  mov     r2, sp
000d9256  add     r3, pc ; -> 0x000f3350  OBJC_IVAR_$_CXMLNode._node
000d9258  ldr     r3, [r3]
000d925a  ldr     r3, [r3]
000d925c  ldr     r0, [r0, r3]
000d925e  blx     #0xdde60 ; -> xmlDocDumpMemory
000d9262  ldr     r0, [pc, #0x2c]
000d9264  ldr     r1, [pc, #0x2c]
000d9266  ldr     r2, [sp, #4]
000d9268  add     r0, pc ; -> 0x000fdb6c  
000d926a  add     r1, pc ; -> 0x000fca88  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x110
000d926c  ldr     r3, [sp]
000d926e  ldr     r1, [r1]
000d9270  ldr     r0, [r0]
000d9272  blx     #0xddbfc ; -> objc_msgSend
000d9276  ldr     r3, [pc, #0x20]
000d9278  add     r3, pc ; -> 0x000f334c  0x0
000d927a  ldr     r3, [r3]
000d927c  ldr     r3, [r3]
000d927e  mov     r4, r0
000d9280  ldr     r0, [sp, #4]
000d9282  blx     r3
000d9284  mov     r0, r4
000d9286  sub.w   sp, r7, #4
000d928a  pop     {r4, r7, pc}
000d928c  adr     r0, #0x3d8
000d928e  movs    r1, r0
000d9290  ldr     r1, [pc, #0]
000d9292  movs    r2, r0
000d9294  subs    r0, #0x1a
000d9296  movs    r2, r0
000d9298  adr     r0, #0x340
000d929a  movs    r1, r0
