========================================================================
EASDK_LogEventEnumEnum  0x0007f354  204 bytes   EASDK_Handler.mm
========================================================================

0007f354  push    {r4, r5, r6, r7, lr}
0007f356  add     r7, sp, #0xc
0007f358  push.w  {r8, sl, fp}
0007f35c  sub     sp, #0x14
0007f35e  str     r0, [sp, #0x10]
0007f360  str     r1, [sp, #0xc]
0007f362  ldr     r0, [pc, #0x98]
0007f364  ldr     r1, [pc, #0x98]
0007f366  mov     r5, r2
0007f368  add     r0, pc ; -> 0x000fdb5c  
0007f36a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f36c  ldr.w   sl, [r0]
0007f370  ldr.w   r8, [r1]
0007f374  str     r3, [sp, #8]
0007f376  ldr     r4, [pc, #0x8c]
0007f378  mov     r0, sl
0007f37a  mov     r1, r8
0007f37c  blx     #0xddbfc ; -> objc_msgSend
0007f380  ldr     r1, [pc, #0x84]
0007f382  add     r4, pc ; -> 0x0017e5c4  
0007f384  mov     r3, r5
0007f386  add     r1, pc ; -> 0x000fcb18  '\x15\x1e\x0e'
0007f388  mov     r2, r4
0007f38a  ldr     r6, [r1]
0007f38c  mov     r1, r6
0007f38e  blx     #0xddbfc ; -> objc_msgSend
0007f392  ldr     r1, [pc, #0x78]
0007f394  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f396  ldr     r5, [r1]
0007f398  mov     r1, r5
0007f39a  blx     #0xddbfc ; -> objc_msgSend
0007f39e  mov     r1, r8
0007f3a0  mov     fp, r0
0007f3a2  mov     r0, sl
0007f3a4  blx     #0xddbfc ; -> objc_msgSend
0007f3a8  mov     r2, r4
0007f3aa  ldr     r3, [sp, #0x34]
0007f3ac  mov     r1, r6
0007f3ae  blx     #0xddbfc ; -> objc_msgSend
0007f3b2  mov     r1, r5
0007f3b4  blx     #0xddbfc ; -> objc_msgSend
0007f3b8  ldr     r3, [pc, #0x54]
0007f3ba  add     r3, pc ; -> 0x000f354c  Settings
0007f3bc  ldr     r3, [r3]
0007f3be  ldr     r3, [r3, #0x24]
0007f3c0  mov     r4, r0
0007f3c2  cbz     r3, #0x7f3e4
0007f3c4  ldr     r0, [pc, #0x4c]
0007f3c6  ldr     r1, [pc, #0x50]
0007f3c8  add     r0, pc ; -> 0x000fdbb4  
0007f3ca  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
0007f3cc  ldr     r0, [r0]
0007f3ce  ldr     r1, [r1]
0007f3d0  blx     #0xddbfc ; -> objc_msgSend
0007f3d4  ldr     r1, [sp, #0xc]
0007f3d6  mov     r2, fp
0007f3d8  ldr     r3, [sp, #8]
0007f3da  str     r4, [sp]
0007f3dc  str     r0, [sp, #4]
0007f3de  ldr     r0, [sp, #0x10]
0007f3e0  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
0007f3e4  ldr     r0, [pc, #0x34]
0007f3e6  ldr     r1, [sp, #0x10]
0007f3e8  mov     r2, fp
0007f3ea  add     r0, pc ; -> 0x0017e5d4  
0007f3ec  mov     r3, r4
0007f3ee  blx     #0xdd3e0 ; -> NSLog
0007f3f2  sub.w   sp, r7, #0x18
0007f3f6  pop.w   {r8, sl, fp}
0007f3fa  pop     {r4, r5, r6, r7, pc}
0007f3fc  b       #0x7f3e0
0007f3fe  movs    r7, r0
0007f400  bvs     #0x7f430
0007f402  movs    r7, r0
