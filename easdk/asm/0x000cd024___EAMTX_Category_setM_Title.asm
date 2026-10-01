========================================================================
-[EAMTX_Category setM_Title  0x000cd024  40 bytes   EAMTX_Category.mm
========================================================================

000cd024  push    {r7, lr}
000cd026  add     r7, sp, #0
000cd028  sub     sp, #8
000cd02a  mov     r3, r2
000cd02c  ldr     r2, [pc, #0x18]
000cd02e  mov.w   ip, #0
000cd032  add     r2, pc ; -> 0x000f9300  OBJC_IVAR_$_EAMTX_Category.m_Title
000cd034  ldr     r2, [r2]
000cd036  str.w   ip, [sp]
000cd03a  str.w   ip, [sp, #4]
000cd03e  blx     #0xddc20 ; -> objc_setProperty
000cd042  sub.w   sp, r7, #0
000cd046  pop     {r7, pc}
000cd048  stm     r2!, {r1, r3, r6, r7}
000cd04a  movs    r2, r0
