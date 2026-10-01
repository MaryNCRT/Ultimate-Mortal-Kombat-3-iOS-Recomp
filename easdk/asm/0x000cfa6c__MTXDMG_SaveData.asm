========================================================================
MTXDMG_SaveData  0x000cfa6c  232 bytes   EAMTX_DMGController.mm
========================================================================

000cfa6c  push    {r4, r5, r6, r7, lr}
000cfa6e  add     r7, sp, #0xc
000cfa70  push.w  {r8, sl}
000cfa74  sub     sp, #4
000cfa76  ldr     r0, [pc, #0xa4]
000cfa78  ldr     r1, [pc, #0xa4]
000cfa7a  ldr     r2, [pc, #0xa8]
000cfa7c  add     r0, pc ; -> 0x000fdb88  
000cfa7e  add     r1, pc ; -> 0x000fcadc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x164
000cfa80  add     r2, pc ; -> 0x0038c1f4  mCachedHTMLData
000cfa82  ldr     r1, [r1]
000cfa84  ldr     r2, [r2]
000cfa86  ldr     r0, [r0]
000cfa88  blx     #0xddbfc ; -> objc_msgSend
000cfa8c  ldr     r1, [pc, #0x98]
000cfa8e  ldr     r4, [pc, #0x9c]
000cfa90  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000cfa92  add     r4, pc ; -> 0x00182014  
000cfa94  ldr     r1, [r1]
000cfa96  mov     r8, r0
000cfa98  ldr     r0, [pc, #0x94]
000cfa9a  add     r0, pc ; -> 0x000fdc2c  
000cfa9c  ldr     r0, [r0]
000cfa9e  blx     #0xddbfc ; -> objc_msgSend
000cfaa2  ldr     r1, [pc, #0x90]
000cfaa4  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cfaa6  ldr     r5, [r1]
000cfaa8  mov     sl, r0
000cfaaa  ldr     r0, [pc, #0x8c]
000cfaac  add     r0, pc ; -> 0x000fdb5c  
000cfaae  ldr     r6, [r0]
000cfab0  blx     #0xdd41c ; -> NSTemporaryDirectory
000cfab4  mov     r2, r4
000cfab6  mov     r1, r5
000cfab8  mov     r3, r0
000cfaba  mov     r0, r6
000cfabc  blx     #0xddbfc ; -> objc_msgSend
000cfac0  mov     r4, r0
000cfac2  cmp.w   r8, #0
000cfac6  beq     #0xcfafe
000cfac8  ldr     r1, [pc, #0x70]
000cfaca  mov     r0, r8
000cfacc  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000cface  ldr     r1, [r1]
000cfad0  blx     #0xddbfc ; -> objc_msgSend
000cfad4  cbz     r0, #0xcfafe
000cfad6  ldr     r1, [pc, #0x68]
000cfad8  movs    r3, #0
000cfada  mov     r0, sl
000cfadc  add     r1, pc ; -> 0x000fd218  
000cfade  str     r3, [sp]
000cfae0  ldr     r1, [r1]
000cfae2  mov     r2, r4
000cfae4  mov     r3, r8
000cfae6  blx     #0xddbfc ; -> objc_msgSend
000cfaea  tst.w   r0, #0xff
000cfaee  beq     #0xcfaf6
000cfaf0  ldr     r0, [pc, #0x50]
000cfaf2  add     r0, pc ; -> 0x00182024  
000cfaf4  b       #0xcfafa
000cfaf6  ldr     r0, [pc, #0x50]
000cfaf8  add     r0, pc ; -> 0x00182034  
000cfafa  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cfafe  ldr     r0, [pc, #0x4c]
000cfb00  add     r0, pc ; -> 0x0017cfe0  gpDMGLogin
000cfb02  ldr     r0, [r0]
000cfb04  cbz     r0, #0xcfb10
000cfb06  ldr     r1, [pc, #0x48]
000cfb08  add     r1, pc ; -> 0x000fd888  '/\x12\x0f'
000cfb0a  ldr     r1, [r1]
000cfb0c  blx     #0xddbfc ; -> objc_msgSend
000cfb10  sub.w   sp, r7, #0x14
000cfb14  pop.w   {r8, sl}
000cfb18  pop     {r4, r5, r6, r7, pc}
000cfb1a  nop     
000cfb1c  b       #0xcfd30
000cfb1e  movs    r2, r0
000cfb20  beq     #0xcfbd8
000cfb22  movs    r2, r0
000cfb24  stm     r7!, {r4, r5, r6}
000cfb26  movs    r3, r5
000cfb28  bpl     #0xcfc14
000cfb2a  movs    r2, r0
000cfb2c  movs    r5, #0x7e
000cfb2e  movs    r3, r1
000cfb30  b       #0xcfe50
000cfb32  movs    r2, r0
000cfb34  ldm     r7, {r3, r4, r5, r6, r7}
000cfb36  movs    r2, r0
000cfb38  b       #0xcfc94
000cfb3a  movs    r2, r0
000cfb3c  ldm     r7, {r3, r5, r7}
000cfb3e  movs    r2, r0
000cfb40  bvc     #0xcfbb4
000cfb42  movs    r2, r0
000cfb44  movs    r5, #0x2e
000cfb46  movs    r3, r1
000cfb48  movs    r5, #0x38
000cfb4a  movs    r3, r1
000cfb4c  bmi     #0xcfb08
000cfb4e  movs    r2, r1
000cfb50  ble     #0xcfc4c
000cfb52  movs    r2, r0
