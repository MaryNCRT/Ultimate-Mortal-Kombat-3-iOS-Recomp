========================================================================
-[EAMTX_Controller setProcessTimer  0x000cc1dc  40 bytes   EAMTX_Controller.mm
========================================================================

000cc1dc  push    {r7, lr}
000cc1de  add     r7, sp, #0
000cc1e0  sub     sp, #8
000cc1e2  mov     r3, r2
000cc1e4  ldr     r2, [pc, #0x18]
000cc1e6  mov.w   ip, #0
000cc1ea  add     r2, pc ; -> 0x000f8c28  OBJC_IVAR_$_EAMTX_Controller.processTimer
000cc1ec  ldr     r2, [r2]
000cc1ee  str.w   ip, [sp]
000cc1f2  str.w   ip, [sp, #4]
000cc1f6  blx     #0xddc20 ; -> objc_setProperty
000cc1fa  sub.w   sp, r7, #0
000cc1fe  pop     {r7, pc}
000cc200  ldm     r2!, {r1, r3, r4, r5}
000cc202  movs    r2, r0
