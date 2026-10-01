========================================================================
-[FacebookAgent getUsersInfo  0x000dc554  160 bytes   FacebookAgent.mm
========================================================================

000dc554  push    {r4, r7, lr}
000dc556  add     r7, sp, #4
000dc558  sub     sp, #8
000dc55a  mov     r3, r2
000dc55c  ldr     r2, [pc, #0x68]
000dc55e  mov     r4, r0
000dc560  movs    r1, #3
000dc562  add     r2, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc564  ldr     r2, [r2]
000dc566  str     r1, [r0, r2]
000dc568  ldr     r0, [pc, #0x60]
000dc56a  ldr     r1, [pc, #0x64]
000dc56c  ldr     r2, [pc, #0x64]
000dc56e  add     r0, pc ; -> 0x000fdb5c  
000dc570  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dc572  add     r2, pc ; -> 0x001825f4  
000dc574  ldr     r1, [r1]
000dc576  ldr     r0, [r0]
000dc578  blx     #0xddbfc ; -> objc_msgSend
000dc57c  ldr     r1, [pc, #0x58]
000dc57e  ldr     r3, [pc, #0x5c]
000dc580  mov.w   ip, #0
000dc584  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc586  add     r3, pc ; -> 0x0017eec4  
000dc588  ldr     r1, [r1]
000dc58a  str.w   ip, [sp]
000dc58e  mov     r2, r0
000dc590  ldr     r0, [pc, #0x4c]
000dc592  add     r0, pc ; -> 0x000fdbf4  
000dc594  ldr     r0, [r0]
000dc596  blx     #0xddbfc ; -> objc_msgSend
000dc59a  ldr     r2, [pc, #0x48]
000dc59c  ldr     r1, [pc, #0x48]
000dc59e  ldr.w   ip, [pc, #0x4c]
000dc5a2  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc5a4  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc5a6  ldr     r2, [r2]
000dc5a8  ldr     r1, [r1]
000dc5aa  add     ip, pc ; -> 0x0017e7a4  
000dc5ac  str     r4, [sp, #4]
000dc5ae  str.w   ip, [sp]
000dc5b2  mov     r3, r0
000dc5b4  ldr     r0, [r4, r2]
000dc5b6  ldr     r2, [pc, #0x38]
000dc5b8  add     r2, pc ; -> 0x001825b4  
000dc5ba  blx     #0xddbfc ; -> objc_msgSend
000dc5be  movs    r0, #1
000dc5c0  sub.w   sp, r7, #4
000dc5c4  pop     {r4, r7, pc}
000dc5c6  nop     
000dc5c8  lsls    r2, r4, #0xd
000dc5ca  movs    r2, r0
000dc5cc  asrs    r2, r5, #0x17
000dc5ce  movs    r2, r0
000dc5d0  lsls    r4, r5, #0x14
000dc5d2  movs    r2, r0
000dc5d4  str     r6, [r7, #4]
000dc5d6  movs    r2, r1
000dc5d8  lsls    r4, r6, #0x11
000dc5da  movs    r2, r0
000dc5dc  cmp     r1, #0x3a
000dc5de  movs    r2, r1
000dc5e0  asrs    r6, r3, #0x19
000dc5e2  movs    r2, r0
000dc5e4  lsls    r2, r2, #0xc
000dc5e6  movs    r2, r0
000dc5e8  asrs    r4, r5, #0x10
000dc5ea  movs    r2, r0
000dc5ec  movs    r1, #0xf6
000dc5ee  movs    r2, r1
000dc5f0  ldrsh   r0, [r7, r7]
000dc5f2  movs    r2, r1
