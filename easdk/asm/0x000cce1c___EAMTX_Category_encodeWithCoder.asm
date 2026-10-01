========================================================================
-[EAMTX_Category encodeWithCoder  0x000cce1c  256 bytes   EAMTX_Category.mm
========================================================================

000cce1c  push    {r4, r5, r6, r7, lr}
000cce1e  add     r7, sp, #0xc
000cce20  push.w  {r8, sl, fp}
000cce24  ldr     r1, [pc, #0xbc]
000cce26  mov     r4, r0
000cce28  ldr     r0, [pc, #0xbc]
000cce2a  add     r1, pc ; -> 0x000fd1fc  
000cce2c  mov     r6, r2
000cce2e  ldr     r5, [r1]
000cce30  ldr     r1, [pc, #0xb8]
000cce32  add     r0, pc ; -> 0x000fdb5c  
000cce34  ldr.w   r8, [pc, #0xb8]
000cce38  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000cce3a  ldr.w   fp, [r0]
000cce3e  ldr.w   sl, [r1]
000cce42  ldr     r1, [pc, #0xb0]
000cce44  mov     r0, r4
000cce46  add     r8, pc ; -> 0x0017e5c4  
000cce48  add     r1, pc ; -> 0x000fd5f4  
000cce4a  ldr     r1, [r1]
000cce4c  blx     #0xddbfc ; -> objc_msgSend
000cce50  mov     r1, sl
000cce52  mov     r2, r8
000cce54  mov     r3, r0
000cce56  mov     r0, fp
000cce58  blx     #0xddbfc ; -> objc_msgSend
000cce5c  ldr     r3, [pc, #0x98]
000cce5e  mov     r1, r5
000cce60  add     r3, pc ; -> 0x00180074  
000cce62  mov     r2, r0
000cce64  mov     r0, r6
000cce66  blx     #0xddbfc ; -> objc_msgSend
000cce6a  ldr     r1, [pc, #0x90]
000cce6c  mov     r0, r4
000cce6e  add     r1, pc ; -> 0x000fd1f4  
000cce70  ldr     r1, [r1]
000cce72  blx     #0xddbfc ; -> objc_msgSend
000cce76  ldr     r3, [pc, #0x88]
000cce78  mov     r1, r5
000cce7a  add     r3, pc ; -> 0x0017fe24  
000cce7c  mov     r2, r0
000cce7e  mov     r0, r6
000cce80  blx     #0xddbfc ; -> objc_msgSend
000cce84  ldr     r1, [pc, #0x7c]
000cce86  mov     r0, r4
000cce88  add     r1, pc ; -> 0x000fd828  '(\x0e\x0f'
000cce8a  ldr     r1, [r1]
000cce8c  blx     #0xddbfc ; -> objc_msgSend
000cce90  ldr     r3, [pc, #0x74]
000cce92  mov     r1, r5
000cce94  add     r3, pc ; -> 0x00181e54  
000cce96  mov     r2, r0
000cce98  mov     r0, r6
000cce9a  blx     #0xddbfc ; -> objc_msgSend
000cce9e  ldr     r1, [pc, #0x6c]
000ccea0  mov     r0, r4
000ccea2  add     r1, pc ; -> 0x000fd824  '5\x0e\x0f'
000ccea4  ldr     r1, [r1]
000ccea6  blx     #0xddbfc ; -> objc_msgSend
000cceaa  ldr     r3, [pc, #0x64]
000cceac  mov     r1, r5
000cceae  add     r3, pc ; -> 0x00181e64  
000cceb0  mov     r2, r0
000cceb2  mov     r0, r6
000cceb4  blx     #0xddbfc ; -> objc_msgSend
000cceb8  ldr     r1, [pc, #0x58]
000cceba  mov     r0, r4
000ccebc  add     r1, pc ; -> 0x000fd820  'B\x0e\x0f'
000ccebe  ldr     r1, [r1]
000ccec0  blx     #0xddbfc ; -> objc_msgSend
000ccec4  mov     r1, sl
000ccec6  mov     r2, r8
000ccec8  mov     r3, r0
000cceca  mov     r0, fp
000ccecc  blx     #0xddbfc ; -> objc_msgSend
000cced0  ldr     r3, [pc, #0x44]
000cced2  mov     r1, r5
000cced4  add     r3, pc ; -> 0x00181e74  
000cced6  mov     r2, r0
000cced8  mov     r0, r6
000cceda  blx     #0xddbfc ; -> objc_msgSend
000ccede  pop.w   {r8, sl, fp}
000ccee2  pop     {r4, r5, r6, r7, pc}
000ccee4  lsls    r6, r1, #0xf
000ccee6  movs    r3, r0
000ccee8  lsrs    r6, r4, #0x14
000cceea  movs    r3, r0
000cceec  stc2l   p0, c0, [r4], #-8
000ccef0  asrs    r2, r7, #0x1d
000ccef2  movs    r3, r1
000ccef4  lsls    r0, r5, #0x1e
000ccef6  movs    r3, r0
000ccef8  adds    r2, #0x10
000ccefa  movs    r3, r1
000ccefc  lsls    r2, r0, #0xe
000ccefe  movs    r3, r0
000ccf00  cmp     r7, #0xa6
000ccf02  movs    r3, r1
000ccf04  lsrs    r4, r3, #6
000ccf06  movs    r3, r0
000ccf08  ldr     r7, [pc, #0x2f0]
000ccf0a  movs    r3, r1
000ccf0c  lsrs    r6, r7, #5
000ccf0e  movs    r3, r0
000ccf10  ldr     r7, [pc, #0x2c8]
000ccf12  movs    r3, r1
000ccf14  lsrs    r0, r4, #5
000ccf16  movs    r3, r0
000ccf18  ldr     r7, [pc, #0x270]
000ccf1a  movs    r3, r1
