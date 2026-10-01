========================================================================
-[EAMTX_Banner setM_Type  0x000ccd18  40 bytes   EAMTX_Banner.mm
========================================================================

000ccd18  push    {r7, lr}
000ccd1a  add     r7, sp, #0
000ccd1c  sub     sp, #8
000ccd1e  mov     r3, r2
000ccd20  ldr     r2, [pc, #0x18]
000ccd22  mov.w   ip, #0
000ccd26  add     r2, pc ; -> 0x000f9168  OBJC_IVAR_$_EAMTX_Banner.m_Type
000ccd28  ldr     r2, [r2]
000ccd2a  str.w   ip, [sp]
000ccd2e  str.w   ip, [sp, #4]
000ccd32  blx     #0xddc20 ; -> objc_setProperty
000ccd36  sub.w   sp, r7, #0
000ccd3a  pop     {r7, pc}
000ccd3c  stm     r4!, {r1, r2, r3, r4, r5}
000ccd3e  movs    r2, r0
