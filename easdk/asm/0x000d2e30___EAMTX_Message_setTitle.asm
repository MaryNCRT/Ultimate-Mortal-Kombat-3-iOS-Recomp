========================================================================
-[EAMTX_Message setTitle  0x000d2e30  40 bytes   EAMTX_Message.mm
========================================================================

000d2e30  push    {r7, lr}
000d2e32  add     r7, sp, #0
000d2e34  sub     sp, #8
000d2e36  mov     r3, r2
000d2e38  ldr     r2, [pc, #0x18]
000d2e3a  mov.w   ip, #0
000d2e3e  add     r2, pc ; -> 0x000fa2d0  OBJC_IVAR_$_EAMTX_Message.mTitle
000d2e40  ldr     r2, [r2]
000d2e42  str.w   ip, [sp]
000d2e46  str.w   ip, [sp, #4]
000d2e4a  blx     #0xddc20 ; -> objc_setProperty
000d2e4e  sub.w   sp, r7, #0
000d2e52  pop     {r7, pc}
000d2e54  strb    r6, [r1, #0x12]
000d2e56  movs    r2, r0
