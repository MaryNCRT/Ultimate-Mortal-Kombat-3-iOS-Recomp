========================================================================
FilterAndSendCategories  0x000bbfd0  656 bytes   EAMTX_Main.mm
========================================================================

000bbfd0  push    {r4, r5, r6, r7, lr}
000bbfd2  add     r7, sp, #0xc
000bbfd4  push.w  {r8, sl, fp}
000bbfd8  sub     sp, #0x54
000bbfda  str     r1, [sp, #8]
000bbfdc  bl      #0xb7180 ; -> Z17GetCategoriesListP12NSDictionary
000bbfe0  ldr     r3, [pc, #0x1f8]
000bbfe2  ldr     r1, [pc, #0x1fc]
000bbfe4  add     r3, pc ; -> 0x0038c190  m_CategoriesList
000bbfe6  add     r1, pc ; -> 0x000fc984  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0xc
000bbfe8  ldr     r1, [r1]
000bbfea  str     r1, [sp, #0x10]
000bbfec  str     r0, [r3]
000bbfee  ldr     r0, [pc, #0x1f4]
000bbff0  add     r0, pc ; -> 0x000fdb70  
000bbff2  ldr     r0, [r0]
000bbff4  str     r0, [sp, #0xc]
000bbff6  blx     #0xddbfc ; -> objc_msgSend
000bbffa  ldr     r1, [pc, #0x1ec]
000bbffc  add     r1, pc ; -> 0x000fc980  '$(\x0e'
000bbffe  ldr     r1, [r1]
000bc000  blx     #0xddbfc ; -> objc_msgSend
000bc004  ldr     r1, [pc, #0x1e4]
000bc006  ldr     r2, [pc, #0x1e8]
000bc008  movs    r3, #0
000bc00a  add     r1, pc ; -> 0x000fca80  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x108
000bc00c  add     r2, pc ; -> 0x000fcdc8  
000bc00e  ldr     r1, [r1]
000bc010  ldr     r2, [r2]
000bc012  str     r3, [sp, #0x44]
000bc014  ldr     r3, [pc, #0x1dc]
000bc016  str     r1, [sp, #0x18]
000bc018  ldr     r1, [pc, #0x1dc]
000bc01a  str     r2, [sp, #0x3c]
000bc01c  str     r3, [sp, #4]
000bc01e  add     r1, pc ; -> 0x000fca7c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x104
000bc020  ldr     r1, [r1]
000bc022  str     r1, [sp, #0x1c]
000bc024  ldr     r1, [pc, #0x1d4]
000bc026  add     r1, pc ; -> 0x000fcaa0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x128
000bc028  ldr     r1, [r1]
000bc02a  str     r1, [sp, #0x28]
000bc02c  ldr     r1, [pc, #0x1d0]
000bc02e  str     r0, [sp, #0x14]
000bc030  ldr     r0, [pc, #0x1d0]
000bc032  add     r1, pc ; -> 0x000fd5f4  
000bc034  ldr     r1, [r1]
000bc036  add     r0, pc ; -> 0x000fdb5c  
000bc038  ldr     r0, [r0]
000bc03a  str     r1, [sp, #0x2c]
000bc03c  ldr     r1, [pc, #0x1c8]
000bc03e  str     r0, [sp, #0x24]
000bc040  add     r1, pc ; -> 0x000fce70  'F=\x0e'
000bc042  ldr     r1, [r1]
000bc044  str     r1, [sp, #0x30]
000bc046  ldr     r1, [pc, #0x1c4]
000bc048  add     r1, pc ; -> 0x000fcaf0  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x178
000bc04a  ldr     r1, [r1]
000bc04c  str     r1, [sp, #0x34]
000bc04e  ldr     r1, [pc, #0x1c0]
000bc050  add     r1, pc ; -> 0x000fd3c8  
000bc052  ldr.w   fp, [r1]
000bc056  ldr     r1, [pc, #0x1bc]
000bc058  add     r1, pc ; -> 0x000fca78  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x100
000bc05a  ldr     r1, [r1]
000bc05c  str     r1, [sp, #0x38]
000bc05e  ldr     r1, [pc, #0x1b8]
000bc060  add     r1, pc ; -> 0x000fca84  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x10c
000bc062  ldr     r1, [r1]
000bc064  str     r1, [sp, #0x40]
000bc066  b       #0xbc130
000bc068  ldr     r2, [sp, #0x44]
000bc06a  ldr     r0, [r4]
000bc06c  ldr     r1, [sp, #0x1c]
000bc06e  blx     #0xddbfc ; -> objc_msgSend
000bc072  ldr     r1, [sp, #0x2c]
000bc074  ldr     r4, [pc, #0x1a4]
000bc076  add     r4, pc ; -> 0x0017e5c4  
000bc078  str     r0, [sp, #0x20]
000bc07a  blx     #0xddbfc ; -> objc_msgSend
000bc07e  ldr     r1, [sp, #0x28]
000bc080  mov     r2, r4
000bc082  mov     r3, r0
000bc084  ldr     r0, [sp, #0x24]
000bc086  blx     #0xddbfc ; -> objc_msgSend
000bc08a  ldr     r1, [sp, #0x30]
000bc08c  mov     sl, r0
000bc08e  ldr     r0, [pc, #0x190]
000bc090  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc092  ldr     r0, [r0]
000bc094  blx     #0xddbfc ; -> objc_msgSend
000bc098  movs    r3, #0
000bc09a  str     r3, [sp, #0x48]
000bc09c  mov     r6, r3
000bc09e  mov     r8, r0
000bc0a0  b       #0xbc110
000bc0a2  ldr     r0, [pc, #0x180]
000bc0a4  ldr     r1, [sp, #0x1c]
000bc0a6  mov     r2, r6
000bc0a8  add     r0, pc ; -> 0x0038c0bc  mtxProdsList
000bc0aa  ldr     r4, [r0]
000bc0ac  mov     r0, r8
000bc0ae  blx     #0xddbfc ; -> objc_msgSend
000bc0b2  ldr     r1, [sp, #0x34]
000bc0b4  mov     r2, r0
000bc0b6  mov     r0, r4
000bc0b8  blx     #0xddbfc ; -> objc_msgSend
000bc0bc  mov     r1, fp
000bc0be  ldr     r4, [pc, #0x168]
000bc0c0  add     r4, pc ; -> 0x001805d4  
000bc0c2  mov     r5, r0
000bc0c4  blx     #0xddbfc ; -> objc_msgSend
000bc0c8  ldr     r2, [pc, #0x160]
000bc0ca  ldr     r1, [sp, #0x28]
000bc0cc  add     r2, pc ; -> 0x0038c164  categoryName
000bc0ce  ldr     r2, [r2]
000bc0d0  str     r2, [sp]
000bc0d2  mov     r2, r4
000bc0d4  mov     r3, r0
000bc0d6  ldr     r0, [sp, #0x24]
000bc0d8  blx     #0xddbfc ; -> objc_msgSend
000bc0dc  bl      #0xb6f64 ; -> Z9PRINT_LOGP8NSString
000bc0e0  mov     r0, sl
000bc0e2  ldr     r1, [sp, #0x38]
000bc0e4  blx     #0xddbfc ; -> objc_msgSend
000bc0e8  cbz     r0, #0xbc10a
000bc0ea  mov     r1, fp
000bc0ec  mov     r0, r5
000bc0ee  blx     #0xddbfc ; -> objc_msgSend
000bc0f2  ldr     r2, [sp, #0x3c]
000bc0f4  mov     r3, sl
000bc0f6  mov     r1, r0
000bc0f8  add     r0, sp, #0x4c
000bc0fa  blx     #0xddc14 ; -> objc_msgSend_stret
000bc0fe  add     r2, sp, #0x4c
000bc100  ldm     r2, {r2, r3}
000bc102  mvn     r1, #0x80000000
000bc106  cmp     r2, r1
000bc108  beq     #0xbc10e
000bc10a  movs    r3, #1
000bc10c  str     r3, [sp, #0x48]
000bc10e  adds    r6, #1
000bc110  mov     r0, r8
000bc112  ldr     r1, [sp, #0x18]
000bc114  blx     #0xddbfc ; -> objc_msgSend
000bc118  cmp     r0, r6
000bc11a  bhi     #0xbc0a2
000bc11c  ldr     r3, [sp, #0x48]
000bc11e  cbz     r3, #0xbc12a
000bc120  ldr     r0, [sp, #0x14]
000bc122  ldr     r1, [sp, #0x40]
000bc124  ldr     r2, [sp, #0x20]
000bc126  blx     #0xddbfc ; -> objc_msgSend
000bc12a  ldr     r3, [sp, #0x44]
000bc12c  adds    r3, #1
000bc12e  str     r3, [sp, #0x44]
000bc130  ldr     r4, [sp, #4]
000bc132  ldr     r1, [sp, #0x18]
000bc134  add     r4, pc
000bc136  ldr     r0, [r4]
000bc138  blx     #0xddbfc ; -> objc_msgSend
000bc13c  ldr     r3, [sp, #0x44]
000bc13e  cmp     r0, r3
000bc140  bhi     #0xbc068
000bc142  ldr     r0, [r4]
000bc144  cbz     r0, #0xbc15c
000bc146  ldr     r1, [pc, #0xe8]
000bc148  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bc14a  ldr     r1, [r1]
000bc14c  blx     #0xddbfc ; -> objc_msgSend
000bc150  ldr     r1, [pc, #0xe0]
000bc152  ldr     r0, [r4]
000bc154  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bc156  ldr     r1, [r1]
000bc158  blx     #0xddbfc ; -> objc_msgSend
000bc15c  ldr     r1, [sp, #0x10]
000bc15e  ldr     r0, [sp, #0xc]
000bc160  blx     #0xddbfc ; -> objc_msgSend
000bc164  ldr     r1, [pc, #0xd0]
000bc166  ldr     r2, [sp, #0x14]
000bc168  ldr     r4, [pc, #0xd0]
000bc16a  add     r1, pc ; -> 0x000fd3bc  
000bc16c  ldr     r1, [r1]
000bc16e  blx     #0xddbfc ; -> objc_msgSend
000bc172  ldr     r3, [pc, #0xcc]
000bc174  ldr     r1, [pc, #0xcc]
000bc176  add     r4, pc ; -> 0x0038c1a4  catsUpdatedTime
000bc178  add     r3, pc ; -> 0x0038c190  m_CategoriesList
000bc17a  add     r1, pc ; -> 0x000fca8c  '\x02\x1f\x0e'
000bc17c  ldr     r1, [r1]
000bc17e  str     r0, [r3]
000bc180  ldr     r0, [sp, #0x14]
000bc182  blx     #0xddbfc ; -> objc_msgSend
000bc186  ldr     r1, [pc, #0xc0]
000bc188  ldr     r0, [sp, #0x14]
000bc18a  add     r1, pc ; -> 0x000fc97c  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x4
000bc18c  ldr     r5, [r1]
000bc18e  mov     r1, r5
000bc190  blx     #0xddbfc ; -> objc_msgSend
000bc194  ldr     r0, [r4]
000bc196  cbz     r0, #0xbc1a2
000bc198  mov     r1, r5
000bc19a  blx     #0xddbfc ; -> objc_msgSend
000bc19e  movs    r3, #0
000bc1a0  str     r3, [r4]
000bc1a2  ldr     r0, [pc, #0xa8]
000bc1a4  ldr     r1, [pc, #0xa8]
000bc1a6  add     r0, pc ; -> 0x000fdbb4  
000bc1a8  add     r1, pc ; -> 0x000fcbc8  OBJC_IVAR_$_EAMTX_MMTracking.trackingConn+0x250
000bc1aa  ldr     r0, [r0]
000bc1ac  ldr     r1, [r1]
000bc1ae  blx     #0xddbfc ; -> objc_msgSend
000bc1b2  ldr     r1, [pc, #0xa0]
000bc1b4  add     r1, pc ; -> 0x000fccd0  '(\t\x0e'
000bc1b6  ldr     r1, [r1]
000bc1b8  blx     #0xddbfc ; -> objc_msgSend
000bc1bc  ldr     r3, [pc, #0x98]
000bc1be  ldr     r2, [pc, #0x9c]
000bc1c0  ldr     r1, [sp, #8]
000bc1c2  add     r3, pc ; -> 0x0038c1a4  catsUpdatedTime
000bc1c4  add     r2, pc ; -> 0x0038c190  m_CategoriesList
000bc1c6  ldr     r2, [r2]
000bc1c8  str     r0, [r3]
000bc1ca  movs    r0, #0x1d
000bc1cc  bl      #0xb75e4 ; -> Z15MTX_Events_Send11MTX_EventIDiPv
000bc1d0  sub.w   sp, r7, #0x18
000bc1d4  pop.w   {r8, sl, fp}
000bc1d8  pop     {r4, r5, r6, r7, pc}
000bc1da  nop     
000bc1dc  lsls    r0, r5, #6
000bc1de  movs    r5, r5
000bc1e0  lsrs    r2, r3, #6
000bc1e2  movs    r4, r0
000bc1e4  subs    r4, r7, r5
000bc1e6  movs    r4, r0
000bc1e8  lsrs    r0, r0, #6
000bc1ea  movs    r4, r0
000bc1ec  lsrs    r2, r6, #9
000bc1ee  movs    r4, r0
000bc1f0  lsrs    r0, r7, #0x16
000bc1f2  movs    r4, r0
000bc1f4  lsls    r0, r3, #1
000bc1f6  movs    r5, r5
000bc1f8  lsrs    r2, r3, #9
000bc1fa  movs    r4, r0
000bc1fc  lsrs    r6, r6, #9
000bc1fe  movs    r4, r0
000bc200  asrs    r6, r7, #0x16
000bc202  movs    r4, r0
000bc204  subs    r2, r4, r4
000bc206  movs    r4, r0
000bc208  lsrs    r4, r5, #0x18
000bc20a  movs    r4, r0
000bc20c  lsrs    r4, r4, #0xa
000bc20e  movs    r4, r0
000bc210  asrs    r4, r6, #0xd
000bc212  movs    r4, r0
000bc214  lsrs    r4, r3, #8
000bc216  movs    r4, r0
000bc218  lsrs    r0, r4, #8
000bc21a  movs    r4, r0
000bc21c  movs    r5, #0x4a
000bc21e  movs    r4, r1
000bc220  movs    r0, r5
000bc222  movs    r5, r5
000bc224  movs    r0, r2
000bc226  movs    r5, r5
000bc228  cmp     r0, r2
000bc22a  movs    r4, r1
000bc22c  lsls    r4, r2, #2
000bc22e  movs    r5, r5
000bc230  lsrs    r0, r0, #5
000bc232  movs    r4, r0
000bc234  lsrs    r4, r4, #0x20
000bc236  movs    r4, r0
000bc238  asrs    r6, r1, #9
000bc23a  movs    r4, r0
000bc23c  movs    r2, r5
000bc23e  movs    r5, r5
000bc240  movs    r4, r2
000bc242  movs    r5, r5
000bc244  lsrs    r6, r1, #4
000bc246  movs    r4, r0
000bc248  lsls    r6, r5, #0x1f
000bc24a  movs    r4, r0
000bc24c  subs    r2, r1, r0
000bc24e  movs    r4, r0
000bc250  lsrs    r4, r3, #8
000bc252  movs    r4, r0
000bc254  lsrs    r0, r3, #0xc
000bc256  movs    r4, r0
000bc258  vaddl.u16 q8, d14, d28
000bc25c  vaddl.u8 q8, d8, d28
