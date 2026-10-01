========================================================================
EASDK_LogEventEnumEnumStringNum  0x0007f100  228 bytes   EASDK_Handler.mm
========================================================================

0007f100  push    {r4, r5, r6, r7, lr}
0007f102  add     r7, sp, #0xc
0007f104  push.w  {r8, sl}
0007f108  sub     sp, #8
0007f10a  mov     r6, r0
0007f10c  mov     r8, r1
0007f10e  mov     r4, r2
0007f110  mov     sl, r3
0007f112  cmp     r2, #0
0007f114  beq     #0x7f1ac
0007f116  ldr     r0, [pc, #0x98]
0007f118  ldr     r1, [pc, #0x98]
0007f11a  add     r0, pc ; -> 0x000fdb5c  
0007f11c  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f11e  ldr     r0, [r0]
0007f120  ldr     r1, [r1]
0007f122  blx     #0xddbfc ; -> objc_msgSend
0007f126  ldr     r1, [pc, #0x90]
0007f128  mov     r2, r4
0007f12a  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f12c  ldr     r1, [r1]
0007f12e  blx     #0xddbfc ; -> objc_msgSend
0007f132  ldr     r1, [pc, #0x88]
0007f134  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f136  ldr     r1, [r1]
0007f138  blx     #0xddbfc ; -> objc_msgSend
0007f13c  mov     r5, r0
0007f13e  ldr     r0, [pc, #0x80]
0007f140  ldr     r1, [pc, #0x80]
0007f142  add     r0, pc ; -> 0x000fdb5c  
0007f144  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f146  ldr     r0, [r0]
0007f148  ldr     r1, [r1]
0007f14a  blx     #0xddbfc ; -> objc_msgSend
0007f14e  ldr     r1, [pc, #0x78]
0007f150  ldr     r2, [pc, #0x78]
0007f152  ldr     r3, [sp, #0x24]
0007f154  add     r1, pc ; -> 0x000fcb18  '\x15\x1e\x0e'
0007f156  add     r2, pc ; -> 0x0017e5c4  
0007f158  ldr     r1, [r1]
0007f15a  blx     #0xddbfc ; -> objc_msgSend
0007f15e  ldr     r1, [pc, #0x70]
0007f160  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f162  ldr     r1, [r1]
0007f164  blx     #0xddbfc ; -> objc_msgSend
0007f168  ldr     r3, [pc, #0x68]
0007f16a  add     r3, pc ; -> 0x000f354c  Settings
0007f16c  ldr     r3, [r3]
0007f16e  ldr     r3, [r3, #0x24]
0007f170  mov     r4, r0
0007f172  cbz     r3, #0x7f194
0007f174  ldr     r0, [pc, #0x60]
0007f176  ldr     r1, [pc, #0x64]
0007f178  add     r0, pc ; -> 0x000fdbb4  
0007f17a  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
0007f17c  ldr     r0, [r0]
0007f17e  ldr     r1, [r1]
0007f180  blx     #0xddbfc ; -> objc_msgSend
0007f184  mov     r1, r8
0007f186  mov     r2, r5
0007f188  mov     r3, sl
0007f18a  str     r4, [sp]
0007f18c  str     r0, [sp, #4]
0007f18e  mov     r0, r6
0007f190  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
0007f194  ldr     r0, [pc, #0x48]
0007f196  mov     r1, r6
0007f198  mov     r2, r5
0007f19a  add     r0, pc ; -> 0x0017e5d4  
0007f19c  mov     r3, r4
0007f19e  blx     #0xdd3e0 ; -> NSLog
0007f1a2  sub.w   sp, r7, #0x14
0007f1a6  pop.w   {r8, sl}
0007f1aa  pop     {r4, r5, r6, r7, pc}
0007f1ac  mov     r5, r2
0007f1ae  b       #0x7f13e
0007f1b0  bics.w  r0, lr, r7
0007f1b4  bhi     #0x7f280
0007f1b6  movs    r7, r0
0007f1b8  bge     #0x7f0e0
0007f1ba  movs    r7, r0
0007f1bc  bls     #0x7f200
0007f1be  movs    r7, r0
0007f1c0  ands.w  r0, r6, r7
0007f1c4  bhi     #0x7f240
0007f1c6  movs    r7, r0
0007f1c8  bls     #0x7f14c
0007f1ca  movs    r7, r0
0007f1cc  orn     r0, sl, #0x8f0000
0007f1d0  bhi     #0x7f1bc
0007f1d2  movs    r7, r0
0007f1d4  mvns    r6, r3
0007f1d6  movs    r7, r0
0007f1d8  bics.w  r0, r8, r7
0007f1dc  bge     #0x7f274
0007f1de  movs    r7, r0
0007f1e0  bics    r0, r6, #0x8f0000
