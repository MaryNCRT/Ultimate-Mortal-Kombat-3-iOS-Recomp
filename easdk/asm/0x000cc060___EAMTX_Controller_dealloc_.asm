========================================================================
-[EAMTX_Controller dealloc]  0x000cc060  180 bytes   EAMTX_Controller.mm
========================================================================

000cc060  push    {r4, r5, r7, lr}
000cc062  add     r7, sp, #8
000cc064  sub     sp, #8
000cc066  ldr     r3, [pc, #0x84]
000cc068  ldr     r1, [pc, #0x84]
000cc06a  mov     r5, r0
000cc06c  add     r3, pc ; -> 0x000f8c24  OBJC_IVAR_$_EAMTX_Controller.requestStartTime
000cc06e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cc070  ldr     r3, [r3]
000cc072  ldr     r4, [r1]
000cc074  ldr     r0, [r0, r3]
000cc076  mov     r1, r4
000cc078  blx     #0xddbfc ; -> objc_msgSend
000cc07c  ldr     r3, [pc, #0x74]
000cc07e  mov     r1, r4
000cc080  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000cc082  ldr     r3, [r3]
000cc084  ldr     r0, [r5, r3]
000cc086  blx     #0xddbfc ; -> objc_msgSend
000cc08a  ldr     r3, [pc, #0x6c]
000cc08c  mov     r1, r4
000cc08e  add     r3, pc ; -> 0x000f8c18  OBJC_IVAR_$_EAMTX_Controller.responseQ
000cc090  ldr     r3, [r3]
000cc092  ldr     r0, [r5, r3]
000cc094  blx     #0xddbfc ; -> objc_msgSend
000cc098  ldr     r3, [pc, #0x60]
000cc09a  mov     r1, r4
000cc09c  add     r3, pc ; -> 0x000f8c1c  OBJC_IVAR_$_EAMTX_Controller.networkRequests
000cc09e  ldr     r3, [r3]
000cc0a0  ldr     r0, [r5, r3]
000cc0a2  blx     #0xddbfc ; -> objc_msgSend
000cc0a6  ldr     r3, [pc, #0x58]
000cc0a8  mov     r1, r4
000cc0aa  add     r3, pc ; -> 0x000f8c20  OBJC_IVAR_$_EAMTX_Controller.networkObjsDict
000cc0ac  ldr     r3, [r3]
000cc0ae  ldr     r0, [r5, r3]
000cc0b0  blx     #0xddbfc ; -> objc_msgSend
000cc0b4  ldr     r0, [pc, #0x4c]
000cc0b6  mov     r1, r4
000cc0b8  add     r0, pc ; -> 0x0038c1e0  dbPath
000cc0ba  ldr     r0, [r0]
000cc0bc  blx     #0xddbfc ; -> objc_msgSend
000cc0c0  ldr     r3, [pc, #0x44]
000cc0c2  mov     r1, r4
000cc0c4  add     r3, pc ; -> 0x000f8c28  OBJC_IVAR_$_EAMTX_Controller.processTimer
000cc0c6  ldr     r3, [r3]
000cc0c8  ldr     r0, [r5, r3]
000cc0ca  blx     #0xddbfc ; -> objc_msgSend
000cc0ce  ldr     r3, [pc, #0x3c]
000cc0d0  ldr     r1, [pc, #0x3c]
000cc0d2  mov     r0, sp
000cc0d4  add     r3, pc ; -> 0x000fdda4  
000cc0d6  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cc0d8  ldr     r3, [r3]
000cc0da  ldr     r1, [r1]
000cc0dc  str     r5, [sp]
000cc0de  str     r3, [sp, #4]
000cc0e0  blx     #0xddc08 ; -> objc_msgSendSuper2
000cc0e4  sub.w   sp, r7, #8
000cc0e8  pop     {r4, r5, r7, pc}
000cc0ea  nop     
000cc0ec  ldm     r3!, {r2, r4, r5, r7}
000cc0ee  movs    r2, r0
000cc0f0  lsrs    r2, r1, #4
000cc0f2  movs    r3, r0
000cc0f4  ldm     r3!, {r4, r7}
000cc0f6  movs    r2, r0
000cc0f8  ldm     r3!, {r1, r2, r7}
000cc0fa  movs    r2, r0
000cc0fc  ldm     r3, {r2, r3, r4, r5, r6}
000cc0fe  movs    r2, r0
000cc100  ldm     r3!, {r1, r4, r5, r6}
000cc102  movs    r2, r0
000cc104  lsls    r4, r4, #4
000cc106  movs    r4, r5
000cc108  ldm     r3!, {r5, r6}
000cc10a  movs    r2, r0
000cc10c  adds    r4, r1, #3
000cc10e  movs    r3, r0
000cc110  lsrs    r6, r0, #3
000cc112  movs    r3, r0
