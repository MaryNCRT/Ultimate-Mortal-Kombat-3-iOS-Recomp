========================================================================
-[DMGViewController alertView  0x000d045c  36 bytes   DMGViewController.mm
========================================================================

000d045c  push    {r7, lr}
000d045e  add     r7, sp, #0
000d0460  ldr     r3, [pc, #0x14]
000d0462  ldr     r1, [pc, #0x18]
000d0464  movs    r2, #0
000d0466  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0468  add     r1, pc ; -> 0x000fda10  
000d046a  ldr     r3, [r3]
000d046c  ldr     r1, [r1]
000d046e  ldr     r0, [r0, r3]
000d0470  blx     #0xddbfc ; -> objc_msgSend
000d0474  pop     {r7, pc}
000d0476  nop     
000d0478  ldr     r6, [sp, #0xe8]
000d047a  movs    r2, r0
000d047c  bpl     #0xd03c8
000d047e  movs    r2, r0
