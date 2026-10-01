========================================================================
-[EAMTX_TransObserver returnError  0x000c7dec  232 bytes   EAMTX_TransObserver.mm
========================================================================

000c7dec  push    {r4, r5, r6, r7, lr}
000c7dee  add     r7, sp, #0xc
000c7df0  push.w  {r8, sl, fp}
000c7df4  sub     sp, #8
000c7df6  ldr     r1, [pc, #0xa8]
000c7df8  str     r0, [sp, #4]
000c7dfa  ldr     r0, [pc, #0xa8]
000c7dfc  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000c7dfe  mov     fp, r3
000c7e00  add     r0, pc ; -> 0x000fdbf4  
000c7e02  ldr     r1, [r1]
000c7e04  ldr     r0, [r0]
000c7e06  str     r2, [sp]
000c7e08  blx     #0xddbfc ; -> objc_msgSend
000c7e0c  ldr     r1, [pc, #0x98]
000c7e0e  ldr     r4, [pc, #0x9c]
000c7e10  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000c7e12  add     r4, pc ; -> 0x0017e5c4  
000c7e14  ldr     r1, [r1]
000c7e16  blx     #0xddbfc ; -> objc_msgSend
000c7e1a  ldr     r1, [pc, #0x94]
000c7e1c  ldr     r3, [pc, #0x94]
000c7e1e  mov     r2, r4
000c7e20  add     r1, pc ; -> 0x000fcad8  '`<\x0e'
000c7e22  add     r3, pc ; -> 0x000f3318  iItemSellId
000c7e24  ldr.w   sl, [r1]
000c7e28  ldr     r1, [pc, #0x8c]
000c7e2a  ldr     r3, [r3]
000c7e2c  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7e2e  ldr     r6, [r1]
000c7e30  ldr     r3, [r3]
000c7e32  mov     r1, r6
000c7e34  mov     r5, r0
000c7e36  ldr     r0, [pc, #0x84]
000c7e38  add     r0, pc ; -> 0x000fdb5c  
000c7e3a  ldr.w   r8, [r0]
000c7e3e  mov     r0, r8
000c7e40  blx     #0xddbfc ; -> objc_msgSend
000c7e44  ldr     r3, [pc, #0x78]
000c7e46  mov     r1, sl
000c7e48  add     r3, pc ; -> 0x00180434  
000c7e4a  mov     r2, r0
000c7e4c  mov     r0, r5
000c7e4e  blx     #0xddbfc ; -> objc_msgSend
000c7e52  mov     r1, r6
000c7e54  mov     r2, r4
000c7e56  mov     r3, fp
000c7e58  mov     r0, r8
000c7e5a  blx     #0xddbfc ; -> objc_msgSend
000c7e5e  ldr     r3, [pc, #0x64]
000c7e60  mov     r1, sl
000c7e62  add     r3, pc ; -> 0x001803f4  
000c7e64  mov     r2, r0
000c7e66  mov     r0, r5
000c7e68  blx     #0xddbfc ; -> objc_msgSend
000c7e6c  ldr     r3, [pc, #0x58]
000c7e6e  mov     r2, r5
000c7e70  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c7e72  ldr     r0, [r3]
000c7e74  ldr     r3, [sp, #4]
000c7e76  ldr     r1, [r3, r0]
000c7e78  ldr     r0, [sp]
000c7e7a  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c7e7e  ldr     r1, [pc, #0x4c]
000c7e80  mov     r0, r5
000c7e82  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000c7e84  ldr     r1, [r1]
000c7e86  blx     #0xddbfc ; -> objc_msgSend
000c7e8a  ldr     r1, [pc, #0x44]
000c7e8c  mov     r0, r5
000c7e8e  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000c7e90  ldr     r1, [r1]
000c7e92  blx     #0xddbfc ; -> objc_msgSend
000c7e96  sub.w   sp, r7, #0x18
000c7e9a  pop.w   {r8, sl, fp}
000c7e9e  pop     {r4, r5, r6, r7, pc}
000c7ea0  ldr     r3, [pc, #0x210]
000c7ea2  movs    r3, r0
000c7ea4  ldrb    r0, [r6, r7]
000c7ea6  movs    r3, r0
000c7ea8  ldr     r3, [pc, #0x1b0]
000c7eaa  movs    r3, r0
000c7eac  str     r6, [r5, #0x78]
000c7eae  movs    r3, r1
000c7eb0  ldr     r4, [pc, #0x2d0]
000c7eb2  movs    r3, r0
000c7eb4  push    {r1, r4, r5, r6, r7}
000c7eb6  movs    r2, r0
000c7eb8  ldr     r4, [pc, #0x1c0]
000c7eba  movs    r3, r0
000c7ebc  ldrb    r0, [r4, r4]
000c7ebe  movs    r3, r0
000c7ec0  strh    r0, [r5, #0x2e]
000c7ec2  movs    r3, r1
000c7ec4  strh    r6, [r1, #0x2c]
000c7ec6  movs    r3, r1
000c7ec8  lsls    r0, r3, #5
000c7eca  movs    r3, r0
000c7ecc  ldr     r4, [pc, #0x18]
000c7ece  movs    r3, r0
000c7ed0  ldr     r2, [pc, #0x3a8]
000c7ed2  movs    r3, r0
