========================================================================
EASDK_LogEventEnumEnumString  0x0007f1e4  232 bytes   EASDK_Handler.mm
========================================================================

0007f1e4  push    {r4, r5, r6, r7, lr}
0007f1e6  add     r7, sp, #0xc
0007f1e8  push.w  {r8, sl, fp}
0007f1ec  sub     sp, #8
0007f1ee  mov     r8, r0
0007f1f0  mov     sl, r1
0007f1f2  mov     r4, r2
0007f1f4  mov     fp, r3
0007f1f6  ldr     r5, [sp, #0x28]
0007f1f8  cmp     r2, #0
0007f1fa  beq     #0x7f296
0007f1fc  ldr     r0, [pc, #0x9c]
0007f1fe  ldr     r1, [pc, #0xa0]
0007f200  add     r0, pc ; -> 0x000fdb5c  
0007f202  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f204  ldr     r0, [r0]
0007f206  ldr     r1, [r1]
0007f208  blx     #0xddbfc ; -> objc_msgSend
0007f20c  ldr     r1, [pc, #0x94]
0007f20e  mov     r2, r4
0007f210  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f212  ldr     r1, [r1]
0007f214  blx     #0xddbfc ; -> objc_msgSend
0007f218  ldr     r1, [pc, #0x8c]
0007f21a  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f21c  ldr     r1, [r1]
0007f21e  blx     #0xddbfc ; -> objc_msgSend
0007f222  mov     r6, r0
0007f224  cmp     r5, #0
0007f226  beq     #0x7f292
0007f228  ldr     r0, [pc, #0x80]
0007f22a  ldr     r1, [pc, #0x84]
0007f22c  add     r0, pc ; -> 0x000fdb5c  
0007f22e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f230  ldr     r0, [r0]
0007f232  ldr     r1, [r1]
0007f234  blx     #0xddbfc ; -> objc_msgSend
0007f238  ldr     r1, [pc, #0x78]
0007f23a  mov     r2, r5
0007f23c  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f23e  ldr     r1, [r1]
0007f240  blx     #0xddbfc ; -> objc_msgSend
0007f244  ldr     r1, [pc, #0x70]
0007f246  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f248  ldr     r1, [r1]
0007f24a  blx     #0xddbfc ; -> objc_msgSend
0007f24e  mov     r4, r0
0007f250  ldr     r3, [pc, #0x68]
0007f252  add     r3, pc ; -> 0x000f354c  Settings
0007f254  ldr     r3, [r3]
0007f256  ldr     r3, [r3, #0x24]
0007f258  cbz     r3, #0x7f27a
0007f25a  ldr     r0, [pc, #0x64]
0007f25c  ldr     r1, [pc, #0x64]
0007f25e  add     r0, pc ; -> 0x000fdbb4  
0007f260  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
0007f262  ldr     r0, [r0]
0007f264  ldr     r1, [r1]
0007f266  blx     #0xddbfc ; -> objc_msgSend
0007f26a  mov     r1, sl
0007f26c  mov     r2, r6
0007f26e  mov     r3, fp
0007f270  str     r4, [sp]
0007f272  str     r0, [sp, #4]
0007f274  mov     r0, r8
0007f276  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
0007f27a  ldr     r0, [pc, #0x4c]
0007f27c  mov     r1, r8
0007f27e  mov     r2, r6
0007f280  add     r0, pc ; -> 0x0017e5d4  
0007f282  mov     r3, r4
0007f284  blx     #0xdd3e0 ; -> NSLog
0007f288  sub.w   sp, r7, #0x18
0007f28c  pop.w   {r8, sl, fp}
0007f290  pop     {r4, r5, r6, r7, pc}
0007f292  mov     r4, r5
0007f294  b       #0x7f250
0007f296  mov     r6, r2
0007f298  b       #0x7f224
0007f29a  nop     
0007f29c  ldrd    r0, r0, [r8, #-0x1c]
0007f2a0  bvc     #0x7f3a0
0007f2a2  movs    r7, r0
0007f2a4  bls     #0x7f200
0007f2a6  movs    r7, r0
0007f2a8  bhi     #0x7f320
0007f2aa  movs    r7, r0
0007f2ac  stmdb   ip!, {r0, r1, r2}
0007f2b0  bvc     #0x7f358
0007f2b2  movs    r7, r0
0007f2b4  bls     #0x7f1b8
0007f2b6  movs    r7, r0
0007f2b8  bhi     #0x7f2d8
0007f2ba  movs    r7, r0
0007f2bc  cmn     r6, r6
0007f2be  movs    r7, r0
0007f2c0  ldrd    r0, r0, [r2, #-0x1c]
0007f2c4  bls     #0x7f390
0007f2c6  movs    r7, r0
