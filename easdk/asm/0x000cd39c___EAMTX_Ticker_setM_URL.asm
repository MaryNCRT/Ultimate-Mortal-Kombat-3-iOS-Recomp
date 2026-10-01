========================================================================
-[EAMTX_Ticker setM_URL  0x000cd39c  40 bytes   EAMTX_Ticker.mm
========================================================================

000cd39c  push    {r7, lr}
000cd39e  add     r7, sp, #0
000cd3a0  sub     sp, #8
000cd3a2  mov     r3, r2
000cd3a4  ldr     r2, [pc, #0x18]
000cd3a6  mov.w   ip, #0
000cd3aa  add     r2, pc ; -> 0x000f94a8  OBJC_IVAR_$_EAMTX_Ticker.m_URL
000cd3ac  ldr     r2, [r2]
000cd3ae  str.w   ip, [sp]
000cd3b2  str.w   ip, [sp, #4]
000cd3b6  blx     #0xddc20 ; -> objc_setProperty
000cd3ba  sub.w   sp, r7, #0
000cd3be  pop     {r7, pc}
000cd3c0  stm     r0!, {r1, r3, r4, r5, r6, r7}
000cd3c2  movs    r2, r0
