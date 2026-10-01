========================================================================
EASDK_LogEvent  0x0007f420  232 bytes   EASDK_Handler.mm
========================================================================

0007f420  push    {r4, r5, r6, r7, lr}
0007f422  add     r7, sp, #0xc
0007f424  push.w  {r8, sl, fp}
0007f428  sub     sp, #8
0007f42a  mov     r8, r0
0007f42c  mov     sl, r1
0007f42e  mov     r4, r2
0007f430  mov     fp, r3
0007f432  ldr     r5, [sp, #0x28]
0007f434  cmp     r2, #0
0007f436  beq     #0x7f4d2
0007f438  ldr     r0, [pc, #0x9c]
0007f43a  ldr     r1, [pc, #0xa0]
0007f43c  add     r0, pc ; -> 0x000fdb5c  
0007f43e  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f440  ldr     r0, [r0]
0007f442  ldr     r1, [r1]
0007f444  blx     #0xddbfc ; -> objc_msgSend
0007f448  ldr     r1, [pc, #0x94]
0007f44a  mov     r2, r4
0007f44c  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f44e  ldr     r1, [r1]
0007f450  blx     #0xddbfc ; -> objc_msgSend
0007f454  ldr     r1, [pc, #0x8c]
0007f456  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f458  ldr     r1, [r1]
0007f45a  blx     #0xddbfc ; -> objc_msgSend
0007f45e  mov     r6, r0
0007f460  cmp     r5, #0
0007f462  beq     #0x7f4ce
0007f464  ldr     r0, [pc, #0x80]
0007f466  ldr     r1, [pc, #0x84]
0007f468  add     r0, pc ; -> 0x000fdb5c  
0007f46a  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
0007f46c  ldr     r0, [r0]
0007f46e  ldr     r1, [r1]
0007f470  blx     #0xddbfc ; -> objc_msgSend
0007f474  ldr     r1, [pc, #0x78]
0007f476  mov     r2, r5
0007f478  add     r1, pc ; -> 0x000fcbc0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x248
0007f47a  ldr     r1, [r1]
0007f47c  blx     #0xddbfc ; -> objc_msgSend
0007f480  ldr     r1, [pc, #0x70]
0007f482  add     r1, pc ; -> 0x000fca58  '\x14\t\x0e'
0007f484  ldr     r1, [r1]
0007f486  blx     #0xddbfc ; -> objc_msgSend
0007f48a  mov     r4, r0
0007f48c  ldr     r3, [pc, #0x68]
0007f48e  add     r3, pc ; -> 0x000f354c  Settings
0007f490  ldr     r3, [r3]
0007f492  ldr     r3, [r3, #0x24]
0007f494  cbz     r3, #0x7f4b6
0007f496  ldr     r0, [pc, #0x64]
0007f498  ldr     r1, [pc, #0x64]
0007f49a  add     r0, pc ; -> 0x000fdbb4  
0007f49c  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
0007f49e  ldr     r0, [r0]
0007f4a0  ldr     r1, [r1]
0007f4a2  blx     #0xddbfc ; -> objc_msgSend
0007f4a6  mov     r1, sl
0007f4a8  mov     r2, r6
0007f4aa  mov     r3, fp
0007f4ac  str     r4, [sp]
0007f4ae  str     r0, [sp, #4]
0007f4b0  mov     r0, r8
0007f4b2  bl      #0xbe81c ; -> Z15MTX_LogEAServeriiP8NSStringiS0_P6NSDate
0007f4b6  ldr     r0, [pc, #0x4c]
0007f4b8  mov     r1, r8
0007f4ba  mov     r2, r6
0007f4bc  add     r0, pc ; -> 0x0017e5d4  
0007f4be  mov     r3, r4
0007f4c0  blx     #0xdd3e0 ; -> NSLog
0007f4c4  sub.w   sp, r7, #0x18
0007f4c8  pop.w   {r8, sl, fp}
0007f4cc  pop     {r4, r5, r6, r7, pc}
0007f4ce  mov     r4, r5
0007f4d0  b       #0x7f48c
0007f4d2  mov     r6, r2
0007f4d4  b       #0x7f460
0007f4d6  nop     
0007f4d8  b       #0x7f314
0007f4da  movs    r7, r0
0007f4dc  bpl     #0x7f564
0007f4de  movs    r7, r0
0007f4e0  bvc     #0x7f5c4
0007f4e2  movs    r7, r0
0007f4e4  bpl     #0x7f4e4
0007f4e6  movs    r7, r0
0007f4e8  b       #0x7f2cc ; -> EASOC_StatPostFailed
0007f4ea  movs    r7, r0
0007f4ec  bpl     #0x7f51c
0007f4ee  movs    r7, r0
0007f4f0  bvc     #0x7f57c
0007f4f2  movs    r7, r0
0007f4f4  bpl     #0x7f49c
0007f4f6  movs    r7, r0
0007f4f8  lsls    r2, r7
0007f4fa  movs    r7, r0
0007f4fc  b       #0x7f32c
0007f4fe  movs    r7, r0
0007f500  bvc     #0x7f554
0007f502  movs    r7, r0
0007f504  adds.w  r0, r4, #0xf
