========================================================================
-[EAMTX_Controller isHWIDReqInQ]  0x000ca874  200 bytes   EAMTX_Controller.mm
========================================================================

000ca874  push    {r4, r5, r6, r7, lr}
000ca876  add     r7, sp, #0xc
000ca878  push.w  {r8, sl, fp}
000ca87c  sub     sp, #8
000ca87e  ldr     r3, [pc, #0x9c]
000ca880  mov     r6, r0
000ca882  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca884  ldr     r0, [r3]
000ca886  ldr     r0, [r6, r0]
000ca888  cmp     r0, #0
000ca88a  beq     #0xca8f6
000ca88c  ldr     r1, [pc, #0x90]
000ca88e  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000ca890  ldr.w   r8, [r1]
000ca894  mov     r1, r8
000ca896  blx     #0xddbfc ; -> objc_msgSend
000ca89a  cmp     r0, #0
000ca89c  beq     #0xca8f6
000ca89e  ldr     r1, [pc, #0x84]
000ca8a0  ldr     r3, [pc, #0x84]
000ca8a2  movs    r5, #0
000ca8a4  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000ca8a6  ldr.w   sl, [r1]
000ca8aa  ldr     r1, [pc, #0x80]
000ca8ac  str     r3, [sp]
000ca8ae  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ca8b0  ldr     r1, [r1]
000ca8b2  str     r1, [sp, #4]
000ca8b4  ldr     r1, [pc, #0x78]
000ca8b6  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000ca8b8  ldr.w   fp, [r1]
000ca8bc  b       #0xca8e4
000ca8be  ldr     r3, [r4]
000ca8c0  mov     r1, sl
000ca8c2  mov     r2, r5
000ca8c4  ldr     r0, [r6, r3]
000ca8c6  blx     #0xddbfc ; -> objc_msgSend
000ca8ca  mov     r4, r0
000ca8cc  cbz     r0, #0xca8e2
000ca8ce  ldr     r2, [pc, #0x64]
000ca8d0  ldr     r1, [sp, #4]
000ca8d2  add     r2, pc ; -> 0x00180634  
000ca8d4  blx     #0xddbfc ; -> objc_msgSend
000ca8d8  mov     r1, fp
000ca8da  blx     #0xddbfc ; -> objc_msgSend
000ca8de  cmp     r0, #0
000ca8e0  ble     #0xca8fa
000ca8e2  adds    r5, #1
000ca8e4  ldr     r4, [sp]
000ca8e6  mov     r1, r8
000ca8e8  add     r4, pc
000ca8ea  ldr     r3, [r4]
000ca8ec  ldr     r0, [r6, r3]
000ca8ee  blx     #0xddbfc ; -> objc_msgSend
000ca8f2  cmp     r0, r5
000ca8f4  bhi     #0xca8be
000ca8f6  movs    r0, #0
000ca8f8  b       #0xca912
000ca8fa  ldr     r2, [pc, #0x3c]
000ca8fc  ldr     r1, [sp, #4]
000ca8fe  mov     r0, r4
000ca900  add     r2, pc ; -> 0x001805e4  
000ca902  blx     #0xddbfc ; -> objc_msgSend
000ca906  mov     r1, fp
000ca908  blx     #0xddbfc ; -> objc_msgSend
000ca90c  cmp     r0, #6
000ca90e  bne     #0xca8e2
000ca910  subs    r0, #5
000ca912  sub.w   sp, r7, #0x18
000ca916  pop.w   {r8, sl, fp}
000ca91a  pop     {r4, r5, r6, r7, pc}
000ca91c  b       #0xcb03c
000ca91e  movs    r2, r0
000ca920  movs    r1, #0xee
000ca922  movs    r3, r0
000ca924  movs    r1, #0xd4
000ca926  movs    r3, r0
000ca928  b       #0xcaf7c
000ca92a  movs    r2, r0
000ca92c  movs    r2, #0x3e
000ca92e  movs    r3, r0
000ca930  movs    r2, #0x2e
000ca932  movs    r3, r0
000ca934  ldrb    r6, [r3, r5]
000ca936  movs    r3, r1
000ca938  ldrb    r0, [r4, r3]
000ca93a  movs    r3, r1
