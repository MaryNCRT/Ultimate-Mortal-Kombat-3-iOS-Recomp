========================================================================
-[EAMTX_Banner setM_Title  0x000ccca0  40 bytes   EAMTX_Banner.mm
========================================================================

000ccca0  push    {r7, lr}
000ccca2  add     r7, sp, #0
000ccca4  sub     sp, #8
000ccca6  mov     r3, r2
000ccca8  ldr     r2, [pc, #0x18]
000cccaa  mov.w   ip, #0
000cccae  add     r2, pc ; -> 0x000f915c  OBJC_IVAR_$_EAMTX_Banner.m_Title
000cccb0  ldr     r2, [r2]
000cccb2  str.w   ip, [sp]
000cccb6  str.w   ip, [sp, #4]
000cccba  blx     #0xddc20 ; -> objc_setProperty
000cccbe  sub.w   sp, r7, #0
000cccc2  pop     {r7, pc}
000cccc4  stm     r4!, {r1, r3, r5, r7}
000cccc6  movs    r2, r0
