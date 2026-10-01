========================================================================
-[EAMTX_Ticker setM_Type  0x000cd3ec  40 bytes   EAMTX_Ticker.mm
========================================================================

000cd3ec  push    {r7, lr}
000cd3ee  add     r7, sp, #0
000cd3f0  sub     sp, #8
000cd3f2  mov     r3, r2
000cd3f4  ldr     r2, [pc, #0x18]
000cd3f6  mov.w   ip, #0
000cd3fa  add     r2, pc ; -> 0x000f94b0  OBJC_IVAR_$_EAMTX_Ticker.m_Type
000cd3fc  ldr     r2, [r2]
000cd3fe  str.w   ip, [sp]
000cd402  str.w   ip, [sp, #4]
000cd406  blx     #0xddc20 ; -> objc_setProperty
000cd40a  sub.w   sp, r7, #0
000cd40e  pop     {r7, pc}
000cd410  stm     r0!, {r1, r4, r5, r7}
000cd412  movs    r2, r0
