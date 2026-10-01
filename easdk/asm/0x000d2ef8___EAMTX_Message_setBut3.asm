========================================================================
-[EAMTX_Message setBut3  0x000d2ef8  40 bytes   EAMTX_Message.mm
========================================================================

000d2ef8  push    {r7, lr}
000d2efa  add     r7, sp, #0
000d2efc  sub     sp, #8
000d2efe  mov     r3, r2
000d2f00  ldr     r2, [pc, #0x18]
000d2f02  mov.w   ip, #0
000d2f06  add     r2, pc ; -> 0x000fa2e0  OBJC_IVAR_$_EAMTX_Message.mBut3Title
000d2f08  ldr     r2, [r2]
000d2f0a  str.w   ip, [sp]
000d2f0e  str.w   ip, [sp, #4]
000d2f12  blx     #0xddc20 ; -> objc_setProperty
000d2f16  sub.w   sp, r7, #0
000d2f1a  pop     {r7, pc}
000d2f1c  strb    r6, [r2, #0xf]
000d2f1e  movs    r2, r0
