========================================================================
MTXDMG_ExitMoreGames  0x000cfbf0  108 bytes   EAMTX_DMGController.mm
========================================================================

000cfbf0  push    {r4, r5, r7, lr}
000cfbf2  add     r7, sp, #8
000cfbf4  ldr     r3, [pc, #0x48]
000cfbf6  ldr     r0, [pc, #0x4c]
000cfbf8  movs    r5, #0
000cfbfa  add     r3, pc ; -> 0x0038c1f8  bShowingMoreGames
000cfbfc  add     r0, pc ; -> 0x000cf9b1  ZL18DMGMTXEventHandler11MTX_EventIDiPv
000cfbfe  strb    r5, [r3]
000cfc00  bl      #0xb74cc ; -> Z21MTX_UnregisterHandlerPFv11MTX_EventIDiPvE
000cfc04  ldr     r0, [pc, #0x40]
000cfc06  add     r0, pc ; -> 0x0017cfdc  gpDMGController
000cfc08  ldr     r0, [r0]
000cfc0a  cbnz    r0, #0xcfc10
000cfc0c  mov     r0, r5
000cfc0e  b       #0xcfc3e
000cfc10  ldr     r1, [pc, #0x38]
000cfc12  ldr     r4, [pc, #0x3c]
000cfc14  add     r1, pc ; -> 0x000fd894  '{\x12\x0f'
000cfc16  add     r4, pc ; -> 0x0017cfdc  gpDMGController
000cfc18  ldr     r1, [r1]
000cfc1a  blx     #0xddbfc ; -> objc_msgSend
000cfc1e  ldr     r1, [pc, #0x34]
000cfc20  ldr     r0, [r4]
000cfc22  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cfc24  ldr     r1, [r1]
000cfc26  blx     #0xddbfc ; -> objc_msgSend
000cfc2a  ldr     r3, [pc, #0x2c]
000cfc2c  str     r5, [r4]
000cfc2e  add     r3, pc ; -> 0x0038c1ec  gpMTXDMG_EventCB
000cfc30  ldr     r3, [r3]
000cfc32  cbz     r3, #0xcfc3c
000cfc34  movs    r0, #0x21
000cfc36  mov     r1, r5
000cfc38  mov     r2, r5
000cfc3a  blx     r3
000cfc3c  movs    r0, #1
000cfc3e  pop     {r4, r5, r7, pc}
000cfc40  stm     r5!, {r1, r3, r4, r5, r6, r7}
000cfc42  movs    r3, r5
000cfc44  ldc2    p15, c15, [r1, #0x3fc]!
000cfc48  blo     #0xcfbf0 ; -> Z20MTXDMG_ExitMoreGamesv
000cfc4a  movs    r2, r1
000cfc4c  bgt     #0xcfd48
000cfc4e  movs    r2, r0
000cfc50  blo     #0xcfbd8
000cfc52  movs    r2, r1
000cfc54  ldm     r5!, {r1, r2, r4, r6}
000cfc56  movs    r2, r0
000cfc58  stm     r5!, {r1, r3, r4, r5, r7}
000cfc5a  movs    r3, r5
