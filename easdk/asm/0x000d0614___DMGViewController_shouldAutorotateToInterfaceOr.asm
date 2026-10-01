========================================================================
-[DMGViewController shouldAutorotateToInterfaceOrientation  0x000d0614  48 bytes   DMGViewController.mm
========================================================================

000d0614  push    {r4, r7, lr}
000d0616  add     r7, sp, #4
000d0618  ldr     r3, [pc, #0x20]
000d061a  ldr     r1, [pc, #0x24]
000d061c  mov     r4, r2
000d061e  add     r3, pc ; -> 0x000fa2a4  OBJC_IVAR_$_DMGViewController.dmgController
000d0620  add     r1, pc ; -> 0x000fda8c  'g\x14\x0f'
000d0622  ldr     r3, [r3]
000d0624  ldr     r1, [r1]
000d0626  ldr     r0, [r0, r3]
000d0628  blx     #0xddbfc ; -> objc_msgSend
000d062c  cmp     r0, #1
000d062e  beq     #0xd0638
000d0630  cmp     r4, #1
000d0632  ite     ne
000d0634  movne   r0, #0
000d0636  moveq   r0, #1
000d0638  pop     {r4, r7, pc}
000d063a  nop     
000d063c  ldr     r4, [sp, #0x208]
000d063e  movs    r2, r0
000d0640  bmi     #0xd0714
000d0642  movs    r2, r0
