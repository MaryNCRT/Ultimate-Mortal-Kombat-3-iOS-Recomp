========================================================================
-[EAMTX_MTXProduct setM_ReleaseDate  0x000c91e8  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c91e8  push    {r7, lr}
000c91ea  add     r7, sp, #0
000c91ec  sub     sp, #8
000c91ee  mov     r3, r2
000c91f0  ldr     r2, [pc, #0x18]
000c91f2  mov.w   ip, #0
000c91f6  add     r2, pc ; -> 0x000f807c  OBJC_IVAR_$_EAMTX_MTXProduct.m_ReleaseDate
000c91f8  ldr     r2, [r2]
000c91fa  str.w   ip, [sp]
000c91fe  str.w   ip, [sp, #4]
000c9202  blx     #0xddc20 ; -> objc_setProperty
000c9206  sub.w   sp, r7, #0
000c920a  pop     {r7, pc}
000c920c  cdp     p0, #8, c0, c2, c2, #0
