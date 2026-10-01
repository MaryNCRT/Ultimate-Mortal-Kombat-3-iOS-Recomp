========================================================================
-[EAMTX_TransObserver paymentQueue  0x000c792c  144 bytes   EAMTX_TransObserver.mm
========================================================================

000c792c  push    {r4, r5, r7, lr}
000c792e  add     r7, sp, #8
000c7930  mov     r4, r3
000c7932  ldr     r3, [pc, #0x60]
000c7934  mov     r5, r0
000c7936  add     r3, pc ; -> 0x000f3280  bRequiredToShowAlert
000c7938  ldr     r3, [r3]
000c793a  ldrb    r3, [r3]
000c793c  cbnz    r3, #0xc7990
000c793e  ldr     r0, [pc, #0x58]
000c7940  ldr     r1, [pc, #0x58]
000c7942  ldr     r2, [pc, #0x5c]
000c7944  add     r0, pc ; -> 0x000fdb5c  
000c7946  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000c7948  add     r2, pc ; -> 0x00181564  
000c794a  ldr     r1, [r1]
000c794c  mov     r3, r4
000c794e  ldr     r0, [r0]
000c7950  blx     #0xddbfc ; -> objc_msgSend
000c7954  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000c7958  ldr     r1, [pc, #0x48]
000c795a  mov     r0, r4
000c795c  add     r1, pc ; -> 0x000fcc38  '\\M\x0e'
000c795e  ldr     r1, [r1]
000c7960  blx     #0xddbfc ; -> objc_msgSend
000c7964  cmp     r0, #2
000c7966  bne     #0xc7976
000c7968  ldr     r1, [pc, #0x3c]
000c796a  ldr     r3, [pc, #0x40]
000c796c  movs    r2, #0x14
000c796e  add     r1, pc ; -> 0x000fd734  
000c7970  mov     r0, r5
000c7972  ldr     r1, [r1]
000c7974  b       #0xc7982
000c7976  ldr     r1, [pc, #0x38]
000c7978  ldr     r3, [pc, #0x38]
000c797a  movs    r2, #0x14
000c797c  add     r1, pc ; -> 0x000fd734  
000c797e  mov     r0, r5
000c7980  ldr     r1, [r1]
000c7982  blx     #0xddbfc ; -> objc_msgSend
000c7986  ldr     r3, [pc, #0x30]
000c7988  movs    r2, #0
000c798a  add     r3, pc ; -> 0x000f7fd0  OBJC_IVAR_$_EAMTX_TransObserver.m_RestoreState
000c798c  ldr     r3, [r3]
000c798e  str     r2, [r5, r3]
000c7990  pop     {r4, r5, r7, pc}
000c7992  nop     
000c7994  cbnz    r6, #0xc79a8
000c7996  movs    r2, r0
000c7998  str     r4, [r2, #0x20]
000c799a  movs    r3, r0
000c799c  str     r6, [r2, r5]
000c799e  movs    r3, r0
000c79a0  ldr     r4, [sp, #0x60]
000c79a2  movs    r3, r1
000c79a4  strh    r0, [r3, r3]
000c79a6  movs    r3, r0
000c79a8  ldrb    r2, [r0, r7]
000c79aa  movs    r3, r0
000c79ac  orr.w   pc, sp, pc, ror #31
000c79b0  ldrb    r4, [r6, r6]
000c79b2  movs    r3, r0
000c79b4  b       #0xc75a4
