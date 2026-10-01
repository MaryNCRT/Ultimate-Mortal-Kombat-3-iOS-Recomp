========================================================================
-[EAMTX_MTXProduct setM_Desc  0x000c9170  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9170  push    {r7, lr}
000c9172  add     r7, sp, #0
000c9174  sub     sp, #8
000c9176  mov     r3, r2
000c9178  ldr     r2, [pc, #0x18]
000c917a  mov.w   ip, #0
000c917e  add     r2, pc ; -> 0x000f8070  OBJC_IVAR_$_EAMTX_MTXProduct.m_Desc
000c9180  ldr     r2, [r2]
000c9182  str.w   ip, [sp]
000c9186  str.w   ip, [sp, #4]
000c918a  blx     #0xddc20 ; -> objc_setProperty
000c918e  sub.w   sp, r7, #0
000c9192  pop     {r7, pc}
000c9194  cdp     p0, #0xe, c0, c14, c2, #0
