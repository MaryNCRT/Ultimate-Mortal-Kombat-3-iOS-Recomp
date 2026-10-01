========================================================================
-[FacebookAgent handleOpenURL  0x000dc714  36 bytes   FacebookAgent.mm
========================================================================

000dc714  push    {r7, lr}
000dc716  add     r7, sp, #0
000dc718  ldr     r3, [pc, #0x14]
000dc71a  add     r3, pc ; -> 0x000fc8b8  OBJC_IVAR_$_FacebookAgent.facebook
000dc71c  ldr     r3, [r3]
000dc71e  ldr     r0, [r0, r3]
000dc720  cbz     r0, #0xdc72c
000dc722  ldr     r1, [pc, #0x10]
000dc724  add     r1, pc ; -> 0x000fd3a8  
000dc726  ldr     r1, [r1]
000dc728  blx     #0xddbfc ; -> objc_msgSend
000dc72c  pop     {r7, pc}
000dc72e  nop     
000dc730  lsls    r2, r3, #6
000dc732  movs    r2, r0
000dc734  lsrs    r0, r0, #0x12
000dc736  movs    r2, r0
