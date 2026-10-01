========================================================================
-[Social_Info setGameName  0x000d7f10  44 bytes   Social_Info.mm
========================================================================

000d7f10  push    {r7, lr}
000d7f12  add     r7, sp, #0
000d7f14  sub     sp, #8
000d7f16  mov     r3, r2
000d7f18  ldr     r2, [pc, #0x1c]
000d7f1a  mov.w   ip, #0
000d7f1e  add     r2, pc ; -> 0x000fae9c  OBJC_IVAR_$_Social_Info.gameName
000d7f20  ldr     r2, [r2]
000d7f22  str.w   ip, [sp]
000d7f26  add.w   ip, ip, #1
000d7f2a  str.w   ip, [sp, #4]
000d7f2e  blx     #0xddc20 ; -> objc_setProperty
000d7f32  sub.w   sp, r7, #0
000d7f36  pop     {r7, pc}
000d7f38  cmp     r7, #0x7a
000d7f3a  movs    r2, r0
