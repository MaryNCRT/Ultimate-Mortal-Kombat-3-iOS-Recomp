========================================================================
-[EAMTX_Banner setM_URL  0x000cccc8  40 bytes   EAMTX_Banner.mm
========================================================================

000cccc8  push    {r7, lr}
000cccca  add     r7, sp, #0
000ccccc  sub     sp, #8
000cccce  mov     r3, r2
000cccd0  ldr     r2, [pc, #0x18]
000cccd2  mov.w   ip, #0
000cccd6  add     r2, pc ; -> 0x000f9160  OBJC_IVAR_$_EAMTX_Banner.m_URL
000cccd8  ldr     r2, [r2]
000cccda  str.w   ip, [sp]
000cccde  str.w   ip, [sp, #4]
000ccce2  blx     #0xddc20 ; -> objc_setProperty
000ccce6  sub.w   sp, r7, #0
000cccea  pop     {r7, pc}
000cccec  stm     r4!, {r1, r2, r7}
000cccee  movs    r2, r0
