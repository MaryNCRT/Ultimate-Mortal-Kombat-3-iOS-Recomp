========================================================================
-[FacebookAgent getFriends]  0x000dc690  132 bytes   FacebookAgent.mm
========================================================================

000dc690  push    {r4, r7, lr}
000dc692  add     r7, sp, #4
000dc694  sub     sp, #8
000dc696  ldr     r3, [pc, #0x58]
000dc698  mov     r4, r0
000dc69a  movs    r2, #2
000dc69c  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc69e  ldr     r1, [pc, #0x54]
000dc6a0  ldr     r3, [r3]
000dc6a2  mov.w   ip, #0
000dc6a6  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc6a8  str     r2, [r0, r3]
000dc6aa  ldr     r0, [pc, #0x4c]
000dc6ac  ldr     r2, [pc, #0x4c]
000dc6ae  ldr     r3, [pc, #0x50]
000dc6b0  add     r0, pc ; -> 0x000fdbf4  
000dc6b2  add     r2, pc ; -> 0x00182614  
000dc6b4  add     r3, pc ; -> 0x0017eec4  
000dc6b6  ldr     r1, [r1]
000dc6b8  ldr     r0, [r0]
000dc6ba  str.w   ip, [sp]
000dc6be  blx     #0xddbfc ; -> objc_msgSend
000dc6c2  ldr     r2, [pc, #0x40]
000dc6c4  ldr     r1, [pc, #0x40]
000dc6c6  ldr.w   ip, [pc, #0x44]
000dc6ca  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc6cc  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc6ce  ldr     r2, [r2]
000dc6d0  ldr     r1, [r1]
000dc6d2  add     ip, pc ; -> 0x0017e7a4  
000dc6d4  str     r4, [sp, #4]
000dc6d6  str.w   ip, [sp]
000dc6da  mov     r3, r0
000dc6dc  ldr     r0, [r4, r2]
000dc6de  ldr     r2, [pc, #0x30]
000dc6e0  add     r2, pc ; -> 0x001825b4  
000dc6e2  blx     #0xddbfc ; -> objc_msgSend
000dc6e6  movs    r0, #1
000dc6e8  sub.w   sp, r7, #4
000dc6ec  pop     {r4, r7, pc}
000dc6ee  nop     
000dc6f0  lsls    r0, r5, #8
000dc6f2  movs    r2, r0
000dc6f4  lsls    r2, r2, #0xd
000dc6f6  movs    r2, r0
000dc6f8  asrs    r0, r0, #0x15
000dc6fa  movs    r2, r0
000dc6fc  ldrsh   r6, [r3, r5]
000dc6fe  movs    r2, r1
000dc700  cmp     r0, #0xc
000dc702  movs    r2, r1
000dc704  lsls    r2, r5, #7
000dc706  movs    r2, r0
000dc708  asrs    r4, r0, #0xc
000dc70a  movs    r2, r0
000dc70c  movs    r0, #0xce
000dc70e  movs    r2, r1
000dc710  ldrsh   r0, [r2, r3]
000dc712  movs    r2, r1
