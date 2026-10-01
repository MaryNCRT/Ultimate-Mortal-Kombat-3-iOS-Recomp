========================================================================
-[FacebookAgent publishFeedDirectly  0x000dc374  208 bytes   FacebookAgent.mm
========================================================================

000dc374  push    {r4, r5, r6, r7, lr}
000dc376  add     r7, sp, #0xc
000dc378  sub     sp, #0xc
000dc37a  mov     r5, r3
000dc37c  ldr     r3, [pc, #0x8c]
000dc37e  mov     lr, r2
000dc380  mov     r4, r0
000dc382  add     r3, pc ; -> 0x000fc8c8  OBJC_IVAR_$_FacebookAgent.fbRequestState
000dc384  movs    r2, #6
000dc386  ldr     r3, [r3]
000dc388  ldr     r1, [pc, #0x84]
000dc38a  ldr.w   ip, [pc, #0x88]
000dc38e  str     r2, [r0, r3]
000dc390  ldr     r0, [pc, #0x84]
000dc392  ldr     r2, [pc, #0x88]
000dc394  ldr     r3, [pc, #0x88]
000dc396  add     r0, pc ; -> 0x000fdbf4  
000dc398  add     r1, pc ; -> 0x000fc9fc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x84
000dc39a  ldr     r0, [r0]
000dc39c  add     r2, pc ; -> 0x001825d4  
000dc39e  add     r3, pc ; -> 0x0017ed64  
000dc3a0  ldr     r1, [r1]
000dc3a2  add     ip, pc ; -> 0x0017ed34  
000dc3a4  str.w   lr, [sp]
000dc3a8  str.w   ip, [sp, #4]
000dc3ac  mov.w   ip, #0
000dc3b0  str.w   ip, [sp, #8]
000dc3b4  blx     #0xddbfc ; -> objc_msgSend
000dc3b8  mov     r6, r0
000dc3ba  cbz     r5, #0xdc3e4
000dc3bc  ldr     r1, [pc, #0x64]
000dc3be  ldr     r2, [pc, #0x68]
000dc3c0  mov     r0, r5
000dc3c2  add     r1, pc ; -> 0x000fcc64  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x2ec
000dc3c4  add     r2, pc ; -> 0x0017e2f4  kGraphBaseURL+0x1c4
000dc3c6  ldr     r1, [r1]
000dc3c8  blx     #0xddbfc ; -> objc_msgSend
000dc3cc  tst.w   r0, #0xff
000dc3d0  bne     #0xdc3e4
000dc3d2  ldr     r1, [pc, #0x58]
000dc3d4  ldr     r3, [pc, #0x58]
000dc3d6  mov     r0, r6
000dc3d8  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000dc3da  add     r3, pc ; -> 0x0017ed44  
000dc3dc  ldr     r1, [r1]
000dc3de  mov     r2, r5
000dc3e0  blx     #0xddbfc ; -> objc_msgSend
000dc3e4  ldr     r3, [pc, #0x4c]
000dc3e6  ldr     r1, [pc, #0x50]
000dc3e8  ldr     r2, [pc, #0x50]
000dc3ea  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc3ec  add     r1, pc ; -> 0x000fd9d4  '\\\x1c\x0f'
000dc3ee  ldr     r3, [r3]
000dc3f0  add     r2, pc ; -> 0x001825e4  
000dc3f2  ldr     r1, [r1]
000dc3f4  str     r4, [sp, #4]
000dc3f6  ldr     r0, [r4, r3]
000dc3f8  ldr     r3, [pc, #0x44]
000dc3fa  add     r3, pc ; -> 0x0017e7a4  
000dc3fc  str     r3, [sp]
000dc3fe  mov     r3, r6
000dc400  blx     #0xddbfc ; -> objc_msgSend
000dc404  sub.w   sp, r7, #0xc
000dc408  pop     {r4, r5, r6, r7, pc}
000dc40a  nop     
000dc40c  lsls    r2, r0, #0x15
000dc40e  movs    r2, r0
000dc410  lsls    r0, r4, #0x19
000dc412  movs    r2, r0
000dc414  cmp     r1, #0x8e
000dc416  movs    r2, r1
000dc418  adds    r2, r3, r1
000dc41a  movs    r2, r0
000dc41c  str     r4, [r6, #0x20]
000dc41e  movs    r2, r1
000dc420  cmp     r1, #0xc2
000dc422  movs    r2, r1
000dc424  lsrs    r6, r3, #2
000dc426  movs    r2, r0
000dc428  subs    r4, r5, #4
000dc42a  movs    r2, r1
000dc42c  lsls    r4, r7, #0x1b
000dc42e  movs    r2, r0
000dc430  cmp     r1, #0x66
000dc432  movs    r2, r1
000dc434  lsls    r2, r1, #0x13
000dc436  movs    r2, r0
000dc438  asrs    r4, r4, #0x17
000dc43a  movs    r2, r0
000dc43c  str     r0, [r6, #0x1c]
000dc43e  movs    r2, r1
000dc440  movs    r3, #0xa6
000dc442  movs    r2, r1
