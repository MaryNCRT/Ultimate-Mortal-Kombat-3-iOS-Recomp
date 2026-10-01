========================================================================
MTXDMG_StartUp  0x000cf9d4  152 bytes   EAMTX_DMGController.mm
========================================================================

000cf9d4  push    {r4, r5, r6, r7, lr}
000cf9d6  add     r7, sp, #0xc
000cf9d8  str     r8, [sp, #-0x4]!
000cf9dc  ldr     r0, [pc, #0x64]
000cf9de  ldr     r1, [pc, #0x68]
000cf9e0  ldr     r4, [pc, #0x68]
000cf9e2  add     r0, pc ; -> 0x000fdc2c  
000cf9e4  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000cf9e6  ldr     r0, [r0]
000cf9e8  ldr     r1, [r1]
000cf9ea  blx     #0xddbfc ; -> objc_msgSend
000cf9ee  ldr     r1, [pc, #0x60]
000cf9f0  add     r4, pc ; -> 0x00182014  
000cf9f2  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cf9f4  ldr     r5, [r1]
000cf9f6  mov     r8, r0
000cf9f8  ldr     r0, [pc, #0x58]
000cf9fa  add     r0, pc ; -> 0x000fdb5c  
000cf9fc  ldr     r6, [r0]
000cf9fe  blx     #0xdd41c ; -> NSTemporaryDirectory
000cfa02  mov     r1, r5
000cfa04  mov     r2, r4
000cfa06  mov     r3, r0
000cfa08  mov     r0, r6
000cfa0a  blx     #0xddbfc ; -> objc_msgSend
000cfa0e  ldr     r1, [pc, #0x48]
000cfa10  add     r1, pc ; -> 0x000fd21c  
000cfa12  ldr     r1, [r1]
000cfa14  mov     r2, r0
000cfa16  mov     r0, r8
000cfa18  blx     #0xddbfc ; -> objc_msgSend
000cfa1c  ldr     r1, [pc, #0x3c]
000cfa1e  add     r1, pc ; -> 0x000fcad0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x158
000cfa20  ldr     r1, [r1]
000cfa22  mov     r2, r0
000cfa24  ldr     r0, [pc, #0x38]
000cfa26  add     r0, pc ; -> 0x000fdb8c  
000cfa28  ldr     r0, [r0]
000cfa2a  blx     #0xddbfc ; -> objc_msgSend
000cfa2e  ldr     r1, [pc, #0x34]
000cfa30  ldr     r3, [pc, #0x34]
000cfa32  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000cfa34  add     r3, pc ; -> 0x0038c1f4  mCachedHTMLData
000cfa36  ldr     r1, [r1]
000cfa38  str     r0, [r3]
000cfa3a  blx     #0xddbfc ; -> objc_msgSend
000cfa3e  ldr     r8, [sp], #4
000cfa42  pop     {r4, r5, r6, r7, pc}
000cfa44  b       #0xcfed4
000cfa46  movs    r2, r0
000cfa48  bvs     #0xcfa8c
000cfa4a  movs    r2, r0
000cfa4c  movs    r6, #0x20
000cfa4e  movs    r3, r1
000cfa50  beq     #0xcf9a8
000cfa52  movs    r2, r0
000cfa54  b       #0xcfd14
000cfa56  movs    r2, r0
000cfa58  bhi     #0xcfa6c ; -> Z15MTXDMG_SaveDatav
000cfa5a  movs    r2, r0
000cfa5c  beq     #0xcf9bc
000cfa5e  movs    r2, r0
000cfa60  b       #0xcfd28
000cfa62  movs    r2, r0
000cfa64  bhs     #0xcf99c
000cfa66  movs    r2, r0
000cfa68  stm     r7!, {r2, r3, r4, r5, r7}
000cfa6a  movs    r3, r5
