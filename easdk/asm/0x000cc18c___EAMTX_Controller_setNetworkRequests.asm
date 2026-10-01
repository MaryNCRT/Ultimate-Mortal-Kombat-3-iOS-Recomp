========================================================================
-[EAMTX_Controller setNetworkRequests  0x000cc18c  40 bytes   EAMTX_Controller.mm
========================================================================

000cc18c  push    {r7, lr}
000cc18e  add     r7, sp, #0
000cc190  sub     sp, #8
000cc192  mov     r3, r2
000cc194  ldr     r2, [pc, #0x18]
000cc196  mov.w   ip, #0
000cc19a  add     r2, pc ; -> 0x000f8c1c  OBJC_IVAR_$_EAMTX_Controller.networkRequests
000cc19c  ldr     r2, [r2]
000cc19e  str.w   ip, [sp]
000cc1a2  str.w   ip, [sp, #4]
000cc1a6  blx     #0xddc20 ; -> objc_setProperty
000cc1aa  sub.w   sp, r7, #0
000cc1ae  pop     {r7, pc}
000cc1b0  ldm     r2, {r1, r2, r3, r4, r5, r6}
000cc1b2  movs    r2, r0
