========================================================================
GetBadgesCount  0x000b6f84  112 bytes   EAMTX_Main.mm
========================================================================

000b6f84  push    {r4, r5, r7, lr}
000b6f86  add     r7, sp, #8
000b6f88  ldr     r5, [pc, #0x50]
000b6f8a  rsbs.w  r3, r0, #1
000b6f8e  it      lo
000b6f90  movlo   r3, #0
000b6f92  mov     r4, r0
000b6f94  add     r5, pc ; -> 0x0038c194  m_BadgesDict
000b6f96  ldr     r2, [r5]
000b6f98  cmp     r2, #0
000b6f9a  it      eq
000b6f9c  orreq   r3, r3, #1
000b6fa0  cbnz    r3, #0xb6fd8
000b6fa2  ldr     r0, [pc, #0x3c]
000b6fa4  ldr     r1, [pc, #0x3c]
000b6fa6  ldr     r2, [pc, #0x40]
000b6fa8  add     r0, pc ; -> 0x000fdb5c  
000b6faa  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000b6fac  add     r2, pc ; -> 0x00180064  
000b6fae  ldr     r1, [r1]
000b6fb0  mov     r3, r4
000b6fb2  ldr     r0, [r0]
000b6fb4  blx     #0xddbfc ; -> objc_msgSend
000b6fb8  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000b6fbc  ldr     r1, [pc, #0x2c]
000b6fbe  ldr     r0, [r5]
000b6fc0  mov     r2, r4
000b6fc2  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000b6fc4  ldr     r1, [r1]
000b6fc6  blx     #0xddbfc ; -> objc_msgSend
000b6fca  cbz     r0, #0xb6fd8
000b6fcc  ldr     r1, [pc, #0x20]
000b6fce  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000b6fd0  ldr     r1, [r1]
000b6fd2  blx     #0xddbfc ; -> objc_msgSend
000b6fd6  b       #0xb6fda
000b6fd8  movs    r0, #0
000b6fda  pop     {r4, r5, r7, pc}
000b6fdc  str     r4, [r7, r7]
000b6fde  movs    r5, r5
000b6fe0  ldr     r0, [r6, #0x38]
000b6fe2  movs    r4, r0
000b6fe4  ldrh    r2, [r6, r3]
000b6fe6  movs    r4, r0
000b6fe8  str     r0, [sp, #0x2d0]
000b6fea  movs    r4, r1
000b6fec  ldrh    r2, [r5, r4]
000b6fee  movs    r4, r0
000b6ff0  ldrh    r6, [r5, r2]
000b6ff2  movs    r4, r0
