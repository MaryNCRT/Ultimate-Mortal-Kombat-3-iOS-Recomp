========================================================================
-[FacebookAgent getLikeResult  0x000dc288  236 bytes   FacebookAgent.mm
========================================================================

000dc288  push    {r4, r5, r7, lr}
000dc28a  add     r7, sp, #8
000dc28c  sub     sp, #8
000dc28e  mov     r3, r2
000dc290  ldr     r2, [pc, #0xa0]
000dc292  mov     r4, r0
000dc294  add     r2, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc296  ldr     r2, [r2]
000dc298  ldr     r5, [r0, r2]
000dc29a  cbz     r5, #0xdc2ce
000dc29c  ldr     r1, [pc, #0x98]
000dc29e  ldr     r3, [pc, #0x9c]
000dc2a0  add     r1, pc ; -> 0x000fd9cc  
000dc2a2  add     r3, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dc2a4  ldr     r5, [r1]
000dc2a6  ldr     r1, [pc, #0x98]
000dc2a8  ldr     r3, [r3]
000dc2aa  add     r1, pc ; -> 0x000fcc90  'h\x1d\x0e'
000dc2ac  mov     r2, r5
000dc2ae  ldr     r0, [r0, r3]
000dc2b0  ldr     r1, [r1]
000dc2b2  blx     #0xddbfc ; -> objc_msgSend
000dc2b6  uxtb    r0, r0
000dc2b8  cmp     r0, #0
000dc2ba  beq     #0xdc32c
000dc2bc  ldr     r3, [pc, #0x84]
000dc2be  mov     r1, r5
000dc2c0  add     r3, pc ; -> 0x000fc8b0  OBJC_IVAR_$_FacebookAgent.delegate
000dc2c2  ldr     r0, [r3]
000dc2c4  ldr     r0, [r4, r0]
000dc2c6  blx     #0xddbfc ; -> objc_msgSend
000dc2ca  movs    r0, #0
000dc2cc  b       #0xdc32c
000dc2ce  movs    r1, #0xa
000dc2d0  str     r1, [r0, r2]
000dc2d2  ldr     r2, [pc, #0x74]
000dc2d4  ldr     r1, [pc, #0x74]
000dc2d6  add     r2, pc ; -> 0x000fc550  OBJC_IVAR_$_FacebookAgent.fbLikeId
000dc2d8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dc2da  ldr     r2, [r2]
000dc2dc  ldr     r1, [r1]
000dc2de  str     r3, [r0, r2]
000dc2e0  ldr     r0, [pc, #0x6c]
000dc2e2  ldr     r2, [pc, #0x70]
000dc2e4  add     r0, pc ; -> 0x000fdb5c  
000dc2e6  add     r2, pc ; -> 0x001825c4  
000dc2e8  ldr     r0, [r0]
000dc2ea  blx     #0xddbfc ; -> objc_msgSend
000dc2ee  ldr     r1, [pc, #0x68]
000dc2f0  ldr     r3, [pc, #0x68]
000dc2f2  str     r5, [sp]
000dc2f4  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc2f6  add     r3, pc ; -> 0x0017eec4  
000dc2f8  ldr     r1, [r1]
000dc2fa  mov     r2, r0
000dc2fc  ldr     r0, [pc, #0x60]
000dc2fe  add     r0, pc ; -> 0x000fdbf4  
000dc300  ldr     r0, [r0]
000dc302  blx     #0xddbfc ; -> objc_msgSend
000dc306  ldr     r2, [pc, #0x5c]
000dc308  ldr     r1, [pc, #0x5c]
000dc30a  ldr.w   ip, [pc, #0x60]
000dc30e  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc310  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc312  ldr     r2, [r2]
000dc314  ldr     r1, [r1]
000dc316  add     ip, pc ; -> 0x0017e7a4  
000dc318  str     r4, [sp, #4]
000dc31a  str.w   ip, [sp]
000dc31e  mov     r3, r0
000dc320  ldr     r0, [r4, r2]
000dc322  ldr     r2, [pc, #0x4c]
000dc324  add     r2, pc ; -> 0x001825b4  
000dc326  blx     #0xddbfc ; -> objc_msgSend
000dc32a  movs    r0, #1
000dc32c  sub.w   sp, r7, #8
000dc330  pop     {r4, r5, r7, pc}
000dc332  nop     
000dc334  lsls    r0, r6, #0x18
000dc336  movs    r2, r0
000dc338  asrs    r0, r5, #0x1c
000dc33a  movs    r2, r0
000dc33c  lsls    r2, r1, #0x18
000dc33e  movs    r2, r0
000dc340  lsrs    r2, r4, #7
000dc342  movs    r2, r0
000dc344  lsls    r4, r5, #0x17
000dc346  movs    r2, r0
000dc348  lsls    r6, r6, #9
000dc34a  movs    r2, r0
000dc34c  lsls    r4, r0, #0x1f
000dc34e  movs    r2, r0
000dc350  adds    r4, r6, r1
000dc352  movs    r2, r0
000dc354  str     r2, [r3, #0x2c]
000dc356  movs    r2, r1
000dc358  lsls    r4, r0, #0x1c
000dc35a  movs    r2, r0
000dc35c  cmp     r3, #0xca
000dc35e  movs    r2, r1
000dc360  adds    r2, r6, r3
000dc362  movs    r2, r0
000dc364  lsls    r6, r4, #0x16
000dc366  movs    r2, r0
000dc368  asrs    r0, r0, #0x1b
000dc36a  movs    r2, r0
000dc36c  movs    r4, #0x8a
000dc36e  movs    r2, r1
000dc370  str     r4, [r1, #0x28]
000dc372  movs    r2, r1
