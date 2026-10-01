========================================================================
-[Social_Info setOpponentId  0x000d820c  44 bytes   Social_Info.mm
========================================================================

000d820c  push    {r7, lr}
000d820e  add     r7, sp, #0
000d8210  sub     sp, #8
000d8212  mov     r3, r2
000d8214  ldr     r2, [pc, #0x1c]
000d8216  mov.w   ip, #0
000d821a  add     r2, pc ; -> 0x000fae88  OBJC_IVAR_$_Social_Info.opponentId
000d821c  ldr     r2, [r2]
000d821e  str.w   ip, [sp]
000d8222  add.w   ip, ip, #1
000d8226  str.w   ip, [sp, #4]
000d822a  blx     #0xddc20 ; -> objc_setProperty
000d822e  sub.w   sp, r7, #0
000d8232  pop     {r7, pc}
000d8234  cmp     r4, #0x6a
000d8236  movs    r2, r0
