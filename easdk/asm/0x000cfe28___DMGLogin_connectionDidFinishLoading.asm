========================================================================
-[DMGLogin connectionDidFinishLoading  0x000cfe28  144 bytes   DMGLogin.mm
========================================================================

000cfe28  push    {r4, r5, r6, r7, lr}
000cfe2a  add     r7, sp, #0xc
000cfe2c  push.w  {r8, sl, fp}
000cfe30  ldr     r1, [pc, #0x68]
000cfe32  mov     sl, r0
000cfe34  ldr     r0, [pc, #0x68]
000cfe36  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cfe38  ldr     r5, [pc, #0x68]
000cfe3a  add     r0, pc ; -> 0x000fdb5c  
000cfe3c  ldr.w   r8, [r1]
000cfe40  ldr     r1, [pc, #0x64]
000cfe42  ldr     r6, [r0]
000cfe44  add     r5, pc ; -> 0x000fa008  OBJC_IVAR_$_DMGLogin.receivedData
000cfe46  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000cfe48  mov     fp, r2
000cfe4a  ldr     r1, [r1]
000cfe4c  mov     r0, r6
000cfe4e  blx     #0xddbfc ; -> objc_msgSend
000cfe52  ldr     r1, [pc, #0x58]
000cfe54  ldr     r3, [r5]
000cfe56  ldr     r4, [pc, #0x58]
000cfe58  add     r1, pc ; -> 0x000fcfb4  '_U\x0e'
000cfe5a  ldr.w   r2, [sl, r3]
000cfe5e  ldr     r1, [r1]
000cfe60  movs    r3, #4
000cfe62  blx     #0xddbfc ; -> objc_msgSend
000cfe66  add     r4, pc ; -> 0x00182134  
000cfe68  mov     r1, r8
000cfe6a  mov     r2, r4
000cfe6c  mov     r3, r0
000cfe6e  mov     r0, r6
000cfe70  blx     #0xddbfc ; -> objc_msgSend
000cfe74  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cfe78  ldr     r1, [pc, #0x38]
000cfe7a  mov     r0, fp
000cfe7c  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000cfe7e  ldr     r4, [r1]
000cfe80  mov     r1, r4
000cfe82  blx     #0xddbfc ; -> objc_msgSend
000cfe86  ldr     r0, [r5]
000cfe88  mov     r1, r4
000cfe8a  ldr.w   r0, [sl, r0]
000cfe8e  blx     #0xddbfc ; -> objc_msgSend
000cfe92  bl      #0xcf87c ; -> Z16MTXDMG_LoginDonev
000cfe96  pop.w   {r8, sl, fp}
000cfe9a  pop     {r4, r5, r6, r7, pc}
000cfe9c  ldm     r4!, {r1, r2, r5, r6}
000cfe9e  movs    r2, r0
000cfea0  ble     #0xcfee0
000cfea2  movs    r2, r0
000cfea4  adr     r1, #0x300
000cfea6  movs    r2, r0
000cfea8  ldm     r3, {r1, r3, r4, r5}
000cfeaa  movs    r2, r0
000cfeac  bne     #0xcff60
000cfeae  movs    r2, r0
000cfeb0  movs    r2, #0xca
000cfeb2  movs    r3, r1
000cfeb4  ldm     r2, {r2, r3, r4, r5, r6, r7}
000cfeb6  movs    r2, r0
