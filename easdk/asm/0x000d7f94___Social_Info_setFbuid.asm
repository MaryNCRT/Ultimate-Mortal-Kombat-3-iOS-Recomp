========================================================================
-[Social_Info setFbuid  0x000d7f94  44 bytes   Social_Info.mm
========================================================================

000d7f94  push    {r7, lr}
000d7f96  add     r7, sp, #0
000d7f98  sub     sp, #8
000d7f9a  mov     r3, r2
000d7f9c  ldr     r2, [pc, #0x1c]
000d7f9e  mov.w   ip, #0
000d7fa2  add     r2, pc ; -> 0x000faea8  OBJC_IVAR_$_Social_Info.fbuid
000d7fa4  ldr     r2, [r2]
000d7fa6  str.w   ip, [sp]
000d7faa  add.w   ip, ip, #1
000d7fae  str.w   ip, [sp, #4]
000d7fb2  blx     #0xddc20 ; -> objc_setProperty
000d7fb6  sub.w   sp, r7, #0
000d7fba  pop     {r7, pc}
000d7fbc  cmp     r7, #2
000d7fbe  movs    r2, r0
