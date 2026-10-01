========================================================================
MTX_Resume  0x000bbf2c  76 bytes   EAMTX_Main.mm
========================================================================

000bbf2c  push    {r7, lr}
000bbf2e  add     r7, sp, #0
000bbf30  ldr     r3, [pc, #0x30]
000bbf32  add     r3, pc ; -> 0x0038c0b4  mIAMView
000bbf34  ldr     r3, [r3]
000bbf36  cbz     r3, #0xbbf54
000bbf38  ldr     r2, [pc, #0x2c]
000bbf3a  add     r2, pc ; -> 0x0038c0b8  bRequiredToShowAlert
000bbf3c  ldrb    r3, [r2]
000bbf3e  cbz     r3, #0xbbf54
000bbf40  ldr     r0, [pc, #0x28]
000bbf42  ldr     r1, [pc, #0x2c]
000bbf44  movs    r3, #0
000bbf46  add     r0, pc ; -> 0x0038c0e8  mtxUserInfo
000bbf48  add     r1, pc ; -> 0x000fd5e8  
000bbf4a  ldr     r0, [r0]
000bbf4c  ldr     r1, [r1]
000bbf4e  strb    r3, [r2]
000bbf50  blx     #0xddbfc ; -> objc_msgSend
000bbf54  ldr     r3, [pc, #0x1c]
000bbf56  add     r3, pc ; -> 0x000f3264  bShowingMoreGames
000bbf58  ldr     r3, [r3]
000bbf5a  ldrb    r3, [r3]
000bbf5c  cbz     r3, #0xbbf62
000bbf5e  bl      #0xcf8e8 ; -> Z22MTXDMG_ResumeMoreGamesv
000bbf62  pop     {r7, pc}
000bbf64  lsls    r6, r7, #5
000bbf66  movs    r5, r5
000bbf68  lsls    r2, r7, #5
000bbf6a  movs    r5, r5
000bbf6c  lsls    r6, r3, #6
000bbf6e  movs    r5, r5
000bbf70  asrs    r4, r3, #0x1a
000bbf72  movs    r4, r0
000bbf74  strb    r2, [r1, #0xc]
000bbf76  movs    r3, r0
