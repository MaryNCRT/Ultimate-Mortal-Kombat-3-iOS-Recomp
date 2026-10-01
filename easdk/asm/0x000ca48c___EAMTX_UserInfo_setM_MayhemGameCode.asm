========================================================================
-[EAMTX_UserInfo setM_MayhemGameCode  0x000ca48c  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca48c  push    {r7, lr}
000ca48e  add     r7, sp, #0
000ca490  sub     sp, #8
000ca492  mov     r3, r2
000ca494  ldr     r2, [pc, #0x18]
000ca496  mov.w   ip, #0
000ca49a  add     r2, pc ; -> 0x000f8528  OBJC_IVAR_$_EAMTX_UserInfo.m_MayhemGameCode
000ca49c  ldr     r2, [r2]
000ca49e  str.w   ip, [sp]
000ca4a2  str.w   ip, [sp, #4]
000ca4a6  blx     #0xddc20 ; -> objc_setProperty
000ca4aa  sub.w   sp, r7, #0
000ca4ae  pop     {r7, pc}
000ca4b0  b       #0xca5c8
000ca4b2  movs    r2, r0
