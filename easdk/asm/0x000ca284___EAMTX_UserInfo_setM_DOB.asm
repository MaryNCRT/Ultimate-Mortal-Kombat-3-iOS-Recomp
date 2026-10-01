========================================================================
-[EAMTX_UserInfo setM_DOB  0x000ca284  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca284  push    {r7, lr}
000ca286  add     r7, sp, #0
000ca288  sub     sp, #8
000ca28a  mov     r3, r2
000ca28c  ldr     r2, [pc, #0x18]
000ca28e  mov.w   ip, #0
000ca292  add     r2, pc ; -> 0x000f84f8  OBJC_IVAR_$_EAMTX_UserInfo.m_DOB
000ca294  ldr     r2, [r2]
000ca296  str.w   ip, [sp]
000ca29a  str.w   ip, [sp, #4]
000ca29e  blx     #0xddc20 ; -> objc_setProperty
000ca2a2  sub.w   sp, r7, #0
000ca2a6  pop     {r7, pc}
000ca2a8  b       #0xca770
000ca2aa  movs    r2, r0
