========================================================================
-[EAMTX_Category setM_RegImgData  0x000cd074  40 bytes   EAMTX_Category.mm
========================================================================

000cd074  push    {r7, lr}
000cd076  add     r7, sp, #0
000cd078  sub     sp, #8
000cd07a  mov     r3, r2
000cd07c  ldr     r2, [pc, #0x18]
000cd07e  mov.w   ip, #0
000cd082  add     r2, pc ; -> 0x000f9308  OBJC_IVAR_$_EAMTX_Category.m_RegImgData
000cd084  ldr     r2, [r2]
000cd086  str.w   ip, [sp]
000cd08a  str.w   ip, [sp, #4]
000cd08e  blx     #0xddc20 ; -> objc_setProperty
000cd092  sub.w   sp, r7, #0
000cd096  pop     {r7, pc}
000cd098  stm     r2!, {r1, r7}
000cd09a  movs    r2, r0
