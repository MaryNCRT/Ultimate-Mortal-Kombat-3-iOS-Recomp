========================================================================
-[EAMTX_MTXProduct setM_LocalCurrency  0x000c9288  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9288  push    {r7, lr}
000c928a  add     r7, sp, #0
000c928c  sub     sp, #8
000c928e  mov     r3, r2
000c9290  ldr     r2, [pc, #0x18]
000c9292  mov.w   ip, #0
000c9296  add     r2, pc ; -> 0x000f8088  OBJC_IVAR_$_EAMTX_MTXProduct.m_LocalCurrency
000c9298  ldr     r2, [r2]
000c929a  str.w   ip, [sp]
000c929e  str.w   ip, [sp, #4]
000c92a2  blx     #0xddc20 ; -> objc_setProperty
000c92a6  sub.w   sp, r7, #0
000c92aa  pop     {r7, pc}
000c92ac  stcl    p0, c0, [lr, #8]!
