========================================================================
-[EAMTX_Banner setM_ImgData  0x000cccf0  40 bytes   EAMTX_Banner.mm
========================================================================

000cccf0  push    {r7, lr}
000cccf2  add     r7, sp, #0
000cccf4  sub     sp, #8
000cccf6  mov     r3, r2
000cccf8  ldr     r2, [pc, #0x18]
000cccfa  mov.w   ip, #0
000cccfe  add     r2, pc ; -> 0x000f9164  OBJC_IVAR_$_EAMTX_Banner.m_ImgData
000ccd00  ldr     r2, [r2]
000ccd02  str.w   ip, [sp]
000ccd06  str.w   ip, [sp, #4]
000ccd0a  blx     #0xddc20 ; -> objc_setProperty
000ccd0e  sub.w   sp, r7, #0
000ccd12  pop     {r7, pc}
000ccd14  stm     r4!, {r1, r5, r6}
000ccd16  movs    r2, r0
