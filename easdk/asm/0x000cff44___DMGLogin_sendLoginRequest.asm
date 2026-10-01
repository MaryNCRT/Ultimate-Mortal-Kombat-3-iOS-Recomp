========================================================================
-[DMGLogin sendLoginRequest  0x000cff44  476 bytes   DMGLogin.mm
========================================================================

000cff44  push    {r4, r5, r6, r7, lr}
000cff46  add     r7, sp, #0xc
000cff48  push.w  {r8, sl, fp}
000cff4c  sub     sp, #0x10
000cff4e  ldr     r1, [pc, #0x15c]
000cff50  mov     sl, r0
000cff52  mov     fp, r2
000cff54  add     r1, pc ; -> 0x000fd8f4  
000cff56  ldr     r1, [r1]
000cff58  blx     #0xddbfc ; -> objc_msgSend
000cff5c  str     r0, [sp, #8]
000cff5e  cbz     r0, #0xcff66
000cff60  bl      #0xcf87c ; -> Z16MTXDMG_LoginDonev
000cff64  b       #0xd00a2
000cff66  ldr     r0, [pc, #0x148]
000cff68  ldr     r1, [pc, #0x148]
000cff6a  ldr     r4, [pc, #0x14c]
000cff6c  add     r0, pc ; -> 0x000fdb5c  
000cff6e  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cff70  ldr     r6, [r0]
000cff72  ldr     r5, [r1]
000cff74  ldr     r0, [pc, #0x144]
000cff76  ldr     r1, [pc, #0x148]
000cff78  add     r4, pc ; -> 0x00182154  
000cff7a  add     r0, pc ; -> 0x000fdce4  
000cff7c  add     r1, pc ; -> 0x000fd8d4  
000cff7e  ldr     r0, [r0]
000cff80  ldr     r1, [r1]
000cff82  blx     #0xddbfc ; -> objc_msgSend
000cff86  mov     r2, r4
000cff88  mov     r1, r5
000cff8a  ldr.w   r8, [pc, #0x138]
000cff8e  add     r8, pc ; -> 0x00182164  
000cff90  mov     r3, r0
000cff92  mov     r0, r6
000cff94  blx     #0xddbfc ; -> objc_msgSend
000cff98  ldr     r1, [pc, #0x12c]
000cff9a  add     r1, pc ; -> 0x000fc9f0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x78
000cff9c  ldr     r1, [r1]
000cff9e  str     r0, [sp, #0xc]
000cffa0  ldr     r0, [pc, #0x128]
000cffa2  add     r0, pc ; -> 0x000fdb50  
000cffa4  ldr     r0, [r0]
000cffa6  blx     #0xddbfc ; -> objc_msgSend
000cffaa  ldr     r1, [pc, #0x124]
000cffac  add     r1, pc ; -> 0x000fcfa8  'AU\x0e'
000cffae  ldr     r1, [r1]
000cffb0  blx     #0xddbfc ; -> objc_msgSend
000cffb4  ldr     r1, [pc, #0x11c]
000cffb6  add     r1, pc ; -> 0x000fd8f0  
000cffb8  ldr     r1, [r1]
000cffba  mov     r4, r0
000cffbc  mov     r0, sl
000cffbe  blx     #0xddbfc ; -> objc_msgSend
000cffc2  mov     r1, r5
000cffc4  mov     r2, r8
000cffc6  mov     r3, r4
000cffc8  str.w   fp, [sp, #4]
000cffcc  str     r0, [sp]
000cffce  mov     r0, r6
000cffd0  blx     #0xddbfc ; -> objc_msgSend
000cffd4  ldr     r2, [pc, #0x100]
000cffd6  mov     r1, r5
000cffd8  ldr     r3, [sp, #0xc]
000cffda  add     r2, pc ; -> 0x00182174  
000cffdc  mov     r8, r0
000cffde  mov     r0, r6
000cffe0  blx     #0xddbfc ; -> objc_msgSend
000cffe4  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cffe8  ldr     r2, [pc, #0xf0]
000cffea  mov     r1, r5
000cffec  mov     r3, r8
000cffee  add     r2, pc ; -> 0x00182184  
000cfff0  mov     r0, r6
000cfff2  blx     #0xddbfc ; -> objc_msgSend
000cfff6  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000cfffa  ldr     r0, [pc, #0xe4]
000cfffc  ldr     r1, [pc, #0xe4]
000cfffe  ldr     r2, [sp, #0xc]
000d0000  add     r0, pc ; -> 0x000fdbe4  
000d0002  add     r1, pc ; -> 0x000fce34  
000d0004  ldr     r5, [r0]
000d0006  ldr     r4, [r1]
000d0008  ldr     r0, [pc, #0xdc]
000d000a  ldr     r1, [pc, #0xe0]
000d000c  add     r0, pc ; -> 0x000fdb64  
000d000e  add     r1, pc ; -> 0x000fcbb0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x238
000d0010  ldr     r0, [r0]
000d0012  ldr     r1, [r1]
000d0014  blx     #0xddbfc ; -> objc_msgSend
000d0018  ldr     r1, [pc, #0xd4]
000d001a  ldr     r3, [sp, #8]
000d001c  mov     r2, r0
000d001e  movs    r0, #0
000d0020  stm.w   sp, {r0, r1}
000d0024  mov     r1, r4
000d0026  mov     r0, r5
000d0028  blx     #0xddbfc ; -> objc_msgSend
000d002c  ldr     r1, [pc, #0xc4]
000d002e  ldr     r2, [pc, #0xc8]
000d0030  add     r1, pc ; -> 0x000fcbe0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x268
000d0032  add     r2, pc ; -> 0x0017e7a4  
000d0034  ldr     r1, [r1]
000d0036  mov     r4, r0
000d0038  blx     #0xddbfc ; -> objc_msgSend
000d003c  ldr     r1, [pc, #0xbc]
000d003e  movs    r2, #4
000d0040  mov     r0, r8
000d0042  add     r1, pc ; -> 0x000fcbd4  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x25c
000d0044  ldr     r5, [r1]
000d0046  ldr     r1, [pc, #0xb8]
000d0048  add     r1, pc ; -> 0x000fcd10  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x398
000d004a  ldr     r1, [r1]
000d004c  blx     #0xddbfc ; -> objc_msgSend
000d0050  mov     r1, r5
000d0052  mov     r2, r0
000d0054  mov     r0, r4
000d0056  blx     #0xddbfc ; -> objc_msgSend
000d005a  ldr     r0, [pc, #0xa8]
000d005c  ldr     r1, [pc, #0xa8]
000d005e  add     r0, pc ; -> 0x000fdc08  
000d0060  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000d0062  ldr     r0, [r0]
000d0064  ldr     r1, [r1]
000d0066  blx     #0xddbfc ; -> objc_msgSend
000d006a  ldr     r1, [pc, #0xa0]
000d006c  movs    r3, #1
000d006e  mov     r2, r4
000d0070  add     r1, pc ; -> 0x000fd7c0  'Z\t\x0f'
000d0072  str     r3, [sp]
000d0074  ldr     r1, [r1]
000d0076  mov     r3, sl
000d0078  blx     #0xddbfc ; -> objc_msgSend
000d007c  cbz     r0, #0xd00a2
000d007e  ldr     r0, [pc, #0x90]
000d0080  ldr     r1, [pc, #0x90]
000d0082  ldr     r3, [pc, #0x94]
000d0084  add     r0, pc ; -> 0x000fdbbc  
000d0086  add     r1, pc ; -> 0x000fcd14  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x39c
000d0088  add     r3, pc ; -> 0x000fa008  OBJC_IVAR_$_DMGLogin.receivedData
000d008a  ldr     r1, [r1]
000d008c  ldr     r0, [r0]
000d008e  ldr     r4, [r3]
000d0090  blx     #0xddbfc ; -> objc_msgSend
000d0094  ldr     r1, [pc, #0x84]
000d0096  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000d0098  ldr     r1, [r1]
000d009a  blx     #0xddbfc ; -> objc_msgSend
000d009e  str.w   r0, [sl, r4]
000d00a2  sub.w   sp, r7, #0x18
000d00a6  pop.w   {r8, sl, fp}
000d00aa  pop     {r4, r5, r6, r7, pc}
000d00ac  bls     #0xcffe8
000d00ae  movs    r2, r0
000d00b0  blt     #0xd008c
000d00b2  movs    r2, r0
000d00b4  ldm     r3, {r1, r2, r3, r5}
000d00b6  movs    r2, r0
000d00b8  movs    r1, #0xd8
000d00ba  movs    r3, r1
000d00bc  ble     #0xd018c
000d00be  movs    r2, r0
000d00c0  bls     #0xd016c
000d00c2  movs    r2, r0
000d00c4  movs    r1, #0xd2
000d00c6  movs    r3, r1
000d00c8  ldm     r2!, {r1, r4, r6}
000d00ca  movs    r2, r0
000d00cc  blt     #0xd0024
000d00ce  movs    r2, r0
000d00d0  ldm     r7, {r3, r4, r5, r6, r7}
000d00d2  movs    r2, r0
000d00d4  bls     #0xd0144
000d00d6  movs    r2, r0
000d00d8  movs    r1, #0x96
000d00da  movs    r3, r1
000d00dc  movs    r1, #0x92
000d00de  movs    r3, r1
000d00e0  blt     #0xd00a4
000d00e2  movs    r2, r0
000d00e4  ldm     r6!, {r1, r2, r3, r5}
000d00e6  movs    r2, r0
000d00e8  blt     #0xd0194
000d00ea  movs    r2, r0
000d00ec  ldm     r3, {r1, r2, r3, r4, r7}
000d00ee  movs    r2, r0
000d00f0  movs    r0, r0
000d00f2  eors    r6, r3
000d00f4  ldm     r3, {r2, r3, r5, r7}
000d00f6  movs    r2, r0
000d00f8  b       #0xcffd8
000d00fa  movs    r2, r1
000d00fc  ldm     r3, {r1, r2, r3, r7}
000d00fe  movs    r2, r0
000d0100  ldm     r4!, {r2, r6, r7}
000d0102  movs    r2, r0
000d0104  blt     #0xd0054
000d0106  movs    r2, r0
000d0108  ldm     r1!, {r5}
000d010a  movs    r2, r0
000d010c  bvc     #0xd01a8
000d010e  movs    r2, r0
000d0110  blt     #0xd017c
000d0112  movs    r2, r0
000d0114  ldm     r4!, {r1, r3, r7}
000d0116  movs    r2, r0
000d0118  ldr     r7, [sp, #0x1f0]
000d011a  movs    r2, r0
000d011c  ldm     r4, {r1, r2, r4, r5}
000d011e  movs    r2, r0
