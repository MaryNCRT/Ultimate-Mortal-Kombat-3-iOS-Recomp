========================================================================
-[EAMTX_Ticker setM_Title  0x000cd374  40 bytes   EAMTX_Ticker.mm
========================================================================

000cd374  push    {r7, lr}
000cd376  add     r7, sp, #0
000cd378  sub     sp, #8
000cd37a  mov     r3, r2
000cd37c  ldr     r2, [pc, #0x18]
000cd37e  mov.w   ip, #0
000cd382  add     r2, pc ; -> 0x000f94a4  OBJC_IVAR_$_EAMTX_Ticker.m_Title
000cd384  ldr     r2, [r2]
000cd386  str.w   ip, [sp]
000cd38a  str.w   ip, [sp, #4]
000cd38e  blx     #0xddc20 ; -> objc_setProperty
000cd392  sub.w   sp, r7, #0
000cd396  pop     {r7, pc}
000cd398  stm     r1!, {r1, r2, r3, r4}
000cd39a  movs    r2, r0
