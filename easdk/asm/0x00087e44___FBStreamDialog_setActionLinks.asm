========================================================================
-[FBStreamDialog setActionLinks  0x00087e44  44 bytes   FBStreamDialog.m
========================================================================

00087e44  push    {r7, lr}
00087e46  add     r7, sp, #0
00087e48  sub     sp, #8
00087e4a  mov     r3, r2
00087e4c  ldr     r2, [pc, #0x1c]
00087e4e  mov.w   ip, #0
00087e52  add     r2, pc ; -> 0x000f5e98  OBJC_IVAR_$_FBStreamDialog._actionLinks
00087e54  ldr     r2, [r2]
00087e56  str.w   ip, [sp]
00087e5a  add.w   ip, ip, #1
00087e5e  str.w   ip, [sp, #4]
00087e62  blx     #0xddc20 ; -> objc_setProperty
00087e66  sub.w   sp, r7, #0
00087e6a  pop     {r7, pc}
00087e6c  b       #0x87ef4
00087e6e  movs    r6, r0
