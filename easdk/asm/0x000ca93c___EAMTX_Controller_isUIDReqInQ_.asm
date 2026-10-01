========================================================================
-[EAMTX_Controller isUIDReqInQ]  0x000ca93c  200 bytes   EAMTX_Controller.mm
========================================================================

000ca93c  push    {r4, r5, r6, r7, lr}
000ca93e  add     r7, sp, #0xc
000ca940  push.w  {r8, sl, fp}
000ca944  sub     sp, #8
000ca946  ldr     r3, [pc, #0x9c]
000ca948  mov     r6, r0
000ca94a  add     r3, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000ca94c  ldr     r0, [r3]
000ca94e  ldr     r0, [r6, r0]
000ca950  cmp     r0, #0
000ca952  beq     #0xca9be
000ca954  ldr     r1, [pc, #0x90]
000ca956  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000ca958  ldr.w   r8, [r1]
000ca95c  mov     r1, r8
000ca95e  blx     #0xddbfc ; -> objc_msgSend
000ca962  cmp     r0, #0
000ca964  beq     #0xca9be
000ca966  ldr     r1, [pc, #0x84]
000ca968  ldr     r3, [pc, #0x84]
000ca96a  movs    r5, #0
000ca96c  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000ca96e  ldr.w   sl, [r1]
000ca972  ldr     r1, [pc, #0x80]
000ca974  str     r3, [sp]
000ca976  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000ca978  ldr     r1, [r1]
000ca97a  str     r1, [sp, #4]
000ca97c  ldr     r1, [pc, #0x78]
000ca97e  add     r1, pc ; -> 0x000fcae8  '\x10\x1a\x0e'
000ca980  ldr.w   fp, [r1]
000ca984  b       #0xca9ac
000ca986  ldr     r3, [r4]
000ca988  mov     r1, sl
000ca98a  mov     r2, r5
000ca98c  ldr     r0, [r6, r3]
000ca98e  blx     #0xddbfc ; -> objc_msgSend
000ca992  mov     r4, r0
000ca994  cbz     r0, #0xca9aa
000ca996  ldr     r2, [pc, #0x64]
000ca998  ldr     r1, [sp, #4]
000ca99a  add     r2, pc ; -> 0x00180634  
000ca99c  blx     #0xddbfc ; -> objc_msgSend
000ca9a0  mov     r1, fp
000ca9a2  blx     #0xddbfc ; -> objc_msgSend
000ca9a6  cmp     r0, #0
000ca9a8  ble     #0xca9c2
000ca9aa  adds    r5, #1
000ca9ac  ldr     r4, [sp]
000ca9ae  mov     r1, r8
000ca9b0  add     r4, pc
000ca9b2  ldr     r3, [r4]
000ca9b4  ldr     r0, [r6, r3]
000ca9b6  blx     #0xddbfc ; -> objc_msgSend
000ca9ba  cmp     r0, r5
000ca9bc  bhi     #0xca986
000ca9be  movs    r0, #0
000ca9c0  b       #0xca9da
000ca9c2  ldr     r2, [pc, #0x3c]
000ca9c4  ldr     r1, [sp, #4]
000ca9c6  mov     r0, r4
000ca9c8  add     r2, pc ; -> 0x001805e4  
000ca9ca  blx     #0xddbfc ; -> objc_msgSend
000ca9ce  mov     r1, fp
000ca9d0  blx     #0xddbfc ; -> objc_msgSend
000ca9d4  cmp     r0, #3
000ca9d6  bne     #0xca9aa
000ca9d8  subs    r0, #2
000ca9da  sub.w   sp, r7, #0x18
000ca9de  pop.w   {r8, sl, fp}
000ca9e2  pop     {r4, r5, r6, r7, pc}
000ca9e4  b       #0xcaf74
000ca9e6  movs    r2, r0
000ca9e8  movs    r1, #0x26
000ca9ea  movs    r3, r0
000ca9ec  movs    r1, #0xc
000ca9ee  movs    r3, r0
000ca9f0  b       #0xcaeb4
000ca9f2  movs    r2, r0
000ca9f4  movs    r1, #0x76
000ca9f6  movs    r3, r0
000ca9f8  movs    r1, #0x66
000ca9fa  movs    r3, r0
000ca9fc  ldrb    r6, [r2, r2]
000ca9fe  movs    r3, r1
000caa00  ldrb    r0, [r3, r0]
000caa02  movs    r3, r1
