========================================================================
-[Social_Info setAppName  0x000d8018  44 bytes   Social_Info.mm
========================================================================

000d8018  push    {r7, lr}
000d801a  add     r7, sp, #0
000d801c  sub     sp, #8
000d801e  mov     r3, r2
000d8020  ldr     r2, [pc, #0x1c]
000d8022  mov.w   ip, #0
000d8026  add     r2, pc ; -> 0x000faeb4  OBJC_IVAR_$_Social_Info.appName
000d8028  ldr     r2, [r2]
000d802a  str.w   ip, [sp]
000d802e  add.w   ip, ip, #1
000d8032  str.w   ip, [sp, #4]
000d8036  blx     #0xddc20 ; -> objc_setProperty
000d803a  sub.w   sp, r7, #0
000d803e  pop     {r7, pc}
000d8040  cmp     r6, #0x8a
000d8042  movs    r2, r0
