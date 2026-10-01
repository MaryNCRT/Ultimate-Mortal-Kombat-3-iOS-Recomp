========================================================================
MTXDMG_EnterBackground  0x000cfbb8  56 bytes   EAMTX_DMGController.mm
========================================================================

000cfbb8  push    {r7, lr}
000cfbba  add     r7, sp, #0
000cfbbc  ldr     r0, [pc, #0x24]
000cfbbe  add     r0, pc ; -> 0x0038c1f0  gpImgLoader
000cfbc0  ldr     r0, [r0]
000cfbc2  cbz     r0, #0xcfbe0
000cfbc4  ldr     r1, [pc, #0x20]
000cfbc6  add     r1, pc ; -> 0x000fd890  'O\x12\x0f'
000cfbc8  ldr     r1, [r1]
000cfbca  blx     #0xddbfc ; -> objc_msgSend
000cfbce  tst.w   r0, #0xff
000cfbd2  beq     #0xcfbe0
000cfbd4  ldr     r3, [pc, #0x14]
000cfbd6  add     r3, pc ; -> 0x0038c1f4  mCachedHTMLData
000cfbd8  ldr     r3, [r3]
000cfbda  cbz     r3, #0xcfbe0
000cfbdc  bl      #0xcfa6c ; -> Z15MTXDMG_SaveDatav
000cfbe0  pop     {r7, pc}
000cfbe2  nop     
000cfbe4  stm     r6!, {r1, r2, r3, r5}
000cfbe6  movs    r3, r5
000cfbe8  bgt     #0xcfb78
000cfbea  movs    r2, r0
000cfbec  stm     r6!, {r1, r3, r4}
000cfbee  movs    r3, r5
