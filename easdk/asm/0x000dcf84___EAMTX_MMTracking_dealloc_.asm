========================================================================
-[EAMTX_MMTracking dealloc]  0x000dcf84  512 bytes   EAMTX_MMTracking.mm
========================================================================

000dcf84  push    {r4, r7, lr}
000dcf86  add     r7, sp, #4
000dcf88  sub     sp, #8
000dcf8a  ldr     r3, [pc, #0x30]
000dcf8c  ldr     r1, [pc, #0x30]
000dcf8e  mov     r4, r0
000dcf90  add     r3, pc ; -> 0x000fc978  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn
000dcf92  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000dcf94  ldr     r3, [r3]
000dcf96  ldr     r1, [r1]
000dcf98  ldr     r0, [r0, r3]
000dcf9a  blx     #0xddbfc ; -> objc_msgSend
000dcf9e  ldr     r3, [pc, #0x24]
000dcfa0  ldr     r1, [pc, #0x24]
000dcfa2  mov     r0, sp
000dcfa4  add     r3, pc ; -> 0x000fde08  
000dcfa6  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000dcfa8  ldr     r3, [r3]
000dcfaa  ldr     r1, [r1]
000dcfac  str     r4, [sp]
000dcfae  str     r3, [sp, #4]
000dcfb0  blx     #0xddc08 ; -> objc_msgSendSuper2
000dcfb4  sub.w   sp, r7, #4
000dcfb8  pop     {r4, r7, pc}
000dcfba  nop     
000dcfbc  vld1.8  {d16[0]}, [r4], r1
000dcfc0  vld1.8  {d16[0]}, [r6], r1
000dcfc4  lsrs    r0, r4, #0x19
000dcfc6  movs    r2, r0
