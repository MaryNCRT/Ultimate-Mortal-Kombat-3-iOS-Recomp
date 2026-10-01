========================================================================
-[Social_Info setMUser  0x000d7ee8  40 bytes   Social_Info.mm
========================================================================

000d7ee8  push    {r7, lr}
000d7eea  add     r7, sp, #0
000d7eec  sub     sp, #8
000d7eee  mov     r3, r2
000d7ef0  ldr     r2, [pc, #0x18]
000d7ef2  mov.w   ip, #0
000d7ef6  add     r2, pc ; -> 0x000fae70  OBJC_IVAR_$_Social_Info.mUser
000d7ef8  ldr     r2, [r2]
000d7efa  str.w   ip, [sp]
000d7efe  str.w   ip, [sp, #4]
000d7f02  blx     #0xddc20 ; -> objc_setProperty
000d7f06  sub.w   sp, r7, #0
000d7f0a  pop     {r7, pc}
000d7f0c  cmp     r7, #0x76
000d7f0e  movs    r2, r0
