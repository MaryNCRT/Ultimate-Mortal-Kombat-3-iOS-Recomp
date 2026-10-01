========================================================================
-[EAMTX_MTXProduct setM_Dummy  0x000c92b0  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c92b0  push    {r7, lr}
000c92b2  add     r7, sp, #0
000c92b4  sub     sp, #8
000c92b6  mov     r3, r2
000c92b8  ldr     r2, [pc, #0x18]
000c92ba  mov.w   ip, #0
000c92be  add     r2, pc ; -> 0x000f8090  OBJC_IVAR_$_EAMTX_MTXProduct.m_Dummy
000c92c0  ldr     r2, [r2]
000c92c2  str.w   ip, [sp]
000c92c6  str.w   ip, [sp, #4]
000c92ca  blx     #0xddc20 ; -> objc_setProperty
000c92ce  sub.w   sp, r7, #0
000c92d2  pop     {r7, pc}
000c92d4  stcl    p0, c0, [lr, #8]
