========================================================================
-[EAMTX_UserInfo setM_Email  0x000ca234  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca234  push    {r7, lr}
000ca236  add     r7, sp, #0
000ca238  sub     sp, #8
000ca23a  mov     r3, r2
000ca23c  ldr     r2, [pc, #0x18]
000ca23e  mov.w   ip, #0
000ca242  add     r2, pc ; -> 0x000f84f0  OBJC_IVAR_$_EAMTX_UserInfo.m_Email
000ca244  ldr     r2, [r2]
000ca246  str.w   ip, [sp]
000ca24a  str.w   ip, [sp, #4]
000ca24e  blx     #0xddc20 ; -> objc_setProperty
000ca252  sub.w   sp, r7, #0
000ca256  pop     {r7, pc}
000ca258  b       #0xca7b0
000ca25a  movs    r2, r0
