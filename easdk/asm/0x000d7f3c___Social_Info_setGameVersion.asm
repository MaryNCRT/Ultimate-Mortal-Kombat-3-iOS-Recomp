========================================================================
-[Social_Info setGameVersion  0x000d7f3c  44 bytes   Social_Info.mm
========================================================================

000d7f3c  push    {r7, lr}
000d7f3e  add     r7, sp, #0
000d7f40  sub     sp, #8
000d7f42  mov     r3, r2
000d7f44  ldr     r2, [pc, #0x1c]
000d7f46  mov.w   ip, #0
000d7f4a  add     r2, pc ; -> 0x000faea0  OBJC_IVAR_$_Social_Info.gameVersion
000d7f4c  ldr     r2, [r2]
000d7f4e  str.w   ip, [sp]
000d7f52  add.w   ip, ip, #1
000d7f56  str.w   ip, [sp, #4]
000d7f5a  blx     #0xddc20 ; -> objc_setProperty
000d7f5e  sub.w   sp, r7, #0
000d7f62  pop     {r7, pc}
000d7f64  cmp     r7, #0x52
000d7f66  movs    r2, r0
