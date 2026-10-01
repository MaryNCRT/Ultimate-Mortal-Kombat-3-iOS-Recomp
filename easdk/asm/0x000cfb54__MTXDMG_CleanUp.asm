========================================================================
MTXDMG_CleanUp  0x000cfb54  100 bytes   EAMTX_DMGController.mm
========================================================================

000cfb54  push    {r4, r7, lr}
000cfb56  add     r7, sp, #4
000cfb58  ldr     r0, [pc, #0x44]
000cfb5a  add     r0, pc ; -> 0x0038c1f0  gpImgLoader
000cfb5c  ldr     r0, [r0]
000cfb5e  cbz     r0, #0xcfb8c
000cfb60  ldr     r1, [pc, #0x40]
000cfb62  add     r1, pc ; -> 0x000fd890  'O\x12\x0f'
000cfb64  ldr     r1, [r1]
000cfb66  blx     #0xddbfc ; -> objc_msgSend
000cfb6a  tst.w   r0, #0xff
000cfb6e  beq     #0xcfb8c
000cfb70  ldr     r4, [pc, #0x34]
000cfb72  add     r4, pc ; -> 0x0038c1f4  mCachedHTMLData
000cfb74  ldr     r3, [r4]
000cfb76  cbz     r3, #0xcfb8c
000cfb78  bl      #0xcfa6c ; -> Z15MTXDMG_SaveDatav
000cfb7c  ldr     r1, [pc, #0x2c]
000cfb7e  ldr     r0, [r4]
000cfb80  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cfb82  ldr     r1, [r1]
000cfb84  blx     #0xddbfc ; -> objc_msgSend
000cfb88  movs    r3, #0
000cfb8a  str     r3, [r4]
000cfb8c  ldr     r0, [pc, #0x20]
000cfb8e  ldr     r1, [pc, #0x24]
000cfb90  add     r0, pc ; -> 0x0038c1f0  gpImgLoader
000cfb92  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cfb94  ldr     r0, [r0]
000cfb96  ldr     r1, [r1]
000cfb98  blx     #0xddbfc ; -> objc_msgSend
000cfb9c  pop     {r4, r7, pc}
000cfb9e  nop     
000cfba0  stm     r6!, {r1, r4, r7}
000cfba2  movs    r3, r5
000cfba4  ble     #0xcfbfc
000cfba6  movs    r2, r0
000cfba8  stm     r6!, {r1, r2, r3, r4, r5, r6}
000cfbaa  movs    r3, r5
000cfbac  ldm     r5, {r3, r4, r5, r6, r7}
000cfbae  movs    r2, r0
000cfbb0  stm     r6!, {r2, r3, r4, r6}
000cfbb2  movs    r3, r5
000cfbb4  ldm     r5, {r1, r2, r5, r6, r7}
000cfbb6  movs    r2, r0
