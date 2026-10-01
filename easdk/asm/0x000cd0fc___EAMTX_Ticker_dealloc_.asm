========================================================================
-[EAMTX_Ticker dealloc]  0x000cd0fc  128 bytes   EAMTX_Ticker.mm
========================================================================

000cd0fc  push    {r4, r5, r7, lr}
000cd0fe  add     r7, sp, #8
000cd100  sub     sp, #8
000cd102  ldr     r3, [pc, #0x5c]
000cd104  ldr     r1, [pc, #0x5c]
000cd106  mov     r5, r0
000cd108  add     r3, pc ; -> 0x000f94a4  OBJC_IVAR_$_EAMTX_Ticker.m_Title
000cd10a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cd10c  ldr     r3, [r3]
000cd10e  ldr     r4, [r1]
000cd110  ldr     r0, [r0, r3]
000cd112  mov     r1, r4
000cd114  blx     #0xddbfc ; -> objc_msgSend
000cd118  ldr     r3, [pc, #0x4c]
000cd11a  mov     r1, r4
000cd11c  add     r3, pc ; -> 0x000f94a8  OBJC_IVAR_$_EAMTX_Ticker.m_URL
000cd11e  ldr     r3, [r3]
000cd120  ldr     r0, [r5, r3]
000cd122  blx     #0xddbfc ; -> objc_msgSend
000cd126  ldr     r3, [pc, #0x44]
000cd128  mov     r1, r4
000cd12a  add     r3, pc ; -> 0x000f94ac  OBJC_IVAR_$_EAMTX_Ticker.m_Message
000cd12c  ldr     r3, [r3]
000cd12e  ldr     r0, [r5, r3]
000cd130  blx     #0xddbfc ; -> objc_msgSend
000cd134  ldr     r3, [pc, #0x38]
000cd136  mov     r1, r4
000cd138  add     r3, pc ; -> 0x000f94b0  OBJC_IVAR_$_EAMTX_Ticker.m_Type
000cd13a  ldr     r3, [r3]
000cd13c  ldr     r0, [r5, r3]
000cd13e  blx     #0xddbfc ; -> objc_msgSend
000cd142  ldr     r3, [pc, #0x30]
000cd144  ldr     r1, [pc, #0x30]
000cd146  mov     r0, sp
000cd148  add     r3, pc ; -> 0x000fddb0  
000cd14a  add     r1, pc ; -> 0x000fc9a0  '\x1c\x06\x0e'
000cd14c  ldr     r3, [r3]
000cd14e  ldr     r1, [r1]
000cd150  str     r5, [sp]
000cd152  str     r3, [sp, #4]
000cd154  blx     #0xddc08 ; -> objc_msgSendSuper2
000cd158  sub.w   sp, r7, #8
000cd15c  pop     {r4, r5, r7, pc}
000cd15e  nop     
000cd160  stm     r3!, {r3, r4, r7}
000cd162  movs    r2, r0
