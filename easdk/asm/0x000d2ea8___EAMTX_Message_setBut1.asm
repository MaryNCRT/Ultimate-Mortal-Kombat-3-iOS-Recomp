========================================================================
-[EAMTX_Message setBut1  0x000d2ea8  40 bytes   EAMTX_Message.mm
========================================================================

000d2ea8  push    {r7, lr}
000d2eaa  add     r7, sp, #0
000d2eac  sub     sp, #8
000d2eae  mov     r3, r2
000d2eb0  ldr     r2, [pc, #0x18]
000d2eb2  mov.w   ip, #0
000d2eb6  add     r2, pc ; -> 0x000fa2d8  OBJC_IVAR_$_EAMTX_Message.mBut1Title
000d2eb8  ldr     r2, [r2]
000d2eba  str.w   ip, [sp]
000d2ebe  str.w   ip, [sp, #4]
000d2ec2  blx     #0xddc20 ; -> objc_setProperty
000d2ec6  sub.w   sp, r7, #0
000d2eca  pop     {r7, pc}
000d2ecc  strb    r6, [r3, #0x10]
000d2ece  movs    r2, r0
