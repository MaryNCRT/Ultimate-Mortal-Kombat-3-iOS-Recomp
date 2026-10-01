========================================================================
-[EAMTX_MTXProduct setM_ProdIdentifier  0x000c91c0  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c91c0  push    {r7, lr}
000c91c2  add     r7, sp, #0
000c91c4  sub     sp, #8
000c91c6  mov     r3, r2
000c91c8  ldr     r2, [pc, #0x18]
000c91ca  mov.w   ip, #0
000c91ce  add     r2, pc ; -> 0x000f8078  OBJC_IVAR_$_EAMTX_MTXProduct.m_ProdIdentifier
000c91d0  ldr     r2, [r2]
000c91d2  str.w   ip, [sp]
000c91d6  str.w   ip, [sp, #4]
000c91da  blx     #0xddc20 ; -> objc_setProperty
000c91de  sub.w   sp, r7, #0
000c91e2  pop     {r7, pc}
000c91e4  cdp     p0, #0xa, c0, c6, c2, #0
