========================================================================
-[DMGLogin connection  0x000cfddc  76 bytes   DMGLogin.mm
========================================================================

000cfddc  push    {r4, r7, lr}
000cfdde  add     r7, sp, #4
000cfde0  ldr     r1, [pc, #0x30]
000cfde2  mov     r4, r0
000cfde4  ldr     r0, [pc, #0x30]
000cfde6  ldr     r2, [pc, #0x34]
000cfde8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cfdea  add     r0, pc ; -> 0x000fdb5c  
000cfdec  add     r2, pc ; -> 0x00182124  
000cfdee  ldr     r1, [r1]
000cfdf0  ldr     r0, [r0]
000cfdf2  blx     #0xddbfc ; -> objc_msgSend
000cfdf6  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cfdfa  ldr     r3, [pc, #0x24]
000cfdfc  ldr     r1, [pc, #0x24]
000cfdfe  add     r3, pc ; -> 0x000fa008  OBJC_IVAR_$_DMGLogin.receivedData
000cfe00  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cfe02  ldr     r0, [r3]
000cfe04  ldr     r1, [r1]
000cfe06  ldr     r0, [r4, r0]
000cfe08  blx     #0xddbfc ; -> objc_msgSend
000cfe0c  bl      #0xcf87c ; -> Z16MTXDMG_LoginDonev
000cfe10  pop     {r4, r7, pc}
000cfe12  nop     
000cfe14  ldm     r4, {r2, r4, r5, r7}
000cfe16  movs    r2, r0
000cfe18  ble     #0xcfef8
000cfe1a  movs    r2, r0
000cfe1c  movs    r3, #0x34
000cfe1e  movs    r3, r1
000cfe20  adr     r2, #0x18
000cfe22  movs    r2, r0
000cfe24  ldm     r3, {r3, r4, r5, r6}
000cfe26  movs    r2, r0
