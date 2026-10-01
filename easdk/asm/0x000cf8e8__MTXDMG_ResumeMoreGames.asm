========================================================================
MTXDMG_ResumeMoreGames  0x000cf8e8  60 bytes   EAMTX_DMGController.mm
========================================================================

000cf8e8  push    {r4, r5, r7, lr}
000cf8ea  add     r7, sp, #8
000cf8ec  ldr     r4, [pc, #0x28]
000cf8ee  add     r4, pc ; -> 0x0017cfdc  gpDMGController
000cf8f0  ldr     r0, [r4]
000cf8f2  cbz     r0, #0xcf914
000cf8f4  ldr     r1, [pc, #0x24]
000cf8f6  add     r1, pc ; -> 0x000fcb38  'D\x19\x0e'
000cf8f8  ldr     r5, [r1]
000cf8fa  mov     r1, r5
000cf8fc  blx     #0xddbfc ; -> objc_msgSend
000cf900  cbz     r0, #0xcf914
000cf902  mov     r1, r5
000cf904  ldr     r0, [r4]
000cf906  blx     #0xddbfc ; -> objc_msgSend
000cf90a  ldr     r1, [pc, #0x14]
000cf90c  add     r1, pc ; -> 0x000fcac4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x14c
000cf90e  ldr     r1, [r1]
000cf910  blx     #0xddbfc ; -> objc_msgSend
000cf914  pop     {r4, r5, r7, pc}
000cf916  nop     
000cf918  bvs     #0xcf8f0
000cf91a  movs    r2, r1
000cf91c  bhs     #0xcf99c
000cf91e  movs    r2, r0
000cf920  bne     #0xcf88c
000cf922  movs    r2, r0
