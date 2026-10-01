========================================================================
-[EAMTX_UserInfo setM_BundleId  0x000ca20c  40 bytes   EAMTX_UserInfo.mm
========================================================================

000ca20c  push    {r7, lr}
000ca20e  add     r7, sp, #0
000ca210  sub     sp, #8
000ca212  mov     r3, r2
000ca214  ldr     r2, [pc, #0x18]
000ca216  mov.w   ip, #0
000ca21a  add     r2, pc ; -> 0x000f8524  OBJC_IVAR_$_EAMTX_UserInfo.m_BundleId
000ca21c  ldr     r2, [r2]
000ca21e  str.w   ip, [sp]
000ca222  str.w   ip, [sp, #4]
000ca226  blx     #0xddc20 ; -> objc_setProperty
000ca22a  sub.w   sp, r7, #0
000ca22e  pop     {r7, pc}
000ca230  b       #0xca840
000ca232  movs    r2, r0
