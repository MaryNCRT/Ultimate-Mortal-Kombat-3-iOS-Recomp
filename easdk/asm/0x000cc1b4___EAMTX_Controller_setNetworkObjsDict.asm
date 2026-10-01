========================================================================
-[EAMTX_Controller setNetworkObjsDict  0x000cc1b4  40 bytes   EAMTX_Controller.mm
========================================================================

000cc1b4  push    {r7, lr}
000cc1b6  add     r7, sp, #0
000cc1b8  sub     sp, #8
000cc1ba  mov     r3, r2
000cc1bc  ldr     r2, [pc, #0x18]
000cc1be  mov.w   ip, #0
000cc1c2  add     r2, pc ; -> 0x000f8c20  OBJC_IVAR_$_EAMTX_Controller.networkObjsDict
000cc1c4  ldr     r2, [r2]
000cc1c6  str.w   ip, [sp]
000cc1ca  str.w   ip, [sp, #4]
000cc1ce  blx     #0xddc20 ; -> objc_setProperty
000cc1d2  sub.w   sp, r7, #0
000cc1d6  pop     {r7, pc}
000cc1d8  ldm     r2!, {r1, r3, r4, r6}
000cc1da  movs    r2, r0
