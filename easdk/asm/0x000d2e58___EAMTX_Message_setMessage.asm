========================================================================
-[EAMTX_Message setMessage  0x000d2e58  40 bytes   EAMTX_Message.mm
========================================================================

000d2e58  push    {r7, lr}
000d2e5a  add     r7, sp, #0
000d2e5c  sub     sp, #8
000d2e5e  mov     r3, r2
000d2e60  ldr     r2, [pc, #0x18]
000d2e62  mov.w   ip, #0
000d2e66  add     r2, pc ; -> 0x000fa2d4  OBJC_IVAR_$_EAMTX_Message.mMessage
000d2e68  ldr     r2, [r2]
000d2e6a  str.w   ip, [sp]
000d2e6e  str.w   ip, [sp, #4]
000d2e72  blx     #0xddc20 ; -> objc_setProperty
000d2e76  sub.w   sp, r7, #0
000d2e7a  pop     {r7, pc}
000d2e7c  strb    r2, [r5, #0x11]
000d2e7e  movs    r2, r0
