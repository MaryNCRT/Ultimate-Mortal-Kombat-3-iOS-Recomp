========================================================================
-[EAMTX_Message setBut2  0x000d2ed0  40 bytes   EAMTX_Message.mm
========================================================================

000d2ed0  push    {r7, lr}
000d2ed2  add     r7, sp, #0
000d2ed4  sub     sp, #8
000d2ed6  mov     r3, r2
000d2ed8  ldr     r2, [pc, #0x18]
000d2eda  mov.w   ip, #0
000d2ede  add     r2, pc ; -> 0x000fa2dc  OBJC_IVAR_$_EAMTX_Message.mBut2Title
000d2ee0  ldr     r2, [r2]
000d2ee2  str.w   ip, [sp]
000d2ee6  str.w   ip, [sp, #4]
000d2eea  blx     #0xddc20 ; -> objc_setProperty
000d2eee  sub.w   sp, r7, #0
000d2ef2  pop     {r7, pc}
000d2ef4  strb    r2, [r7, #0xf]
000d2ef6  movs    r2, r0
