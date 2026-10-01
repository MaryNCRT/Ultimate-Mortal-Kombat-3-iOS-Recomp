========================================================================
-[EAMTX_MTXProduct setM_CurrencySymbol  0x000c9260  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9260  push    {r7, lr}
000c9262  add     r7, sp, #0
000c9264  sub     sp, #8
000c9266  mov     r3, r2
000c9268  ldr     r2, [pc, #0x18]
000c926a  mov.w   ip, #0
000c926e  add     r2, pc ; -> 0x000f808c  OBJC_IVAR_$_EAMTX_MTXProduct.m_CurrencySymbol
000c9270  ldr     r2, [r2]
000c9272  str.w   ip, [sp]
000c9276  str.w   ip, [sp, #4]
000c927a  blx     #0xddc20 ; -> objc_setProperty
000c927e  sub.w   sp, r7, #0
000c9282  pop     {r7, pc}
000c9284  cdp     p0, #1, c0, c10, c2, #0
