========================================================================
-[EAMTX_Message setMessageId  0x000d2e08  40 bytes   EAMTX_Message.mm
========================================================================

000d2e08  push    {r7, lr}
000d2e0a  add     r7, sp, #0
000d2e0c  sub     sp, #8
000d2e0e  mov     r3, r2
000d2e10  ldr     r2, [pc, #0x18]
000d2e12  mov.w   ip, #0
000d2e16  add     r2, pc ; -> 0x000fa2e8  OBJC_IVAR_$_EAMTX_Message.mID
000d2e18  ldr     r2, [r2]
000d2e1a  str.w   ip, [sp]
000d2e1e  str.w   ip, [sp, #4]
000d2e22  blx     #0xddc20 ; -> objc_setProperty
000d2e26  sub.w   sp, r7, #0
000d2e2a  pop     {r7, pc}
000d2e2c  strb    r6, [r1, #0x13]
000d2e2e  movs    r2, r0
