========================================================================
-[EAMTX_MTXProduct setM_Version  0x000c9198  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9198  push    {r7, lr}
000c919a  add     r7, sp, #0
000c919c  sub     sp, #8
000c919e  mov     r3, r2
000c91a0  ldr     r2, [pc, #0x18]
000c91a2  mov.w   ip, #0
000c91a6  add     r2, pc ; -> 0x000f8074  OBJC_IVAR_$_EAMTX_MTXProduct.m_Version
000c91a8  ldr     r2, [r2]
000c91aa  str.w   ip, [sp]
000c91ae  str.w   ip, [sp, #4]
000c91b2  blx     #0xddc20 ; -> objc_setProperty
000c91b6  sub.w   sp, r7, #0
000c91ba  pop     {r7, pc}
000c91bc  cdp     p0, #0xc, c0, c10, c2, #0
