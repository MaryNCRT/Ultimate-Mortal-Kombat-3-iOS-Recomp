========================================================================
-[EAMTX_Controller setRequestStartTime  0x000cc164  40 bytes   EAMTX_Controller.mm
========================================================================

000cc164  push    {r7, lr}
000cc166  add     r7, sp, #0
000cc168  sub     sp, #8
000cc16a  mov     r3, r2
000cc16c  ldr     r2, [pc, #0x18]
000cc16e  mov.w   ip, #0
000cc172  add     r2, pc ; -> 0x000f8c24  OBJC_IVAR_$_EAMTX_Controller.requestStartTime
000cc174  ldr     r2, [r2]
000cc176  str.w   ip, [sp]
000cc17a  str.w   ip, [sp, #4]
000cc17e  blx     #0xddc20 ; -> objc_setProperty
000cc182  sub.w   sp, r7, #0
000cc186  pop     {r7, pc}
000cc188  ldm     r2, {r1, r2, r3, r5, r7}
000cc18a  movs    r2, r0
