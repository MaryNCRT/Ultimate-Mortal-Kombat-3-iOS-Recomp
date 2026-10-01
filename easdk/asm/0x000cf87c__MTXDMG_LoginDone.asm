========================================================================
MTXDMG_LoginDone  0x000cf87c  36 bytes   EAMTX_DMGController.mm
========================================================================

000cf87c  push    {r4, r7, lr}
000cf87e  add     r7, sp, #4
000cf880  ldr     r4, [pc, #0x14]
000cf882  add     r4, pc ; -> 0x0017cfe0  gpDMGLogin
000cf884  ldr     r0, [r4]
000cf886  cbz     r0, #0xcf896
000cf888  ldr     r1, [pc, #0x10]
000cf88a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cf88c  ldr     r1, [r1]
000cf88e  blx     #0xddbfc ; -> objc_msgSend
000cf892  movs    r3, #0
000cf894  str     r3, [r4]
000cf896  pop     {r4, r7, pc}
000cf898  bvc     #0xcf950
000cf89a  movs    r2, r1
000cf89c  beq     #0xcf87c ; -> Z16MTXDMG_LoginDonev
000cf89e  movs    r2, r0
