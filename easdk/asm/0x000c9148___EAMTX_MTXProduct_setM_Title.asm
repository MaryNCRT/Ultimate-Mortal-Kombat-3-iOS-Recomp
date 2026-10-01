========================================================================
-[EAMTX_MTXProduct setM_Title  0x000c9148  40 bytes   EAMTX_MTXProduct.mm
========================================================================

000c9148  push    {r7, lr}
000c914a  add     r7, sp, #0
000c914c  sub     sp, #8
000c914e  mov     r3, r2
000c9150  ldr     r2, [pc, #0x18]
000c9152  mov.w   ip, #0
000c9156  add     r2, pc ; -> 0x000f806c  OBJC_IVAR_$_EAMTX_MTXProduct.m_Title
000c9158  ldr     r2, [r2]
000c915a  str.w   ip, [sp]
000c915e  str.w   ip, [sp, #4]
000c9162  blx     #0xddc20 ; -> objc_setProperty
000c9166  sub.w   sp, r7, #0
000c916a  pop     {r7, pc}
000c916c  vhadd.s16 d0, d2, d2
