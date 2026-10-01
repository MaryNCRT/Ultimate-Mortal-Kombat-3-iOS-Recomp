========================================================================
-[EAMTX_MTXProduct setM_Category  0x000c9210  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9210  push    {r7, lr}
000c9212  add     r7, sp, #0
000c9214  sub     sp, #8
000c9216  mov     r3, r2
000c9218  ldr     r2, [pc, #0x18]
000c921a  mov.w   ip, #0
000c921e  add     r2, pc ; -> 0x000f8080  OBJC_IVAR_$_EAMTX_MTXProduct.m_Category
000c9220  ldr     r2, [r2]
000c9222  str.w   ip, [sp]
000c9226  str.w   ip, [sp, #4]
000c922a  blx     #0xddc20 ; -> objc_setProperty
000c922e  sub.w   sp, r7, #0
000c9232  pop     {r7, pc}
000c9234  cdp     p0, #5, c0, c14, c2, #0
