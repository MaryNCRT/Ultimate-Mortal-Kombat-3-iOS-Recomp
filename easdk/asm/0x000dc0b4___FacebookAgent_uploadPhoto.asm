========================================================================
-[FacebookAgent uploadPhoto  0x000dc0b4  164 bytes   FacebookAgent.mm
========================================================================

000dc0b4  push    {r4, r5, r7, lr}
000dc0b6  add     r7, sp, #8
000dc0b8  sub     sp, #8
000dc0ba  ldr     r1, [pc, #0x70]
000dc0bc  mov     r5, r0
000dc0be  ldr     r0, [pc, #0x70]
000dc0c0  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000dc0c2  mov     r4, r2
000dc0c4  add     r0, pc ; -> 0x000fdba8  
000dc0c6  ldr     r1, [r1]
000dc0c8  ldr     r0, [r0]
000dc0ca  blx     #0xddbfc ; -> objc_msgSend
000dc0ce  ldr     r1, [pc, #0x64]
000dc0d0  mov     r2, r4
000dc0d2  add     r1, pc ; -> 0x000fce64  '\x0b=\x0e'
000dc0d4  ldr     r1, [r1]
000dc0d6  blx     #0xddbfc ; -> objc_msgSend
000dc0da  ldr     r1, [pc, #0x5c]
000dc0dc  ldr     r3, [pc, #0x5c]
000dc0de  movs    r2, #0
000dc0e0  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc0e2  str     r2, [sp]
000dc0e4  add     r3, pc ; -> 0x00182574  
000dc0e6  ldr     r1, [r1]
000dc0e8  mov     r4, r0
000dc0ea  ldr     r0, [pc, #0x54]
000dc0ec  mov     r2, r4
000dc0ee  add     r0, pc ; -> 0x000fdbf4  
000dc0f0  ldr     r0, [r0]
000dc0f2  blx     #0xddbfc ; -> objc_msgSend
000dc0f6  ldr     r2, [pc, #0x4c]
000dc0f8  ldr     r1, [pc, #0x4c]
000dc0fa  ldr.w   ip, [pc, #0x50]
000dc0fe  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc100  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc102  ldr     r2, [r2]
000dc104  ldr     r1, [r1]
000dc106  add     ip, pc ; -> 0x0017e7a4  
000dc108  str     r5, [sp, #4]
000dc10a  str.w   ip, [sp]
000dc10e  mov     r3, r0
000dc110  ldr     r0, [r5, r2]
000dc112  ldr     r2, [pc, #0x3c]
000dc114  add     r2, pc ; -> 0x00182584  
000dc116  blx     #0xddbfc ; -> objc_msgSend
000dc11a  ldr     r1, [pc, #0x38]
000dc11c  mov     r0, r4
000dc11e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dc120  ldr     r1, [r1]
000dc122  blx     #0xddbfc ; -> objc_msgSend
000dc126  sub.w   sp, r7, #8
000dc12a  pop     {r4, r5, r7, pc}
000dc12c  lsrs    r0, r0, #3
000dc12e  movs    r2, r0
000dc130  subs    r0, r4, r3
000dc132  movs    r2, r0
000dc134  lsrs    r6, r1, #0x16
000dc136  movs    r2, r0
000dc138  lsrs    r0, r3, #4
000dc13a  movs    r2, r0
000dc13c  str     r4, [r1, #0x48]
000dc13e  movs    r2, r1
000dc140  subs    r2, r0, r4
000dc142  movs    r2, r0
000dc144  lsls    r6, r6, #0x1e
000dc146  movs    r2, r0
000dc148  adds    r0, r2, r3
000dc14a  movs    r2, r0
000dc14c  movs    r6, #0x9a
000dc14e  movs    r2, r1
000dc150  str     r4, [r5, #0x44]
000dc152  movs    r2, r1
000dc154  lsrs    r2, r3, #1
000dc156  movs    r2, r0
