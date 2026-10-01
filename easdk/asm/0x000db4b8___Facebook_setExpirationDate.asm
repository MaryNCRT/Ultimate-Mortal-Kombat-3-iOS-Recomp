========================================================================
-[Facebook setExpirationDate  0x000db4b8  44 bytes   Facebook.m
========================================================================

000db4b8  push    {r7, lr}
000db4ba  add     r7, sp, #0
000db4bc  sub     sp, #8
000db4be  mov     r3, r2
000db4c0  ldr     r2, [pc, #0x1c]
000db4c2  mov.w   ip, #0
000db4c6  add     r2, pc ; -> 0x000fc504  OBJC_IVAR_$_Facebook._expirationDate
000db4c8  ldr     r2, [r2]
000db4ca  str.w   ip, [sp]
000db4ce  add.w   ip, ip, #1
000db4d2  str.w   ip, [sp, #4]
000db4d6  blx     #0xddc20 ; -> objc_setProperty
000db4da  sub.w   sp, r7, #0
000db4de  pop     {r7, pc}
000db4e0  asrs    r2, r7, #0x20
000db4e2  movs    r2, r0
