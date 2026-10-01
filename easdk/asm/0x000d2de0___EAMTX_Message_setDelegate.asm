========================================================================
-[EAMTX_Message setDelegate  0x000d2de0  40 bytes   EAMTX_Message.mm
========================================================================

000d2de0  push    {r7, lr}
000d2de2  add     r7, sp, #0
000d2de4  sub     sp, #8
000d2de6  mov     r3, r2
000d2de8  ldr     r2, [pc, #0x18]
000d2dea  mov.w   ip, #0
000d2dee  add     r2, pc ; -> 0x000fa2e4  OBJC_IVAR_$_EAMTX_Message.mDelegate
000d2df0  ldr     r2, [r2]
000d2df2  str.w   ip, [sp]
000d2df6  str.w   ip, [sp, #4]
000d2dfa  blx     #0xddc20 ; -> objc_setProperty
000d2dfe  sub.w   sp, r7, #0
000d2e02  pop     {r7, pc}
000d2e04  strb    r2, [r6, #0x13]
000d2e06  movs    r2, r0
