========================================================================
MTX_Pause  0x000bbf78  88 bytes   EAMTX_Main.mm
========================================================================

000bbf78  push    {r4, r7, lr}
000bbf7a  add     r7, sp, #4
000bbf7c  ldr     r4, [pc, #0x3c]
000bbf7e  add     r4, pc ; -> 0x0038c0b4  mIAMView
000bbf80  ldr     r0, [r4]
000bbf82  cbz     r0, #0xbbfac
000bbf84  ldr     r1, [pc, #0x38]
000bbf86  add     r1, pc ; -> 0x000fcaac  '\x1al\x0e'
000bbf88  ldr     r1, [r1]
000bbf8a  blx     #0xddbfc ; -> objc_msgSend
000bbf8e  tst.w   r0, #0xff
000bbf92  beq     #0xbbfac
000bbf94  ldr     r3, [pc, #0x2c]
000bbf96  ldr     r1, [pc, #0x30]
000bbf98  movs    r2, #1
000bbf9a  add     r3, pc ; -> 0x0038c0b8  bRequiredToShowAlert
000bbf9c  add     r1, pc ; -> 0x000fcac0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x148
000bbf9e  strb    r2, [r3]
000bbfa0  subs    r2, #1
000bbfa2  ldr     r0, [r4]
000bbfa4  ldr     r1, [r1]
000bbfa6  mov     r3, r2
000bbfa8  blx     #0xddbfc ; -> objc_msgSend
000bbfac  ldr     r3, [pc, #0x1c]
000bbfae  add     r3, pc ; -> 0x000f3264  bShowingMoreGames
000bbfb0  ldr     r3, [r3]
000bbfb2  ldrb    r3, [r3]
000bbfb4  cbz     r3, #0xbbfba
000bbfb6  bl      #0xcf874 ; -> Z21MTXDMG_PauseMoreGamesv
000bbfba  pop     {r4, r7, pc}
000bbfbc  lsls    r2, r6, #4
000bbfbe  movs    r5, r5
000bbfc0  lsrs    r2, r4, #0xc
000bbfc2  movs    r4, r0
000bbfc4  lsls    r2, r3, #4
000bbfc6  movs    r5, r5
000bbfc8  lsrs    r0, r4, #0xc
000bbfca  movs    r4, r0
000bbfcc  strb    r2, [r6, #0xa]
000bbfce  movs    r3, r0
