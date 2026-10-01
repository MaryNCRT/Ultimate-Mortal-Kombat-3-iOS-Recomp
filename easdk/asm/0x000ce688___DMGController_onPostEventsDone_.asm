========================================================================
-[DMGController onPostEventsDone]  0x000ce688  32 bytes   DMGController.mm
========================================================================

000ce688  push    {r7, lr}
000ce68a  add     r7, sp, #0
000ce68c  ldr     r3, [pc, #0x10]
000ce68e  ldr     r1, [pc, #0x14]
000ce690  add     r3, pc ; -> 0x000f9a28  OBJC_IVAR_$_DMGController.dmgView
000ce692  add     r1, pc ; -> 0x000fd8c0  
000ce694  ldr     r3, [r3]
000ce696  ldr     r1, [r1]
000ce698  ldr     r0, [r0, r3]
000ce69a  blx     #0xddbfc ; -> objc_msgSend
000ce69e  pop     {r7, pc}
000ce6a0  cbz     r4, #0xce708
000ce6a2  movs    r2, r0
