========================================================================
-[FacebookAgent getMyInfo]  0x000dc5f4  156 bytes   FacebookAgent.mm
========================================================================

000dc5f4  push    {r4, r5, r7, lr}
000dc5f6  add     r7, sp, #8
000dc5f8  sub     sp, #8
000dc5fa  ldr     r3, [pc, #0x68]
000dc5fc  mov     r4, r0
000dc5fe  movs    r5, #1
000dc600  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc602  ldr     r1, [pc, #0x64]
000dc604  ldr     r3, [r3]
000dc606  ldr     r2, [pc, #0x64]
000dc608  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000dc60a  str     r5, [r0, r3]
000dc60c  ldr     r0, [pc, #0x60]
000dc60e  add     r2, pc ; -> 0x00182604  
000dc610  ldr     r1, [r1]
000dc612  add     r0, pc ; -> 0x000fdb5c  
000dc614  ldr     r0, [r0]
000dc616  blx     #0xddbfc ; -> objc_msgSend
000dc61a  ldr     r1, [pc, #0x58]
000dc61c  ldr     r3, [pc, #0x58]
000dc61e  mov.w   ip, #0
000dc622  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc624  add     r3, pc ; -> 0x0017eec4  
000dc626  ldr     r1, [r1]
000dc628  str.w   ip, [sp]
000dc62c  mov     r2, r0
000dc62e  ldr     r0, [pc, #0x4c]
000dc630  add     r0, pc ; -> 0x000fdbf4  
000dc632  ldr     r0, [r0]
000dc634  blx     #0xddbfc ; -> objc_msgSend
000dc638  ldr     r2, [pc, #0x44]
000dc63a  ldr     r1, [pc, #0x48]
000dc63c  ldr.w   ip, [pc, #0x48]
000dc640  add     r2, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc642  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc644  ldr     r2, [r2]
000dc646  ldr     r1, [r1]
000dc648  add     ip, pc ; -> 0x0017e7a4  
000dc64a  str     r4, [sp, #4]
000dc64c  str.w   ip, [sp]
000dc650  mov     r3, r0
000dc652  ldr     r0, [r4, r2]
000dc654  ldr     r2, [pc, #0x34]
000dc656  add     r2, pc ; -> 0x001825b4  
000dc658  blx     #0xddbfc ; -> objc_msgSend
000dc65c  mov     r0, r5
000dc65e  sub.w   sp, r7, #8
000dc662  pop     {r4, r5, r7, pc}
000dc664  lsls    r4, r0, #0xb
000dc666  movs    r2, r0
000dc668  lsls    r4, r2, #0x12
000dc66a  movs    r2, r0
000dc66c  ldrsh   r2, [r6, r7]
000dc66e  movs    r2, r1
000dc670  asrs    r6, r0, #0x15
000dc672  movs    r2, r0
000dc674  lsls    r6, r2, #0xf
000dc676  movs    r2, r0
000dc678  cmp     r0, #0x9c
000dc67a  movs    r2, r1
000dc67c  asrs    r0, r0, #0x17
000dc67e  movs    r2, r0
000dc680  lsls    r4, r6, #9
000dc682  movs    r2, r0
000dc684  asrs    r6, r1, #0xe
000dc686  movs    r2, r0
000dc688  movs    r1, #0x58
000dc68a  movs    r2, r1
000dc68c  ldrsh   r2, [r3, r5]
000dc68e  movs    r2, r1
