========================================================================
-[FacebookAgent dealloc]  0x000db560  144 bytes   FacebookAgent.mm
========================================================================

000db560  push    {r4, r5, r7, lr}
000db562  add     r7, sp, #8
000db564  sub     sp, #8
000db566  ldr     r3, [pc, #0x68]
000db568  ldr     r1, [pc, #0x68]
000db56a  mov     r5, r0
000db56c  add     r3, pc ; -> 0x000fc8bc  OBJC_IVAR_$_FacebookAgent.permissions
000db56e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000db570  ldr     r3, [r3]
000db572  ldr     r4, [r1]
000db574  ldr     r0, [r0, r3]
000db576  mov     r1, r4
000db578  blx     #0xddbfc ; -> objc_msgSend
000db57c  ldr     r3, [pc, #0x58]
000db57e  mov     r1, r4
000db580  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000db582  ldr     r3, [r3]
000db584  ldr     r0, [r5, r3]
000db586  blx     #0xddbfc ; -> objc_msgSend
000db58a  ldr     r3, [pc, #0x50]
000db58c  mov     r1, r4
000db58e  add     r3, pc ; -> 0x000fc8b4  OBJC_IVAR_$_FacebookAgent.fbButton
000db590  ldr     r3, [r3]
000db592  ldr     r0, [r5, r3]
000db594  blx     #0xddbfc ; -> objc_msgSend
000db598  ldr     r3, [pc, #0x44]
000db59a  mov     r1, r4
000db59c  add     r3, pc ; -> 0x000fc54c  OBJC_IVAR_$_FacebookAgent.fbApplicationId
000db59e  ldr     r3, [r3]
000db5a0  ldr     r0, [r5, r3]
000db5a2  blx     #0xddbfc ; -> objc_msgSend
000db5a6  ldr     r3, [pc, #0x3c]
000db5a8  mov     r1, r4
000db5aa  add     r3, pc ; -> 0x000fc550  OBJC_IVAR_$_FacebookAgent.fbLikeId
000db5ac  ldr     r3, [r3]
000db5ae  ldr     r0, [r5, r3]
000db5b0  blx     #0xddbfc ; -> objc_msgSend
000db5b4  ldr     r3, [pc, #0x30]
000db5b6  ldr     r1, [pc, #0x34]
000db5b8  mov     r0, sp
000db5ba  add     r3, pc ; -> 0x000fde04  
000db5bc  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000db5be  ldr     r3, [r3]
000db5c0  ldr     r1, [r1]
000db5c2  str     r5, [sp]
000db5c4  str     r3, [sp, #4]
000db5c6  blx     #0xddc08 ; -> objc_msgSendSuper2
000db5ca  sub.w   sp, r7, #8
000db5ce  pop     {r4, r5, r7, pc}
000db5d0  asrs    r4, r1, #0xd
000db5d2  movs    r2, r0
000db5d4  asrs    r2, r1, #0x10
000db5d6  movs    r2, r0
000db5d8  asrs    r4, r6, #0xc
000db5da  movs    r2, r0
000db5dc  asrs    r2, r4, #0xc
000db5de  movs    r2, r0
000db5e0  lsrs    r4, r5, #0x1e
000db5e2  movs    r2, r0
000db5e4  lsrs    r2, r4, #0x1e
000db5e6  movs    r2, r0
000db5e8  cmp     r0, #0x46
000db5ea  movs    r2, r0
000db5ec  asrs    r0, r4, #0xf
000db5ee  movs    r2, r0
