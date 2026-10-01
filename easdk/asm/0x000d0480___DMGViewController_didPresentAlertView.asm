========================================================================
-[DMGViewController didPresentAlertView  0x000d0480  36 bytes   DMGViewController.mm
========================================================================

000d0480  push    {r7, lr}
000d0482  add     r7, sp, #0
000d0484  ldr     r3, [pc, #0x14]
000d0486  ldr     r1, [pc, #0x18]
000d0488  movs    r2, #1
000d048a  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d048c  add     r1, pc ; -> 0x000fda10  
000d048e  ldr     r3, [r3]
000d0490  ldr     r1, [r1]
000d0492  ldr     r0, [r0, r3]
000d0494  blx     #0xddbfc ; -> objc_msgSend
000d0498  pop     {r7, pc}
000d049a  nop     
000d049c  ldr     r6, [sp, #0x58]
000d049e  movs    r2, r0
000d04a0  bpl     #0xd03a4
000d04a2  movs    r2, r0
