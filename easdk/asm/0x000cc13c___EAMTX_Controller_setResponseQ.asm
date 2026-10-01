========================================================================
-[EAMTX_Controller setResponseQ  0x000cc13c  40 bytes   EAMTX_Controller.mm
========================================================================

000cc13c  push    {r7, lr}
000cc13e  add     r7, sp, #0
000cc140  sub     sp, #8
000cc142  mov     r3, r2
000cc144  ldr     r2, [pc, #0x18]
000cc146  mov.w   ip, #0
000cc14a  add     r2, pc ; -> 0x000f8c18  OBJC_IVAR_$_EAMTX_Controller.responseQ
000cc14c  ldr     r2, [r2]
000cc14e  str.w   ip, [sp]
000cc152  str.w   ip, [sp, #4]
000cc156  blx     #0xddc20 ; -> objc_setProperty
000cc15a  sub.w   sp, r7, #0
000cc15e  pop     {r7, pc}
000cc160  ldm     r2!, {r1, r3, r6, r7}
000cc162  movs    r2, r0
