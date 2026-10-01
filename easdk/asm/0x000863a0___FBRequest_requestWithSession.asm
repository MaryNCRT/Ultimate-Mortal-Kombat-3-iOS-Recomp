========================================================================
+[FBRequest requestWithSession  0x000863a0  84 bytes   FBRequest.m
========================================================================

000863a0  push    {r4, r5, r7, lr}
000863a2  add     r7, sp, #8
000863a4  ldr     r0, [pc, #0x38]
000863a6  ldr     r1, [pc, #0x3c]
000863a8  mov     r5, r3
000863aa  add     r0, pc ; -> 0x000fdbf0  
000863ac  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000863ae  ldr     r0, [r0]
000863b0  ldr     r1, [r1]
000863b2  mov     r4, r2
000863b4  blx     #0xddbfc ; -> objc_msgSend
000863b8  ldr     r1, [pc, #0x2c]
000863ba  mov     r2, r4
000863bc  add     r1, pc ; -> 0x000fccd8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x360
000863be  ldr     r1, [r1]
000863c0  blx     #0xddbfc ; -> objc_msgSend
000863c4  ldr     r1, [pc, #0x24]
000863c6  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
000863c8  ldr     r1, [r1]
000863ca  blx     #0xddbfc ; -> objc_msgSend
000863ce  ldr     r1, [pc, #0x20]
000863d0  mov     r2, r5
000863d2  add     r1, pc ; -> 0x000fcc78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x300
000863d4  ldr     r1, [r1]
000863d6  mov     r4, r0
000863d8  blx     #0xddbfc ; -> objc_msgSend
000863dc  mov     r0, r4
000863de  pop     {r4, r5, r7, pc}
000863e0  ldrb    r2, [r0, #1]
000863e2  movs    r7, r0
000863e4  str     r4, [r2, #0x5c]
000863e6  movs    r7, r0
000863e8  ldr     r0, [r3, #0x10]
000863ea  movs    r7, r0
000863ec  str     r6, [r1, #0x68]
000863ee  movs    r7, r0
000863f0  ldr     r2, [r4, #8]
000863f2  movs    r7, r0
