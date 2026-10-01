========================================================================
-[DMGLogin connection  0x000cfeb8  140 bytes   DMGLogin.mm
========================================================================

000cfeb8  push    {r4, r5, r6, r7, lr}
000cfeba  add     r7, sp, #0xc
000cfebc  push.w  {r8, sl, fp}
000cfec0  ldr     r1, [pc, #0x64]
000cfec2  mov     fp, r0
000cfec4  ldr     r0, [pc, #0x64]
000cfec6  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cfec8  mov     sl, r3
000cfeca  ldr     r6, [r1]
000cfecc  ldr     r1, [pc, #0x60]
000cfece  add     r0, pc ; -> 0x000fdb5c  
000cfed0  ldr     r4, [pc, #0x60]
000cfed2  add     r1, pc ; -> 0x000fcfb0  'TU\x0e'
000cfed4  ldr.w   r8, [r0]
000cfed8  ldr     r5, [r1]
000cfeda  mov     r0, r3
000cfedc  add     r4, pc ; -> 0x00182144  
000cfede  mov     r1, r5
000cfee0  blx     #0xddbfc ; -> objc_msgSend
000cfee4  mov     r1, r6
000cfee6  mov     r2, r4
000cfee8  mov     r3, r0
000cfeea  mov     r0, r8
000cfeec  blx     #0xddbfc ; -> objc_msgSend
000cfef0  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cfef4  mov     r0, sl
000cfef6  mov     r1, r5
000cfef8  blx     #0xddbfc ; -> objc_msgSend
000cfefc  cmp     r0, #0xc8
000cfefe  bne     #0xcff0c
000cff00  ldr     r1, [pc, #0x34]
000cff02  mov     r0, fp
000cff04  add     r1, pc ; -> 0x000fd888  '/\x12\x0f'
000cff06  ldr     r1, [r1]
000cff08  blx     #0xddbfc ; -> objc_msgSend
000cff0c  ldr     r3, [pc, #0x2c]
000cff0e  ldr     r1, [pc, #0x30]
000cff10  movs    r2, #0
000cff12  add     r3, pc ; -> 0x000fa008  OBJC_IVAR_$_DMGLogin.receivedData
000cff14  add     r1, pc ; -> 0x000fd7b8  '\t\t\x0f'
000cff16  ldr     r0, [r3]
000cff18  ldr     r1, [r1]
000cff1a  ldr.w   r0, [fp, r0]
000cff1e  blx     #0xddbfc ; -> objc_msgSend
000cff22  pop.w   {r8, sl, fp}
000cff26  pop     {r4, r5, r6, r7, pc}
000cff28  ldm     r3!, {r1, r2, r4, r6, r7}
000cff2a  movs    r2, r0
000cff2c  bgt     #0xcfe44
000cff2e  movs    r2, r0
000cff30  beq     #0xcfee8
000cff32  movs    r2, r0
000cff34  movs    r2, #0x64
000cff36  movs    r3, r1
000cff38  bls     #0xcfe3c
000cff3a  movs    r2, r0
000cff3c  adr     r0, #0x3c8
000cff3e  movs    r2, r0
000cff40  bhi     #0xcfe84
000cff42  movs    r2, r0
