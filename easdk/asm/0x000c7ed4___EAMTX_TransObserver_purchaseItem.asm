========================================================================
-[EAMTX_TransObserver purchaseItem  0x000c7ed4  220 bytes   EAMTX_TransObserver.mm
========================================================================

000c7ed4  push    {r4, r5, r6, r7, lr}
000c7ed6  add     r7, sp, #0xc
000c7ed8  str     r8, [sp, #-0x4]!
000c7edc  ldr     r3, [pc, #0x98]
000c7ede  mov     r4, r0
000c7ee0  mov     r8, r2
000c7ee2  add     r3, pc ; -> 0x000f7fd8  OBJC_IVAR_$_EAMTX_TransObserver.m_PurchaseState
000c7ee4  ldr     r3, [r3]
000c7ee6  ldr     r3, [r0, r3]
000c7ee8  cmp     r3, #2
000c7eea  bne     #0xc7efc
000c7eec  ldr     r1, [pc, #0x8c]
000c7eee  movs    r2, #0x11
000c7ef0  ldr     r3, [pc, #0x8c]
000c7ef2  add     r1, pc ; -> 0x000fd734  
000c7ef4  ldr     r1, [r1]
000c7ef6  blx     #0xddbfc ; -> objc_msgSend
000c7efa  b       #0xc7f72
000c7efc  ldr     r3, [pc, #0x84]
000c7efe  movs    r2, #0
000c7f00  add     r3, pc ; -> 0x000f7fcc  OBJC_IVAR_$_EAMTX_TransObserver.requestId
000c7f02  ldr     r3, [r3]
000c7f04  ldr     r1, [r0, r3]
000c7f06  movs    r0, #0xf
000c7f08  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000c7f0c  ldr     r1, [pc, #0x78]
000c7f0e  ldr     r3, [pc, #0x7c]
000c7f10  ldr     r0, [pc, #0x7c]
000c7f12  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7f14  add     r3, pc ; -> 0x000f7fd4  OBJC_IVAR_$_EAMTX_TransObserver.m_TransState
000c7f16  ldr     r5, [r1]
000c7f18  ldr     r1, [pc, #0x78]
000c7f1a  ldr     r3, [r3]
000c7f1c  add     r0, pc ; -> 0x000fdb5c  
000c7f1e  add     r1, pc ; -> 0x000fd724  
000c7f20  ldr     r6, [r0]
000c7f22  ldr     r1, [r1]
000c7f24  mov     r0, r8
000c7f26  movs    r2, #4
000c7f28  str     r2, [r4, r3]
000c7f2a  blx     #0xddbfc ; -> objc_msgSend
000c7f2e  ldr     r4, [pc, #0x68]
000c7f30  mov     r1, r5
000c7f32  add     r4, pc ; -> 0x001815d4  
000c7f34  mov     r2, r4
000c7f36  mov     r3, r0
000c7f38  mov     r0, r6
000c7f3a  blx     #0xddbfc ; -> objc_msgSend
000c7f3e  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7f42  ldr     r0, [pc, #0x58]
000c7f44  ldr     r1, [pc, #0x58]
000c7f46  mov     r2, r8
000c7f48  add     r0, pc ; -> 0x000fdcb8  
000c7f4a  add     r1, pc ; -> 0x000fd710  'h\x02\x0f'
000c7f4c  ldr     r0, [r0]
000c7f4e  ldr     r1, [r1]
000c7f50  blx     #0xddbfc ; -> objc_msgSend
000c7f54  ldr     r1, [pc, #0x4c]
000c7f56  add     r1, pc ; -> 0x000fd644  
000c7f58  ldr     r1, [r1]
000c7f5a  mov     r4, r0
000c7f5c  ldr     r0, [pc, #0x48]
000c7f5e  add     r0, pc ; -> 0x000fdc6c  
000c7f60  ldr     r0, [r0]
000c7f62  blx     #0xddbfc ; -> objc_msgSend
000c7f66  ldr     r1, [pc, #0x44]
000c7f68  mov     r2, r4
000c7f6a  add     r1, pc ; -> 0x000fd70c  '\\\x02\x0f'
000c7f6c  ldr     r1, [r1]
000c7f6e  blx     #0xddbfc ; -> objc_msgSend
000c7f72  ldr     r8, [sp], #4
000c7f76  pop     {r4, r5, r6, r7, pc}
000c7f78  lsls    r2, r6, #3
000c7f7a  movs    r3, r0
000c7f7c  ldr     r6, [r7, r0]
000c7f7e  movs    r3, r0
000c7f80  bl      #0x3c3f82
000c7f84  lsls    r0, r1, #3
000c7f86  movs    r3, r0
000c7f88  ldr     r3, [pc, #0x228]
000c7f8a  movs    r3, r0
000c7f8c  lsls    r4, r7, #2
000c7f8e  movs    r3, r0
000c7f90  ldrb    r4, [r7, r0]
000c7f92  movs    r3, r0
000c7f94  ldr     r2, [r0, r0]
000c7f96  movs    r3, r0
000c7f98  str     r6, [sp, #0x278]
000c7f9a  movs    r3, r1
000c7f9c  ldrb    r4, [r5, r5]
000c7f9e  movs    r3, r0
000c7fa0  ldrsb   r2, [r0, r7]
000c7fa2  movs    r3, r0
000c7fa4  ldrsb   r2, [r5, r3]
000c7fa6  movs    r3, r0
000c7fa8  ldrb    r2, [r1, r4]
000c7faa  movs    r3, r0
000c7fac  ldrsb   r6, [r3, r6]
000c7fae  movs    r3, r0
