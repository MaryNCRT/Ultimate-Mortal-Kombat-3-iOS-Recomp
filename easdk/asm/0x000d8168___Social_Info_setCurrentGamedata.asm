========================================================================
-[Social_Info setCurrentGamedata  0x000d8168  44 bytes   Social_Info.mm
========================================================================

000d8168  push    {r7, lr}
000d816a  add     r7, sp, #0
000d816c  sub     sp, #8
000d816e  mov     r3, r2
000d8170  ldr     r2, [pc, #0x1c]
000d8172  mov.w   ip, #0
000d8176  add     r2, pc ; -> 0x000faec8  OBJC_IVAR_$_Social_Info.currentGamedata
000d8178  ldr     r2, [r2]
000d817a  str.w   ip, [sp]
000d817e  add.w   ip, ip, #1
000d8182  str.w   ip, [sp, #4]
000d8186  blx     #0xddc20 ; -> objc_setProperty
000d818a  sub.w   sp, r7, #0
000d818e  pop     {r7, pc}
000d8190  cmp     r5, #0x4e
000d8192  movs    r2, r0
