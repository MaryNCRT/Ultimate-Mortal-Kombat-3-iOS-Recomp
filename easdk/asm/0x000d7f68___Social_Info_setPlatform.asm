========================================================================
-[Social_Info setPlatform  0x000d7f68  44 bytes   Social_Info.mm
========================================================================

000d7f68  push    {r7, lr}
000d7f6a  add     r7, sp, #0
000d7f6c  sub     sp, #8
000d7f6e  mov     r3, r2
000d7f70  ldr     r2, [pc, #0x1c]
000d7f72  mov.w   ip, #0
000d7f76  add     r2, pc ; -> 0x000faea4  OBJC_IVAR_$_Social_Info.platform
000d7f78  ldr     r2, [r2]
000d7f7a  str.w   ip, [sp]
000d7f7e  add.w   ip, ip, #1
000d7f82  str.w   ip, [sp, #4]
000d7f86  blx     #0xddc20 ; -> objc_setProperty
000d7f8a  sub.w   sp, r7, #0
000d7f8e  pop     {r7, pc}
000d7f90  cmp     r7, #0x2a
000d7f92  movs    r2, r0
