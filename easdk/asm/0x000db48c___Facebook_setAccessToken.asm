========================================================================
-[Facebook setAccessToken  0x000db48c  44 bytes   Facebook.m
========================================================================

000db48c  push    {r7, lr}
000db48e  add     r7, sp, #0
000db490  sub     sp, #8
000db492  mov     r3, r2
000db494  ldr     r2, [pc, #0x1c]
000db496  mov.w   ip, #0
000db49a  add     r2, pc ; -> 0x000fc508  OBJC_IVAR_$_Facebook._accessToken
000db49c  ldr     r2, [r2]
000db49e  str.w   ip, [sp]
000db4a2  add.w   ip, ip, #1
000db4a6  str.w   ip, [sp, #4]
000db4aa  blx     #0xddc20 ; -> objc_setProperty
000db4ae  sub.w   sp, r7, #0
000db4b2  pop     {r7, pc}
000db4b4  asrs    r2, r5, #1
000db4b6  movs    r2, r0
