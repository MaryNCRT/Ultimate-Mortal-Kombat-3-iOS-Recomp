========================================================================
-[DMGLogin saveLoginFlag]  0x000d01b8  216 bytes   DMGLogin.mm
========================================================================

000d01b8  push    {r4, r5, r6, r7, lr}
000d01ba  add     r7, sp, #0xc
000d01bc  push.w  {r8, sl}
000d01c0  sub     sp, #4
000d01c2  ldr     r0, [pc, #0x9c]
000d01c4  ldr     r1, [pc, #0x9c]
000d01c6  ldr     r2, [pc, #0xa0]
000d01c8  add     r0, pc ; -> 0x000fdb88  
000d01ca  add     r1, pc ; -> 0x000fcadc  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x164
000d01cc  ldr     r5, [r0]
000d01ce  ldr     r4, [r1]
000d01d0  ldr     r0, [pc, #0x98]
000d01d2  ldr     r1, [pc, #0x9c]
000d01d4  movs    r3, #1
000d01d6  add     r0, pc ; -> 0x000fdb5c  
000d01d8  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000d01da  ldr.w   r8, [r0]
000d01de  ldr     r6, [r1]
000d01e0  add     r2, pc ; -> 0x0017e5c4  
000d01e2  mov     r0, r8
000d01e4  mov     r1, r6
000d01e6  blx     #0xddbfc ; -> objc_msgSend
000d01ea  mov     r1, r4
000d01ec  ldr     r4, [pc, #0x84]
000d01ee  add     r4, pc ; -> 0x00182194  
000d01f0  mov     r2, r0
000d01f2  mov     r0, r5
000d01f4  blx     #0xddbfc ; -> objc_msgSend
000d01f8  ldr     r1, [pc, #0x7c]
000d01fa  add     r1, pc ; -> 0x000fd008  ':Z\x0e'
000d01fc  ldr     r1, [r1]
000d01fe  mov     r5, r0
000d0200  ldr     r0, [pc, #0x78]
000d0202  add     r0, pc ; -> 0x000fdc2c  
000d0204  ldr     r0, [r0]
000d0206  blx     #0xddbfc ; -> objc_msgSend
000d020a  mov     sl, r0
000d020c  blx     #0xdd41c ; -> NSTemporaryDirectory
000d0210  mov     r2, r4
000d0212  mov     r1, r6
000d0214  mov     r3, r0
000d0216  mov     r0, r8
000d0218  blx     #0xddbfc ; -> objc_msgSend
000d021c  mov     r4, r0
000d021e  cbz     r5, #0xd0256
000d0220  ldr     r1, [pc, #0x5c]
000d0222  mov     r0, r5
000d0224  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000d0226  ldr     r1, [r1]
000d0228  blx     #0xddbfc ; -> objc_msgSend
000d022c  cbz     r0, #0xd0256
000d022e  ldr     r1, [pc, #0x54]
000d0230  movs    r3, #0
000d0232  mov     r0, sl
000d0234  add     r1, pc ; -> 0x000fd218  
000d0236  str     r3, [sp]
000d0238  ldr     r1, [r1]
000d023a  mov     r2, r4
000d023c  mov     r3, r5
000d023e  blx     #0xddbfc ; -> objc_msgSend
000d0242  tst.w   r0, #0xff
000d0246  beq     #0xd024e
000d0248  ldr     r0, [pc, #0x3c]
000d024a  add     r0, pc ; -> 0x001821a4  
000d024c  b       #0xd0252
000d024e  ldr     r0, [pc, #0x3c]
000d0250  add     r0, pc ; -> 0x001821b4  
000d0252  bl      #0xb74c0 ; -> Z12MTX_PrintLogP8NSString
000d0256  sub.w   sp, r7, #0x14
000d025a  pop.w   {r8, sl}
000d025e  pop     {r4, r5, r6, r7, pc}
000d0260  bls     #0xd01dc
000d0262  movs    r2, r0
000d0264  ldm     r1, {r1, r2, r3}
000d0266  movs    r2, r0
000d0268  b       #0xd0a2c ; -> -[DMGViewController webViewDidFinishLoad:]
000d026a  movs    r2, r1
000d026c  bls     #0xd0174
000d026e  movs    r2, r0
000d0270  ldm     r0!, {r2, r6, r7}
000d0272  movs    r2, r0
000d0274  subs    r2, r4, #6
000d0276  movs    r3, r1
000d0278  ldm     r6!, {r1, r3}
000d027a  movs    r2, r0
000d027c  bge     #0xd02cc
000d027e  movs    r2, r0
000d0280  ldm     r0!, {r4, r6}
000d0282  movs    r2, r0
000d0284  ldm     r7, {r5, r6, r7}
000d0286  movs    r2, r0
000d0288  subs    r6, r2, #5
000d028a  movs    r3, r1
000d028c  subs    r0, r4, #5
000d028e  movs    r3, r1
