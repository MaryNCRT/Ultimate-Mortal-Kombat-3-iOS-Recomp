========================================================================
-[EAMTX_Ticker setM_Message  0x000cd3c4  40 bytes   EAMTX_Ticker.mm
========================================================================

000cd3c4  push    {r7, lr}
000cd3c6  add     r7, sp, #0
000cd3c8  sub     sp, #8
000cd3ca  mov     r3, r2
000cd3cc  ldr     r2, [pc, #0x18]
000cd3ce  mov.w   ip, #0
000cd3d2  add     r2, pc ; -> 0x000f94ac  OBJC_IVAR_$_EAMTX_Ticker.m_Message
000cd3d4  ldr     r2, [r2]
000cd3d6  str.w   ip, [sp]
000cd3da  str.w   ip, [sp, #4]
000cd3de  blx     #0xddc20 ; -> objc_setProperty
000cd3e2  sub.w   sp, r7, #0
000cd3e6  pop     {r7, pc}
000cd3e8  stm     r0!, {r1, r2, r4, r6, r7}
000cd3ea  movs    r2, r0
