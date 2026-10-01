========================================================================
-[FBStreamDialog setTargetId  0x00087e70  44 bytes   FBStreamDialog.m
========================================================================

00087e70  push    {r7, lr}
00087e72  add     r7, sp, #0
00087e74  sub     sp, #8
00087e76  mov     r3, r2
00087e78  ldr     r2, [pc, #0x1c]
00087e7a  mov.w   ip, #0
00087e7e  add     r2, pc ; -> 0x000f5e94  OBJC_IVAR_$_FBStreamDialog._targetId
00087e80  ldr     r2, [r2]
00087e82  str.w   ip, [sp]
00087e86  add.w   ip, ip, #1
00087e8a  str.w   ip, [sp, #4]
00087e8e  blx     #0xddc20 ; -> objc_setProperty
00087e92  sub.w   sp, r7, #0
00087e96  pop     {r7, pc}
00087e98  b       #0x87ec0
00087e9a  movs    r6, r0
