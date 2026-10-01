========================================================================
-[EAMTX_MTXProduct setM_BinPack  0x000c9238  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9238  push    {r7, lr}
000c923a  add     r7, sp, #0
000c923c  sub     sp, #8
000c923e  mov     r3, r2
000c9240  ldr     r2, [pc, #0x18]
000c9242  mov.w   ip, #0
000c9246  add     r2, pc ; -> 0x000f8084  OBJC_IVAR_$_EAMTX_MTXProduct.m_BinPack
000c9248  ldr     r2, [r2]
000c924a  str.w   ip, [sp]
000c924e  str.w   ip, [sp, #4]
000c9252  blx     #0xddc20 ; -> objc_setProperty
000c9256  sub.w   sp, r7, #0
000c925a  pop     {r7, pc}
000c925c  cdp     p0, #3, c0, c10, c2, #0
