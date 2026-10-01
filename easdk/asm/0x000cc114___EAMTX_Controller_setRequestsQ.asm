========================================================================
-[EAMTX_Controller setRequestsQ  0x000cc114  40 bytes   EAMTX_Controller.mm
========================================================================

000cc114  push    {r7, lr}
000cc116  add     r7, sp, #0
000cc118  sub     sp, #8
000cc11a  mov     r3, r2
000cc11c  ldr     r2, [pc, #0x18]
000cc11e  mov.w   ip, #0
000cc122  add     r2, pc ; -> 0x000f8c14  OBJC_IVAR_$_EAMTX_Controller.requestsQ
000cc124  ldr     r2, [r2]
000cc126  str.w   ip, [sp]
000cc12a  str.w   ip, [sp, #4]
000cc12e  blx     #0xddc20 ; -> objc_setProperty
000cc132  sub.w   sp, r7, #0
000cc136  pop     {r7, pc}
000cc138  ldm     r2, {r1, r2, r3, r5, r6, r7}
000cc13a  movs    r2, r0
