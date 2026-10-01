========================================================================
-[Social_Info setCurrentPeriod  0x000d813c  44 bytes   Social_Info.mm
========================================================================

000d813c  push    {r7, lr}
000d813e  add     r7, sp, #0
000d8140  sub     sp, #8
000d8142  mov     r3, r2
000d8144  ldr     r2, [pc, #0x1c]
000d8146  mov.w   ip, #0
000d814a  add     r2, pc ; -> 0x000faec0  OBJC_IVAR_$_Social_Info.currentPeriod
000d814c  ldr     r2, [r2]
000d814e  str.w   ip, [sp]
000d8152  add.w   ip, ip, #1
000d8156  str.w   ip, [sp, #4]
000d815a  blx     #0xddc20 ; -> objc_setProperty
000d815e  sub.w   sp, r7, #0
000d8162  pop     {r7, pc}
000d8164  cmp     r5, #0x72
000d8166  movs    r2, r0
