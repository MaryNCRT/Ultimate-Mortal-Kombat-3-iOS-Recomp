========================================================================
-[Social_Info setCurrentStatType  0x000d8110  44 bytes   Social_Info.mm
========================================================================

000d8110  push    {r7, lr}
000d8112  add     r7, sp, #0
000d8114  sub     sp, #8
000d8116  mov     r3, r2
000d8118  ldr     r2, [pc, #0x1c]
000d811a  mov.w   ip, #0
000d811e  add     r2, pc ; -> 0x000faebc  OBJC_IVAR_$_Social_Info.currentStatType
000d8120  ldr     r2, [r2]
000d8122  str.w   ip, [sp]
000d8126  add.w   ip, ip, #1
000d812a  str.w   ip, [sp, #4]
000d812e  blx     #0xddc20 ; -> objc_setProperty
000d8132  sub.w   sp, r7, #0
000d8136  pop     {r7, pc}
000d8138  cmp     r5, #0x9a
000d813a  movs    r2, r0
