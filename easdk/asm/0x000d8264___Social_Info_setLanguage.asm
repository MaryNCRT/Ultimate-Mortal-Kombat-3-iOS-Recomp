========================================================================
-[Social_Info setLanguage  0x000d8264  44 bytes   Social_Info.mm
========================================================================

000d8264  push    {r7, lr}
000d8266  add     r7, sp, #0
000d8268  sub     sp, #8
000d826a  mov     r3, r2
000d826c  ldr     r2, [pc, #0x1c]
000d826e  mov.w   ip, #0
000d8272  add     r2, pc ; -> 0x000fae90  OBJC_IVAR_$_Social_Info.language
000d8274  ldr     r2, [r2]
000d8276  str.w   ip, [sp]
000d827a  add.w   ip, ip, #1
000d827e  str.w   ip, [sp, #4]
000d8282  blx     #0xddc20 ; -> objc_setProperty
000d8286  sub.w   sp, r7, #0
000d828a  pop     {r7, pc}
000d828c  cmp     r4, #0x1a
000d828e  movs    r2, r0
