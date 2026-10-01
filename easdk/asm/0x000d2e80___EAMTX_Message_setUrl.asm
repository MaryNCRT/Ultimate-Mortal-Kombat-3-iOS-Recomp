========================================================================
-[EAMTX_Message setUrl  0x000d2e80  40 bytes   EAMTX_Message.mm
========================================================================

000d2e80  push    {r7, lr}
000d2e82  add     r7, sp, #0
000d2e84  sub     sp, #8
000d2e86  mov     r3, r2
000d2e88  ldr     r2, [pc, #0x18]
000d2e8a  mov.w   ip, #0
000d2e8e  add     r2, pc ; -> 0x000fa2cc  OBJC_IVAR_$_EAMTX_Message.mURL
000d2e90  ldr     r2, [r2]
000d2e92  str.w   ip, [sp]
000d2e96  str.w   ip, [sp, #4]
000d2e9a  blx     #0xddc20 ; -> objc_setProperty
000d2e9e  sub.w   sp, r7, #0
000d2ea2  pop     {r7, pc}
000d2ea4  strb    r2, [r7, #0x10]
000d2ea6  movs    r2, r0
