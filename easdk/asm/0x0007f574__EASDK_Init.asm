========================================================================
EASDK_Init  0x0007f574  224 bytes   EASDK_Handler.mm
========================================================================

0007f574  push    {r4, r7, lr}
0007f576  add     r7, sp, #4
0007f578  sub     sp, #8
0007f57a  ldr     r3, [pc, #0x98]
0007f57c  movs    r2, #0
0007f57e  ldr     r0, [pc, #0x98]
0007f580  add     r3, pc ; -> 0x000f3360  tickerLoaded
0007f582  ldr     r4, [pc, #0x98]
0007f584  ldr     r3, [r3]
0007f586  add     r0, pc ; -> 0x0017e624  
0007f588  str     r2, [r3]
0007f58a  ldr     r3, [pc, #0x94]
0007f58c  add     r3, pc ; -> 0x000f337c  displayTicker
0007f58e  ldr     r3, [r3]
0007f590  str     r2, [r3]
0007f592  blx     #0xdd3e0 ; -> NSLog
0007f596  ldr     r0, [pc, #0x8c]
0007f598  add     r0, pc ; -> 0x0007edf1  ZL29MTXStore_EventHandlerCallback11MTX_EventIDiPv
0007f59a  bl      #0xb753c ; -> Z19MTX_RegisterHandlerPFv11MTX_EventIDiPvE
0007f59e  ldr     r0, [pc, #0x88]
0007f5a0  add     r0, pc ; -> 0x0017e634  
0007f5a2  blx     #0xdd3e0 ; -> NSLog
0007f5a6  movs    r2, #0
0007f5a8  movs    r3, #0
0007f5aa  ldr     r1, [pc, #0x80]
0007f5ac  stm.w   sp, {r3, r4}
0007f5b0  movs    r0, #0
0007f5b2  ldr     r3, [pc, #0x7c]
0007f5b4  bl      #0xbe278 ; -> Z20MTX_SetLoggingConfigddd
0007f5b8  ldr     r0, [pc, #0x78]
0007f5ba  add     r0, pc ; -> 0x0017e644  
0007f5bc  blx     #0xdd3e0 ; -> NSLog
0007f5c0  ldr     r0, [pc, #0x74]
0007f5c2  ldr     r1, [pc, #0x78]
0007f5c4  add     r0, pc ; -> 0x000fdb5c  
0007f5c6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f5c8  ldr     r0, [r0]
0007f5ca  ldr     r1, [r1]
0007f5cc  blx     #0xddbfc ; -> objc_msgSend
0007f5d0  ldr     r2, [pc, #0x6c]
0007f5d2  ldr     r1, [pc, #0x70]
0007f5d4  add     r2, pc ; -> 0x000f34c0  Language
0007f5d6  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f5d8  ldr     r2, [r2]
0007f5da  ldr     r1, [r1]
0007f5dc  blx     #0xddbfc ; -> objc_msgSend
0007f5e0  ldr     r1, [pc, #0x64]
0007f5e2  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f5e4  ldr     r1, [r1]
0007f5e6  blx     #0xddbfc ; -> objc_msgSend
0007f5ea  ldr     r1, [pc, #0x60]
0007f5ec  add     r1, pc ; -> 0x000fcbcc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x254
0007f5ee  ldr     r1, [r1]
0007f5f0  blx     #0xddbfc ; -> objc_msgSend
0007f5f4  mov     r4, r0
0007f5f6  ldr     r0, [pc, #0x58]
0007f5f8  mov     r1, r4
0007f5fa  add     r0, pc ; -> 0x0017e654  
0007f5fc  blx     #0xdd3e0 ; -> NSLog
0007f600  movs    r1, #1
0007f602  movs    r2, #3
0007f604  mov     r0, r4
0007f606  bl      #0xc1db0 ; -> Z14MTX_GetTickersP8NSStringii
0007f60a  bl      #0x7ec50 ; -> EASOC_FBInit
0007f60e  sub.w   sp, r7, #4
0007f612  pop     {r4, r7, pc}
0007f614  subs    r5, #0xdc
0007f616  movs    r7, r0
0007f618  eors    r0, sl, #0xf
0007f61c  ldrh    r0, [r0]
0007f61e  lsrs    r3, r0
0007f620  subs    r5, #0xec
0007f622  movs    r7, r0
0007f624  ldr     pc, [r5, #0xff]!
0007f628  eors    r0, r0, #0xf
0007f62c  movs    r0, r0
0007f62e  eors    r6, r1
0007f630  beq     #0x7f634
0007f632  eors    r2, r6
0007f634  eor     r0, r6, #0xf
0007f638  b       #0x7f164
0007f63a  movs    r7, r0
0007f63c  blo     #0x7f5b4
0007f63e  movs    r7, r0
0007f640  subs    r6, #0xe8
0007f642  movs    r7, r0
0007f644  bpl     #0x7f614
0007f646  movs    r7, r0
0007f648  bmi     #0x7f730
0007f64a  movs    r7, r0
0007f64c  bpl     #0x7f608
0007f64e  movs    r7, r0
0007f650  orrs    r0, r6, #0xf
